package org.chajajo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.chajajo.domain.MemberVO;
import org.chajajo.security.domain.CustomUser;
import org.chajajo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/mypage")
public class MyPageController {
	@Autowired
	MemberService memberservice;

	// 회원 정보 페이지 이동
	@RequestMapping(value = "userinfo", method = RequestMethod.GET)
	public void userinfoGET(RedirectAttributes rttr, Principal principal, Model model, MemberVO member) throws Exception {

		String id =  principal.getName();
		log.info("C: 회원정보보기 GET의 아이디 " + id);

		MemberVO member1 = memberservice.userinfo(id);

		model.addAttribute("member", member1);
		log.info("C: 회원정보보기 GET의 VO " + member1);
	}

	// 정보 수정 페이지 이동
	@RequestMapping(value = "infomodify", method = RequestMethod.GET)
	public String infomodifyGET(Principal principal, Model model) throws Exception {
		String id =  principal.getName();
		model.addAttribute("member", memberservice.userinfo(id));
		return "/mypage/infomodify";
	}

	@RequestMapping(value = "/infomodify", method = RequestMethod.POST)
	public String infomodifyPOST(HttpSession session, HttpServletRequest request, MemberVO member,
			RedirectAttributes rttr) throws Exception {
		log.info("회원정보수정 입력페이지 POST");
		String pwInDb = memberservice.searchById(member.getUserId());

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		Boolean isMatches = passwordEncoder.matches(member.getPassword(), pwInDb);
		System.out.println(isMatches);

		session = request.getSession();
		if (isMatches == true) {
			try {
				memberservice.infomodify(member, pwInDb);
				
				session.setAttribute("phone", member.getPhone());
				session.setAttribute("email", member.getEmail());

				rttr.addFlashAttribute("updatedPhone", memberservice.userinfo(member.getEmail()));
				rttr.addFlashAttribute("updateEmail", memberservice.userinfo(member.getPhone()));
				rttr.addFlashAttribute("success", "수정이 완료되었습니다.");
				return "redirect:/mypage/userinfo"; // 수정 성공 시 리다이렉트할 경로
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
		}
		return "redirect:/mypage/infomodify";
	}

	// 나만의 보조금 페이지 이동
	@RequestMapping(value = "mysubsidy", method = RequestMethod.GET)
	public void mysubsidyGET(Model model, Principal principal) {
		log.info(" 나만의 보조금 페이지 진입 성공");
		String userId = principal.getName();
		
		if (userId != null) {
			
			//UserConditionsVO
			model.addAttribute("userConditions", memberservice.getUserCondtions(userId));
		}
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

	// 회원 탈퇴 페이지 이동
	@RequestMapping(value = "/userout", method = RequestMethod.GET)
	public String useroutGET(HttpSession session) throws Exception {
		log.info("C: 회원정보 삭제 GET");
		return "/mypage/userout";
	}

	@RequestMapping(value = "/userout", method = RequestMethod.POST)
	public String useroutPOST(HttpSession session, HttpServletRequest request, MemberVO member, RedirectAttributes rttr)
			throws Exception {
		String pwInDb = memberservice.searchById(member.getUserId());

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		Boolean isMatches = passwordEncoder.matches(member.getPassword(), pwInDb);
		System.out.println(isMatches);

		session = request.getSession();
		if (isMatches == true) {
			try {
				memberservice.userout(member, pwInDb);
				rttr.addFlashAttribute("success", "탈퇴가 완료되었습니다.");
				return "redirect:/member/logout.do"; // 탈퇴 성공 시 리다이렉트할 경로
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
		}

		return "redirect:/mypage/userout";

	}
}
