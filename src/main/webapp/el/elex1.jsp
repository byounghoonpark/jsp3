<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/el/elex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e1Form.jsp의 결과 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String tel = "010-1111-2222";
	pageContext.setAttribute("test", "pageContext객체의 test 속성");
	//el은 변수값을 표현할 수 없기 때문에 무조건 속성에 등록되어야한다. 
	pageContext.setAttribute("tel", tel);
%>
<h3>JSP 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageContext test 속성값 : <%=pageContext.getAttribute("test") %><br>
session test 속성값 : <%=session.getAttribute("test") %><br>
today 속성값 : <%=session.getAttribute("today") %><br>
name 파라미터값 : <%=request.getParameter("name") %><br>
tel 변수값 : <%=tel %><br>
없는 속성값 : <%=pageContext.getAttribute("noAttr") %><br>
없는 파라미더값 : <%=request.getAttribute("noParam") %><br>
<hr>
<h3>JSP의 EL 이용하여 파라미터와 속성값 출력</h3>
<%-- pageScope : pageContext 객체의 속성객체 --%>
pageContext test 속성값 : ${pageScope.test}<br>
<%-- sessionScope : session 객체의 속성객체 --%>
session test 속성값 : ${sessionScope.test}<br>
today 속성값 : ${sessionScope.today}<br>
today 속성값 : ${today}<br>
<%-- param : 파라미터 객체. param.파라미터명 --%>
name 파라미터값 : ${param.name}<br>
tel 변수값 : EL로는 표현 불가<br> 
tel 속성값 : ${tel}<br> 
test 속성값 : ${test}<br>
<%-- 값이 없으면 null로 표시되는것이 아닌 빈문자열로 표시된다. --%>
없는 속성값 : ${pageScope.noAttr}<br>
없는 속성값 : ${noAttr}<br>
없는 파라미더값 : ${param.noParam}<br>
<%--
	${tel} : 영역담당 객체에 저장된 속성 중 이름이 tel인 속성의 값을 출력
	${test} : 영역담당 객체에 저장된 속성 중 이름이 test인 속성의 값을 출력
	  - 1. pageContext에 등록된 속성 중 test인 속성의 값을 출력
	  - 2. 1번이 없는 경우 request에 등록된 속성 중 test인 속성의 값을 출력
	  - 3. 1번,2번이 없는 경우 session에 등록된 속성 중 test인 속성의 값을 출력
	  - 4. 1번,2번,3번이 없는 경우 application에 등록된 속성 중 test인 속성의 값을 출력
	  - 5. 모든 영역 객체에 test라는 속성이 없는 경우 빈문자열 출력. null 아님
	  
	영역 담당 객체의 속성 정보를 저장하는 EL의 기본 객체
		pageScope : pageContext 객체에 등록된 속성 목록. ${pageScope.속성명}
		requestScope : request 객체에 등록된 속성 목록. ${requestScope.속성명}	
		sessionScope : session 객체에 등록된 속성 목록. ${sessionScope.속성명}	
		applicationScope : application 객체에 등록된 속성 목록. ${applicationScope.속성명}	
 --%>
</body>
</html>