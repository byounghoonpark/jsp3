<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/imgupload.jsp--%>    
<script>
  //opener 윈도우의 id="pic"인 태그 선택 
  img = opener.document.getElementById("pic")
  img.src="../picture/${filename}"
  //파라미터에 파일이름 설정 => db에 저장
  opener.document.f.picture.value="${filename}" 
  self.close()
</script>