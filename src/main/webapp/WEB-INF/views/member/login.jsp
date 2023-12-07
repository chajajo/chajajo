<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../layouts/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>


<div style="width: 500px" class="mx-auto">
	<h1 class="my-5">
		<i class="fa-solid fa-right-to-bracket"></i> 로그인
	</h1>

	<c:if test="${param.error == 'true' }">
		<div class="error">사용자 ID 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
	<c:if test="${param.error == 'login_required' }">
		<div class="error">로그인이 필요한 서비스입니다.</div>
	</c:if>

	<form action="/member/login"  method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div class="form-group">
			<label for="userId" class="userIdBox"><i class="fa-solid fa-user"></i> 사용자 ID:</label>
			<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력하세요"/>
		</div>

		<div class="form-group">
			<label for="password" class="userPwBox"><i class="fa-solid fa-lock"></i> 비밀번호:</label>
			<input type="password" name="password" id="password"
				class="form-control" placeholder="비밀번호를 입력하세요"/>
		</div>

		<button type="submit" class="login_button btn btn-primary btn-block">로그인</button>

	</form>
</div>


<form id="logoutForm" action="/member/logout" method="post"></form>

<!-- <div style="width: 500px" class="mx-auto">
	<h1 class="my-5">
		<i class="fa-solid fa-right-to-bracket"></i> 로그인
	</h1>

	<c:if test="${param.error == 'true' }">
		<div class="error">사용자 ID 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
	<c:if test="${param.error == 'login_required' }">
		<div class="error">로그인이 필요한 서비스입니다.</div>
	</c:if>

	<form action="/member/login" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div class="form-group id_wrap">
			<label for="userId" class="id_name"><i
				class="fa-solid fa-user"></i> 사용자 ID:</label> <input type="text"
				name="userId" id="userId" class="form-control id_input"
				placeholder="아이디를 입력하세요" />
		</div>

		<div class="form-group pw_wrap">
			<label for="password" class="pw_name"><i
				class="fa-solid fa-lock"></i> 비밀번호:</label> <input type="password"
				name="password" id="password" class="form-control pw_input"
				placeholder="비밀번호를 입력하세요" />
		</div>

		<div class="login_button_wrap">
			<input type="button" class="login_button" value="로그인">
		</div>

		<button type="#" class="btn btn-primary btn-block">
			<i class="fa-solid fa-user-plus"></i> 회원가입
		</button>
	</form>
</div>


<form id="logoutForm" action="/member/logout" method="post"></form>



<script>
	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function() {

		/* 로그인 메서드 서버 요청 */
		$("#login_form").attr("action", "/member/login");
		$("#login_form").submit();

	});
</script> -->

<%@include file="../layouts/footer.jsp"%>