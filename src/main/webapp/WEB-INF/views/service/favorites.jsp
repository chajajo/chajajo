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
			let serviceId = parseInt($(this).data("tno"));
			let star = { serviceId, userId };
			console.log(star);	
			
			await rest_create(BASE_URL + "/add", star);
			
		let starCount = $(this).parent().find(".star-count");
			console.log(starCount);
			let count = parseInt(starCount.text());
			starCount.text(count+1);
			
			$(this)
				.removeClass('fa-regular')
				.addClass('fa-solid');
		});
		
		// 좋아요 제거
		$('span.star').on('click', '.fa-star.fa-solid', async function(e){
			let serviceId = parseInt($(this).data("tno"));
			
			await rest_delete(`\${BASE_URL}/delete?serviceId=\${serviceId}&userId=\${userId}`);
			
		let starCount = $(this).parent().find(".star-count");
			console.log(starCount);
			let count = parseInt(starCount.text());
			starCount.text(count-1);
			
			$(this)
				.removeClass('fa-solid')
				.addClass('fa-regular');
		});
	});
</script>
</c:if>


<!-- 즐겨찾기 토글 버튼 -->
<span class="star"><i class="${service.myStars ? 'fa-solid' : 'fa-regular'}
 fa-star text-warning" data-tno="${service.serviceId}"></i> </span>
<span class="star-count">${service.stars}</span>





<!-- 즐겨찾기 토글 JavaScript
<script>
    $(document).ready(function() {
        // 별 모양이 클릭될 때 이벤트 처리
        $('#favorite-star').click(function() {
            // 서비스 ID 및 사용자 ID 가져오기
            var serviceId = $(this).data('service-id');
            var userId = $(this).data('user-id');

            // AJAX를 사용하여 서버에 토글 요청 보내기
            $.ajax({
                type: 'POST',
                url: '/userStar/toggle',
                data: {
                    serviceId: serviceId,
                    userId: userId
                },
                success: function(response) {
                    // 성공 시 별 모양 토글 및 UI 업데이트
                    if (response.success) {
                        toggleStar();
                    } else {
                        console.error('Failed to toggle favorite.');
                    }
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        });

        // 별 모양 토글 함수
        function toggleStar() {
            var starIcon = $('#favorite-star');

            // 현재 상태 확인
            var isFavorite = starIcon.hasClass('favorited');

            // 토글
            if (isFavorite) {
                starIcon.removeClass('favorited');
            } else {
                starIcon.addClass('favorited');
            }
        }
    });
</script> -->