<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
<%@include file="../layouts/header.jsp"%>

<h1 align="center">info</h1>
<div class="">
	<form action="update.me" method="post">
		<div class="form-group">
			<label for="userId">* ID : </label>
			<input type="text" class="form-control" id="userId" 
				value="${member.userId}" name="userId" readonly> <br>
	
			<label for="email"> &nbsp; Email : </label>
			<input type="text" class="form-control" id="email" 
				value="${member.email}" name="email" readonly> <br>
	
			<label for="birth"> &nbsp; Birth : </label>
			<input type="text" class="form-control" id="birth" 
				value="${member.birth}" name="age" readonly> <br>
	
			<label for="phone"> &nbsp; Phone : </label>
			<input type="tel" class="form-control" id="phone" 
	        	value="${member.phone}" name="phone" readonly> <br>
	        	
			<label for="phone"> &nbsp; Gender : </label>
	        <input type="text" class="form-control" id="gender" 
	        	value="${member.gender}" name="gender" readonly> <br>
	        	
	        <input type="button" value="메인으로" class="btn" onclick="location.href='/'">
	        <input type="button" value="회원정보수정" class="btn" onclick="location.href='/member/update'">
	         <input type="button" value="회원탈퇴" class="btn" onclick="location.href='/member/delete'">
		</div>
	</form>
</div>





<%@ include file="../layouts/footer.jsp" %>