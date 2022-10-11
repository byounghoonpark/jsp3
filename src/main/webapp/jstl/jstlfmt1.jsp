<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jsp3/src/main/webapp/jstl/jstlfmt1.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>형식화 태그 : 숫자,날짜를 형식화된 문자열로 출력</title>
</head>
<body>
<h3>숫자 관련 형식 지정</h3>
<%-- type="currency" 해당 지역의 화폐단위 --%>
<fmt:setLocale value="ko_KR"/> <%--해당 지역 설정 --%>
<fmt:formatNumber value="500000" type="currency" 
currencySymbol="￦"/><br>
<fmt:formatNumber value="0.15" type="percent"/><br> 
<fmt:formatNumber value="50000.341" pattern="###,###.00"/><br> 
<fmt:formatNumber value="50000.341" pattern="000,000.00"/><br> 
<h3>날짜 관련 형식 지정</h3></body>
<c:set var="today" value="<%=new Date() %>"/>
<fmt:formatDate value="${today }"
pattern="yyyy년 MM월 dd일 HH:mm:ss a E"/><br>

</html>