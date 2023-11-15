package org.chajajo.mapper;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceMapper {
	public ServiceVO read(Long no);
	
	// pagination
	public List<ServiceVO> getList();
	public List<ServiceVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
