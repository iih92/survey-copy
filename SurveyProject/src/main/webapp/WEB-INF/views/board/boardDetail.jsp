<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.4.1.js"></script>
<script src="resources/board/boardDetail.js" ></script>
</head>
<body>
	<fmt:formatDate var="deadline" value="${ dto.deadline }" pattern="yyyy-MM-dd"/>
	<input type="hidden" id="code" value="${code}">   
	<h1>${ dto.title }</h1>
	<h1>${ dto.hashtag }</h1>
	<h1>${ deadline }</h1>
	<div id="question">
	</div>
	<div><button type="button" onclick="location.href='boardmodify?num=${dto.num}'">수정</button></div>
</body>
</html>