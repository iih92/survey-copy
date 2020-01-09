<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ admin == 0 }">
		<c:redirect url="mainpage"/>
	</c:if>
	<%@include file="../include/header.jsp" %>
	<a href="adminUser">유저 정보 보기</a>
	
	<a href="adminBoard">게시글 모두 보기</a>
	<%@include file="../include/footer.jsp" %>
</body>
</html>