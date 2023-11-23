package org.chajajo.domain;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {

	private String userId;

	private String password;

	private String password2;

	private String email;

	private String phone;
	
	private String birth;
	
	private String gender;

}