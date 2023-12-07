package org.chajajo.service;

import java.util.List;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.RecommendedServiceDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;

public interface RecommendationService {

	//userConditions 가져오기
	public UserConditionsVO getUserCondtions(String userId);
	
	//userConditions을 통해 추천 목록 검색하기
	public List<RecommendedServiceDTO> getServiceIdToUserCondtions(UserConditionsVO userConditionsVO);
	
	//카테고리화 된 추천목록 추리기
	public List<RecommendedServiceDTO> getCategoristRecommendedList(List<RecommendedServiceDTO> recommendedServiceList, String category);
	
	//추천 목록 가져오기
	public List<ServiceVO> getRecommendedList(List<RecommendedServiceDTO> recommendedServiceList, Criteria cri, int total);
	
	//추천 목록 개수
	public int countRecommendedList(List<RecommendedServiceDTO> recommendedServiceList);
	
	//userCondition update
	public void setUserConditions(UserConditionsVO userConditionsVO);
	
}
