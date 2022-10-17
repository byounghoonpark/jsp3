<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/jstl/jstlfmt2.jsp --%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 태그 예제</title>
</head>
<body>
<h3>parseNumber : Format 된 숫자를 일반적인 숫자로 변경</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
합:${num1}+${num2}=${num1+num2}<br>
<hr>
<h3>20,000 + 10,000 = 30,000 형식으로 출력하기</h3>
<fmt:formatNumber value="${num1}" pattern="##,###" /> +
<fmt:formatNumber value="${num2}" pattern="##,###" /> = 
<fmt:formatNumber value="${num1+num2}" pattern="##,###" /><br>

<fmt:formatNumber value="${num1}" pattern="##,###" var="snum1"/>
<fmt:formatNumber value="${num2}" pattern="##,###" var="snum2"/> 
<fmt:formatNumber value="${num1+num2}" pattern="##,###" var="snum3"/>
${snum1} + ${snum2} = ${snum3 }<br>

<h3>parseDate : Format 된 날짜를 일반적인 날짜 객체로 변경</h3>
<fmt:parseDate value="2022-12-25 12:00:00" 
               pattern="yyyy-MM-dd HH:mm:ss" var="day" />
${day}<br>
<h3>2022-12-25 요일 출력하기</h3>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd E요일"/>
             

</body>
</html>