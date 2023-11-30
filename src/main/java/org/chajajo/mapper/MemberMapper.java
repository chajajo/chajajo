package org.chajajo.mapper;

import org.chajajo.domain.MemberVO;

public interface MemberMapper {

	// 회원가입
	public void signUp(MemberVO member);

	// 아이디 중복 검사
	public int idCheck(String userId);

	// 로그인
	public MemberVO memberLogin(MemberVO member);

	//회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public MemberVO userinfo(String userId) throws Exception;

	//회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public MemberVO userinfoWithIDPW(String userId, String password) throws Exception;

	//회원정보수정
	public void infomodify(MemberVO member) throws Exception;

	//회원탈퇴
	public void userout(MemberVO member) throws Exception;

	//이메일 중복 검사
	public int emailCheck(String email);

}
