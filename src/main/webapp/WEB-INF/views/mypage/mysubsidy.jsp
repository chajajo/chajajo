<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../mypage/mypage.jsp"%>

<link href="/resources/css/recommendation/conditionsForm.css" rel="stylesheet">


<script>
	$(document).ready(function() {
		
		$('#age').val("${userConditions.age}");
		
		if("${userConditions.gender}"==="male") {
			 $("#male").prop("checked", true);
		} else if ("${userConditions.gender}"==="female") {
			$("#female").prop("checked", true);
		}
		
		if("${userConditions.income}"==="income_0_50") {
			$("#income_0_50").prop("checked", true);
		} else if ("${userConditions.income}"==="income_51_75") {
			$("#income_51_75").prop("checked", true);
		} else if ("${userConditions.income}"==="income_76_100") {
			$("#income_76_100").prop("checked", true);
		} else if ("${userConditions.income}"==="income_101_200") {
			$("#income_101_200").prop("checked", true);
		} else if ("${userConditions.income}"==="incomeOver_200") {
			$("#incomeOver_200").prop("checked", true);
		}
		
		if("${userConditions.child}"==="noBaby") {
			$("#noBaby").prop("checked", true);
		} else if ("${userConditions.child}"==="pregnant") {
			$("#pregnant").prop("checked", true);
		} else if ("${userConditions.child}"==="birthAdopt") {
			$("#birthAdopt").prop("checked", true);
		} else {
			$("#noapply").prop("checked", true);
		}
		
		if("${userConditions.job}"==="farmWorker") {
			$("#farmWorker").prop("checked", true);
		} else if ("${userConditions.job}"==="fishWorker") {
			$("#fishWorker").prop("checked", true);
		} else if ("${userConditions.job}"==="livestockWorker") {
			$("#livestockWorker").prop("checked", true);
		} else if ("${userConditions.job}"==="forestWorker") {
			$("#forestWorker").prop("checked", true);
		} else if ("${userConditions.job}"==="elementary") {
			$("#elementary").prop("checked", true);
		} else if ("${userConditions.job}"==="miStdnt") {
			$("#miStdnt").prop("checked", true);
		} else if ("${userConditions.job}"==="hiStdnt") {
			$("#hiStdnt").prop("checked", true);
		} else if ("${userConditions.job}"==="grStdnt") {
			$("#grStdnt").prop("checked", true);
		} else if ("${userConditions.job}"==="worker") {
			$("#worker").prop("checked", true);
		} else if ("${userConditions.job}"==="nonWorker") {
			$("#nonWorker").prop("checked", true);
		} else if ("${userConditions.job}"==="notAplcb") {
			$("#notAplcb").prop("checked", true);
		}
		
		if("${userConditions.fmlyType}"==="mltclFmly") {
			$("#mltclFmly").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="northDft") {
			$("#northDft").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="spGcFmly") {
			$("#spGcFmly").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="sngFmly") {
			$("#sngFmly").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="mltChld") {
			$("#mltChld").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="homeless") {
			$("#homeless").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="newTrnsf") {
			$("#newTrnsf").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="exFmly") {
			$("#exFmly").prop("checked", true);
		} else if ("${userConditions.fmlyType}"==="noneApply") {
			$("#noneApply").prop("checked", true);
		}
		
		if("${userConditions.bsnsType}"==="soonBsns") {
			$("#soonBsns").prop("checked", true);
		} else if ("${userConditions.bsnsType}"==="inBsns") {
			$("#inBsns").prop("checked", true);
		} else if ("${userConditions.bsnsType}"==="nonBsns") {
			$("#nonBsns").prop("checked", true);
		}  else if ("${userConditions.bsnsType}"==="foodBsns") {
			$("#foodBsns").prop("checked", true);
		} else if ("${userConditions.bsnsType}"==="mnfBsns") {
			$("#mnfBsns").prop("checked", true);
		} else if ("${userConditions.bsnsType}"==="etcBsns") {
			$("#etcBsns").prop("checked", true);
		} else {
			$("#nobsns").prop("checked", true);
		}
		
		if("${userConditions.copType}"==="smallCop") {
			$("#smallCop").prop("checked", true);
		} else if ("${userConditions.copType}"==="socialCop") {
			$("#socialCop").prop("checked", true);
		} else if ("${userConditions.copType}"==="facility") {
			$("#facility").prop("checked", true);
		}  else if ("${userConditions.copType}"==="mnfCop") {
			$("#mnfCop").prop("checked", true);
		} else if ("${userConditions.copType}"==="fffCop") {
			$("#fffCop").prop("checked", true);
		} else if ("${userConditions.copType}"==="ictCop") {
			$("#ictCop").prop("checked", true);
		} else if ("${userConditions.copType}"==="etcCop") {
			$("#etcCop").prop("checked", true);
		} else {
			$("#nocop").prop("checked", true);
		}
		
		if("${userConditions.handicap}"==="disabledPerson") {
			$("#disabledPerson").prop("checked", true);
		} else if ("${userConditions.handicap}"==="nationslVeterans") {
			$("#nationslVeterans").prop("checked", true);
		} else if ("${userConditions.handicap}"==="sickPerson") {
			$("#sickPerson").prop("checked", true);
		} else {
			$("#nohandicap").prop("checked", true);
		}
		
		
		$(".userConditions_button").click(function() {
			
			$("#conditions_form").attr("action", "/recommendation/userConditions");
			$("#conditions_form").submit();

		});
		
	});
