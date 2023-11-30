package org.chajajo.config;

import javax.sql.DataSource;

import org.chajajo.security.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private DataSource datasource;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.httpBasic().disable();
//		http.csrf().disable();

		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);

		http.addFilterBefore(filter, CsrfFilter.class);

		http.csrf().ignoringAntMatchers("/api/**", "/member/**");

		http.authorizeRequests().antMatchers("/mypage/**").authenticated().anyRequest().permitAll();

		http.formLogin().loginPage("/member/login?error=login_required").loginProcessingUrl("/member/login")
				.defaultSuccessUrl("/").failureUrl("/member/login?error=true").usernameParameter("userId")
				.passwordParameter("password").permitAll();

		http.logout() // 로그아웃 설정 시작
				.logoutUrl("/member/logout") // POST: 로그아웃 호출 url
				.invalidateHttpSession(true) // 세션 invalidate
				.deleteCookies("remember-me", "JSESSION-ID") // 삭제할 쿠키 목록
				.logoutSuccessUrl("/").permitAll(); // 로그아웃 이후 이동할 페이지

		http.rememberMe() // remember-me 기능 설정
				.key("Galapagos").tokenRepository(persistentTokenRepository()).tokenValiditySeconds(7 * 24 * 60 * 60); // 7일
	}

	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(datasource);

		return repo;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());

	}
}
