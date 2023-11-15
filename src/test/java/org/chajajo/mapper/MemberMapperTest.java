package org.chajajo.mapper;

import org.chajajo.config.RootConfig;
import org.chajajo.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootConfig.class })
@Log4j
public class MemberMapperTest {

	@Autowired
	private MemberMapper membermapper; // MemberMapper.java 인터페이스 의존성 주입

	// 회원가입 쿼리 테스트 메서드
//	@Test
	public void register() throws Exception {
		MemberVO member = new MemberVO();

		member.setUserId("test3"); // 회원 id
		member.setPassword("test3"); // 회원 비밀번호
		member.setEmail("test3@gmail.com"); // 회원 이메일
		member.setPhone("01012341234"); // 회원 전화번호

		membermapper.signUp(member); // 쿼리 메서드 실행

	}

	// 아이디 중복검사
	// @Test
	public void memberIdChk() throws Exception {
		String id = "test1"; // 존재하는 아이디
		String id2 = "test123"; // 존재하지 않는 아이디
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}

	/* 로그인 쿼리 mapper 메서드 테스트 */
	@Test
	public void memberLogin() throws Exception {

		MemberVO member = new MemberVO(); // MemberVO 변수 선언 및 초기화

		/* 올바른 아이디 비번 입력경우 */
		member.setUserId("test1");
		member.setPassword("1234");

		/* 올바른 않은 아이디 비번 입력경우 */
		// member.setMemberId("test1123");
		// member.setMemberPw("test1321321");

		membermapper.memberLogin(member);
		System.out.println("결과 값 : " + membermapper.memberLogin(member));

	}

}