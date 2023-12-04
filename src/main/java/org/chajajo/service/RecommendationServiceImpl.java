package org.chajajo.service;

import java.util.ArrayList;
import java.util.List;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.RecommendedServiceDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;
import org.chajajo.mapper.OpenApiMapper;
import org.chajajo.mapper.RecommendationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
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
	public List<RecommendedServiceDTO> getServiceIdToUserCondtions(UserConditionsVO userConditionsVO) {
		List<RecommendedServiceDTO> recommendedServiceList = mapper.getServiceIdToSupportConditions(userConditionsVO);

		return recommendedServiceList;
	}

	//카테고리화 된 추천목록 추리기
	@Override
	public List<RecommendedServiceDTO> getCategoristRecommendedList(List<RecommendedServiceDTO> recommendedServiceList, String category) {
		List<RecommendedServiceDTO> categoristRecommendedServiceList = new ArrayList<RecommendedServiceDTO>();
		for (RecommendedServiceDTO recommendedService : recommendedServiceList) {
			if(recommendedService.getServiceField().equals(category)) {
				categoristRecommendedServiceList.add(recommendedService);
			}
		}
		return categoristRecommendedServiceList;
	}
	
	//추천 목록 가져오기
	@Override
	public List<ServiceVO> getRecommendedList(List<RecommendedServiceDTO> recommendedServiceList, Criteria cri, int total) {
		List<ServiceVO> serviceVoList = new ArrayList<ServiceVO>() ;
		
		for (int i = cri.getOffset(); i < cri.getOffset() + cri.getAmount() && i < total; i++) {
				log.info("" + i);
				String serivceId = recommendedServiceList.get(i).getServiceId();
				ServiceVO serviceVo;
				serviceVo = mapper.getServiceVOToServiceId(serivceId);
				if (serviceVo != null) {
					serviceVoList.add(serviceVo);
				}
			}

			return serviceVoList;
	}

	//추천 목록 개수
	@Override
	public int countRecommendedList(List<RecommendedServiceDTO> recommendedServiceList) {
		int total=0;
		for (RecommendedServiceDTO recommendedService : recommendedServiceList) {
			total++;
		}
		return total;
	}

	
	@Override
	public void setUserConditions(UserConditionsVO userConditionsVO) {
		mapper.updateUserCondition(userConditionsVO);
	}


}
