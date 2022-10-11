<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
이름 : ${param.name} <br>
성별 : ${param.gender == 1?"남":"여"}<br>
수강과목 : ${fn:join(paramValues.subject, ',')} <br>
출생연도 : ${param.year}<br>
나이 : 만${2022 - param.year}<br>
</body>
</html>