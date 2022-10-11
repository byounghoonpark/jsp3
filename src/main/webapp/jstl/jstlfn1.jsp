<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/jstl/jstlfn1.jsp --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl의 EL 함수</title>
</head>
<body>
<c:set var="str1" value="Functions <태그>를 사용하지 않습니다.   "/>
<c:set var="str2" value="사용"/>
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
length(str1)=${fn:length(str1)}:str1 문자열의 길이<br>
toUpperCase(str1)=${fn:toUpperCase(str1)} : str1을 대문자로 변경<br>
toLowerCase(str1)=${fn:toLowerCase(str1)} : str1을 소문자로 변경<br>
substring(str1,3,6)=${fn:substring(str1,3,6)} : str1 문자열에서 3번인덱스부터 5번인덱스까지 리턴<br>
substringAfter(str1,str2)=${fn:substringAfter(str1,str2)} : str1에서 str2 이후부분<br>
substringBefore(str1,str2)=${fn:substringBefore(str1,str2)} : str1에서 str2 이전부분<br>
contains(str1,str2)=${fn:contains(str1,str2)} : str1 내부에 str2 존재?<br>
trim(str1)=${fn:trim(str1)} : str1에서 양쪽 공백 제거. 안쪽 공백이 아닌 바깥쪽 양쪽공백만 제거<br>
replace(str1," ","-")=${fn:replace(str1," ","-")} : str1에서 공백을 -으로 변경<br>
split(tokens,',') : tokens값을 ,를 기준으로 분리해서 배열로 리턴<br>
<c:set var="arr" value="${fn:split(tokens,',')}" />
<c:forEach var="i" items="${arr}">${i}&nbsp;</c:forEach><br>
join(arr,"-")${fn:join(arr,"-")} : arr배열의 요소를 -으로 연결하여 하나의 문자열로 리턴 <br>
</body>
</html>