package org.chajajo.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.chajajo.domain.MemberVO;
import org.chajajo.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	 MemberService memberservice;
	

	

	// 회원가입 페이지 이동
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public void signUpGET() {

		logger.info("회원가입 페이지 진입");

	}

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signPOST(MemberVO member) throws Exception {

		logger.info("signup 진입");

		// 회원가입 서비스 실행
		memberservice.signUp(member);

		logger.info("signup Service 성공");

		return "redirect:/";

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지 진입");

	}
	
	
	/* 로그인 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		//System.out.println("login 메서드 진입");
		//System.out.println("전달된 데이터 : " + member);
		
		  HttpSession session = request.getSession();
		  MemberVO lvo = memberservice.memberLogin(member);
		  
		  if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            
	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	            
	        }
	        
	        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:/";

	}
	
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/";        
        
    }
 

	// 아이디 중복 검사
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String userId) throws Exception {

		/* logger.info("userIdChk() 진입"); */

		logger.info("userIdChk() 진입");

		int result = memberservice.idCheck(userId);

		logger.info("결과값 = " + result);

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}

	} // memberIdChkPOST() 종료


}
