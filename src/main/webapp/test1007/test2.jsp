<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testForm2.jsp 결과</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
이름:${param.name}<br>
성별:${param.gender == 1?"남":"여" }<br>
수강과목 : ${fn:join(paramValues.subject,',')}<br>
출생년도:${param.year}<br>
나이:만${2022 - param.year}<br>
</body>
</html>