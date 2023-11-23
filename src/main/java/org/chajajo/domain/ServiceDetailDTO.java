package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceDetailDTO {

	private String SERVICE_ID;
	private String SUPPORT_TYPE;
	private String SERVICE_NAME;
	private String SERVICE_PURPOSE;
	private String APPLY_DATE;
	private String SUPPORT_TARGET;
	private String SELECTION_CRITERIA;
	private String APP_CONTENTS;
	private String APPLY_METHOD;
	private String DOCUMENT;
	private String RECEPTION;
	private String CONTACT;
	private String APP_URL;
	private String MODIFY_DATE;
	private String AGENCY_NAME;
	private String STATUTE;
}
