package org.chajajo.controller;

import java.security.Principal;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.protobuf.Extension.MessageType;

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
	public void postConditions(HttpServletRequest request, MemberVO member, HttpSession session, Model model) {
		
		session = request.getSession();
		String userId  = (String) session.getAttribute("member.userId");
		
		if (userId != null) {
			
			//UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
		}
	}
	
	@PostMapping("/userConditions")
	public String postUserConditions(UserConditionsVO userConditionsVO) {
		
		service.setUserConditions(userConditionsVO);
		return "redirect:/mypage/mysubsidy";
	}
	
	@GetMapping("/subsidy")
	public void getRecommendation(UserConditionsVO userConditionsVO, Model model, Criteria cri, HttpServletRequest request, HttpSession session) throws Exception {
		
		session = request.getSession();
		
		
		Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
		
		//로그인 시에 기동
		if(securityContextObject != null) {
		    SecurityContext securityContext = (SecurityContext)securityContextObject;
		    Authentication authentication = securityContext.getAuthentication();
		    
		    
		    String userId = authentication.getName();
		  //UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
		}
		List<String> serviceIds = service.getServiceIdToUserCondtions(userConditionsVO);
		
		//List<ServiceVO>
		model.addAttribute("list", service.getRecommendedList(serviceIds, cri));
		
		int total = service.countRecommendedList(serviceIds)+1;
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		log.info(""+ cri.getOffset() );
	}
	
	@PostMapping("/subsidy")
	public void postRecommendation(Principal principal, Model model) {
		
		String userId = principal.getName();
		
		if (userId != null) {
			log.info(""+ userId );
			//UserConditionsVO
			model.addAttribute("userConditions", service.getUserCondtions(userId));
			log.info(""+ userId );
		}
	}
	/*
	@RequestMapping(value="/userConditions", method=RequestMethod.POST)
	@ResponseBody
	public String postUserConditions(Principal principal) {
		String jsonUserConditions= "";
		String userId = principal.getName();
		UserConditionsVO userconditions = null;
		if (userId != null) {
			
			
			userconditions = service.getUserCondtions(userId);
			log.info(""+userconditions);
			ObjectMapper obm = new ObjectMapper();
			try {
				jsonUserConditions = obm.writeValueAsString(userconditions);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return jsonUserConditions;
		}
		return jsonUserConditions;
	}*/
	
}
