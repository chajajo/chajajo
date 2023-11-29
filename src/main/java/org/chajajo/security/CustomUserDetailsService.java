package org.chajajo.security;

import org.chajajo.domain.MemberVO;
import org.chajajo.mapper.MemberMapper;
import org.chajajo.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	// 회원 정보 수정 후 세션 정보 갱신
	public void updateSessionAfterUserUpdate() {
		// 현재 인증된 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 사용자 정보 업데이트
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		UserDetails updatedUserDetails = loadUserByUsername(userDetails.getUsername()); // 사용자 정보를 새로운 정보로 업데이트
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(updatedUserDetails,
				authentication.getCredentials(), updatedUserDetails.getAuthorities());

		// SecurityContextHolder에 새로운 Authentication 설정
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
	}

	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {

		log.info("Load User By userId:===== " + userId);

		MemberVO vo = mapper.read(userId);
		log.warn("user vo: " + vo);
		if (vo == null) {
			log.warn(userId + "은 없는 id입니다.");
			throw new UsernameNotFoundException(userId + "은 없는 id입니다.");
		}

		log.info("user vo: " + vo);
		return new CustomUser(vo);

	}

}
