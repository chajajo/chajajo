package org.chajajo.service;

import java.io.IOException;

import org.chajajo.domain.MemberVO;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;


public interface MemberService {

	// 회원가입
	public void signUp(MemberVO member) throws IOException;

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception;

	   /* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;

	

}
