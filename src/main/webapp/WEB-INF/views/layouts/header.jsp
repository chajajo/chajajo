<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>chajajo</title>
<!-- Latest compiled and minified CSS -->
<!-- CDN: Content Delivery Network (fontawesome) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>	
<script src="/resources/js/summernote/summernote-lite.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

<script>
$(document).ready(function() {
	$('#content').summernote({
		height: 300,    // 에디터 높이
		focus : true,
		lang: "ko-KR",	// 한글 설정
	});
});
$('#content').summernote('fontName', 'Arial');
</script>

<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.min.css">
<link href="/resources/css/main.css" rel="stylesheet" />
<link href="/resources/css/member/mypage.css" rel="stylesheet" />
<link href="/resources/css/pagination.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/member/signup.css?v6" />
<link rel="stylesheet" href="/resources/css/member/login.css?ver=7" />
<body>
	<header class="jumbotron mb-0 rounded-0">
		<div>
			<%@ include file="menu.jsp"%>
		</div>

	</header>

	<div class="container" role="main"style="padding-right: 0px;padding-left: 0px;">