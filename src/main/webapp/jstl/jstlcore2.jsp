<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/jstl/jstlcore2.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core 태그 : 조건문 태그(if, choose)</title>
</head>
<body>
<h3>조건문 태그 : if, choose</h3>
<c:if test="${5<10}">
	<h4>5는 10보다 작다.</h4>
</c:if>
<c:if test="${5>10}">
	<h4>5는 10보다 크다.</h4>
</c:if>
<c:choose>
	<c:when test="${5+10 == 25}">
		<h4>5+10은 25다.</h4>
	</c:when>
	<c:when test="${5+10 == 15}">
		<h4>5+10은 15다.</h4>
	</c:when>
	<c:when test="${5+10 == 510}">
		<h4>5+10은 510다.</h4>
	</c:when>
	<c:otherwise>
		<h4>5+10은 모른다.</h4>
	</c:otherwise>
</c:choose>
</body>
</html>