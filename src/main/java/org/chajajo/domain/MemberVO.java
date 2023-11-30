package org.chajajo.domain;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import lombok.Data;
@Data
public class MemberVO {
	@NotBlank(message = "사용자 id는 필수항목입니다.")
	@Size(min = 4, message = "사용자 id는 4글자 이상이어야 합니다.")
	private String userId;
	@NotBlank(message = "비밀번호는 필수항목입니다.")
	private String password;
	@NotBlank(message = "비밀번호 확인은 필수항목입니다.")
	private String password2;
	@NotBlank(message = "email는 필수항목입니다.")
	@Email(message = "email 형식에 맞지 않습니다.")
	private String email;
	private String phone;
	private String birth;
	private String gender;
	private List<AuthVO> authList;
	public Collection<SimpleGrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (AuthVO auth : authList) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
		}
		return authorities;
	}
}