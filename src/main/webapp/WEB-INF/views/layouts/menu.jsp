<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="menu">
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="tnb-nav-btn-home navbar-brand" href="/"><i
			class="fa-solid fa-wallet"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav navbar-nav-scroll" style="max-height: 100px;">
				<li class="tnb-nav-btn nav-item active"><a class="nav-link"
					href="/service/list">전체보기 </a></li>
				<li class="tnb-nav-btn nav-item active"><a class="nav-link"
					href="...">서비스별 </a></li>
			</ul>

		<%@ include file="../common/searchbar.jsp"%>

		<div class="tnb-right-section">
			<!-- user-anonymous -->
			<c:if test="${member == null }">
				<a href="/member/login" class="user-anonymous login"> Log in </a>
				<a href="/member/signup" class="user-anonymous signup"> Sign Up
				</a>
			</c:if>
			<!-- 로그인한 상태 -->
			<c:if test="${ member != null }">
				<div class="login_success_area">
					<span>회원 : ${member.userId}</span> 
					<a href="/member/logout.do"><i class="fa-solid fa-right-from-bracket"></i>로그아웃</a>
					<a href="/member/info"><i class="fa-solid fa-right-from-bracket"></i>내정보</a>
				</div>
			</c:if>




		</div>
	</nav>

</div>