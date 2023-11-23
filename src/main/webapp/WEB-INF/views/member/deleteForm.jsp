<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../layouts/header.jsp"%>
<%
// 로그인 처리 -> 로그인 x (로그인페이지 이동)
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("/test/member/main");
}
%>

<script type="text/javascript">
		$(document).ready(function(){
		
			$("#delete").on("click", function(){
				
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#password").focus();
					return false
				}
				
				if($("#password2").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#password2").focus();
					return false
				}
				
				if ($("password").val() != $("#password2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#password").focus();
					 
					return false;
					}
				
				$.ajax({
					url : "/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			});
		})
	</script>
<fieldset>
	<legend>회원탈퇴</legend>
	   <form action="/member/delete" method="post" id="deleteForm" name="deleteForm">
		<!-- input타입중 hidden은 화면에 있는 해당 input태그를 숨겨서 정보 전달   -->
		<div class="form-group has-geedback">
			<label class="control-label" for="userId">아이디</label> 
			<input class="form-control" type="text" name="userId" value="<%=id%>" readonly><br>
		</div>
		<div class="form-group has-geedback">
			<label class="control-label" for="password">비밀번호</label>
			<input class="form-control" type="password" name="password"><br> 
		</div>
				<div class="form-group has-geedback">
			<label class="control-label" for="password2">비밀번호</label>
			<input class="form-control" type="password" name="password2"><br> 
		</div>
		<div class="form-group has-geedback">
			<button class="btn btn-success" type="submit" id="delete">탈퇴하기</button>
			<button class="btn btn-danger" type="button" onclick="location.href='/member/info'">취소</button>
		</div>
	</form>
</fieldset>

<%@ include file="../layouts/footer.jsp"%>