<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp2/src/main/webapp/model1/member/loginForm.jsp --%>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
   function inputcheck(f) {
	   if(f.id.value == '') {
		   alert("아이디를 입력하세요")
		   f.id.focus()
		   return false
	   }
	   if(f.pass.value == '') {
		   alert("비밀번호를 입력하세요")
		   f.pass.focus()
		   return false
	   }
   }
   function win_open(page) {
	   let op = "width=500,height=350,left=50,top=150"
	   open(page+".jsp","",op) //idForm.jsp
	   //open("idForm.jsp","윈도우이름",옵션)
   }
</script>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<form action="login.jsp" method="post" name="f" 
                     onsubmit="return inputcheck(this)">
<table><caption>로그인</caption>
<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
  <input type="submit" value="로그인">
  <input type="button" value="회원가입" 
                         onclick="location.href='joinForm.jsp'">
  <input type="button" value="아이디찾기"  
                                   onclick="win_open('idForm')">
  <input type="button" value="비밀번호찾기" 
                                   onclick="win_open('pwForm')">      
</td></tr></table></form>
</body></html>