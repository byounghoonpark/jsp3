<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
</head>
<body>
<hr>
<div class="container">
<h2 id="center">게시물 상세보기</h2>
<table class="table table-hover">
<tr><th>작성자</th><td style="text-aligh:left;">${b.writer}</td>
<th>등록일</th><td style="text-aligh:left;">${b.regdate}</td></tr>
<tr><th>제목</th><td colspan="3">${b.subject}</td></tr>
<tr><th>내용</th><td colspan="3">${b.content}</td></tr>
<tr><th>파일</th><td colspan="3">${b.file1}</td></tr>
</table>
<div id="center" style="padding:3px;">
<button class="btn btn-dark"
onclick="location.href='replyForm?num=${b.num}'">답변</button>
<button class="btn btn-dark"
onclick="location.href='updateForm?num=${b.num}'">수정</button>
<button class="btn btn-dark"
onclick="location.href='deleteForm?num=${b.num}'">삭제</button>
<button class="btn btn-dark"
onclick="location.href='list'">목록보기</button>
</div>
</body>
</html>