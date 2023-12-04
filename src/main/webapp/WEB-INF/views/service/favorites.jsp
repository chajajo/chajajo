<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/rest.js"></script>

<c:if test="${not empty userId}">
<style>
	.fa-star {
		cursor: pointer;
	}
</style>

<script>
	$(document).ready(function() {
		let userId = '${userId}';
		
		const BASE_URL = '/api/service/star';
		
		// 좋아요 추가	
		$('span.star').on('click', '.fa-star.fa-regular', async function(e){			
			let serviceId = '${service.serviceId}';
			let star = { serviceId, userId };
			console.log(star);	

			await rest_create(BASE_URL + "/add", star);
			
			$(this)
				.removeClass('fa-regular')
				.addClass('fa-solid');
		});
		
		// 좋아요 제거
		$('span.star').on('click', '.fa-star.fa-solid', async function(e){
			let serviceId = '${service.serviceId}';
			
			await rest_delete(`\${BASE_URL}/delete?serviceId=\${serviceId}&userId=\${userId}`);
			
			$(this)
				.removeClass('fa-solid')
				.addClass('fa-regular');
		});
	});
</script>
</c:if>

<span class="star">
	<i class="${ service.myStars ? 'fa-solid' : 'fa-regular' } fa-star text-warning"
	data-serviceId="${serviceId}"></i>
</span>

