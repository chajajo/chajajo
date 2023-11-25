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
		<input type="radio" name="gender" value="MALE"> 
		<label for="MALE">남</label>
		<input type="radio" name="gender" value="FEMALE"> 
		<label for="FEMALE">여</label>
	</div>
	<div>
		<input type="radio" id="INCOME_0_50" name="income" value="INCOME_0_50"> 
		<label for="INCOME_0_50">중위소득 0~50%</label>
		<input type="radio" id="INCOME_51_75" name="income"value="INCOME_51_75"> 
		<label for="INCOME_51_75">중위소득 51~75%</label>
		<input type="radio" id="INCOME_76_100" name="income"value="INCOME_76_100"> 
		<label for="INCOME_76_100">중위소득 76~100%</label>
		<input type="radio" id="INCOME_101_200" name="income"value="INCOME_101_200"> 
		<label for="INCOME_101_200">중위소득 101~200%</label>
		<input type="radio" id="INCOME_OVER_200" name="income"value="INCOME_OVER_200"> 
		<label for="INCOME_OVER_200">중위소득 200% 이상</label>
	</div>
	<div>
		<input type="radio" id="NO_BABY" name="child" value="NO_BABY"> 
		<label for="NO_BABY">예비부모/난임</label>
		<input type="radio" id="PREGNANT" name="child" value="PREGNANT"> 
		<label for="PREGNANT">임산부</label>
		<input type="radio" id="BIRTH_ADOPT" name="child" value="BIRTH_ADOPT"> 
		<label for="BIRTH_ADOPT">출산/입양</label>
	</div>
	<div>
		<input type="radio" id="FARM_WORKER" name="job" value="FARM_WORKER">
		<label for="FARM_WORKER">농업인</label>
		<input type="radio" id="FISH_WORKER" name="job" value="FISH_WORKER">
		<label for="FISH_WORKER">어업인</label>
		<input type="radio" id="LIVESTOCK_WORKER" name="job" value="LIVESTOCK_WORKER">
		<label for="LIVESTOCK_WORKER">축산업인</label>
		<input type="radio" id="FOREST_WORKER" name="job" value="FOREST_WORKER">
		<label for="LIVESTOCK_WORKER">임업인</label>
		<input type="radio" id="ELEMENTARY" name="job" value="ELEMENTARY">
		<label for="ELEMENTARY">초등학생</label>
		<input type="radio" id="MI_STDNT" name="job" value="MI_STDNT">
		<label for="MI_STDNT">중학생</label>
		<input type="radio" id="HI_STDNT" name="job" value="HI_STDNT">
		<label for="HI_STDNT">고등학생</label>
		<input type="radio" id="GR_STDNT" name="job" value="GR_STDNT">
		<label for="GR_STDNT">대학생/대학원생</label>
		<input type="radio" id="WORKER" name="job" value="WORKER">
		<label for="WORKER">근로자/직장인</label>
		<input type="radio" id="NON_WORKER" name="job" value="NON_WORKER">
		<label for="NON_WORKER">구직자/실업자</label>
		<input type="radio" id="NOT_APLCB" name="job" value="NOT_APLCB">
		<label for="NOT_APLCB">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="MLTCL_FMLY"  name="fmlyType" value="MLTCL_FMLY">
		<label for="MLTCL_FMLY">다문화가족</label>
		<input type="radio" id="NORTH_DFT" name="fmlyType" value="NORTH_DFT"> 
		<label for="NORTH_DFT">북한이탈주민</label>
		<input type="radio" id="SP_GC_FMLY" name="fmlyType" value="SP_GC_FMLY"> 
		<label for="SP_GC_FMLY">한부모가정/조손가정</label>
		<input type="radio" id="SNG_FMLY" name="fmlyType" value="SNG_FMLY"> 
		<label for="SNG_FMLY">1인가구</label>
		<input type="radio" id="MLT_CHLD" name="fmlyType" value="MLT_CHLD"> 
		<label for="MLT_CHLD">다자녀가구</label>
		<input type="radio" id="HOMELESS" name="fmlyType" value="HOMELESS"> 
		<label for="HOMELESS">무주택세대</label>
		<input type="radio" id="NEW_TRNSF" name="fmlyType" value="NEW_TRNSF"> 
		<label for="NEW_TRNSF">신규전입</label>
		<input type="radio" id="EX_FMLY" name="fmlyType" value="EX_FMLY"> 
		<label for="EX_FMLY">확대가족</label>
		<input type="radio" id="NONE_APPLY" name="fmlyType" value="NONE_APPLY"> 
		<label for="NONE_APPLY">해당사항없음</label>
	</div>
	<div>
		<input type="radio" id="SOON_BSNS"  name="bsnsType" value="SOON_BSNS">
		<label for="SOON_BSNS">예비창업자</label>
		<input type="radio" id="IN_BSNS"  name="bsnsType" value="IN_BSNS">
		<label for="IN_BSNS">영업중</label>
		<input type="radio" id="NON_BSNS"  name="bsnsType" value="NON_BSNS">
		<label for="NON_BSNS">생계곤란/폐업예정자"</label>
		<input type="radio" id="FOOD_BSNS"  name="bsnsType" value="FOOD_BSNS">
		<label for="FOOD_BSNS">음식적업</label>
		<input type="radio" id="MNF_BSNS"  name="bsnsType" value="MNF_BSNS">
		<label for="MNF_BSNS">제조업</label>
		<input type="radio" id="ETC_BSNS"  name="bsnsType" value="ETC_BSNS">
		<label for="ETC_BSNS">기타업종</label>
	</div>
	<div>
		<input type="radio" id="SMALL_COP"  name="copType" value="SMALL_COP">
		<label for="SMALL_COP">중소기업</label>
		<input type="radio" id="SOCIAL_COP"  name="copType" value="SOCIAL_COP">
		<label for="SOCIAL_COP">사회복지시설</label>
		<input type="radio" id="FACILITY"  name="copType" value="FACILITY">
		<label for="FACILITY">기관/단체"</label>
		<input type="radio" id="MNF_COP"  name="copType" value="MNF_COP">
		<label for="MNF_COP">제조업</label>
		<input type="radio" id="FFF_COP"  name="copType" value="FFF_COP">
		<label for="FFF_COP">농업,임업 및 어업</label>
		<input type="radio" id="ICT_COP"  name="copType" value="ICT_COP">
		<label for="ICT_COP">정보통신업</label>
		<input type="radio" id="ETC_COP"  name="copType" value="ETC_COP">
		<label for="ETC_COP">기타업종</label>
	</div>
	<div>
		<input type="radio" id="DISABLED_PERSON" name="handicap" value="DISABLED_PERSON">
		<label for="DISABLED_PERSON">장애인</label>
		<input type="radio" id="NATIONAL_VETERANS" name="handicap" value="NATIONAL_VETERANS">
		<label for="NATIONAL_VETERANS">국가보훈대상자</label>
		<input type="radio" id="SICK_PERSON" name="handicap" value="SICK_PERSON">
		<label for="SICK_PERSON">질병/질환자</label>
	</div>
	<div class="search_button_wrap">
		<input type="button" class="search_button" value="맞춤 보조금 찾기">
	</div>
</form>

<%@ include file="../layouts/footer.jsp"%>