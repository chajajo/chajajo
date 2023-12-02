package org.chajajo.mapper;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;

import java.util.List;

public interface ServiceMapper {
  
  /* 상세보기 페이지 */
	public ServiceDetailVO read(String no);

	/* 게시판 목록 */
	public List<ServiceVO> getList(Criteria cri);

	/* 게시판 목록 (페이징 적용) */
	public List<ServiceVO> getListWithPaging(Criteria cri);

	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);

    public List<ServiceVO> getMostViewed(int count);
}
