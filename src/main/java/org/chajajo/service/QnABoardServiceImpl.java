package org.chajajo.service;

import java.util.List;

import org.chajajo.domain.QnABoardVO;
import org.chajajo.domain.QnACriteria;
import org.chajajo.mapper.QnABoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnABoardServiceImpl implements QnABoardService {
	@Autowired
	private QnABoardMapper mapper;
	
	@Override
	public void register(QnABoardVO qna) {
		log.info("register......" + qna);		
		mapper.insertSelectKey(qna);	
	}

	@Override
	public QnABoardVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(QnABoardVO qna) {
		log.info("modify......" + qna);
		return mapper.update(qna) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...." + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<QnABoardVO> getList(QnACriteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(QnACriteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
