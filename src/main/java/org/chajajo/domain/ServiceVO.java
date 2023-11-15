package org.chajajo.domain;

import lombok.Data;

@Data
public class ServiceVO {
    private String serviceId;
    private String serviceName;
    private String serviceSummary;
    private String applyMethod;
    private String applyDate;
    private String agencyCode;
    private String deptName;
    private Integer views;
    private String agencyType;
    private String userCriteria;
    private String serviceField;
    private String phone;
}
