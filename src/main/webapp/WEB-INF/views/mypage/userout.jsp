<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../mypage/mypage.jsp"%>

<div class="mypage-box">
	<fieldset>
		<legend>회원탈퇴</legend>
		<form id="deleteForm" name="deleteForm" action="/mypage/userout"
			method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<div class="form-group has-geedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" name="userId"
					value="${member.userId}" readonly><br>
			</div>

			<div class="form-group has-geedback">
				<label class="control-label" for="password">비밀번호</label> <input
					class="form-control" type="password" name="password" required><br>
			</div>

			<div class="form-group has-geedback">
				<button class="btn btn-success" type="submit" id="delete">탈퇴하기</button>
				<button class="btn btn-danger" type="button"
					onclick="location.href='/mypage/userinfo'">취소</button>
			</div>
		</form>
	</fieldset>
</div>

<script>
	function showAlert(message) {
		alert(message);
	}

	// 비밀번호 일치 여부에 따른 alert 창 띄우기
	<c:if test="${not empty error}">
	showAlert("${error}");
	</c:if>

	// 탈퇴 성공 메시지에 따른 alert 창 띄우기
	<c:if test="${not empty success}">
	showAlert("${success}");
	</c:if>
</script>

<%@ include file="../layouts/footer.jsp"%>