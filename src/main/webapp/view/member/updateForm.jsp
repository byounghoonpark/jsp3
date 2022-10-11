<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jsp3/src/main/webapp/view/member/updateForm.jsp  
request 객체에 mem 이름의 Member객체가 전달--%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
  function win_passchg() {
	  let op = "width=500,height=250,left=50,top=150"
	  open("passwordForm.jsp","",op)
  }
  function win_upload() {
	   let op = "width=300,height=300,left=50,top=150"
	   open("memberimg.jsp","",op)
  }
</script>
</head>
<body>
<form action="update" name="f" method="post" 
       onsubmit="return inputcheck(this)">
<input type="hidden" name="picture" value="${ mem.Picture}">
<table><caption>회원 정보 수정</caption>
<tr><td rowspan="4" valign="bottom">
  <img src="picture/"${ mem.Picture}" 
                         width="100" height="120" id="pic"><br>
  <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
</td><th>아이디</th>
 <td><input type="text" name="id" readonly value="${ mem.Id}">
 </td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass" ></td></tr>
<tr><th>이름</th>
<td><input type="text" name="name" value="${ mem.Name}"></td></tr>
<tr><th>성별</th>
   <td><input type="radio" name="gender" value="1" 
     ${(mem.Gender==1)?"checked":""}>남
      <input type="radio" name="gender" value="2"
    ${(mem.Gender==2)?"checked":""}>여</td></tr>
<tr><th>전화번호</th>
<td colspan="2"><input type="text" name="tel"  
    value="${ mem.Tel}"></td></tr>
<tr><th>이메일</th><td colspan="2">
<input type="text" name="email"  value="${mem.Email}"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원수정">
<%--!login.equals("admin") : 관리자가 아닌 경우  
    id.equals("admin") : 관리자 관리자 정보 수정 --%>
<c:if test="${sessionScope.login == param.id}">
<input type="button" value="비밀번호수정" onclick="win_passchg()">
</c:if>
</td></tr>
</table></form></body></html>
