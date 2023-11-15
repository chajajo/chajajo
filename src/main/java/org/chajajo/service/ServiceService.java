package org.chajajo.service;

import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceService {
    public List<ServiceVO> getList();

    public ServiceVO get(Long no);
}
