package org.chajajo.service;

import java.io.IOException;

import org.chajajo.domain.MemberVO;
import org.chajajo.domain.AuthVO;
import org.chajajo.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	@Override
	public MemberVO get(String userId) {
		return mapper.read(userId);
	}

	@Override
	public MemberVO login(MemberVO member) {
		return mapper.memberLogin(member);
	}

	//메일 중복 검사
	@Override
	public int emailCheck(String userId) throws Exception {		
		return mapper.emailCheck(userId);
	}


	// 아이디 중복 검사
	@Override
	public int userIdChk(String userId) throws Exception {
		return mapper.userIdChk(userId);
	}

	@Override
	public void register(MemberVO member) throws IOException {

		// 1. 비밀번호 암호화
		String encPassword = pwEncoder.encode(member.getPassword());
		member.setPassword(encPassword);

		// 2. user_info에 저장
		mapper.insert(member);

		AuthVO auth = new AuthVO(member.getUserId(), "ROLE_USER");
		mapper.insertAuth(auth);
	}

	// 회원정보 보기
	@Override
	public MemberVO userinfo(String userId) {
		System.out.println("readMember()실행");
		MemberVO member = null;

		try {
			member = mapper.userinfo(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return member;
	}

	@Override
	public String searchById(String userId) throws Exception {
		System.out.println("searchById() 실행");
		MemberVO member = mapper.searchById(userId);
		return member.getPassword();
	}

	// 회원정보수정
	@Override
	public void infomodify(MemberVO member, String pwInDb) {
		try {
			mapper.infomodify(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 회원정보탈퇴
	public void userout(MemberVO member, String pwInDb) {
		try {
			mapper.deleteUserAuth(member.getUserId());
			mapper.deleteUserInfo(member.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
