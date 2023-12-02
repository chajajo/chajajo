<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="carouselExampleIndicators" class="carousel slide"
	data-ride="carousel">

	<div class="carousel-inner">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-item active" onClick="location.href='/service/get/?no=${service[0].serviceId}'" style="cursor: pointer">
			<div class="main-box" style="background-color: beige">
				<em class="chip">인기 보조금</em> <br> <span class="main-box-title">${service[0].serviceName}</span>
				<p class="main-box-desc">${service[0].serviceSummary}</p>
				<img src="..." class="main-box-img d-block w-100" alt="error">
			</div>
		</div>
		<div class="carousel-item" onClick="location.href='/service/get/?no=${service[1].serviceId}'" style="cursor: pointer">
			<div class="main-box" style="background-color: pink">
				<em class="chip">인기 보조금</em> <br> <span class="main-box-title">${service[1].serviceName}</span>
				<p class="main-box-desc">${service[1].serviceSummary}</p>
				<img src="..." class="main-box-img d-block w-100" alt="error">
			</div>
		</div>
		<div class="carousel-item" onClick="location.href='/service/get/?no=${service[2].serviceId}'" style="cursor: pointer">
			<div class="main-box" style="background-color: skyblue">
				<em class="chip">인기 보조금</em> <br> <span class="main-box-title">${service[2].serviceName}</span>
				<p class="main-box-desc">${service[2].serviceSummary}</p>
				<img src="..." class="main-box-img d-block w-100" alt="error">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>


</div>