</script>

<div class="mypage-box">
나만의 보조금

<form id="conditions_form" method="post">
<div class="conditions">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div>
		<label for="age">나이</label>
		<input type="number" id="age" name="age" value="0" required>
	</div>
	<div>
		<input type="radio" id ="male" name="gender" value="male"> 
		<label for="male">남  </label>
		<input type="radio" id ="female" name="gender" value="female"> 
		<label for="female">여</label>
	</div>
	<div>
		<input type="radio" id="income_0_50" name="income" value="income_0_50"> 
		<label for="income_0_50">중위소득 0~50%  </label>
		<input type="radio" id="income_51_75" name="income"value="income_51_75"> 
		<label for="income_51_75">중위소득 51~75%  </label>
		<input type="radio" id="income_76_100" name="income"value="income_76_100"> 
		<label for="income_76_100">중위소득 76~100%  </label>
		<input type="radio" id="income_101_200" name="income"value="income_101_200"> 
		<label for="income_101_200">중위소득 101~200%  </label>
		<input type="radio" id="incomeOver_200" name="income"value="incomeOver_200"> 
		<label for="incomeOver_200">중위소득 200% 이상  </label>
	</div>
	<div>
		<input type="radio" id="noBaby" name="child" value="noBaby"> 
		<label for="noBaby">예비부모/난임</label>
		<input type="radio" id="pregnant" name="child" value="pregnant"> 
		<label for="pregnant">임산부</label>
		<input type="radio" id="birthAdopt" name="child" value="birthAdopt"> 
		<label for="birthAdopt">출산/입양</label>
		<input type="radio" id="noapply" name="child" value=null> 
		<label for="noapply">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="farmWorker" name="job" value="farmWorker">
		<label for="farmWorker">농업인</label>
		<input type="radio" id="fishWorker" name="job" value="fishWorker">
		<label for="fishWorker">어업인</label>
		<input type="radio" id="livestockWorker" name="job" value="livestockWorker">
		<label for="livestockWorker">축산업인</label>
		<input type="radio" id="forestWorker" name="job" value="forestWorker">
		<label for="forestWorker">임업인</label>
		<input type="radio" id="elementary" name="job" value="elementary">
		<label for="elementary">초등학생</label>
		<input type="radio" id="miStdnt" name="job" value="miStdnt">
		<label for="miStdnt">중학생</label>
		<input type="radio" id="hiStdnt" name="job" value="hiStdnt">
		<label for="hiStdnt">고등학생</label>
		<input type="radio" id="grStdnt" name="job" value="grStdnt">
		<label for="grStdnt">대학생/대학원생</label>
		<input type="radio" id="worker" name="job" value="worker">
		<label for="worker">근로자/직장인</label>
		<input type="radio" id="nonWorker" name="job" value="nonWorker">
		<label for="nonWorker">구직자/실업자</label>
		<input type="radio" id="notAplcb" name="job" value="notAplcb">
		<label for="notAplcb">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="mltclFmly"  name="fmlyType" value="mltclFmly">
		<label for="mltclFmly">다문화가족</label>
		<input type="radio" id="northDft" name="fmlyType" value="northDft"> 
		<label for="northDft">북한이탈주민</label>
		<input type="radio" id="spGcFmly" name="fmlyType" value="spGcFmly"> 
		<label for="spGcFmly">한부모가정/조손가정</label>
		<input type="radio" id="sngFmly" name="fmlyType" value="sngFmly"> 
		<label for="sngFmly">1인가구</label>
		<input type="radio" id="mltChld" name="fmlyType" value="mltChld"> 
		<label for="mltChld">다자녀가구</label>
		<input type="radio" id="homeless" name="fmlyType" value="homeless"> 
		<label for="homeless">무주택세대</label>
		<input type="radio" id="newTrnsf" name="fmlyType" value="newTrnsf"> 
		<label for="newTrnsf">신규전입</label>
		<input type="radio" id="exFmly" name="fmlyType" value="exFmly"> 
		<label for="exFmly">확대가족</label>
		<input type="radio" id="noneApply" name="fmlyType" value="noneApply"> 
		<label for="noneApply">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="soonBsns"  name="bsnsType" value="soonBsns">
		<label for="soonBsns">예비창업자</label>
		<input type="radio" id="inBsns"  name="bsnsType" value="inBsns">
		<label for="inBsns">영업중</label>
		<input type="radio" id="nonBsns"  name="bsnsType" value="nonBsns">
		<label for="nonBsns">생계곤란/폐업예정자</label>
		<input type="radio" id="foodBsns"  name="bsnsType" value="foodBsns">
		<label for="foodBsns">음식적업</label>
		<input type="radio" id="mnfBsns"  name="bsnsType" value="mnfBsns">
		<label for="mnfBsns">제조업</label>
		<input type="radio" id="etcBsns"  name="bsnsType" value="etcBsns">
		<label for="etcBsns">기타업종</label>
		<input type="radio" id="nobsns" name="bsnsType" value=null> 
		<label for="nobsns">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="smallCop"  name="copType" value="smallCop">
		<label for="smallCop">중소기업</label>
		<input type="radio" id="socialCop"  name="copType" value="socialCop">
		<label for="socialCop">사회복지시설</label>
		<input type="radio" id="facility"  name="copType" value="facility">
		<label for="facility">기관/단체</label>
		<input type="radio" id="mnfCop"  name="copType" value="mnfCop">
		<label for="mnfCop">제조업</label>
		<input type="radio" id="fffCop"  name="copType" value="fffCop">
		<label for="fffCop">농업,임업 및 어업</label>
		<input type="radio" id="ictCop"  name="copType" value="ictCop">
		<label for="ictCop">정보통신업</label>
		<input type="radio" id="etcCop"  name="copType" value="etcCop">
		<label for="etcCop">기타업종</label>
		<input type="radio" id="nocop" name="copType" value=null> 
		<label for="nocop">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="disabledPerson" name="handicap" value="disabledPerson">
		<label for="disabledPerson">장애인</label>
		<input type="radio" id="nationslVeterans" name="handicap" value="nationslVeterans">
		<label for="nationslVeterans">국가보훈대상자</label>
		<input type="radio" id="sickPerson" name="handicap" value="sickPerson">
		<label for="sickPerson">질병/질환자</label>
		<input type="radio" id="nohandicap" name="handicap" value=null>
		<label for="nohandicap">해당사항없음</label>
	</div>
	<input type="hidden" id="userId" name="userId" value="${member.userId}">
	<div class="userConditions_button_wrap">
		<input type="submit" class="userConditions_button" value="내 정보 저장">
	</div>
</div>
</form>

</div>
</div>

<%@ include file="../layouts/footer.jsp"%>