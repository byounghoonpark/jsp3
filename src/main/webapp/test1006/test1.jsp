<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/test1006/test1.jsp --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 파라미터값을 계산하기</title>
</head>
<body>
<form method="post" >
  x:<input type="text" name="x" value=""><br>
  y:<input type="text" name="y" value="">
   <input type="submit" value="더하기"> 
</form>
두수의 합계 :
<h3>if 태그를 이용하여 양수,음수, 0인지 출력하기</h3>
<h3>choose 태그를 이용하여 양수,음수, 0인지 출력하기</h3>
</body>
</html>