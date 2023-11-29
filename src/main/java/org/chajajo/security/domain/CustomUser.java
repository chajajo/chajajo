package org.chajajo.security.domain;

import java.util.Collection;

import org.chajajo.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	private MemberVO member;

	public CustomUser(String userId, String password, Collection<? extends GrantedAuthority> authorities) {
		super(userId, password, authorities);
	}

	public CustomUser(MemberVO vo) {
		super(vo.getUserId(), vo.getPassword(), vo.getAuthorities());
		this.member = vo;
	}

}