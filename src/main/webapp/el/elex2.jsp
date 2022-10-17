<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/el/elex2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 연산자 사용</title>
</head>
<body>
<h3>\${5+7}=${5+7 }</h3>
<h3>\${8-2}=${8-2 }</h3>
<h3>\${8/3}=${8/3 }</h3>
<%-- <h3>\${8 div 3}=${8 div 3 }</h3>--%>
<h3>\${8*3}=${8*3 }</h3>
<h3>\${8%3}=${8%3 }</h3>
<h3>\${8 mod 3}=${8 mod 3 }</h3>
<h3>\${8 == 3}=${8 == 3 }</h3>
<h3>\${8 eq 3}=${8 eq 3 }</h3>
<h3>\${8 > 3}=${8 > 3 }</h3>
<h3>\${8 gt 3}=${8 gt 3 }</h3>
<h3>\${"EL의 상수표현"}=${"EL의 상수표현"}</h3>

</body>
</html>