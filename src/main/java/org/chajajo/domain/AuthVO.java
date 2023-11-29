package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class AuthVO {
	private String userId;
	private String auth;

	public String getAuthVO() {
		return auth;
	}
}