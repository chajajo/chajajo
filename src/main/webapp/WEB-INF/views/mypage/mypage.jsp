<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../layouts/header.jsp"%>

<div class="mypage-header">
	<h1>
		<i class="fa-solid fa-user mr-3"></i>마이페이지
	</h1>
</div>

<div class="mypage-container">
	<div class="mypage-menu">
		<ul>
			<li><a href="../mypage/userinfo">회원정보</a></li>
			<ol>
				<li><a href="../mypage/infomodify">정보수정</a></li>
				<li><a href="../mypage/userout">회원탈퇴</a></li>
			</ol>
			<br>
			<li><a href="../mypage/mysubsidy">나만의 보조금</a></li>
			<ol>
				<li><a href="../mypage/favoritelist">즐겨찾기 목록</a></li>
				<li><a href="../mypage/alertservice">알림 서비스</a></li>
			</ol>
			<br>
			<li><a href="../mypage/contact">문의하기</a></li>
			<ol>
				<li><a href="../mypage/mycontact">나의문의</a></li>
			</ol>
		</ul>
	</div>