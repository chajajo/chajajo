package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ServiceListDTO {
	
	private String SERVICE_ID;
	private String SERVICE_NAME;
	private String SERVICE_SUMMARY;
	private String APPLY_METHOD;
	private String APPLY_DATE;
	private String AGENCY_CODE;
	private String DEPT_NAME;
	private Long VIEWS;
	private String AGENCY_TYPE;
	private String USER_CRITERA;
	private String SERVICE_FIELD;
	private String PHONE;
	

}
