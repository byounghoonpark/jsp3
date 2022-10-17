<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%-- /jsp3/src/main/webapp/jstl/jstlex.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jstl을 이용한 화면 처리</title>
</head>
<body>
<% //request.setCharacterEncoding("utf-8"); %>
<fmt:requestEncoding value="utf-8"/>
<%-- paramValues.job : job인 파라미터의 값들을 배열로 리턴 
  ${fn:join(배열,',') : 배열의 요소들을 ,로 연결하여 하나의 문자열 리턴 
  jobs : "개발,유지보수"   --%>
<c:set var="jobs" value="${fn:join(paramValues.job,',')}" />
<form method="post" name="f">
 이 름: <input type="text" name="name" value="${param.name }"><br>
 입사일: <input type="text" name="hiredate" 
        value="${param.hiredate }"> : yyyy-MM-dd 형태로 입력하세요<br>
 급여: <input type="text" name="salary"  value="${param.salary}"><br>
 담당업무: <input type="checkbox" name="job" value="서무"
  <c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무
         <input type="checkbox" name="job" value="개발"
  <c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발
         <input type="checkbox" name="job" value="비서"
  <c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서
         <input type="checkbox" name="job" value="유지보수"
  <c:if test="${fn:contains(jobs,'유지보수')}">checked</c:if>>유지보수<br>          
 <input type="submit" value="전송">
<h3>파라미터 값 출력하기</h3>
이름 : ${param.name}<br>
입사일 : ${param.hiredate}<br>          
급여 : ${param.salary}<br>          
담당업무 : ${jobs}<br>     
<h3>입사일을 yyyy년 MM월 dd일 E요일 형태로 출력</h3>
<%-- <fmt:parseDate...> 예외발생 => 발생된 예외객체를 formatexception
                        객체에 저장 --%>
<c:catch var="formatexception">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd"
   var="hiredate"/>
</c:catch>
<%-- ${formatexception == null } : 발생된 예외가 없음 --%>
<c:if test="${formatexception == null }">   
입사일 : 
<fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일"/>   
</c:if>        
<%-- ${formatexception != null } : 발생된 예외가 있음 --%>
<c:if test="${formatexception != null }">
입사일은 YYYY-MM-DD 형태로 입력하세요
</c:if>   
<h3>급여,연봉 세자리마다 ',' 출력, 연봉 : 급여 * 12 </h3>
급여:<fmt:formatNumber value="${param.salary}" pattern="###,###"/><br>
연봉:<fmt:formatNumber value="${param.salary*12}"
        pattern="###,###"/><br>
</form>
</body>
</html>