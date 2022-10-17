<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="pageContext.request.contextPath" />    
<%-- /jsp3/src/main/webapp/view/board/list.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<!-- table list start -->
	<div class="container">
		<h2  id="center">${boardName}</h2>
	    <p align="right">
	     <c:if test="${boardcount > 0}">글개수:${boardcount}</c:if>	    
	     <c:if test="${boardcount == 0}">등록된 게시물이 없습니다</c:if>	    
	    </p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${boardnum}</td>
 					<c:set var="boardnum" value="${boardnum - 1}"/>
					<td>
					<c:if test="${b.grplevel > 0 }">
					<img src="../image/level.gif" 
					width="${20 * b.grplevel-1 }">
					</c:if>
				 <a href="info?num=${b.num}">${b.subject}</a>
				 </td>
					<td>${b.writer}</td>
					<td>${b.regdate}</td>
				<td><a href="../upload/${b.file1}">${b.file1}</a></td>
					<td>${b.readcnt}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
<%-- 공지사항일 경우 관리자만 게시글 입력 부분 출력 --%>		
<c:if 
  test="${(param.boardid != 1)||(sessionScope.login =='admin') }">
		<p align="right"><a href="writeForm">게시글입력</a></p>
</c:if>	
<%-- 페이징 부분 --%>	
		<div class="container"  >
		<ul class="pagination justify-content-center"  >
   <li class="page-item 
      <c:if test='${startPage <= bottomLine}'>disabled</c:if>">
   <a class="page-link" href="list?pageNum=${startPage-bottomLine}">
   Previous</a></li>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
  <li class="page-item <c:if test='${i==pageInt}'> active </c:if>">
    <a class="page-link" href="list?pageNum=${i}">${i}</a>
  </li></c:forEach>
  <li class="page-item 
     <c:if test='${endPage >= maxPage}'>disabled</c:if>">
 <a class="page-link" href="list?pageNum=${startPage+bottomLine}">
  Next</a></li> 
</ul> </div>
	</div>
	<!-- table list end -->
</body>
</html>