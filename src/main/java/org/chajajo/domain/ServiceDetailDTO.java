package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceDetailDTO {

	private String serviceId;
    private String supportType;
    private String serviceName;
    private String servicePurpose;
    private String applyDate;
    private String supportTarget;
    private String selectionCriteria;
    private String appContents;
    private String applyMethod;
    private String document;
    private String reception;
    private String contact;
    private String appUrl;
    private String modifyDate;
    private String agencyName;
    private String statute;
}
