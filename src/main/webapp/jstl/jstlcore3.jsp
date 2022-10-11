<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/jstl/jstlcore3.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그 : forEach 반복관련 태그</title>
</head>
<body>
<h3>forEach 태그를 이용하여 1부터 100까지의 합 구하기</h3>
<%-- pageContext.setAttribute("sum",0) --%>
<c:set var="sum" value="${0}" /> 
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum+i}" />
</c:forEach>
1부터 100까지의 합 : ${sum}<br>

<h3>forEach 태그를 이용하여 1부터 100까지의 짝수의 합 구하기</h3>
<c:set var="sum" value="${0}" /> 
<c:forEach var="i" begin="1" end="100" step="1"><%-- step="1" 생략가능 --%>
	<c:if test="${i%2==0}" >
		<c:set var="sum" value="${sum+i}" />
	</c:if>
</c:forEach>
1. 1부터 100까지의 짝수의 합 : ${sum}<br>

<c:set var="sum" value="${0}" /> 
<c:forEach var="i" begin="2" end="100" step="2">
		<c:set var="sum" value="${sum+i}" />
</c:forEach>
2. 1부터 100까지의 짝수의 합 : ${sum}<br>

<h3>forEach 태그를 이용하여 1부터 100까지의 홀수의 합 구하기</h3>
<c:set var="sum" value="${0}" /> 
<c:forEach var="i" begin="1" end="100" step="1"><%-- step="1" 생략가능 --%>
	<c:if test="${i%2==1}" >
		<c:set var="sum" value="${sum+i}" />
	</c:if>
</c:forEach>
1. 1부터 100까지의 홀수의 합 : ${sum}<br>

<c:set var="sum" value="${0}" /> 
<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum+i}" />
</c:forEach>
2. 1부터 100까지의 홀수의 합 : ${sum}<br/> <%-- empty tag : 하위태그 없는 태그 --%>
<hr>
<%
	List<Integer> list = new ArrayList<>();
	for(int i=1; i<=10; i++) list.add(i*10);
	pageContext.setAttribute("list", list); //el를 사용하기 위해서는 속성에 등록해야한다.
%>
<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%-- items="${list}" : list이름을 가진 속성의 값 --%>
<c:forEach var="i" items="${list}"> <%-- i : 10 20 30 .... --%>
	${i} &nbsp;&nbsp;&nbsp;
</c:forEach>
<h3>List 객체의 요소의 합을 출력하기</h3>
<c:set var="sum" value="${0}" /> 
<c:forEach var="i" items="${list}">
	<c:set var="sum" value="${sum+i}" />
</c:forEach>
list 객체의 요소의 합 : ${sum}

<h3>forEach태그를 이용하여 List 객체를 인덱스:값의 형태로 출력하기</h3>
<%--
	varStatus="변수명" => 반복중인 요소의 상태 정보
		변수명.index : 0부터 시작하는 첨자
		변수명.count : 1부터 시작하는 갯수
 --%>
<c:forEach var="i" items="${list}" varStatus="stat">
	${stat.index}:${i} &nbsp;&nbsp;&nbsp;
</c:forEach>

<h3>forEach태그를 이용하여 List 객체를 한줄에 2개씩 출력하기</h3>
<c:forEach var="i" items="${list}" varStatus="stat">
	${i} &nbsp;&nbsp;&nbsp;
	<c:if test="${stat.index%2==1}"><br></c:if><%-- index는 0부터 시작 --%>
	<c:if test="${stat.count%2==0}"><br></c:if><%-- count는 1부터 시작 --%>
</c:forEach>
<%
	Map<String, Object> map = new HashMap<>(); //HashMap은 순서는 모른다.
	map.put("name", "홍길동");
	map.put("today", new Date());
	map.put("age", 20);
	map.put("list", list);
	pageContext.setAttribute("map", map);
%>
<c:forEach var="m" items="${map}" varStatus="stat">
<%-- m : (key,value)인 객체 --%>
	${stat.count}:${m.key}=${m.value}<br>
</c:forEach>
<h3>key의 이름으로 Map 객체 출력</h3>
name : ${map.name}<br>
today : ${map.today}<br>
age : ${map.age}<br>
list : ${map.list}<br>
list[0] : ${map.list[0]}<br> <%-- 첨자를 이용하여 출력할 수 있다. --%>
<hr>
<h3>forEach태그를 이용하여 배열 객체 출력하기</h3>
<%
	int arr[] = {10, 20, 30, 40, 50};
	pageContext.setAttribute("arr", arr);
%>
<c:forEach var="a" items="${arr}" varStatus="stat">
	arr[${stat.index}] = ${a}<br>
</c:forEach>

<h3>forEach태그를 이용하여 배열 객체 첨자로 출력하기</h3>
<c:forEach var="i" begin="0" end="4"  varStatus="stat">
	arr[${stat.index}] = ${arr[i]}<br>
</c:forEach>
</body>
</html>