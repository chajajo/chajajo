<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>
<link href="/resources/css/service/list.css" rel="stylesheet">

<!-- pagination script code -->
<script>
 
	$(document).ready(function() {
		let actionForm = $('#actionForm');

		$('a.page-link').on('click', function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});
		
	});
</script>
 
 <%@ include file="./conditionsForm.jsp"%>
 
<div class="container">
    <div class="row">
        <c:forEach var="service" items="${list}">
            <div class="col-sm-12 col-md-6 col-lg-3 mb-4">
                <div class="card text-dark card-has-bg click-col">
                    <div class="card-img-overlay d-flex flex-column">
                        <div class="card-body">
                            <h4 class="card-meta mb-2">${service.serviceName}</h4>
                            <br/>
                            <h5 class="card-title mt-0 ">
                                <a class="text-dark" href="../service/get/?no=${service.serviceId}">${service.serviceSummary}</a>
                            </h5>
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