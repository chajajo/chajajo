package org.chajajo.service;

import lombok.extern.log4j.Log4j;
import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceVO;
import org.chajajo.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ServiceServiceImpl implements ServiceService{

    @Autowired
    private ServiceMapper mapper;

    @Override
    public List<ServiceVO> getList(Criteria cri) {
        List<ServiceVO> list = mapper.getList(cri);

        return list;
    }

    @Override
    public ServiceVO get(Long no) {
        ServiceVO service = mapper.read(no);

        return service;
    }
}
