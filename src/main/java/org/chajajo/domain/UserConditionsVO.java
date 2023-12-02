package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserConditionsVO {

	private String userId;
	private String gender="";
	private int age = -1;
	private String income="";
	private String child="";
	private String job="";
	private String fmlyType="";
	private String bsnsType="";
	private String copType="";
	private String handicap="";
	
}
