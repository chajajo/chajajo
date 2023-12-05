<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="layouts/header.jsp" %>

<%@ include file="layouts/carousel.jsp" %>
<div class="row">
    <div class="col-sm-12 col-md-6 col-lg-4 mb-4">

        <div class="carousel-item active" onClick="location.href='/service/list?keyword=농림축산어업'"
             style="cursor: pointer">
            <div class="main-box" style="background-image:url(../../resources/images/sheep-4432232_640.jpg); opacity: 0.75;">
                <em class="chip">인기 보조금 분야</em> <br><br><br>
                <div class="main-box-text">
               	 <h1  style="color: white">농림 축산 어업</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-4 mb-4">

        <div class="carousel-item active" onClick="location.href='/service/list?keyword=생활안정'"
             style="cursor: pointer">
            <div class="main-box" style="background-image:url(../../resources/images/living-room-2732939_640.jpg); opacity: 0.75;">
                <em class="chip">인기 보조금 분야</em> <br><br><br>
                <div class="main-box-text">
                	<h1  style="color: white">생활안정</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-4 mb-4">

        <div class="carousel-item active" onClick="location.href='/service/list?keyword=보건·의료'"
             style="cursor: pointer">
            <div class="main-box" style="background-image:url(../../resources/images/laboratory-563423_640.jpg); opacity: 0.75;">
                <em class="chip">인기 보조금 분야</em> <br><br><br>
                <div class="main-box-text">
                	<h1 style="color: white">보건·의료</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="layouts/footer.jsp" %>