package org.chajajo.mapper;

import java.util.List;

import org.chajajo.domain.CommentVO;

public interface CommentMapper {

	List<CommentVO> readAll(Long bno);
	CommentVO get(Long no);
	void create(CommentVO vo);
	void update(CommentVO vo);
	void delete(Long no);
	
}
