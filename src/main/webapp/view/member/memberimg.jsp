<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/memberimg.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원사진등록</title>
</head>
<body>
<h3>사진 업로드</h3>
<%--
  enctype="multipart/form-data" : 파일 업로드시 필수 설정 부분
                => 파일 업로드시 선택된 파일의 내용도 서버로 전송하도록 설정
                => type="file" 인 input 태그가 존재하면 설정해야함
                => form 태그의 method="post" 여야함. 
   imgupload 페이지는 file의 내용을 가지고 호출됨.
      => request 객체로 파라미터값,파일의 내용을 구분할수 없음.
      => cos.jar 파일에 설정된 MultipartRequest 객체를 사용해야함
                                
 --%>
<form action="imgupload" method="post" 
                             enctype="multipart/form-data">
 <input type="file" name="picture" id="imageFile" accept="img/*">
 <input type="submit" value="사진등록"> 
</form><br>
<img id="preview" src="">
</body>
</html>