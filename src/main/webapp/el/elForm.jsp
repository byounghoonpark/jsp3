<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--/jsp3/src/main/webapp/el/elForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   session.setAttribute("test","session test 속성");
   session.setAttribute("today",new Date());
%>
<form action="elex1.jsp" method="post">
이름 : <input type="text" name="name" value="홍길동">
<input type="submit" value="전송">
</form>
</body>
</html>