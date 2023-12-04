package org.chajajo.service;

import lombok.extern.log4j.Log4j;
import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.StarVO;
import org.chajajo.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Log4j
@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceMapper mapper;

	/* 즐겨찾기 목록 */
	@Override
	public ServiceDetailVO get(String no, Principal principal) {
		ServiceDetailVO service = mapper.read(no);
		if(principal != null) {
			List<String> stars = mapper.getStarsList(principal.getName());
			service.setMyStars(stars.contains(service.getServiceId()));
		}
		return service;
	}
	
	@Override
	public List<ServiceVO> getFavoritelist(String userId){
		return mapper.getFavoritelist(userId);
	}
	

	/* 게시판 목록 */
	@Override
	public List<ServiceVO> getList(Criteria cri) {

		return mapper.getList(cri);
	}

	/* 게시판 목록 (페이징 적용) */
	@Override
	public List<ServiceVO> getListWithPaging(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	/* 게시판 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public List<ServiceVO> getMostViewed(int count) {
		return mapper.getMostViewed(count);
	}
}
