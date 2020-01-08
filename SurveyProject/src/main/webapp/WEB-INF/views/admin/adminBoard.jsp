<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ admin == 0 }">
		<c:redirect url="mainpage"/>
	</c:if>
	<%@include file="../include/header.jsp" %>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>해쉬태그</td>
			<td>생성 날짜</td>
			<td>마감 날짜</td>
			<td>포인트</td>
			<td>조회수</td>
			<td>작성자</td>
		</tr>
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.num }</td>
				<td><a href="boarddetail?num=${ dto.num }">${ dto.title }</a></td>
				<td>${ dto.hashtag }</td>
				<td>${ dto.createDate }</td>
				<td>${ dto.deadline }</td>
				<td>${ dto.point }</td>
				<td>${ dto.hit }</td>
				<td>${ dto.nick }</td>
			</tr>
		</c:forEach>
	</table>
	<%@include file="../include/footer.jsp" %>
</body>
</html>