package org.chajajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/mypage")
public class MyPageController {

	// 회원 정보 페이지 이동
	@RequestMapping(value = "userinfo", method = RequestMethod.GET)
	public void userifoGET() {
		log.info("회원정보 페이지 진입 성공");
	}

	// 정보 수정 페이지 이동
	@RequestMapping(value = "infomodify", method = RequestMethod.GET)
	public void infomodifyGET() {
		log.info(" 정보수정 페이지 진입 성공");
	}

	// 회원 탈퇴 페이지 이동
	@RequestMapping(value = "userout", method = RequestMethod.GET)
	public void useroutGET() {
		log.info(" 회원탈퇴 페이지 진입 성공");
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
