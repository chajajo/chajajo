package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class UserConditionsVO {

	private String userId;
	private String gender;
	private int age;
	private String income;
	private String child;
	private String job;
	private String fmlyType;
	private String bsnsType;
	private String copType;
	private String handicap;
	
	public UserConditionsVO() {
		this.userId = "";
		this.gender = "";
		this.age = 0;
		this.income = "";
		this.child = "";
		this.job = "notAplcb";
		this.fmlyType = "noneApply";
		this.bsnsType = "";
		this.copType = "";
		this.handicap = "";
	}
	
	
}
