package org.chajajo.controller;

import java.util.List;

import org.chajajo.domain.CommentVO;
import org.chajajo.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/qna/{bno}/comment")
public class CommentController {

	@Autowired
	CommentMapper mapper;

	@GetMapping("")
	public List<CommentVO> readComments(@PathVariable Long bno) {
		return mapper.readAll(bno);
	}

	@GetMapping("/{no}")
	public CommentVO readComment(@PathVariable Long bno, @PathVariable Long no) {
		return mapper.get(no);
	}

	@PostMapping("")
	public CommentVO create(@RequestBody CommentVO vo) {
		mapper.create(vo);
		return mapper.get(vo.getNo());
	}

	@PutMapping("/{no}")
	public CommentVO update(@PathVariable Long no, @RequestBody CommentVO vo) {
		System.out.println("==> " + vo);
		mapper.update(vo);
		return vo;
	}

	@DeleteMapping("/{no}")
	public String delete(@PathVariable Long no) {
		System.out.println("delete ==>" + no);
		mapper.delete(no);
		return "OK";
	}
}
