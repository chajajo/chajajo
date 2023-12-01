<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.min.css">
<script src="/resources/js/summernote/summernote-lite.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

<script>
$(document).ready(function() {
	$('#content').summernote({
		height: 300,    // 에디터 높이
		lang: "ko-KR",	// 한글 설정
	});
});
</script>

<%@ include file="../mypage/mypage.jsp"%>

<div class="mypage-box">

<h1 class="page-header">
	<i class="far fa-edit"></i>문의글 수정
</h1>
<div class="panel panel-default">
	<div class="panel-heading">문의글 수정</div>
	<div class="panel-body">
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${qna.bno}">
			<div class="form-group">
				<label>글제목</label> <input name="title" class="form-control"
					value="${qna.title}">
			</div>
			<div class="form-group">
				<label>작성자</label> <input name="writer" class="form-control"
					value="${qna.writer}">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea id="content" class="form-control" rows="10">${qna.content}</textarea>
			</div>
			
			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i> 확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i> 취소
			</button>
			<a href="javascript:history.back()" class="btn btn-primary"> <i
				class="fas fa-file-alt"></i> 돌아가기
			</a>
		</form>
	</div>
</div>
</div>


<%@include file="../layouts/footer.jsp"%>