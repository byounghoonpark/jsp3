<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2.jsp를 위한 입력 화면</title>
</head>
<body>
<form action="test2.jsp" method="post">
   이름:<input type="text" name="name"><br>
   성별:<input type="radio" name="gender" value="1">남
     <input type="radio" name="gender" value="2">여<br>
   수강과목 : <input type="checkbox" name="subject" value="Java">Java &nbsp;
        <input type="checkbox" name="subject" value="Oracle">Oracle &nbsp;
         <input type="checkbox" name="subject" value="HTML">HTML &nbsp;
         <input type="checkbox" name="subject" value="CSS">CSS &nbsp;
         <input type="checkbox" name="subject" value="JavaScript">JavaScript<br>
 출생연도 : <select name="year">
<c:forEach var="i" begin="1980" end="1999" >
     <option>${i}</option>
</c:forEach></select><br>
  <input type="submit" value="전송"></form>
</body>
</html>