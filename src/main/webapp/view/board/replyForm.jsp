<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--/jsp3/src/main/webapp/view/board/replyForm.jsp --%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>답변쓰기</title>
</head>
<body>
<hr>
	<div class="container">
		<form name="f" action="reply" method="post">
			<input type="hidden" name="num" value="${board.num }"> <%--원글번호 --%>
			<input type="hidden" name="boardid" value="${board.boardid }"> 
			<input type="hidden" name="grp" value="${board.grp }"> 
			<input type="hidden" name="grplevel" value="${board.grplevel }">
			<input type="hidden" name="grpstep" value="${board.grpstep }">
			<h2 id="center">게시판 답글</h2>
			<div class="form-group">
				<label>작성자:</label>
				<input type="text" class="form-control" name="writer">
				<label>비밀번호:</label>
				<input type="password" class="form-control" name="pass">
				<label>제목:</label>
				<input type="text" class="form-control" name="subject"
				value="re:${board.subject }"><%-- 답글 --%>
						
	</div>
	<div class="form-group">
	<label>내용:</label>
	<textarea class="form-control" rows="10" cols="50"
	name="content"></textarea>
	</div>
	<div id="center" style="padding:3px;">
	<button type="submit" class="btn btn-dark">입 력</button>
	</div>
</form>
</div>
</body>
</html>