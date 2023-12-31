package org.chajajo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.chajajo.domain.Criteria;
import org.chajajo.domain.RecommendedServiceDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;

public interface RecommendationMapper {
	
	//user conditions 가져오기
	public UserConditionsVO getUserCondtions(String userId);
	
	//support conditions에서 id 검색하기
	public List<RecommendedServiceDTO> getServiceIdToSupportConditions(UserConditionsVO userConditionsVO);
	
	//id를 통해 ServiceVO 가져오기
	public ServiceVO getServiceVOToServiceId(String serviceId);
	
	//userCondition update
	public void updateUserCondition(UserConditionsVO userConditionsVO);
	
}
