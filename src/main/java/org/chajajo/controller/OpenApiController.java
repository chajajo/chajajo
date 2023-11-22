package org.chajajo.controller;

import org.chajajo.service.OpenApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@PropertySource("classpath:application.properties")
public class OpenApiController { // 수동으로 크롤링

	@Autowired 
	OpenApiService OpenApiService;
	
	@Value("${openApi.serviceKey}")
	private String serviceKey;
	
	//보조금 전체 개수 확인
	@GetMapping("/totalCount")
	public int totalCount() {
		int totalCount =0;
		totalCount =OpenApiService.totalCount();
		return totalCount;
	}
	
	//모든 테이블 초기화 후, serviceList 삽입
	@GetMapping("/insert/list")
	public void ApiInsertList() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		OpenApiService.cleanDB();
		try {
			OpenApiService.openApiToListDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//serviceDetail 삽입
	@GetMapping("/insert/detail")
	public void ApiInsertDetail() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToDetailDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//supportCondtions 삽입
	@GetMapping("/insert/conditions")
	public void ApiInsertConditions() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToConditionsDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//serviceList 업데이트
	@GetMapping("/update/list")
	public void ApiUpdateList() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToListDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//serviceDetail 업데이트
	@GetMapping("/update/detail")
	public void ApiUpdateDetail() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToDetailDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//supportCondtions 업데이트
	@GetMapping("/update/conditions")
	public void ApiUpdateConditions() {
		int totalCount =10142;
		totalCount =OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToConditionsDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
