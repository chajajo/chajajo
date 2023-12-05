<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div class="menu">
	<nav class="navbar navbar-expand-lg navbar-light">
		 <a class="tnb-nav-btn-home navbar-brand" href="/">
		 <img class="img-chajajo" src="../../../resources/images/chajajologo.png" /></a>
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
					href="/recommendation/subsidy">나만의 보조금 찾기 </a></li>
			</ul>

			<%@ include file="../common/searchbar.jsp"%>

			<div class="tnb-right-section">
				<!-- user-anonymous -->
				<sec:authorize access="isAnonymous()">
					<a href="/member/login" class="user-anonymous login"> Log in </a>
					<a href="/member/signup" class="user-anonymous signup"> Sign Up
					</a>
				</sec:authorize>
				<!-- 로그인한 상태 -->
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="member" />
					<sec:authentication property="principal.member.userId" var="userId" />
					<div class="login_success_area">
						<a href="/member/logout.do" class="logout-icon"> <i
							class="fa-solid fa-right-from-bracket fa-lg"></i></a> <span
							class="user-name"> ${member.userId}</span> <a
							href="../mypage/userinfo" class="login-icon"> <i
							class="fa-solid fa-user fa-2xl"></i></a>

					</div>
				</sec:authorize>
			</div>
		</div>
	</nav>

</div>
