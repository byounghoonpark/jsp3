<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- /jsp3/src/main/webapp/view/member/password.jsp --%>
<%--
<script type="text/javascript">
  alert("${msg}")
  <c:if test="${opener}">
    opener.location.href="${url}"
  </c:if>  
  <c:if test="${!opener}">
    location.href="${url}" //현재페이지를 url값으로 이동
  </c:if>  
  <c:if test="${closer}">
     self.close()
  </c:if>  
</script>
--%>
<script type="text/javascript">
   alert("${msg}")
   if(${opener}) { 
	 opener.location.href = "${url}" 
   } else {
     location.href="${url}"
   }
   if (${closer}) {
	   self.close()
   } 
</script>
