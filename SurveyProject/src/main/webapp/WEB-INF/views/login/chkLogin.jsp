<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
      <c:when test="${ rs == '1' }">
         <script> 
            location.href = "mainpage";
         </script>
      </c:when>
      <c:when test="${ rs == '2' }">
         <script>
            alert("비밀번호가 틀렸습니다.");
            location.href = "/survey/";
         </script>
      </c:when>
      <c:otherwise>
         <script>
            alert("존재하지 않는 아이디 입니다.");
            location.href = "/survey/";
         </script>
      </c:otherwise>
   </c:choose>

</body>
</html>