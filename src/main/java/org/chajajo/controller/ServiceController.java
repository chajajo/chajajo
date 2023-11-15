package org.chajajo.controller;

import lombok.extern.log4j.Log4j;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.PageDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	private ServiceService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/get")
	public ServiceVO get(@RequestParam("no") Long no, Model model) {

//        model.addAttribute("service", service.get(no));

		return service.get(no);
	}
}
