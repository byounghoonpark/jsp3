<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--/jsp3/src/main/webapp/jstl/jstlcore3.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>forEach 태그를 이용하여 1부터 100 까지의 합 구하기</h3>
<%-- pageContext.setAttribute("sum",0) --%>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="1" end="100">
<c:set var="sum" value="${sum+i }"/>
</c:forEach>
1부터 100까지의 합:${sum}<br>

<h3>forEach 태그를 이용하여 1부터 100 까지의 짝수 합 구하기</h3>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="2" end="100" step="2">
<c:set var="sum" value="${sum+i }"/>
<%-- <c:if test = "${i%2 ==0 }">
<c:set var="sum" value="${sum+i }"/>
</c:if>--%>
</c:forEach>
1부터 100까지의 짝수합:${sum}<br>

<h3>forEach 태그를 이용하여 1부터 100 까지의 홀수 합 구하기</h3>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="1" end="100" step="2">
<c:set var="sum" value="${sum+i }"/>
<%-- <c:if test = "${i%2 ==1 }">
<c:set var="sum" value="${sum+i }"/>
</c:if>--%>
</c:forEach>
1부터 100까지의 홀수합:${sum}<br>
<hr>
<%
List<Integer> list = new ArrayList<>();
for(int i=1;i<10;i++) list.add(i*10);
pageContext.setAttribute("list",list);
%>
<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<c:forEach var="i" items="${list }">
${i} &nbsp;&nbsp;&nbsp;
</c:forEach>

</body>
</html>