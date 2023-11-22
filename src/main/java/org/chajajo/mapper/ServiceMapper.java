package org.chajajo.mapper;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;


import java.util.List;

public interface ServiceMapper {
	public ServiceDetailVO read(Long no);
	
	// pagination
	public List<ServiceVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

}
