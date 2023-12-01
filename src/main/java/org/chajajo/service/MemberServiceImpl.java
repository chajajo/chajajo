package org.chajajo.service;

import java.io.IOException;
import java.util.Calendar;

import org.chajajo.domain.MemberVO;
import org.chajajo.domain.UserConditionsVO;
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

	
	//userCondition 가져오기
	@Override
	public UserConditionsVO getUserCondtions(String userId) {
		UserConditionsVO userCondtions = null;
		userCondtions = mapper.getUserConditions(userId);
		return userCondtions;
	}

	// 회원정보탈퇴
	public void userout(MemberVO member, String pwInDb) {
		try {
			mapper.deleteUserFavorite(member.getUserId());
			mapper.delteUserCondition(member.getUserId());
			mapper.deleteUserAuth(member.getUserId());
			mapper.deleteUserInfo(member.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//userCondition 제작
	@Override
	public void setUserConditions(MemberVO member) {
		
		UserConditionsVO userCondition = new UserConditionsVO();
		
		userCondition.setUserId(member.getUserId());
		
		String birth = member.getBirth();
		
		int birthYear = Integer.valueOf(birth.substring(0, 4));
		int birthMonth = Integer.valueOf(birth.substring(5, 7));
		int birthDay = Integer.valueOf(birth.substring(8));
		
		
		userCondition.setAge(getAge(birthYear, birthMonth, birthDay));
		
		
		String gender = member.getGender();
		if (gender.equals("M")) {
			gender = "male";
		} else if (gender.equals("F")) {
			gender = "female";
		}
		
		userCondition.setGender(gender);
		
		mapper.insertUserConditions(userCondition);
		
	}
	

	private static int getAge(int birthYear, int birthMonth, int birthDay)
	 {
	         Calendar current = Calendar.getInstance();
	        
	         int currentYear  = current.get(Calendar.YEAR);
	         int currentMonth = current.get(Calendar.MONTH) + 1;
	         int currentDay   = current.get(Calendar.DAY_OF_MONTH);
	         
	         // 만 나이 구하기 2022-1995=27 (현재년-태어난년)
	         int age = currentYear - birthYear;
	         // 만약 생일이 지나지 않았으면 -1
	         if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) 
	             age--;
	         // 5월 26일 생은 526
	         // 현재날짜 5월 25일은 525
	         // 두 수를 비교 했을 때 생일이 더 클 경우 생일이 지나지 않은 것이다.
	         return age;
	 }
	
	

}
