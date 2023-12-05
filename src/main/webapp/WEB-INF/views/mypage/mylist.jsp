<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../mypage/mypage.jsp"%>

<div class="mypage-box">

<!-- pagination script code -->
<!-- <script>
	$(document).ready(function() {
		let actionForm = $('#actionForm');
		$('a.page-link').on('click', function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find('input[name="pageNum"]')
				.val($(this).attr('href'));
			actionForm.submit();
		});
		
		$('.move').on('click', function(e) {
			e.preventDefault();
			actionForm.append('<input type="hidden" name="bno"/>');
			actionForm.find('input[name="bno"]')
			.val($(this).attr('href'));
			actionForm.attr('action', '/mypage/get');
			actionForm.submit();
			});
	});
</script> -->

<h1 class="page-header">
	<i class="fa-solid fa-circle-question"></i> 나의 문의
</h1>
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var ="qna" items="${mylist}">
			<tr>
				<td style="width: 60px">${qna.bno}</td>
				<td>
				<%-- 	<a href="get?bno=${qna.bno}">${qna.title}</a> --%>
					<a class="move" href="${cri.getLinkWithBno('myget', qna.bno)}">
						${qna.title}</a>
				</td>
				<td style="width: 100px">${qna.writer}</td>
				<td style="width: 130px">
					<fmt:formatDate pattern="yyyy-MM-dd" 
						value="${qna.regDate}" />
				</td>
			</tr>
			</c:forEach>
	</tbody>
</table>

<div class="text-right">
	<a href="register" class="btn btn-primary">
		<i class="far fa-edit"></i>
		글쓰기
	</a>
</div>


<%@include file="../common/paginationForQnA.jsp"%>

</div>
</div>

<%@ include file="../layouts/footer.jsp"%>