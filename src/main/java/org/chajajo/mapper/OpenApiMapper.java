package org.chajajo.mapper;

import org.chajajo.domain.ServiceDetailDTO;
import org.chajajo.domain.ServiceListDTO;
import org.chajajo.domain.SupportConditionsDTO;

public interface OpenApiMapper {

	public void insertList(ServiceListDTO serviceListObj);
	public void insertDetail(ServiceDetailDTO serviceDetailObj);
	public void insertConditions(SupportConditionsDTO supportConditionsObj);
	
	public void updateList(ServiceListDTO serviceListObj);
	public void updateDetail(ServiceDetailDTO serviceDetailObj);
	public void updateConditions(SupportConditionsDTO supportConditionsObj);
	
	public void deleteList();
	public void truncateDetail();
	public void truncateConditions();
	
}
