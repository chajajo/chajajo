package org.chajajo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SupportConditionsDTO {

	private String serviceId;
	private String male;
	private String female;
	private Long ageStart;
	private Long ageEnd;
	private String income_0_50;
	private String income_51_75;
	private String income_76_100;
	private String income_101_200;
	private String incomeOver_200;
	private String noBaby;
	private String pregnant;
	private String birthAdopt;
	private String farmWorker;
	private String fishWorker;
	private String livestockWorker;
	private String forestWorker;
	private String elementary;
	private String miStdnt;
	private String hiStdnt;
	private String grStdnt;
	private String notAplcb;
	private String worker;
	private String nonWorker;
	private String mltclFmly;
	private String northDft;
	private String spGcFmly;
	private String sngFmly;
	private String noneApply;
	private String mltChld;
	private String homeless;
	private String newTrnsf;
	private String exFmly;
	private String soonBsns;
	private String inBsns;
	private String nonBsns;
	private String foodBsns;
	private String mnfBsns;
	private String etcBsns;
	private String smallCop;
	private String socialCop;
	private String facility;
	private String mnfCop;
	private String fffCop;
	private String ictCop;
	private String etcCop;
	private String disabledPerson;
	private String nationslVeterans;
	private String sickPerson;
	private String serviceName;
}
