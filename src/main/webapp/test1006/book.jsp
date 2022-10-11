<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 내용 보기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<%   request.setCharacterEncoding("utf-8");  %>
<body>
<table><caption>방명록 조회</caption>
<tr><td>작성자</td><td>${param.writer },
                     <%= request.getParameter("writer") %></td></tr>
<tr><td>제목</td><td>${param.title }</td></tr>
<tr><td>내용</td><td>${param.content }</td></tr>
<tr><td>등록일</td><td>${sessionScope.now }<%-- now : 파라미터값이 아니고, 속성값 --%></td></tr>
</table>
</body>
</html>
