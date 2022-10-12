<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/pw.jsp
  1. 파라미터저장
  2. db에서 비밀번호 읽기
      id,email,tel에 맞는 비밀번호를 읽기. 
--%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>비밀번호 찾기</title></head>
<body>
  <table><tr><th>비밀번호</th><td>${pass }</td></tr>
     <tr><td colspan="2"><input type="button" value="닫기"
        onclick="self.close()"></td></tr>
  </table></body></html>