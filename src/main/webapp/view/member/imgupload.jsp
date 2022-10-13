<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jsp3/src/main/webapp/view/member/imgupload.jsp --%>   
<script>
// opener id속성값이 pic인 태그 => <img 태그... >  
   img = opener.document.getElementById("pic");
   img.src = "../picture/${filename}"; //opener화면의 img태그에 src 설정
//opener form 태그의 picture 파라미터에 파일이름 설정
   opener.document.f.picture.value="${filename}";
   self.close(); //현재 창 (팝업창) close()
</script>