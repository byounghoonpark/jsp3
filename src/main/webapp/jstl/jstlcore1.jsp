<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/jstl/jstlcore1.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그</title>
</head>
<body>

<h3>속성 관련 태그 : set, remove, out 태그</h3>
<%--
   session.setAttribute("test","Hello JSTL"); 같은 기능
   scope="session" 생략되는 경우 pageContext 객체임
 --%>
<c:set var="test" value="${'Hello JSTL'}" scope="session" />
<%-- session.getAttribute("test") --%>
test 속성 : ${sessionScope.test }<br> 
test 속성 : <c:out value="${test}" /><br>
test 속성 : ${test}<br>
<%-- session.removeAttribute("test"); --%>
<c:remove var="test" />
test 속성 : ${sessionScope.test }<br>
test 속성 : <c:out value="${test}" /><br>
test 속성 : ${test}<br>
</body>
</html>