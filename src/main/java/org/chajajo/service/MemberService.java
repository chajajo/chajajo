package org.chajajo.service;

import java.io.IOException;

import org.chajajo.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public void signUp(MemberVO member) throws IOException;

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception;

	// 로그인 기능
	public MemberVO memberLogin(MemberVO member) throws Exception;

	// 회원정보 보기
	public MemberVO readMember(String userId);

	// 회원정보 변경
	public void updateMember(MemberVO member);

	// 회원정보 삭제
	public void deleteMember(MemberVO member);


}
