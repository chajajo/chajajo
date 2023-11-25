<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layouts/header.jsp"%>

<script>
	$(document).ready(function() {
		$(".search_button").click(function() {

			$("#conditions_form").attr("action", "/recommendation/subsidy");
			$("#conditions_form").submit();

		});
	});
</script>

<form id="conditions_form" method="get">
	<div>
		<input type="radio" name="gender" value="male"> 
		<label for="male">남</label>
		<input type="radio" name="gender" value="female"> 
		<label for="female">여</label>
	</div>
	<div>
		<input type="radio" id="income_0_50" name="income" value="income_0_50"> 
		<label for="income_0_50">중위소득 0~50%</label>
		<input type="radio" id="income_51_75" name="income"value="income_51_75"> 
		<label for="income_51_75">중위소득 51~75%</label>
		<input type="radio" id="income_76_100" name="income"value="income_76_100"> 
		<label for="income_76_100">중위소득 76~100%</label>
		<input type="radio" id="income_101_200" name="income"value="income_101_200"> 
		<label for="income_101_200">중위소득 101~200%</label>
		<input type="radio" id="incomeOver_200" name="income"value="incomeOver_200"> 
		<label for="incomeOver_200">중위소득 200% 이상</label>
	</div>
	<div>
		<input type="radio" id="noBaby" name="child" value="noBaby"> 
		<label for="noBaby">예비부모/난임</label>
		<input type="radio" id="pregnant" name="child" value="pregnant"> 
		<label for="pregnant">임산부</label>
		<input type="radio" id="birthAdopt" name="child" value="birthAdopt"> 
		<label for="birthAdopt">출산/입양</label>
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
		<label for="nonBsns">생계곤란/폐업예정자"</label>
		<input type="radio" id="foodBsns"  name="bsnsType" value="foodBsns">
		<label for="foodBsns">음식적업</label>
		<input type="radio" id="mnfBsns"  name="bsnsType" value="mnfBsns">
		<label for="mnfBsns">제조업</label>
		<input type="radio" id="etcBsns"  name="bsnsType" value="etcBsns">
		<label for="etcBsns">기타업종</label>
	</div>
	<div>
		<input type="radio" id="smallCop"  name="copType" value="smallCop">
		<label for="smallCop">중소기업</label>
		<input type="radio" id="socialCop"  name="copType" value="socialCop">
		<label for="socialCop">사회복지시설</label>
		<input type="radio" id="facility"  name="copType" value="facility">
		<label for="facility">기관/단체"</label>
		<input type="radio" id="mnfCop"  name="copType" value="mnfCop">
		<label for="mnfCop">제조업</label>
		<input type="radio" id="fffCop"  name="copType" value="fffCop">
		<label for="fffCop">농업,임업 및 어업</label>
		<input type="radio" id="ictCop"  name="copType" value="ictCop">
		<label for="ictCop">정보통신업</label>
		<input type="radio" id="ETC_COP"  name="copType" value="etcCop">
		<label for="etcCop">기타업종</label>
	</div>
	<div>
		<input type="radio" id="disabledPerson" name="handicap" value="disabledPerson">
		<label for="disabledPerson">장애인</label>
		<input type="radio" id="nationslVeterans" name="handicap" value="nationslVeterans">
		<label for="nationslVeterans">국가보훈대상자</label>
		<input type="radio" id="sickPerson" name="handicap" value="sickPerson">
		<label for="sickPerson">질병/질환자</label>
	</div>
	<div class="search_button_wrap">
		<input type="button" class="search_button" value="맞춤 보조금 찾기">
	</div>
</form>

<%@ include file="../layouts/footer.jsp"%>