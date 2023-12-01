package org.chajajo.mapper;

import java.util.List;

import org.chajajo.domain.QnABoardVO;
import org.chajajo.domain.QnACriteria;

public interface QnABoardMapper {

	public List<QnABoardVO> getList();
	
	public List<QnABoardVO> getListWithPaging(QnACriteria cri);
	
	public void insert(QnABoardVO qna);
	
	public void insertSelectKey(QnABoardVO qna);
	
	public QnABoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(QnABoardVO qna);
	
	public int getTotalCount(QnACriteria cri);

}
