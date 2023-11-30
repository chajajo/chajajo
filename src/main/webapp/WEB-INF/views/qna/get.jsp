<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../layouts/header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js">
	
</script>
<script src="/resources/js/rest.js"></script>
<script src="/resources/js/comment.js"></script>






<script>
	const COMMENT_URL = '/api/qna/${param.bno}/comment/';

	$(document).ready(function() {
		$('.remove').click(function() {
			if (!confirm('정말 삭제할까요?'))
				return;
			document.forms.removeForm.submit();
		});

		let bno = ${param.bno};// 글번호
		let writer = '${userId};// 작성자(로그인유저)
		loadComments(bno, writer);// 댓글목록불러오기
		
		// 댓글수정, 삭제버튼처리-이벤트버블링(이벤트처리위임)
		// 댓글수정보기버튼클릭
		$('.comment-list').on('click', '.comment-update-show-btn',
					showUpdateComment);
		
		// 수정확인버튼클릭
		$('.comment-list').on('click', '.comment-update-btn', function (e){
			const el = $(this).closest('.comment');
			updateComment(el, writer);
		});
		// 수정취소버튼클릭
		$('.comment-list').on('click', '.comment-update-cancel-btn',
					cancelCommentUpdate);

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


<div class="mt-4">
	<a href="list" class="btn btn-primary"> <i class="fas fa-list"></i>목록
	</a> <a href="modify?bno=${qna.bno}" class="btn btn-primary"> <i
		class="far fa-edit"></i> 수정
	</a> <a href="remove?bno=${qna.bno}" class="btn btn-primary"> <i
		class="fas fa-trash-alt"></i> 삭제
	</a>
</div>

<div class="my-5">
	댓글목록
	<hr>
	<div class="comment-list"></div>
</div>

<div class="comment my-3" data-no="10" data-writer="admin">
	<div class="comment-title my-2 d-flex justify-content-between">
		<div>
			<strong class="writer"> admin </strong> <span
				class="text-muted ml-3 comment-date"> 2023-09023 10:10 </span>
		</div>
		<div class="btn-group">
			<button class="btn btn-light btn-smcomment-update-show-btn">
				<i class="fa-solidfa-pen-to-square"> </i> 수정
			</button>
			<button class="btn btn-light btn-smcomment-delete-btn">
				<i class="fa-solidfa-times"> </i> 삭제
			</button>
		</div>
	</div>
	</div>
	<div class="comment-body">
		<div class="comment-content">댓글내용입니다.</div>
	</div>
	<div class="reply-listml-5">
		<!--답글목록출력영역-->
	</div>

<!--코멘트추가/ 작성자가아닌경우에만보여주기-->
<c:if test="${userId != qna.writer}">
	<div class="bg-light p-2 rounded my-5">
		<div>${userId == null ? '댓글을작성하려면먼저로그인하세요' : '댓글작성' }</div>
		<div>
			<textarea class ="form-control new-comment-content" rows="3"
				${userId == null ? 'disabled' : '' }>
			</textarea>
			<div class="text-right">
				<button class="btn btn-primary btn-smmy-2 comment-add-btn"
					${userId == null ? 'disabled' : '' }>
					<i class ="fa-regular fa-comment">
					</i> 확인 
				</button>
			</div>
		</div>
	</div>
	</c:if>





	<%@include file="../layouts/footer.jsp"%>