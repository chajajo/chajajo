<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@include file="../layouts/header.jsp"%>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="/resources/css/member/signup.css?v6">
		<form id="join_form" method="post">
			<div class="wrap">
				<h1 class="my-1"><i class="fa-solid fa-user-plus"></i> 회원 가입</h1>
				
				<div class="id_wrap">
				
					<div class="id_name"><i class="fa-solid fa-user"></i> 아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="userId">
					</div>

					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
						class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				
				<div class="pw_wrap">
					<div class="pw_name"><i class="fa-solid fa-lock"></i> 비밀번호</div>
					<div class="pw_input_box">
						<input type="password" class="pw_input" name="password">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				
				<div class="pwck_wrap">
					<div class="pwck_name"><i class="fa-solid fa-lock"></i> 비밀번호 확인</div>
					<div class="pwck_input_box">
						<input type="password" class="pwck_input" name="password2">
					</div>
					<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
						class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
						class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<div class="gender_wrap">
					<div class="gender_name"><i class="fa-solid fa-venus-mars"></i> 성별</div>
					<div class="gender_input_box">
						<input class="gender_input" type="radio" id="select" name="gender" value="M"/><label for="select">남</label>
						<input class="gender_input" type="radio" id="select2" name="gender" value="F"/><label for="select2">여</label>
					</div>
					<span class="final_gebder_ck">성별을 선택해주세요.</span>
				</div>
			
				<div class="birth_wrap">
					<div class="birth_name"><i class="fa-solid fa-cake-candles"></i> 생년월일</div>
					<div class="birth_input_box">
						<input class="birth_input" type="date" pattern="yyyy.MM.dd" name="birth">
					</div>
					<span class="final_birth_ck">생년월일을 입력해주세요.</span>
				</div>

				<div class="mail_wrap">
					<div class="mail_name"><i class="fa-solid fa-envelope"></i> 이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="email">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
				</div>

				<div class="phone_wrap">
					<div class="phone_name"><i class="fa-solid fa-square-phone"></i> 전화번호</div>
					<div class="phone_input_box">
						<input class="phone_input" name="phone">
					</div>
					<span class="final_phone_ck">전화번호를 입력해주세요.</span>
				</div>
				


				<div class="join_button_wrap">
					<input type="button" class="join_button" value="가입하기">
				</div>
			</div>
		</form>


	<script>
		/* 유효성 검사 통과유무 변수 */
		var idCheck = false; // 아이디
		var idckCheck = false; // 아이디 중복 검사
		var pwCheck = false; // 비번
		var pwckCheck = false; // 비번 확인
		var pwckcorCheck = false; // 비번 확인 일치 확인
		var mailCheck = false; // 이메일
		var phoneCheck = false; // 전화번호

		$(document).ready(
				function() {
					//회원가입 버튼(회원가입 기능 작동)
					$(".join_button")
							.click(
									function() {

										/* 입력값 변수 */
										var id = $('.id_input').val(); // id 입력란
										var pw = $('.pw_input').val(); // 비밀번호 입력란
										var pwck = $('.pwck_input').val(); // 비밀번호 확인 입력란
										var mail = $('.mail_input').val(); // 이메일 입력란
										var phone = $('.phone_input').val(); // 전화번호 입력란


										/* 아이디 유효성검사 */
										if (id == "") {
											$('.final_id_ck').css('display',
													'block');
											idCheck = false;
										} else {
											$('.final_id_ck').css('display',
													'none');
											idCheck = true;
										}

										/* 비밀번호 유효성 검사 */
										if (pw == "") {
											$('.final_pw_ck').css('display',
													'block');
											pwCheck = false;
										} else {
											$('.final_pw_ck').css('display',
													'none');
											pwCheck = true;
										}

										/* 비밀번호 확인 유효성 검사 */
										if (pwck == "") {
											$('.final_pwck_ck').css('display',
													'block');
											pwckCheck = false;
										} else {
											$('.final_pwck_ck').css('display',
													'none');
											pwckCheck = true;
										}

										/* 이메일 유효성 검사 */
										if (mail == "") {
											$('.final_mail_ck').css('display',
													'block');
											mailCheck = false;
										} else {
											$('.final_mail_ck').css('display',
													'none');
											mailCheck = true;
										}

										/* 전화번호 유효성 검사 */
										if (phone == "") {
											$('.final_phone_ck').css('display',
													'block');
											phoneCheck = false;
										} else {
											$('.final_phone_ck').css('display',
													'none');
											phoneCheck = true;
										}
										
										/* 최종 유효성 검사 */
										if (idCheck && idckCheck && pwCheck
												&& pwckCheck && mailCheck
												&& phoneCheck) {

											$("#join_form").attr("action",
													"/member/signup");
											$("#join_form").submit();
										}
										return false;
									});
				});

		//아이디 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {

					/* console.log("keyup 테스트");	 */

					var userId = $('.id_input').val(); // .id_input에 입력되는 값
					var data = {
						userId : userId
					} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

					$.ajax({
						type : "post",
						url : "/member/userIdChk",
						data : data,
						success : function(result) {
							// console.log("성공 여부" + result);

							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								// 아이디 중복이 없는 경우
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								// 아이디 중복된 경우
								idckCheck = false;
							}

						}// success 종료

					}); // ajax 종료

				});// function 종료

		/* 비밀번호 확인 일치 유효성 검사 */

		$('.pwck_input').on("propertychange change keyup paste input",
				function() {

					var pw = $('.pw_input').val();
					var pwck = $('.pwck_input').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw == pwck) {
						$('.pwck_input_re_1').css('display', 'block');
						$('.pwck_input_re_2').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					}

				});
	</script>



<%@ include file="../layouts/footer.jsp" %>