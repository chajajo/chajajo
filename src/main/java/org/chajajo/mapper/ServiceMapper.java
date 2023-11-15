package org.chajajo.mapper;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceMapper {
    public List<ServiceVO> getList(Criteria cri);

    public ServiceVO read(Long no);
}
