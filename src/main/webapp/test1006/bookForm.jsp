<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/test1006/bookForm.jsp
    book.jsp 페이지 작성하기
      - 결과에 맞도록 EL을 이용하여 화면에 출력하기
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<link rel="stylesheet" href="../css/main.css" >
<%
  session.setAttribute("now", new Date());
%>
</head>
<body>
<form action="book.jsp" method="post">
  <table>
     <caption><%= session.getAttribute("now") %></caption>
    <tr><td>작성자</td><td><input type="text" name="writer"></td></tr>
    <tr><td>제목</td><td><input type="text" name="title"></td></tr>
    <tr><td>내용</td><td><textarea rows="5" cols="60" name="content"></textarea>
    </td></tr>
    <tr><td colspan="2">
      <input type="submit" value="방명록조회"></td></tr>
  </table></form></body></html>