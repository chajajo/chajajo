package org.chajajo.service;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceService {

    public List<ServiceVO> getList(Criteria cri);

	public ServiceVO get(Long no);
	
	// pagination
	public int getTotal(Criteria cri);
}
