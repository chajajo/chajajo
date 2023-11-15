package org.chajajo.service;

import org.apache.commons.io.IOExceptionWithCause;
import org.chajajo.domain.MemberVO;
import org.chajajo.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;

	@Override
	public void signUp(MemberVO member) throws IOExceptionWithCause {
		
		membermapper.signUp(member);
		
	}
	

	
	@Override
	public int idCheck(String userId) throws Exception {
		
		return membermapper.idCheck(userId);
	}
	
	  /* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
	
}