package org.chajajo.service;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceService {

  public ServiceDetailVO get(Long no);
  
	/* 게시판 목록 */
	public List<ServiceVO> getList(Criteria cri);
	
	/* 게시판 목록 (페이징 적용) */
	public List<ServiceVO> getListWithPaging(Criteria cri);

	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);

	public List<ServiceVO> getMostViewed(int count);
}
