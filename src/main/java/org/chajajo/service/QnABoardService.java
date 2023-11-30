package org.chajajo.service;

import java.util.List;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.QnABoardVO;

public interface QnABoardService {
	
	public void register(QnABoardVO qna);

	public QnABoardVO get(Long bno);

	public boolean modify(QnABoardVO qna);

	public boolean remove(Long bno);

	//public List<QnABoardVO> getList();
	
	public List<QnABoardVO> getList(Criteria cri);

}
