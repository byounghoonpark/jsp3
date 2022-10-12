<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/info.jsp 
	request 객체에 mem 이름의 Member객체를 가지고 호출됨
	
--%>   
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 정보 보기</title>
</head><body>
<table><caption>회원 정보 보기</caption>
<tr><td rowspan="6" width="30%">
	<img src="../picture/${mem.picture}" width="200" height="210"></td>
    <th width="20%">아이디</th><td>${mem.id}</td></tr>
<tr><th>이름</th><td>${mem.name}</td></tr>
<tr><th>성별</th><td>${(mem.gender==1)?"남":"여"}</td></tr>
<tr><th>전화</th><td>${mem.tel}</td></tr>
<tr><th>이메일</th><td>${mem.email}</td></tr>
<tr><td colspan="2">
	<a href="updateForm?id=${mem.id}">[수정]</a>
	<a href="deleteForm?id=${mem.id}">[탈퇴]</a>
</td></tr></table></body></html>
