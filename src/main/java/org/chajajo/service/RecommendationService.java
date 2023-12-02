package org.chajajo.service;

import java.util.List;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;

public interface RecommendationService {

	//userConditions 가져오기
	public UserConditionsVO getUserCondtions(String userId);
	
	//userConditions을 통해 추천 목록 검색하기
	public List<String> getServiceIdToUserCondtions(UserConditionsVO userConditionsVO);
	
	//추천 목록 가져오기
	public List<ServiceVO> getRecommendedList(List<String> serviceIds, Criteria cri, int total, String category);
	
	//추천 목록 개수
	public int countRecommendedList(List<String> serviceIds);
	
	//userCondition update
	public void setUserConditions(UserConditionsVO userConditionsVO);
	
}
