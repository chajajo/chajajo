package org.chajajo.mapper;

import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceMapper {
    public List<ServiceVO> getList();

    public ServiceVO read(Long no);
}
