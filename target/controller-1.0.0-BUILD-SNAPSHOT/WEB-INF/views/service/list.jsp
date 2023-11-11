<%--
  Created by IntelliJ IDEA.
  User: jinyoung
  Date: 2023-11-11
  Time: 1:09 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layouts/header.jsp"%>

<h1 class="page-header">
    <i></i> Service List
</h1>

<table class="table">
    <thead>
        <tr>
            <th>서비스명</th>
            <th>서비스 요약</th>
            <th>지원 기간</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="service" items="${list}">
            <tr>
                <td>${service.serviceName}</td>
                <td>${service.serviceSummary}</td>
                <td>${service.applyDate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="../layouts/footer.jsp"%>