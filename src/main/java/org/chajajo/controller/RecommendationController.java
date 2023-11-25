package org.chajajo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.PageDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;
import org.chajajo.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/recommendation")
public class RecommendationController {
	
	@Autowired
	private RecommendationService service;
	
	@GetMapping("/conditions")
	public void getConditions(UserConditionsVO userConditionsVO) {
		
	}
	
	@GetMapping("/subsidy")
	public void getRecommendation(Model model, UserConditionsVO userConditionsVO, Criteria cri) {
		
		log.info(""+ userConditionsVO.getGender() +userConditionsVO.getAge() );
		
		List<String> serviceIds = service.getServiceIdToUserCondtions(userConditionsVO);
		
		//List<ServiceVO>
		model.addAttribute("list", service.getRecommendedList(serviceIds));
		
		int total = service.countRecommendedList(serviceIds);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@PostMapping("/subsidy")
	public void postRecommendation(HttpSession session, Model model) {
		String userId  = (String) session.getAttribute("id");
		
		if (userId != null) {
			
			//UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
		}
	}
	
}
