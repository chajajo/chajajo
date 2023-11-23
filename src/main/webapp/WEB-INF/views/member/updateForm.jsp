<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../layouts/header.jsp"%>


<body>
<fieldset>
<legend>회원정보수정</legend>
	<form action="/member/update" method="post" name="fr">
		<div class="form-group has-geedback">
			<label class="control-label" for="userId">아이디</label>
			 <input class="form-control" type="text" name="userId" value="${member.userId }" readonly><br>
		</div>
		<div class="form-group has-geedback">
			<label class="control-label" for="password">비밀번호</label>
			<input class="form-control" type="password" name="password" placeholder="비밀번호를 입력하세요" required><br>
		</div>
		<div class="form-group has-geedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="text" name="email" value="${member.email}"><br>
		</div>
		<div class="form-group has-geedback">
			<label class="control-label" for="phone">전화번호</label>
			<input class="form-control" type="text" name="phone" value="${member.phone}"><br>
		</div>
		<div class="form-group has-geedback">
			<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
			<button class="btn btn-danger" type="button" onclick="location.href='/member/info'">취소</button>
		</div>
			
<!-- 		<input type="button" class="btn" value="메인으로" onclick="location.href='/'"> -->
	</form>
</fieldset>
</body>

<script type="text/javascript">
		$(document).ready(function(){		
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;				
				}})
			});
</script>

<%@ include file="../layouts/footer.jsp" %>