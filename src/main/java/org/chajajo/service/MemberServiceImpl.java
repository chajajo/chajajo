package org.chajajo.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.IOExceptionWithCause;
import org.apache.ibatis.session.SqlSession;
import org.chajajo.domain.MemberVO;
import org.chajajo.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	//회원가입
	@Override
	public void signUp(MemberVO member) throws IOExceptionWithCause {		
		membermapper.signUp(member);		
	}
	
	//아이디 중복 검사
	@Override
	public int idCheck(String userId) throws Exception {		
		return membermapper.idCheck(userId);
	}
	
	//로그인
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {       
        return membermapper.memberLogin(member);
    }
    
    //회원정보 보기
	@Override
	public MemberVO readMember(String userId) {
		System.out.println("readMember()실행");
		MemberVO member = null;
		
		try {
			member = membermapper.readMember(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	//회원정보수정
	@Override
	public void updateMember(MemberVO member) {
		try {
			membermapper.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//회원정보삭제
	@Override
	public void deleteMember(MemberVO member) {
		try {
			membermapper.deleteMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}