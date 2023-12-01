<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js">
</script>
<script src="/resources/js/rest.js"></script>
<script src="/resources/js/comment.js"></script>
<script src="/resources/js/reply.js"></script>


<%@ include file="../mypage/mypage.jsp"%>

<div class="mypage-box">

<script>
	const COMMENT_URL = '/api/mypage/${param.bno}/comment/';
	const REPLY_URL = '/api/mypage/${param.bno}/reply/';

	$(document).ready(function() {
/* 		$('.list').click(function(){
			document.forms.listForm.submit();
		});
		
		$('.modify').click(function(){
			document.forms.modifyForm.submit();
		});
		 */
		
		$('.remove').click(function(){
			if(!confirm('정말 삭제할까요?')) return;		
			document.forms.removeForm.submit();
		});	
		
		let bno = ${param.bno};		// 글번호
		let writer = '${userId}';	// 작성자(로그인 유저)

		loadComments(bno, writer);	// 댓글 목록 불러오기
		
		// 댓글 추가 버튼 처리
		$('.comment-add-btn').click(function(e) {
			createComment(bno, writer);		
		});
		
		$('.comment-list').on('click', '.comment-update-show-btn', showUpdateComment );
		
		// 수정 확인 버튼 클릭
		$('.comment-list').on('click', '.comment-update-btn', function (e){
			const el = $(this).closest('.comment');
			updateComment(el, writer);
		});
		

		// 수정 취소 버튼 클릭
		$('.comment-list').on('click', '.comment-update-cancel-btn', 
								cancelCommentUpdate);
		
		// 삭제 버튼 클릭
		$('.comment-list').on('click', '.comment-delete-btn', 
								deleteComment);	
		
		/////// 답글버튼이벤트핸들링
		// 답글추가인터페이스보이기
		$('.comment-list').on('click', '.reply-add-show-btn', function(e) {
		showReplyAdd($(this), writer);
		});
		
		// 답글등록
		$('.comment-list').on('click', '.reply-add-btn', function(e){
		addReply($(this), writer);
		});
		
		// 답급취소
		$('.comment-list').on('click', '.reply-add-cancel-btn', cancelReply);
		
		// 답글수정화면보이기
		$('.comment-list').on('click', '.reply-update-show-btn', function(e) {
		showUpdateReply($(this));
		});

		// 답글수정등록
		$('.comment-list').on('click', '.reply-update', function(e) {
		updateReply($(this));
		});
		
		// 답글수정취소
		$('.comment-list').on('click', '.reply-update-cancel', cancelReplyUpdate);
		
		// 답글삭제
		$('.comment-list').on('click', '.reply-delete-btn', deleteReply);
	}); 		
</script>


<h1 class="page-header">
	<i class="far fa-file-alt"></i> ${qna.title}
</h1>

<div class="d-flex justify-content-between">
	<div>
		<i class="fas fa-user"></i> ${qna.writer}
	</div>
	<div>
		<i class="fas fa-clock"></i>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${qna.regDate}" />
	</div>
</div>

<hr>

<div>${qna.content}</div>


 <div class="my-5">
	<i class="fa-regular fa-comments"></i> 댓글 목록
	<hr>
	<div class="comment-list"></div>
</div>
 

<!-- 새 댓글 작성 -->
<!-- 코멘트 추가 / 작성자가 아닌 경우에만 보여주기 -->
<c:if test="${userId != qna.writer }">
	<div class="bg-light p-2 rounded my-5">
		<div>${userId == null ? '댓글을 작성하려면 먼저 로그인하세요' : '댓글 작성' }</div>
		<div>
			<textarea class="form-control new-comment-content" rows="3"
				${userId == null ? 'disabled' : '' }></textarea>
			<div class="text-right">
				<button class="btn btn-primary btn-sm my-2 comment-add-btn"
					${userId == null ? 'disabled' : '' }>
					<i class="fa-regular fa-comment"></i> 확인
				</button>
			</div>
		</div>
	</div>
</c:if>






<div class="mt-4">
	<a href="${cri.getLink('list')}" class="btn btn-primary list">
		<i class="fas fa-list"></i> 목록</a>
	
	<c:if test="${userId == qna.writer }">
		<a href="${cri.getLinkWithBno('modify', qna.bno) }" class="btn btn-primary modify">
			<i class="far fa-edit"></i> 수정</a>
		<a href="#" class="btn btn-danger remove">
			<i class="fas fa-trash-alt"></i> 삭제</a>
	</c:if>
</div>

<form id="listForm" action="/mypage/list" method="get" >
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
</form>
<form id="modifyForm" action="/mypage/modify" method="get" >
	<input type="hidden" id="bno" name="bno" value="${qna.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
</form>


<form action="remove" method="get" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="bno" value="${qna.bno}" /> 
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" /> 
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>
 
</div>


	<%@include file="../layouts/footer.jsp"%>