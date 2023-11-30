package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ServiceListDTO {
	
	private String serviceId;
    private String serviceName;
    private String serviceSummary;
    private String applyMethod;
    private String applyDate;
    private String agencyCode;
    private String deptName;
	private Long views;
	private String agencyType;
    private String userCriteria;
    private String serviceField;
    private String phone;


}
