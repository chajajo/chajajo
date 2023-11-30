package org.chajajo.service;

import java.io.IOException;

import org.chajajo.domain.MemberVO;

public interface MemberService {
	// 로그인
	public MemberVO get(String userId);

	public void register(MemberVO member) throws IOException;

	// 아이디 중복 검사
	public int userIdChk(String userId) throws Exception;

	// 회원정보 보기
	public MemberVO userinfo(String userId);

	public String searchById(String userId) throws Exception;

	// 회원정보 변경
	public void infomodify(MemberVO member, String pwInDb) throws Exception;

	public MemberVO login(MemberVO member);

	// 회원 탈퇴
	public void userout(MemberVO member, String pwInDb);
}
