package org.chajajo.service;

import java.util.ArrayList;
import java.util.List;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;
import org.chajajo.mapper.OpenApiMapper;
import org.chajajo.mapper.RecommendationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Service
public class RecommendationServiceImpl implements RecommendationService {

	@Autowired
	RecommendationMapper mapper;

	// userConditions 가져오기
	@Override
	public UserConditionsVO getUserCondtions(String userId) {
		UserConditionsVO userCondtionsVo = null;
		userCondtionsVo = mapper.getUserCondtions(userId);
		return userCondtionsVo;
	}
	
	//userConditions을 통해 추천 목록 검색하기
	@Override
	public List<String> getServiceIdToUserCondtions(UserConditionsVO userConditionsVO) {
		List<String> serviceIds = new ArrayList<String>();
		serviceIds = mapper.getServiceIdToSupportConditions(userConditionsVO);
		return serviceIds;
	}

	//추천 목록 가져오기
	@Override
	public List<ServiceVO> getRecommendedList(List<String> serviceIds) {
		List<ServiceVO> serviceVoList = new ArrayList<ServiceVO>() ;
		
		for (String serivceId : serviceIds) {
			ServiceVO serviceVo;
			serviceVo = mapper.getServiceVOToServiceId(serivceId);
			serviceVoList.add(serviceVo);
		}
		
		return serviceVoList;
	}

	//추천 목록 개수
	@Override
	public int countRecommendedList(List<String> serviceIds) {
		int total=0;
		for (String serivceId : serviceIds) {
			total++;
		}
		return total;
	}

}
