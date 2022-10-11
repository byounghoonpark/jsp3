<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--/jsp3/src/main/webapp/layout/layout.jsp
	1. http://localhost:8088/jsp2/model1/member/loginForm.jsp요청
	   /*에 속한 url 요청임
	2. <sitemesh:write property='title'/> : 
				loginForm.jsp 페이지의 title태그의 내용 적용
	3. <sitemesh:write property='head'/> :
				loginForm.jsp 페이지의 head 태그의 내용 적용. title 태그 제외
				<script>, <style>...
	4. <sitemesh:write property='body'/> :
				loginForm.jsp 페이지의 body 태그의 내용 적용.
--%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property='title'/></title>
<link rel="stylesheet" href="${path}/css/main.css">
<sitemesh:write property='head'/>
</head>
<body>
<table>
<tr><td colspan="3" style="text-align:right">
<c:if test="${empty seesionScope.login}">
   <a href="${path}/member/loginForm">로그인</a>
   <a href="${path}/member/joinForm">회원가입</a>
</c:if>
<c:if test="${!empty seesionScope.login}">
   <a href="${path}/member/logout">로그아웃</a>
</c:if>
   </td></tr>
<tr><td width="15%" valign="top">
   <a href="${path}/member/main">회원관리</a><br></td>
   <td colspan="2" style="text-align: Left; vertical-align: top">
   <sitemesh:write property='body'/></td></tr>
<tr><td colspan="3">KIC 캠퍼스</td></tr>
</table>
</body>
</html>
