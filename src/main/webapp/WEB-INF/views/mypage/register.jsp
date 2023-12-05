<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../mypage/mypage.jsp"%>

<div class="mypage-box">

<h1 class="page-header">
	<i class="far fa-edit"></i> 문의글 쓰기
</h1>
<div class="panel panel-default">

	<div class="panel-body">
		<form role="form" method="post">
			<div class="form-group">
				<label>제목</label> <input name="title" class="form-control">
			</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="form-group has-geedback">
					<label class="control-label" for="userId">작성자</label>
					 <input class="form-control" type="text" name="writer" value="${member.userId}" readonly>
				</div>
			<div class="form-group">
				<label>내용</label>
				<textarea id="content" class="form-control" name="content" rows="10"></textarea>
			</div>
			<button type="submit" class="btn btn-primary list">
				<i class="fas fa-check"></i> 확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i> 취소
			</button>
			
			<a href="javascript:history.back()" class="btn btn-primary" > 
				<i class="fas fa-list"></i>목록
			</a>
		</form>
	</div>
</div>
</div>

<%@include file="../layouts/footer.jsp"%>