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
			<td>아이디</td>
			<td>닉네임</td>
			<td>포인트</td>
			<td>admin 권한</td>
		</tr>
		<c:forEach var="dto" items="${ userList }">
			<tr>
				<form action="adminModify">
					<input type="hidden" name="nick" value="${ dto.nick }">
					<td>${ dto.id }</td>
					<td>${ dto.nick }</td>
					<td><input type="text" name="point" value="${ dto.point }"></td>
					<c:choose>
						<c:when test="${ dto.admin == 0 }">
							<td>없음</td>
						</c:when>
						<c:otherwise>
							<td>있음</td>
						</c:otherwise>
					</c:choose>
					<td><input type="submit" value="수정"></td>
					<td><input type="button" onclick="location.href='adminLeave?nick=${ dto.nick }'" value="탈퇴"></td>
				</form>
			</tr>
		</c:forEach>
	</table>
	<%@include file="../include/footer.jsp" %>
</body>
</html>