<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>게시글삭제</title></head>
<body>
<hr>
<div class="container">
 <h2 id="center">게시물 삭제</h2>
 <form action="delete" method="post">
	<div class="form-group">
		<input type="hidden"  name="num" value="${param.num}">
		<label >Password:</label>
		<input type="password" class="form-control" name="pass">
	</div>
	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-dark">게시물삭제</button>
	</div>
 </form>
</div>
</body>
</html>