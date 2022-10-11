<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/join.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
<%-- ${mem.id} : mem 객체의 get프로퍼티의 이름 
	 ${객체이름.프로퍼티명}
--%>
  <tr><td>아이디</td><td>${mem.id}</td></tr>
  <tr><td>이름</td><td>${mem.name}</td></tr>
  <tr><td>성별</td><td>${(mem.gender==1)?"남":"여"}</td></tr>
  <tr><td>전화번호</td><td>${mem.tel}</td></tr>
  <tr><td>이메일</td><td>${mem.email}</td></tr>
</table>
<input type="button" value="로그인하기" 
	   onclick="location.href='loginForm'">
</body>
</html>