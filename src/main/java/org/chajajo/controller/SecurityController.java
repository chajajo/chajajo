package org.chajajo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.chajajo.domain.MemberVO;
import org.chajajo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class SecurityController {

	@Autowired
	MemberService service;

	@GetMapping("/signup")
	public void signup(@ModelAttribute("member") MemberVO member) {
	}

	@PostMapping("/signup")
	public String signup(@Valid @ModelAttribute("member") MemberVO member, Errors errors) throws IOException {

		if (errors.hasErrors()) {
			return "member/signup";
		}

		// DB 저장
		service.register(member);

		return "redirect:/";
	}

	@GetMapping("/login")
	public void login() {
		log.info("login page");
	}


	/* 아이디 중복 검사 */
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserId(String userId) throws Exception {

		log.info("userIdChk() 진입");

		int result = service.userIdChk(userId);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	} // memberIdChkPOST() 종료

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		log.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/";

	}
}
