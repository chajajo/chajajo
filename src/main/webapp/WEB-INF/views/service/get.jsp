<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layouts/header.jsp"%>

<link href="/resources/css/service/get.css" rel="stylesheet">

<div class="container center">
    <div class="card" style="text-align: center; background-color: azure">
        <h4>${service.serviceName}</h4>
    </div>
</div>
<br/>
<details>
    <summary>지원 대상</summary>
    <h4>지원 대상</h4>
    <div>
        ${service.supportTarget}
    </div>
    <br/>
    <h4>선정 기준</h4>
    <div>
        ${service.selectionCriteria}
    </div>
</details>

<details>
    <summary>지원 내용</summary>
    <h4>지원 내용</h4>
    <div>
        ${service.appContents}
    </div>
</details>

<details>
    <summary>신청 방법</summary>
    <h4>신청기한</h4>
    <div>
        ${service.applyDate}
    </div>
    <br/>
    <h4>지원 방법</h4>
    <div>
        ${service.applyMethod}
    </div>
    <br/>
    <h4>구비서류</h4>
    <div>
        ${service.document}
    </div>
</details>

<details>
    <summary>접수 문의</summary>
    <h4>접수기관명</h4>
    <div>
        ${service.reception}
    </div>
    <br/>
    <h4>문의처</h4>
    <div>
        ${service.contact}
    </div>
</details>

<%@ include file="../layouts/footer.jsp"%>