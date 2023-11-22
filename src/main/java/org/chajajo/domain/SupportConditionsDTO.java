package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SupportConditionsDTO {

	private String SERVICE_ID;
	private String MALE;
	private String FEMALE;
	private Long AGE_START;
	private Long AGE_END;
	private String INCOME_0_50;
	private String INCOME_51_75;
	private String INCOME_76_100;
	private String INCOME_101_200;
	private String INCOME_OVER_200;
	private String NO_BABY;
	private String PREGNANT;
	private String BIRTH_ADOPT;
	private String FARM_WORKER;
	private String FISH_WORKER;
	private String LIVESTOCK_WORKER;
	private String FOREST_WORKER;
	private String ELEMENTARY;
	private String MI_STDNT;
	private String HI_STDNT;
	private String GR_STDNT;
	private String NOT_APLCB;
	private String WORKER;
	private String NON_WORKER;
	private String MLTCL_FMLY;
	private String NORTH_DFT;
	private String SP_GC_FMLY;
	private String SNG_FMLY;
	private String NONE_APPLY;
	private String MLT_CHLD;
	private String HOMELESS;
	private String NEW_TRNSF;
	private String EX_FMLY;
	private String SOON_BSNS;
	private String IN_BSNS;
	private String NON_BSNS;
	private String FOOD_BSNS;
	private String MNF_BSNS;
	private String ETC_BSNS;
	private String SMALL_COP;
	private String SOCIAL_COP;
	private String FACILITY;
	private String MNF_COP;
	private String FFF_COP;
	private String ICT_COP;
	private String ETC_COP;
	private String DISABLED_PERSON;
	private String NATIONAL_VETERANS;
	private String SICK_PERSON;
	private String SERVICE_NAME;
}
