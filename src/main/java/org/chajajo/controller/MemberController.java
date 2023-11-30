package org.chajajo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.chajajo.domain.MemberVO;
import org.chajajo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberservice;

	// 회원가입 페이지 이동
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public void signUpGET() {

		log.info("회원가입 페이지 진입");

	}

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signPOST(MemberVO member) throws Exception {

		log.info("signup 진입");

		// 회원가입 서비스 실행
		memberservice.signUp(member);

		log.info("signup Service 성공");

		return "redirect:/";

	}

	// 로그인 페이지 이동
	@GetMapping("/login")
	public void loginGET() {

		log.info("로그인 페이지 진입");

	}

	
	@PostMapping("/login")
	public String loginPOST(HttpServletRequest request,MemberVO member,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		log.info("C: 로그인 처리페이지 POST");

		log.info("C: " + member.getUserId() + member.getPassword());

		session = request.getSession();
		MemberVO returnVO = memberservice.memberLogin(member);

		log.info("C: 리턴VO결과" + returnVO);

		if (returnVO != null) {

			session.setAttribute("member", returnVO);
			session.setAttribute("id", returnVO.getUserId());

			rttr.addFlashAttribute("member", returnVO);

			return "redirect:/";
		} else {
			int result = 0;
			rttr.addFlashAttribute("result", result);
            
			return "redirect:/member/login";
		}
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		log.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/";

	}

	/* 아이디 중복 검사 */
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String userId) throws Exception {

		log.info("userIdChk() 진입");

		int result = memberservice.idCheck(userId);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	} // memberIdChkPOST() 종료
	
	/* 메일 중복 검사 */
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public String EmailChkPOST(String email) throws Exception {

		log.info("emailChk() 진입");

		int result = memberservice.emailCheck(email);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	} // emailChkPOST() 종료
	
}
