<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- /jsp3/src/main/webapp/view/member/pwForm.jsp
   pw.jsp 구현 : 파라미터값에 해당하는 비밀번호를 db에서 읽기
                화면에 비밀번호 출력. 

    현재 url 정보 기준으로 경로 설정. 
    http://localhost:8088/jsp3/member/idForm             

    http://localhost:8088/jsp3/css/main.css => 절대경로   
                         /jsp3/css/main.css => 절대경로   
                            ../css/main.css => 상대경로   
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet"    href="../css/main.css">
</head><body><h3>비밀번호찾기</h3>
<form action="pw" method="post">
<table>
 <tr><th>아이디</th><td><input type="text" name="id"></td></tr>
 <tr><th>이메일</th><td><input type="text" name="email"></td></tr>
 <tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
 <tr><td colspan="2"><input type="submit" value="비밀번호찾기"></td></tr>
</table>	
</form></body></html>