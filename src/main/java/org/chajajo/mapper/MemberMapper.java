package org.chajajo.mapper;

import org.chajajo.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void signUp(MemberVO member);

	public MemberVO read(String userId);
	
	// 아이디 중복 검사
	public int idCheck(String userId);

	   /* 로그인 */
	public MemberVO memberLogin(MemberVO member);

}
