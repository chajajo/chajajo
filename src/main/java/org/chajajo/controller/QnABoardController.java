package org.chajajo.controller;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.PageDTO;
import org.chajajo.domain.QnABoardVO;
import org.chajajo.service.QnABoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
@AllArgsConstructor
public class QnABoardController {

	private QnABoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));//
	}

	@GetMapping("/register")
	public void register() {
		log.info("register");
	}

	@PostMapping("/register")
	public String register(QnABoardVO qna, RedirectAttributes rttr) {
		log.info("register: " + qna);
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getBno());
		return "redirect:/qna/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or modify");
		model.addAttribute("qna", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(QnABoardVO qna, RedirectAttributes rttr) {
		log.info("modify:" + qna);
		if (service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/qna/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr)
	{
		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/qna/list";
	}
	

}
