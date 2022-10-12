<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/id.jsp--%>  

<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script type="text/javascript">
   function idsend(id) {
	   opener.document.f.id.value=id
	   self.close()
   }
</script>
</head>
<body>
<table>
  <tr><th>아이디</th><td>${id }</td></tr>
  <tr><td colspan="2"><input type="button" value="아이디전송" 
      onclick="idsend('${id}')"></td></tr>
</table></body></html>

