package org.chajajo.mapper;

import org.chajajo.domain.AuthVO;
import org.chajajo.domain.MemberVO;
import org.chajajo.domain.UserConditionsVO;

public interface MemberMapper {

	// 로그인
	public MemberVO read(String userId);

	public MemberVO memberLogin(MemberVO member);

	// 회원가입
	public void insert(MemberVO member);

	public void insertAuth(AuthVO auth);

	// 아이디 중복 검사
	public int userIdChk(String userId);

	// 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public MemberVO userinfo(String userId) throws Exception;

	// 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public MemberVO userinfoWithIDPW(String userId, String password) throws Exception;

	public MemberVO searchById(String userId) throws Exception;

	// 회원정보수정
	public void infomodify(MemberVO member) throws Exception;

	//회원탈퇴
	public void userout(MemberVO member) throws Exception;

	//이메일 중복 검사
	public int emailCheck(String email);


	public void deleteUserAuth(String userId);

	public void deleteUserInfo(String userId);
	
	public void delteUserCondition(String userId);
	
	public UserConditionsVO getUserConditions(String userId);
	
	public void insertUserConditions(UserConditionsVO userConditionsVO);

}
