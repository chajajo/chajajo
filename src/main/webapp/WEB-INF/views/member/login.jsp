<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../layouts/header.jsp"%>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/member/login.css?ver=7">



			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>로그인</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_name"></div>
						<div class="id_input_box">
							<input class="id_input" placeholder="아이디를 입력하세요" name="userId">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_name"></div>
						<div class="pw_input_box">
							<input type ='password' class="pw_iput" placeholder="비밀번호를 입력하세요" name="password">
						</div>
					</div>

					<c:if test= "${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>

					

					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>
				</div>
			</form>






	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login");
			$("#login_form").submit();

		});
	</script>

<%@include file="../layouts/footer.jsp"%>