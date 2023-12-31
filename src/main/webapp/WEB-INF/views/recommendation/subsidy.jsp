<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>
<link href="/resources/css/service/list.css" rel="stylesheet">
<link href="/resources/css/recommendation/subsidy.css" rel="stylesheet">

<!-- pagination script code -->
<script>

 
	$(document).ready(function() {
		
		let pageUrl = decodeURI(window.location.href);
		console.log(pageUrl);
		
	    $(window).on('load', function(){

	        if (pageUrl.indexOf('보육') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.보육').addClass('active');
	        } else if (pageUrl.indexOf('주거') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.주거').addClass('active');
	        } else if (pageUrl.indexOf('농림') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.농림').addClass('active');
	        } else if (pageUrl.indexOf('행정') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.행정').addClass('active');
	        } else if (pageUrl.indexOf('문화') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.문화').addClass('active');
	        } else if (pageUrl.indexOf('보건') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.보건').addClass('active');
	        } else if (pageUrl.indexOf('고용') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.고용').addClass('active');
	        } else if (pageUrl.indexOf('생활') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.생활').addClass('active');
	        } else if (pageUrl.indexOf('보호') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.보호').addClass('active');
	        } else if (pageUrl.indexOf('임신') > -1) {
	            $('.nav-item a').removeClass('active');
	            $('.임신').addClass('active');
	        }
	    });
		

		/*
		let categoryForm = $('#categoryForm');
		
		$('a.cate-link').on('click', function(e) {
			e.preventDefault();
			categoryForm.find('input[name="category"]').val($(this).attr('data-value'));
			categoryForm.submit();
		});
		
		*/
	        
	});
</script>

 
 
<div class="container">

<%@ include file="./conditionsForm.jsp"%>

<form id="categoryForm" action="" method="get">
	<input type="hidden" name="age" value="${keyword.age}" />
	<input type="hidden" name="gender" value="${keyword.gender}" />
	<input type="hidden" name="income" value="${keyword.income}" />
	<input type="hidden" name="child" value="${keyword.child}" />
	<input type="hidden" name="job" value="${keyword.job}" />
	<input type="hidden" name="fmlyType" value="${keyword.fmlyType}" />
	<input type="hidden" name="bsnsType" value="${keyword.bsnsType}" />
	<input type="hidden" name="copType" value="${keyword.copType}" />
	<input type="hidden" name="handicap" value="${keyword.handicap}" />
	<input type="hidden" name="category" value="${category}" />
</form>


<input type="text" class="total-text" name="total" value="총 ${pageMaker.total} 개" readonly/>

 <nav class="navbar navbar-expand-lg static-top" style="height: 50px; background-color: #cccccc">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto" style="color: black">
                <li class="nav-item">
                    <a class="cate-link active" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=">전체보기</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 보육" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=보육·교육">보육·교육</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 주거" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=주거·자립">주거·자립</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 농림" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=농림축산어업">농림축산어업</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 행정" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=행정·안전">행정·안전</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 문화" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=문화·환경">문화·환경</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 보건" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=보건·의료">보건·의료</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 고용" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=고용·창업">고용·창업</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 생활" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=생활안정">생활안정</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 보호" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=보호·돌봄">보호·돌봄</a>
                </li>
                <li class="nav-item">
                    <a class="cate-link 임신" aria-current="page" href="/recommendation/subsidy?age=${keyword.age}&gender=${keyword.gender}&income=${keyword.income}&child=${keyword.child}&job=${keyword.job}&fmlyType=${keyword.fmlyType}&bsnsType=${keyword.bsnsType}&copType=${keyword.copType}&handicap=${keyword.handicap}&category=임신·출산">임신·출산</a>
                </li>
            </ul>
        </div>
    </nav>
    <br/>
    <div class="row">
        <c:forEach var="service" items="${list}">
            <div class="col-sm-12 col-md-6 col-lg-3 mb-4">
                <div class="card text-dark card-has-bg click-col">
                    <div class="card-img-overlay-my d-flex flex-column" onClick="location.href='/service/get/?no=${service.serviceId}'">
                        <div class="card-body-my">
                            <h5 class="card-meta-my mb-2">${service.serviceName}</h5>
                            <p class="card-title-my mt-0 ">
                                <a class="text-my">${service.serviceSummary}</a>
                            </p>
                            <p>지원 기간:<br/>${service.applyDate}</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

</div>

<%@ include file="../common/paginationForRecommendation.jsp"%>
<%@ include file="../layouts/footer.jsp"%>