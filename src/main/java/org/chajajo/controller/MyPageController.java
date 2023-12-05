package org.chajajo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.chajajo.domain.MemberVO;

import org.chajajo.domain.QnABoardVO;
import org.chajajo.domain.QnACriteria;
import org.chajajo.domain.QnAPageDTO;

import org.chajajo.service.MemberService;
import org.chajajo.service.QnABoardService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/mypage")
public class MyPageController {
	@Autowired
	MemberService memberservice;
	
	@Autowired
	private QnABoardService qnaservice;

	// 회원 정보 페이지 이동
	@RequestMapping(value = "userinfo", method = RequestMethod.GET)
	public void userinfoGET(RedirectAttributes rttr, HttpServletRequest request, HttpSession session, Model model,
			MemberVO member) throws Exception {
		session = request.getSession();

		String id = (String) session.getAttribute("member.userId");
		log.info("C: 회원정보보기 GET의 아이디 " + id);

		MemberVO member1 = memberservice.userinfo(id);

		model.addAttribute("member", member1);
		log.info("C: 회원정보보기 GET의 VO " + member1);
	}

	// 정보 수정 페이지 이동
	@RequestMapping(value = "infomodify", method = RequestMethod.GET)
	public String infomodifyGET(HttpSession session, Model model) throws Exception {
		model.addAttribute("member", memberservice.userinfo((String) session.getAttribute("id")));
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

	
	/* QnABoardController기능 추가 시작 */
	// 문의하기 페이지 이동
	@GetMapping("/list")
	public void listGET(@ModelAttribute("cri") QnACriteria cri, Model model) {
		log.info("list" + cri);

		model.addAttribute("list", qnaservice.getList(cri));
		
		int total = qnaservice.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new QnAPageDTO(cri, total));//
	}
	
	//문의글쓰기
	@GetMapping("/register")
	public void register() {
		log.info("register");
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("board") QnABoardVO qna, 
			Errors errors,
			RedirectAttributes rttr) throws Exception {
		
		if (errors.hasErrors()) {
			return "mypage/register";
		}
		
		qnaservice.register(qna);		
		rttr.addFlashAttribute("result", qna.getBno());
		
		return "redirect:/mypage/list";
	}

	//문의글 조회 수정
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") QnACriteria cri,
			Model model) {
		log.info("/get or modify");
		model.addAttribute("qna", qnaservice.get(bno));
	}

	//문의글 수정
	@PostMapping("/modify")
	public String modify(QnABoardVO qna, RedirectAttributes rttr) {
		log.info("modify:" + qna);
		if (qnaservice.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/list";
	}
	
	//문의글 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr)
	{
		log.info("remove..." + bno);
		if (qnaservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/list";
	}
	
	/* QnABoardController기능 추가 끝 */
	
	
	// 나의문의 페이지 이동
	@GetMapping("/mylist")
	public void mylistGET(Principal principal, @ModelAttribute("cri") QnACriteria cri, Model model) {
		log.info("mylist" + cri);
			String userId = principal.getName();
			cri.setUserId(userId);
			model.addAttribute("mylist", qnaservice.getListMy(cri));
			
			int total = qnaservice.getTotalMy(cri);
			log.info("total: " + total);
			
			model.addAttribute("pageMaker", new QnAPageDTO(cri, total));//
	}
	
	//나의 문의글 조회 수정
	@GetMapping({ "/myget"})
	public void myget(@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") QnACriteria cri,
			Model model) {
		log.info("/myget");
		model.addAttribute("qna", qnaservice.myget(bno));
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
