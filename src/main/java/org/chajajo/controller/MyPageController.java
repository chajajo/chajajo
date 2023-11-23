package org.chajajo.controller;

import javax.servlet.http.HttpSession;

import org.chajajo.domain.MemberVO;
import org.chajajo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/mypage")
public class MyPageController {
	@Autowired
	MemberService memberservice;

	// 회원 정보 페이지 이동
	@RequestMapping(value = "userinfo", method = RequestMethod.GET)
	public void userinfoGET(HttpSession session, Model model) throws Exception {

			String id = (String) session.getAttribute("id");
			log.info("C: 회원정보보기 GET의 아이디 " + id);

			MemberVO member = memberservice.userinfo(id);

			model.addAttribute("member", member);
			log.info("C: 회원정보보기 GET의 VO " + member);
		}

	// 정보 수정 페이지 이동
	@RequestMapping(value = "infomodify", method = RequestMethod.GET)
	public String infomodifyGET(HttpSession session, Model model) throws Exception {
			
			model.addAttribute("member", memberservice.userinfo((String) session.getAttribute("id")));

			return "/mypage/infomodify";
		}
	
	@RequestMapping(value = "/infomodify", method = RequestMethod.POST)
	public String infomodifyPOST(MemberVO member) throws Exception {
		log.info("회원정보수정 입력페이지 POST");
		

		memberservice.infomodify(member);
		return "redirect:/mypage/userinfo";
	}


	// 회원 탈퇴 페이지 이동
	@RequestMapping(value = "userout", method = RequestMethod.GET)
	public String useroutGET(HttpSession session) throws Exception {
			log.info("C: 회원정보 삭제 GET");
			System.out.println(session);

			String id = (String)session.getAttribute("id");
			
			if (id == null) {
				return "redirect:/";
			}
			return "/mypage/userout";
		}

	@RequestMapping(value = "/userout", method = RequestMethod.POST)
	public String useroutPOST(MemberVO member, HttpSession session) throws Exception {
		log.info("회원정보 삭제 POST");

		log.info("deleteForm전달정보 " + member);

		memberservice.userout(member);

		session.invalidate();

		return "redirect:/";
	}
	
	// 나만의 보조금 페이지 이동
	@RequestMapping(value = "mysubsidy", method = RequestMethod.GET)
	public void mysubsidyGET() {
		log.info(" 나만의 보조금 페이지 진입 성공");
	}

	// 즐겨찾기 목록 페이지 이동
	@RequestMapping(value = "favoritelist", method = RequestMethod.GET)
	public void favoritelistGET() {
		log.info(" 즐겨찾기 목록 페이지 진입 성공");
	}

	// 알림 서비스 페이지 이동
	@RequestMapping(value = "alertservice", method = RequestMethod.GET)
	public void alertserviceGET() {
		log.info(" 알림 서비스 페이지 진입 성공");
	}

	// 문의하기 페이지 이동
	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public void contactGET() {
		log.info(" 문의하기 페이지 진입 성공");
	}

	// 나의문의 페이지 이동
	@RequestMapping(value = "mycontact", method = RequestMethod.GET)
	public void mycontactGET() {
		log.info(" 나의 문의 페이지 진입 성공");
	}
}
