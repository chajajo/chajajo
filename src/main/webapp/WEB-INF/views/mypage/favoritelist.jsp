<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="../mypage/mypage.jsp"%>


<link href="/resources/css/service/list.css" rel="stylesheet">
<link href="/resources/css/member/favorite.css" rel="stylesheet">


<div class= "mypage-favorite">
 <div class="row">
        <c:forEach var="stars" items="${stars}">
            <div class="col-sm-12 col-md-6 col-lg-3 mb-4">
                <div class="card text-dark card-has-bg click-col">
                    <div class="card-img-overlay d-flex flex-column" onClick="location.href='/service/get/?no=${stars.serviceId}'">
                        <div class="card-body">
                            <h5 class="card-meta mb-2">${stars.serviceName}</h5>
                            <p class="card-title mt-0 ">
                                <a class="text-dark">${stars.serviceSummary}</a>
                            </p>
                            <p>지원 기간:<br/>${stars.applyDate}</p>
                        </div>
                    </div>
                </div>
            </div>
         </c:forEach>

</div>
</div>
</div>
<%@ include file="../layouts/footer.jsp"%>