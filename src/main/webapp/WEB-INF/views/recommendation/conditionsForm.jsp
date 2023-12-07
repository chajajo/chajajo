<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<link href="/resources/css/recommendation/conditionsForm.css" rel="stylesheet">

<script>
	$(document).ready(function() {
		
		if ("${keyword.age}" === "-1") {
			$('#age').val(0);
		} else {
			$('#age').val("${keyword.age}");
		}

		if ("${keyword.gender}" === "male") {
			$("#male").prop("checked", true);
		} else if ("${keyword.gender}" === "female") {
			$("#female").prop("checked", true);
		}

		if ("${keyword.income}" === "income_0_50") {
			$("#income_0_50").prop("checked", true);
		} else if ("${keyword.income}" === "income_51_75") {
			$("#income_51_75").prop("checked", true);
		} else if ("${keyword.income}" === "income_76_100") {
			$("#income_76_100").prop("checked", true);
		} else if ("${keyword.income}" === "income_101_200") {
			$("#income_101_200").prop("checked", true);
		} else if ("${keyword.income}" === "incomeOver_200") {
			$("#incomeOver_200").prop("checked", true);
		}

		if ("${keyword.child}" === "noBaby") {
			$("#noBaby").prop("checked", true);
		} else if ("${keyword.child}" === "pregnant") {
			$("#pregnant").prop("checked", true);
		} else if ("${keyword.child}" === "birthAdopt") {
			$("#birthAdopt").prop("checked", true);
		} else {
			$("#noapply").prop("checked", true);
		}

		if ("${keyword.job}" === "farmWorker") {
			$("#farmWorker").prop("checked", true);
		} else if ("${keyword.job}" === "fishWorker") {
			$("#fishWorker").prop("checked", true);
		} else if ("${keyword.job}" === "livestockWorker") {
			$("#livestockWorker").prop("checked", true);
		} else if ("${keyword.job}" === "forestWorker") {
			$("#forestWorker").prop("checked", true);
		} else if ("${keyword.job}" === "elementary") {
			$("#elementary").prop("checked", true);
		} else if ("${keyword.job}" === "miStdnt") {
			$("#miStdnt").prop("checked", true);
		} else if ("${keyword.job}" === "hiStdnt") {
			$("#hiStdnt").prop("checked", true);
		} else if ("${keyword.job}" === "grStdnt") {
			$("#grStdnt").prop("checked", true);
		} else if ("${keyword.job}" === "worker") {
			$("#worker").prop("checked", true);
		} else if ("${keyword.job}" === "nonWorker") {
			$("#nonWorker").prop("checked", true);
		}  else {
			$("#notAplcb").prop("checked", true);
		}

		if ("${keyword.fmlyType}" === "mltclFmly") {
			$("#mltclFmly").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "northDft") {
			$("#northDft").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "spGcFmly") {
			$("#spGcFmly").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "sngFmly") {
			$("#sngFmly").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "mltChld") {
			$("#mltChld").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "homeless") {
			$("#homeless").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "newTrnsf") {
			$("#newTrnsf").prop("checked", true);
		} else if ("${keyword.fmlyType}" === "exFmly") {
			$("#exFmly").prop("checked", true);
		}  else {
			$("#noneApply").prop("checked", true);
		}

		if ("${keyword.bsnsType}" === "soonBsns") {
			$("#soonBsns").prop("checked", true);
		} else if ("${keyword.bsnsType}" === "inBsns") {
			$("#inBsns").prop("checked", true);
		} else if ("${keyword.bsnsType}" === "nonBsns") {
			$("#nonBsns").prop("checked", true);
		} else if ("${keyword.bsnsType}" === "foodBsns") {
			$("#foodBsns").prop("checked", true);
		} else if ("${keyword.bsnsType}" === "mnfBsns") {
			$("#mnfBsns").prop("checked", true);
		} else if ("${keyword.bsnsType}" === "etcBsns") {
			$("#etcBsns").prop("checked", true);
		} else {
			$("#nobsns").prop("checked", true);
		}

		if ("${keyword.copType}" === "smallCop") {
			$("#smallCop").prop("checked", true);
		} else if ("${keyword.copType}" === "socialCop") {
			$("#socialCop").prop("checked", true);
		} else if ("${keyword.copType}" === "facility") {
			$("#facility").prop("checked", true);
		} else if ("${keyword.copType}" === "mnfCop") {
			$("#mnfCop").prop("checked", true);
		} else if ("${keyword.copType}" === "fffCop") {
			$("#fffCop").prop("checked", true);
		} else if ("${keyword.copType}" === "ictCop") {
			$("#ictCop").prop("checked", true);
		} else if ("${keyword.copType}" === "etcCop") {
			$("#etcCop").prop("checked", true);
		} else {
			$("#nocop").prop("checked", true);
		}

		if ("${keyword.handicap}" === "disabledPerson") {
			$("#disabledPerson").prop("checked", true);
		} else if ("${keyword.handicap}" === "nationslVeterans") {
			$("#nationslVeterans").prop("checked", true);
		} else if ("${keyword.handicap}" === "sickPerson") {
			$("#sickPerson").prop("checked", true);
		} else {
			$("#nohandicap").prop("checked", true);
		}
		
		
		$(".search_button").on('click', function(e) {
			if (!$('#age').val()) {
				$('#age').focus();
				alert("나이는 필수 입력 사항입니다.");
				return false;
			}

			$("#conditions_form").attr("action", "/recommendation/subsidy");
			$("#conditions_form").submit();

		});

		$(".userConditions_button").on('click', function(e) {

			$('#age').val("${userConditions.age}");
			const name = document.getElementById('age').value;
      	 	document.getElementById("result나이").innerText = name;

			if ("${userConditions.gender}" === "male") {
				$("#male").prop("checked", true);
				document.getElementById('result성별').innerText = "남";
			} else if ("${userConditions.gender}" === "female") {
				$("#female").prop("checked", true);
				document.getElementById('result성별').innerText = "여";
			}

			if ("${userConditions.income}" === "income_0_50") {
				$("#income_0_50").prop("checked", true);
				document.getElementById('result소득분위').innerText = ":\u00a0\u00a0 중위소득 0~50%";
			} else if ("${userConditions.income}" === "income_51_75") {
				$("#income_51_75").prop("checked", true);
				document.getElementById('result소득분위').innerText = ":\u00a0\u00a0 중위소득 51~75%";
			} else if ("${userConditions.income}" === "income_76_100") {
				$("#income_76_100").prop("checked", true);
				document.getElementById('result소득분위').innerText = ":\u00a0\u00a0 중위소득 76~100%";
			} else if ("${userConditions.income}" === "income_101_200") {
				$("#income_101_200").prop("checked", true);
				document.getElementById('result소득분위').innerText = ":\u00a0\u00a0 중위소득 101~200%";
			} else if ("${userConditions.income}" === "incomeOver_200") {
				$("#incomeOver_200").prop("checked", true);
				document.getElementById('result소득분위').innerText = ":\u00a0\u00a0 중위소득 200% 이상";
			}

			if ("${userConditions.child}" === "noBaby") {
				$("#noBaby").prop("checked", true);
				document.getElementById('result가족계획').innerText = ":\u00a0\u00a0 예비부모/난임";
			} else if ("${userConditions.child}" === "pregnant") {
				$("#pregnant").prop("checked", true);
				document.getElementById('result가족계획').innerText = ":\u00a0\u00a0 임산부";
			} else if ("${userConditions.child}" === "birthAdopt") {
				$("#birthAdopt").prop("checked", true);
				document.getElementById('result가족계획').innerText = ":\u00a0\u00a0 출산/입양";
			} else {
				$("#noapply").prop("checked", true);
				document.getElementById('result가족계획').innerText = ":\u00a0\u00a0 해당사항 없음";
			}

			if ("${userConditions.job}" === "farmWorker") {
				$("#farmWorker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 농업인";
			} else if ("${userConditions.job}" === "fishWorker") {
				$("#fishWorker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 어업인";
			} else if ("${userConditions.job}" === "livestockWorker") {
				$("#livestockWorker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 축산업인";
			} else if ("${userConditions.job}" === "forestWorker") {
				$("#forestWorker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 임업인";
			} else if ("${userConditions.job}" === "elementary") {
				$("#elementary").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 초등학생";
			} else if ("${userConditions.job}" === "miStdnt") {
				$("#miStdnt").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 중학생";
			} else if ("${userConditions.job}" === "hiStdnt") {
				$("#hiStdnt").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 고등학생";
			} else if ("${userConditions.job}" === "grStdnt") {
				$("#grStdnt").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 대학생/대학원생";
			} else if ("${userConditions.job}" === "worker") {
				$("#worker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 근로자/직장인";
			} else if ("${userConditions.job}" === "nonWorker") {
				$("#nonWorker").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 구직자/실업자";
			} else if ("${userConditions.job}" === "notAplcb") {
				$("#notAplcb").prop("checked", true);
				document.getElementById('result직업').innerText = ":\u00a0\u00a0 해당사항 없음";
			}

			if ("${userConditions.fmlyType}" === "mltclFmly") {
				$("#mltclFmly").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 다문화가족";
			} else if ("${userConditions.fmlyType}" === "northDft") {
				$("#northDft").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 북한이탈주민";
			} else if ("${userConditions.fmlyType}" === "spGcFmly") {
				$("#spGcFmly").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 한부모가정/조손가정";
			} else if ("${userConditions.fmlyType}" === "sngFmly") {
				$("#sngFmly").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 1인가구";
			} else if ("${userConditions.fmlyType}" === "mltChld") {
				$("#mltChld").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 다자녀가구";
			} else if ("${userConditions.fmlyType}" === "homeless") {
				$("#homeless").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 무주택세대";
			} else if ("${userConditions.fmlyType}" === "newTrnsf") {
				$("#newTrnsf").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 신규전입";
			} else if ("${userConditions.fmlyType}" === "exFmly") {
				$("#exFmly").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 확대가족";
			} else if ("${userConditions.fmlyType}" === "noneApply") {
				$("#noneApply").prop("checked", true);
				document.getElementById('result가구특성').innerText = ":\u00a0\u00a0 해당사항없음";
			}

			if ("${userConditions.bsnsType}" === "soonBsns") {
				$("#soonBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 예비창업자";
			} else if ("${userConditions.bsnsType}" === "inBsns") {
				$("#inBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 영업중";
			} else if ("${userConditions.bsnsType}" === "nonBsns") {
				$("#nonBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 생계곤란/폐업예정자";
			} else if ("${userConditions.bsnsType}" === "foodBsns") {
				$("#foodBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 음식적업";
			} else if ("${userConditions.bsnsType}" === "mnfBsns") {
				$("#mnfBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 제조업";
			} else if ("${userConditions.bsnsType}" === "etcBsns") {
				$("#etcBsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 기타업종";
			} else {
				$("#nobsns").prop("checked", true);
				document.getElementById('result소상공인').innerText = ":\u00a0\u00a0 해당사항없음";
			}

			if ("${userConditions.copType}" === "smallCop") {
				$("#smallCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 중소기업";
			} else if ("${userConditions.copType}" === "socialCop") {
				$("#socialCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 사회복지시설";
			} else if ("${userConditions.copType}" === "facility") {
				$("#facility").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 기관/단체";
			} else if ("${userConditions.copType}" === "mnfCop") {
				$("#mnfCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 제조업";
			} else if ("${userConditions.copType}" === "fffCop") {
				$("#fffCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 농업,임업 및 어업";
			} else if ("${userConditions.copType}" === "ictCop") {
				$("#ictCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 정보통신업";
			} else if ("${userConditions.copType}" === "etcCop") {
				$("#etcCop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 기타업종";
			} else {
				$("#nocop").prop("checked", true);
				document.getElementById('result기업').innerText = ":\u00a0\u00a0 해당사항없음";
			}

			if ("${userConditions.handicap}" === "disabledPerson") {
				$("#disabledPerson").prop("checked", true);
				document.getElementById('result개인상황').innerText = ":\u00a0\u00a0 장애인";
			} else if ("${userConditions.handicap}" === "nationslVeterans") {
				$("#nationslVeterans").prop("checked", true);
				document.getElementById('result개인상황').innerText = ":\u00a0\u00a0 국가보훈대상자";
			} else if ("${userConditions.handicap}" === "sickPerson") {
				$("#sickPerson").prop("checked", true);
				document.getElementById('result개인상황').innerText = ":\u00a0\u00a0 질병/질환자";
			} else {
				$("#nohandicap").prop("checked", true);
				document.getElementById('result개인상황').innerText = ":\u00a0\u00a0 해당사항없음";
			}

		});
	});
</script>



<!--  아코디언 추가용 시작점 -->
 <script>
        function accordion(element) {
            var before = document.getElementsByClassName("activeac")[0]               
            if (before && document.getElementsByClassName("activeac")[0] != element) {  
                before.nextElementSibling.style.maxHeight = null; 
                before.classList.remove("activeac");                 
            }
            element.classList.toggle("activeac");         

            var accordioncontent = element.nextElementSibling;
            if (accordioncontent.style.maxHeight != 0) {         
            	accordioncontent.style.maxHeight = null;       
            } else {
            	accordioncontent.style.maxHeight = accordioncontent.scrollHeight + "px";  
            }
        }
        
        
        <!-- 추가 버튼 메뉴에 글자 띄우기 -->        
		function getAge()  {
        	  const name = document.getElementById('age').value;
        	  document.getElementById("result나이").innerText = name;
        	}
        
        function getGender(event) {
        	var value = event.target.value;
        	if (value === "male") {
                value = "남";
            } else if (value === "female") {
                value = "여";
            }
            document.getElementById('result성별').innerText = value;
        }
        
               
        function getIncome(event) {
        	var value = event.target.value;
            if (value === "income_0_50") {
                value = ":\u00a0\u00a0 중위소득 0~50%";
            } else if (value === "income_51_75") {
                value = ":\u00a0\u00a0 중위소득 51~75%";
            } else if (value === "income_76_100"){
                value = ":\u00a0\u00a0 중위소득 76~100%";
            } else if (value === "income_101_200"){
                value = ":\u00a0\u00a0 중위소득 101~200%";
            } else if (value === "incomeOver_200"){
                value = ":\u00a0\u00a0 중위소득 200% 이상";
            }
            document.getElementById('result소득분위').innerText = value;
       	 }
        
      
        function getChild(event) {
        	var value = event.target.value;
            if (value === "noBaby") {
                value = ":\u00a0\u00a0 예비부모/난임";
            } else if (value === "pregnant") {
                value = ":\u00a0\u00a0 임산부";
            } else if (value === "birthAdopt"){
                value = ":\u00a0\u00a0 출산/입양";
            } else if (value === ""){
                value = ":\u00a0\u00a0 해당사항 없음";
            }
            document.getElementById('result가족계획').innerText = value;
       	 }
        
        function getJob(event) {
        	var value = event.target.value;
            if (value === "farmWorker") {
                value = ":\u00a0\u00a0 농업인";
            } else if (value === "fishWorker") {
                value = ":\u00a0\u00a0 어업인";
            } else if (value === "livestockWorker"){
                value = ":\u00a0\u00a0 축산업인";
            } else if (value === "forestWorker"){
                value = ":\u00a0\u00a0 임업인";
            } else if (value === "elementary"){
                value = ":\u00a0\u00a0 초등학생";
            } else if (value === "miStdnt"){
                value = ":\u00a0\u00a0 중학생";
            } else if (value === "hiStdnt"){
                value = ":\u00a0\u00a0 고등학생";
            } else if (value === "grStdnt"){
                value = ":\u00a0\u00a0 대학생/대학원생";
            } else if (value === "worker"){
                value = ":\u00a0\u00a0 근로자/직장인";
            } else if (value === "nonWorker"){
                value = ":\u00a0\u00a0 구직자/실업자";
            } else if (value === "notAplcb"){
                value = ":\u00a0\u00a0 해당사항 없음";
            }
            document.getElementById('result직업').innerText = value;
       	 }
        
        function getFmlyTyper(event) {
        	var value = event.target.value;
            if (value === "mltclFmly") {
                value = ":\u00a0\u00a0 다문화가족";
            } else if (value === "northDft") {
               value = ":\u00a0\u00a0 북한이탈주민";
            } else if (value === "spGcFmly"){
                value = ":\u00a0\u00a0 한부모가정/조손가정";
            } else if (value === "sngFmly"){
                value = ":\u00a0\u00a0 1인가구";
            } else if (value === "mltChld"){
                value = ":\u00a0\u00a0 다자녀가구";
            } else if (value === "homeless"){
                value = ":\u00a0\u00a0 무주택세대";
            } else if (value === "newTrnsf"){
                value = ":\u00a0\u00a0 신규전입";
            } else if (value === "exFmly"){
                value = ":\u00a0\u00a0 확대가족";
            } else if (value === "worker"){
                value = ":\u00a0\u00a0 근로자/직장인";
            } else if (value === "nonWorker"){
                value = ":\u00a0\u00a0 구직자/실업자";
            } else if (value === "noneApply"){
                value = ":\u00a0\u00a0 해당사항 없음";
            }
            document.getElementById('result가구특성').innerText = value;
       	 }
        
        function getBsnsType(event) {
        	var value = event.target.value;
            if (value === "soonBsns") {
                value = ":\u00a0\u00a0 예비창업자";
            } else if (value === "inBsns") {
                value = ":\u00a0\u00a0 영업중";
            } else if (value === "nonBsns"){
                value = ":\u00a0\u00a0 생계곤란/폐업예정자";
            } else if (value === "foodBsns"){
                value = ":\u00a0\u00a0 음식적업";
            } else if (value === "mnfBsns"){
                value = ":\u00a0\u00a0 제조업";
            } else if (value === "etcBsns"){
                value = ":\u00a0\u00a0 기타업종";
            } else if (value === ""){
                value = ":\u00a0\u00a0 해당사항 없음";
            }
            document.getElementById('result소상공인').innerText = value;
       	 }
        
        function getCopType(event) {
        	var value = event.target.value;
            if (value === "smallCop") {
                value = ":\u00a0\u00a0 중소기업";
            } else if (value === "socialCop") {
                value = ":\u00a0\u00a0 사회복지시설";
            } else if (value === "facility"){
                value = ":\u00a0\u00a0 기관/단체";
            } else if (value === "mnfCop"){
                value = ":\u00a0\u00a0 제조업";
            } else if (value === "fffCop"){
                value = ":\u00a0\u00a0 농업,임업 및 어업";
            } else if (value === "ictCop"){
                value = ":\u00a0\u00a0 정보통신업";
            } else if (value === "etcCop"){
                value = ":\u00a0\u00a0 기타업종";
            } else if (value === ""){
                value = ":\u00a0\u00a0 해당사항 없음";
            }
            document.getElementById('result기업').innerText = value;
       	 }

        
        function getHandicap(event) {
        	var value = event.target.value;
            if (value === "disabledPerson") {
                value = ":\u00a0\u00a0 장애인";
            } else if (value === "nationslVeterans") {
                value = ":\u00a0\u00a0 국가보훈대상자";
            } else if (value === "sickPerson"){
                value = ":\u00a0\u00a0 질병/질환자";
            } else if (value === ""){
                value = ":\u00a0\u00a0 해당사항 없음";
            } 
            document.getElementById('result개인상황').innerText = value;
       	 }

</script>

<form id="conditions_form" method="get">
<div class="conditions">

	<button type="button" class="accordion" onclick="accordion(this);"><span id="result나이">나이</span>·<span id="result성별">성별</span></button>	
	<div class="accordioncontent">
		<div>
			<input class="condition-agebox" type="number" id="age" name="age" value="0" required onkeyup='getAge()'><span>세</span>
			<input class="condition-gender" type="radio" id ="male" name="gender" value="male" data-value="남" onclick='getGender(event)'> 
			<label for="male">남</label>
			<input class="condition-gender" type="radio" id ="female" name="gender" value="female"onclick='getGender(event)'> 
			<label for="female">여</label>
		</div>
	</div>
	
	<button type="button" class="accordion" onclick="accordion(this);">소득금액 구간&nbsp;&nbsp;<span id="result소득분위"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="income_0_50" name="income" value="income_0_50" onclick='getIncome(event)'> 
			<label for="income_0_50">중위소득 0~50%  </label>
			<input type="radio" id="income_51_75" name="income"value="income_51_75" onclick='getIncome(event)'> 
			<label for="income_51_75">중위소득 51~75%  </label>
			<input type="radio" id="income_76_100" name="income"value="income_76_100" onclick='getIncome(event)'> 
			<label for="income_76_100">중위소득 76~100%  </label>
			<input type="radio" id="income_101_200" name="income"value="income_101_200" onclick='getIncome(event)'> 
			<label for="income_101_200">중위소득 101~200%  </label>
			<input type="radio" id="incomeOver_200" name="income"value="incomeOver_200" onclick='getIncome(event)'> 
			<label for="incomeOver_200">중위소득 200% 이상  </label> 	
		</div>
	</div>
	
	<button type="button" class="accordion" onclick="accordion(this);">가족계획&nbsp;&nbsp;<span id="result가족계획"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="noBaby" name="child" value="noBaby" onclick='getChild(event)'> 
			<label for="noBaby">예비부모/난임</label>
			<input type="radio" id="pregnant" name="child" value="pregnant" onclick='getChild(event)'> 
			<label for="pregnant">임산부</label>
			<input type="radio" id="birthAdopt" name="child" value="birthAdopt" onclick='getChild(event)'> 
			<label for="birthAdopt">출산/입양</label>
			<input type="radio" id="noapply" name="child" value="" onclick='getChild(event)'> 
			<label for="noapply">해당사항없음</label>
		</div>
	</div>

	<button type="button" class="accordion" onclick="accordion(this);">직업&nbsp;&nbsp;<span id="result직업"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="farmWorker" name="job" value="farmWorker" onclick='getJob(event)'>
			<label for="farmWorker">농업인</label>
			<input type="radio" id="fishWorker" name="job" value="fishWorker" onclick='getJob(event)'>
			<label for="fishWorker">어업인</label>
			<input type="radio" id="livestockWorker" name="job" value="livestockWorker" onclick='getJob(event)'>
			<label for="livestockWorker">축산업인</label>
			<input type="radio" id="forestWorker" name="job" value="forestWorker" onclick='getJob(event)'>
			<label for="forestWorker">임업인</label>
			<input type="radio" id="elementary" name="job" value="elementary" onclick='getJob(event)'>
			<label for="elementary">초등학생</label>
			<input type="radio" id="miStdnt" name="job" value="miStdnt" onclick='getJob(event)'>
			<label for="miStdnt">중학생</label>
			<input type="radio" id="hiStdnt" name="job" value="hiStdnt" onclick='getJob(event)'>
			<label for="hiStdnt">고등학생</label>
			<input type="radio" id="grStdnt" name="job" value="grStdnt" onclick='getJob(event)'>
			<label for="grStdnt">대학생/대학원생</label><br>
			<input type="radio" id="worker" name="job" value="worker" onclick='getJob(event)'>
			<label for="worker">근로자/직장인</label>
			<input type="radio" id="nonWorker" name="job" value="nonWorker" onclick='getJob(event)'>
			<label for="nonWorker">구직자/실업자</label>
			<input type="radio" id="notAplcb" name="job" value="notAplcb" onclick='getJob(event)'>
			<label for="notAplcb">해당사항없음</label>
		</div>
	</div>

	<button type="button" class="accordion" onclick="accordion(this);">가구 특성&nbsp;&nbsp;<span id="result가구특성"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="mltclFmly"  name="fmlyType" value="mltclFmly" onclick='getFmlyTyper(event)'>
			<label for="mltclFmly">다문화가족</label>
			<input type="radio" id="northDft" name="fmlyType" value="northDft" onclick='getFmlyTyper(event)'> 
			<label for="northDft">북한이탈주민</label>
			<input type="radio" id="spGcFmly" name="fmlyType" value="spGcFmly" onclick='getFmlyTyper(event)'> 
			<label for="spGcFmly">한부모가정/조손가정</label>
			<input type="radio" id="sngFmly" name="fmlyType" value="sngFmly" onclick='getFmlyTyper(event)'> 
			<label for="sngFmly">1인가구</label>
			<input type="radio" id="mltChld" name="fmlyType" value="mltChld" onclick='getFmlyTyper(event)'> 
			<label for="mltChld">다자녀가구</label><br>
			<input type="radio" id="homeless" name="fmlyType" value="homeless" onclick='getFmlyTyper(event)'> 
			<label for="homeless">무주택세대</label>
			<input type="radio" id="newTrnsf" name="fmlyType" value="newTrnsf" onclick='getFmlyTyper(event)'> 
			<label for="newTrnsf">신규전입</label>
			<input type="radio" id="exFmly" name="fmlyType" value="exFmly" onclick='getFmlyTyper(event)'> 
			<label for="exFmly">확대가족</label>
			<input type="radio" id="noneApply" name="fmlyType" value="noneApply" onclick='getFmlyTyper(event)'> 
			<label for="noneApply">해당사항없음</label>
		</div>
	</div>	
	
	<button type="button" class="accordion" onclick="accordion(this);">소상공인&nbsp;&nbsp;<span id="result소상공인"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="soonBsns"  name="bsnsType" value="soonBsns" onclick='getBsnsType(event)'>
			<label for="soonBsns">예비창업자</label>
			<input type="radio" id="inBsns"  name="bsnsType" value="inBsns" onclick='getBsnsType(event)'>
			<label for="inBsns">영업중</label>
			<input type="radio" id="nonBsns"  name="bsnsType" value="nonBsns" onclick='getBsnsType(event)'>
			<label for="nonBsns">생계곤란/폐업예정자</label>
			<input type="radio" id="foodBsns"  name="bsnsType" value="foodBsns" onclick='getBsnsType(event)'>
			<label for="foodBsns">음식적업</label>
			<input type="radio" id="mnfBsns"  name="bsnsType" value="mnfBsns" onclick='getBsnsType(event)'>
			<label for="mnfBsns">제조업</label>
			<input type="radio" id="etcBsns"  name="bsnsType" value="etcBsns" onclick='getBsnsType(event)'>
			<label for="etcBsns">기타업종</label>
			<input type="radio" id="nobsns" name="bsnsType" value="" onclick='getBsnsType(event)'>
			<label for="nobsns">해당사항없음</label>
		</div>
	</div>
	
	<button type="button" class="accordion" onclick="accordion(this);">기업&nbsp;&nbsp;<span id="result기업"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="smallCop"  name="copType" value="smallCop" onclick='getCopType(event)'>
			<label for="smallCop">중소기업</label>
			<input type="radio" id="socialCop"  name="copType" value="socialCop" onclick='getCopType(event)'>
			<label for="socialCop">사회복지시설</label>
			<input type="radio" id="facility"  name="copType" value="facility" onclick='getCopType(event)'>
			<label for="facility">기관/단체</label>
			<input type="radio" id="mnfCop"  name="copType" value="mnfCop" onclick='getCopType(event)'>
			<label for="mnfCop">제조업</label>
			<input type="radio" id="fffCop"  name="copType" value="fffCop" onclick='getCopType(event)'>
			<label for="fffCop">농업,임업 및 어업</label>
			<input type="radio" id="ictCop"  name="copType" value="ictCop" onclick='getCopType(event)'>
			<label for="ictCop">정보통신업</label>
			<input type="radio" id="etcCop"  name="copType" value="etcCop" onclick='getCopType(event)'>
			<label for="etcCop">기타업종</label>
			<input type="radio" id="nocop" name="copType" value="" onclick='getCopType(event)'>
			<label for="nocop">해당사항없음</label>
		</div>
	</div>
	
	<button type="button" class="accordion" onclick="accordion(this);">개인상황&nbsp;&nbsp;<span id="result개인상황"></span></button>	
	<div class="accordioncontent">
		<div>
			<input type="radio" id="disabledPerson" name="handicap" value="disabledPerson" onclick='getHandicap(event)'>
			<label for="disabledPerson">장애인</label>
			<input type="radio" id="nationslVeterans" name="handicap" value="nationslVeterans" onclick='getHandicap(event)'>
			<label for="nationslVeterans">국가보훈대상자</label>
			<input type="radio" id="sickPerson" name="handicap" value="sickPerson" onclick='getHandicap(event)'>
			<label for="sickPerson">질병/질환자</label>
			<input type="radio" id="nohandicap" name="handicap" value="" onclick='getHandicap(event)'>
			<label for="nohandicap">해당사항없음</label>
		</div>
	</div>
	
<!--  아코디언 추가용 끝점 -->

		<div class="userCondition-button">
			<sec:authorize access="isAuthenticated()">
				<div class="userConditions_button_wrap">
					<input type="button" class="userConditions_button" value="내 정보 가져오기">
				</div>
			</sec:authorize>
			<div class="search_button_wrap">
				<input type="submit" class="search_button" value="맞춤 보조금 찾기">
			</div>			
		</div>
	</div>
</form>

