package org.chajajo.service;

import java.util.List;

import org.chajajo.domain.QnABoardVO;
import org.chajajo.domain.QnACriteria;

public interface QnABoardService {
	
	public void register(QnABoardVO qna);

	public QnABoardVO get(Long bno);

	public boolean modify(QnABoardVO qna);

	public boolean remove(Long bno);

	//public List<QnABoardVO> getList();
	
	public List<QnABoardVO> getList(QnACriteria cri);
	
	public List<QnABoardVO> getListMy(QnACriteria cri);
	
	public int getTotal(QnACriteria cri);
	
	public int getTotalMy(QnACriteria cri);





}
