package org.chajajo.mapper;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.StarVO;

import java.security.Principal;
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

	/* 즐겨찾기 구현 */	
	public List<String> getStarsList(String userId);

	public int addStar(StarVO star);

	public int deleteStar(StarVO star);

	public List<ServiceVO> getMostViewed(int count);

	public List<ServiceVO> getFavoritelist(String userId);
}

