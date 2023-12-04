package org.chajajo.controller;

import lombok.extern.log4j.Log4j;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.PageDTO;
import org.chajajo.domain.ServiceDetailVO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.StarVO;
import org.chajajo.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	private ServiceService service;

	@GetMapping("/list")
	public void list(Model model, Criteria cri) {

		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotal(cri);

		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/get")
	public void get(@RequestParam("no") String no, Model model, Principal principal) {
		model.addAttribute("service", service.get(no, principal));
	}
}
