<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="menu">
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="tnb-nav-btn-home navbar-brand" href=""><i
			class="fa-solid fa-wallet"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav navbar-nav-scroll" style="max-height: 100px;">
				<li class="tnb-nav-btn nav-item active"><a class="nav-link"
					href="...">전체보기 </a></li>
				<li class="tnb-nav-btn nav-item active"><a class="nav-link"
					href="...">서비스별 </a></li>
			</ul>

			<form class="search d-flex">
				<input class="search-bar form-control" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn search-btn" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>
		<div class="tnb-right-section">
			<!-- user-anonymous -->
			<a href="..." class="user-anonymous login"> Log in </a> <a href="..."
				class="user-anonymous signup"> Sign Up </a>

		</div>
	</nav>

</div>