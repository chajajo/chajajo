package org.chajajo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.chajajo.domain.Criteria;
import org.chajajo.domain.MemberVO;
import org.chajajo.domain.PageDTO;
import org.chajajo.domain.ServiceVO;
import org.chajajo.domain.UserConditionsVO;
import org.chajajo.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@PostMapping("/conditions")
	public void postConditions(HttpServletRequest request,MemberVO member, HttpSession session, Model model) {
		
		session = request.getSession();
		String userId  = (String) session.getAttribute("id");
		
		if (userId != null) {
			
			//UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
		}
	}
	
	@GetMapping("/subsidy")
	public void getRecommendation(UserConditionsVO userConditionsVO, Model model, Criteria cri) {
		/*session = request.getSession();
		if (session.getAttribute("userConditionsVO") != null) {
			userConditionsVO = (UserConditionsVO) session.getAttribute("userConditionsVO");
		} */
		List<String> serviceIds = service.getServiceIdToUserCondtions(userConditionsVO);
		
		//List<ServiceVO>
		model.addAttribute("list", service.getRecommendedList(serviceIds, cri));
		
		int total = service.countRecommendedList(serviceIds)+1;
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		log.info(""+ cri.getOffset() );
	}
	
	@PostMapping("/subsidy")
	public void postRecommendation(HttpServletRequest request,MemberVO member, HttpSession session, Model model) {
		
		session = request.getSession();
		String userId  = (String) session.getAttribute("id");
		
		if (userId != null) {
			
			//UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
		}
	}
	
}
