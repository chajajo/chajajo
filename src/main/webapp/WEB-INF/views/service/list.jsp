<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layouts/header.jsp"%>

<!-- pagination script code -->
<script>
	$(document).ready(function() {
		let actionForm = $('#actionForm');

		$('a.page-link').on('click', function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});

	});
</script>

<h1 class="page-header">
	<i></i> Service List
</h1>

<table class="table">
	<thead>
		<tr>
			<th>서비스명</th>
			<th>서비스 요약</th>
			<th>지원 기간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="service" items="${list}">
			<tr>
				<td><a href="get/?no=${service.serviceId}">${service.serviceName}</a></td>
				<td>${service.serviceSummary}</td>
				<td>${service.applyDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>