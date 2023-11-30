<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layouts/header.jsp" %>

<link href="/resources/css/service/list.css" rel="stylesheet">

<!-- pagination script code -->
<script>
    $(document).ready(function () {
        let actionForm = $('#actionForm');

        $('a.page-link').on('click', function (e) {
            e.preventDefault();
            console.log('click');
            actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
            actionForm.submit();
        });

        // actvie 활성화
        $(".nav-item > .active").css("color", "red");

        $('.nav-link').click(function () {
            // .nav-link 클릭시 이전의 active 값 해제 후,
            $(".nav-item > .active").css("color", "black");

            $('.nav-item').removeClass("active");

            // 클릭한 위치 active 적용
            $(this).addClass("active");
            $(".nav-item > .active").css("color", "red");
        });

    });


</script>

<div class="container">
    <nav class="navbar navbar-expand-lg static-top" style="height: 50px; background-color: #cccccc">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto" style="color: black">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="list">전체보기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=보육·교육">보육·교육</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=주거·자립">주거·자립</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=농림축산어업">농림축산어업</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=행정·안전">행정·안전</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=문화·환경">문화·환경</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=보건·의료">보건·의료</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=고용·창업">고용·창업</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=생활안정">생활안정</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=보호·돌봄">보호·돌봄</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list?keyword=임신·출산">임신·출산</a>
                </li>
            </ul>
        </div>
    </nav>
    <br/>

    <div class="row">
        <c:forEach var="service" items="${list}">
            <div class="col-sm-12 col-md-6 col-lg-3 mb-4">
                <div class="card text-dark card-has-bg click-col">
                    <div class="card-img-overlay d-flex flex-column" onClick="location.href='/service/get/?no=${service.serviceId}'">
                        <div class="card-body">
                            <h4 class="card-meta mb-2">${service.serviceName}</h4>
                            <br/>
                            <h5 class="card-title mt-0 ">
                                <a class="text-dark">${service.serviceSummary}</a>
                            </h5>
                            <p>지원 기간:<br/>${service.applyDate}</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

</div>


<%@ include file="../common/pagination.jsp" %>
<%@ include file="../layouts/footer.jsp" %>