package org.chajajo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.chajajo.domain.Criteria;
import org.chajajo.domain.QnABoardVO;

public interface QnABoardMapper {

	public List<QnABoardVO> getList();
	
	public List<QnABoardVO> getListWithPaging(Criteria cri);
	
	public void insert(QnABoardVO qna);
	
	public void insertSelectKey(QnABoardVO qna);
	
	public QnABoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(QnABoardVO qna);

}
