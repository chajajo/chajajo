package org.chajajo.mapper;

import org.chajajo.domain.ReplyVO;

public interface ReplyMapper {
	ReplyVO get(Long no);
	void create(ReplyVO vo);
	void update(ReplyVO vo);
	void delete(Long no);
}
