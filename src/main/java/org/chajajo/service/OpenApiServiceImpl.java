package org.chajajo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.chajajo.domain.ServiceDetailDTO;
import org.chajajo.domain.ServiceListDTO;
import org.chajajo.domain.SupportConditionsDTO;
import org.chajajo.mapper.OpenApiMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@PropertySource("classpath:application.properties")
@AllArgsConstructor
@NoArgsConstructor
@Service
public class OpenApiServiceImpl implements OpenApiService {

	@Autowired
	private OpenApiMapper mapper;
	
	//open api 키
	@Value("${openApi.serviceKey}")
	private String serviceKey;
	
	//DB table 초기화
	@Override
	public void cleanDB() {
		mapper.truncateConditions();
		mapper.truncateDetail();
		mapper.deleteList();
	}
	
	// api의 총 개수 측정
	@Override
	public int totalCount() {
		int totalCount =0;
		String result ="";
		// 페이지
		String page = "1";
		// 페이지당 개수
		String perPage = "1";
		// api 종류
		String apiType = "gov24/v3/serviceList";

		try {
			// api를 json형식으로 받아오기
			result = callApiToJson(page, perPage, apiType);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			totalCount = Integer.parseInt((String.valueOf(jsonObject.get("totalCount"))));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalCount;
	}
	
	//serviceList를  case에 따라 insert 또는 update 한다
	@Override
	public void openApiToListDB(int totalCount, String Case) throws Exception {
		
		String result = "";
		// 페이지
		String page = "";
		// 페이지당 개수
		String perPage = "1000";
		// api 종류
		String apiType = "gov24/v3/serviceList";

		for (int pageInt = 1; pageInt <= ((totalCount / 1000) + 1); pageInt++) {

			page = "" + pageInt;

			// api를 json형식으로 받아오기
			result = callApiToJson(page, perPage, apiType);

			// json형식을 DTO로 변환
			JSONArray infoArr = JsonToDTO(result);

			for (int i = 0; i < infoArr.size(); i++) {

				JSONObject tmp = (JSONObject) infoArr.get(i);

				ServiceListDTO serviceListObj = new ServiceListDTO((String) tmp.get("서비스ID"), (String) tmp.get("서비스명"),
						(String) tmp.get("서비스목적요약"), (String) tmp.get("신청방법"), (String) tmp.get("신청기한"),
						(String) tmp.get("소관기관코드"), (String) tmp.get("부서명"), (Long) tmp.get("조회수"),
						(String) tmp.get("소관기관유형"), (String) tmp.get("사용자구분"), (String) tmp.get("서비스분야"),
						(String) tmp.get("전화문의"));
				
				if (Case == "insert") {
					mapper.insertList(serviceListObj);
				} else if (Case == "update") {
					mapper.updateList(serviceListObj);
				}
			}

		}
	}

	//serviceDetail를  case에 따라 insert 또는 update 한다
	@Override
	public void openApiToDetailDB(int totalCount, String Case) throws Exception {
	
		String result = "";
		// 페이지
		String page = "";
		// 페이지당 개수
		String perPage = "1000";
		// api 종류
		String apiType = "gov24/v3/serviceDetail";

		for (int pageInt = 1; pageInt <= ((totalCount / 1000) + 1); pageInt++) {

			page = "" + pageInt;

			// api를 json형식으로 받아오기
			result = callApiToJson(page, perPage, apiType);
			// json형식을 DTO로 변환
			JSONArray infoArr = JsonToDTO(result);

			
			for (int i = 0; i < infoArr.size(); i++) {

				JSONObject tmp = (JSONObject) infoArr.get(i);
				
				ServiceDetailDTO serviceDetailObj = new ServiceDetailDTO((String) tmp.get("서비스ID"),
						(String) tmp.get("지원유형"), (String) tmp.get("서비스명"), (String) tmp.get("서비스목적"),
						(String) tmp.get("신청기한"), (String) tmp.get("지원대상"), (String) tmp.get("선정기준"),
						(String) tmp.get("지원내용"), (String) tmp.get("신청방법"), (String) tmp.get("구비서류"),
						(String) tmp.get("접수기관명"), (String) tmp.get("문의처"), (String) tmp.get("온라인신청사이트URL"),
						(String) tmp.get("수정일시"), (String) tmp.get("소관기관명"), (String) tmp.get("법령"));
				

				if (Case == "insert") {
					mapper.insertDetail(serviceDetailObj);
				} else if (Case == "update") {
					mapper.updateDetail(serviceDetailObj);
				}
			}
		}

	}

	//supportConditions을  case에 따라 insert 또는 update 한다
	@Override
	public void openApiToConditionsDB(int totalCount, String Case) throws Exception {

		String result = "";
		// 페이지
		String page = "";
		// 페이지당 개수
		String perPage = "1000";
		// api 종류
		String apiType = "gov24/v3/supportConditions";

		for (int pageInt = 1; pageInt <= ((totalCount / 1000) + 1); pageInt++) {

			page = "" + pageInt;

			// api를 json형식으로 받아오기
			result = callApiToJson(page, perPage, apiType);
			
			// json형식을 DTO로 변환
			JSONArray infoArr = JsonToDTO(result);

			for (int i = 0; i < infoArr.size(); i++) {

				JSONObject tmp = (JSONObject) infoArr.get(i);

				SupportConditionsDTO supportConditionsObj = new SupportConditionsDTO((String) tmp.get("서비스ID"),
						(String) tmp.get("JA0101"), (String) tmp.get("JA0102"), (Long) tmp.get("JA0110"),
						(Long) tmp.get("JA0111"), (String) tmp.get("JA0201"), (String) tmp.get("JA0202"),
						(String) tmp.get("JA0203"), (String) tmp.get("JA0204"), (String) tmp.get("JA0205"),
						(String) tmp.get("JA0301"), (String) tmp.get("JA0302"), (String) tmp.get("JA0303"),
						(String) tmp.get("JA0313"), (String) tmp.get("JA0314"), (String) tmp.get("JA0315"),
						(String) tmp.get("JA0316"), (String) tmp.get("JA0317"), (String) tmp.get("JA0318"),
						(String) tmp.get("JA0319"), (String) tmp.get("JA0320"), (String) tmp.get("JA0322"),
						(String) tmp.get("JA0326"), (String) tmp.get("JA0327"), (String) tmp.get("JA0401"),
						(String) tmp.get("JA0402"), (String) tmp.get("JA0403"), (String) tmp.get("JA0404"),
						(String) tmp.get("JA0410"), (String) tmp.get("JA0411"), (String) tmp.get("JA0412"),
						(String) tmp.get("JA0413"), (String) tmp.get("JA0414"), (String) tmp.get("JA1101"),
						(String) tmp.get("JA1102"), (String) tmp.get("JA1103"), (String) tmp.get("JA1201"),
						(String) tmp.get("JA1202"), (String) tmp.get("JA1299"), (String) tmp.get("JA2101"),
						(String) tmp.get("JA2102"), (String) tmp.get("JA2103"), (String) tmp.get("JA2201"),
						(String) tmp.get("JA2202"), (String) tmp.get("JA2203"), (String) tmp.get("JA2299"),
						(String) tmp.get("JA0328"), (String) tmp.get("JA0329"), (String) tmp.get("JA0330"),
						(String) tmp.get("서비스명"));

				if (Case == "insert") {
					mapper.insertConditions(supportConditionsObj);
				} else if (Case == "update") {
					mapper.updateConditions(supportConditionsObj);
				}

			}
		}
	}
	
	// json형식을 DTO로 변환
	private JSONArray JsonToDTO(String result) throws Exception {

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
		JSONArray infoArr = (JSONArray) jsonObject.get("data");

		return infoArr;
	}


	// api를 json형식으로 가져오기
	//page: 해당 페이지, perPage: 페이지 마다 개수, apiType: api타입
	private String callApiToJson(String page, String perPage, String apiType) throws Exception {
		String result = "";

		URL url = new URL("https://api.odcloud.kr/api/" + apiType + "?page=" + page + "&perPage=" + perPage
				+ "&serviceKey=" + serviceKey);

		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Content-type", "application/json");

		BufferedReader bf;
		bf = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
		result = bf.readLine();

		return result;
	}
	
}
