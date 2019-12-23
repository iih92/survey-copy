<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<!-- 헤더 / 푸터 인식용 추가 -->
<script src="resources/jquery-3.4.1.js"></script>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<!--Google Font link-->
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap"
	rel="stylesheet">

<!-- css link -->
<link rel="stylesheet" href="resources/main/css/main.css" />
<!--For Plugins external css-->
<link rel="stylesheet" href="resources/main/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="resources/main/css/style.css">

<style type="text/css">
.search {
	width: 100%;
	margin: 10px;
	border-left: 10px solid gray;
	margin-top: 5%;
	margin-bottom: 2%;
	color: gray;
}

</style>

</head>
<body>
<%@include file="../include/header.jsp" %>	


<c:choose>
	<c:when test="${fn:length(list) == 0}">
		<h2 style="color: gray; text-align: center; margin-top:3%; ">"#${searchHash}" 의 검색 결과가 없습니다!</h2>
	</c:when>
	<c:otherwise>
		<h2 style="color: gray; text-align: center; margin-top:3%; ">"#${searchHash}" 의 검색 결과 입니다!</h2>
	</c:otherwise>
</c:choose>

<hr>


<!-- main-->
<div id="homemain">
	<div class="inner">
		<!-- Boxes -->
		<div class="thumbnails">
		<!-- 검색 결과 시작구역 ---------------------------------------------------------------------------->
			<c:forEach var="dto" items="${ list }">
				<div class="boxmini">
					<a href="boarddetail?num=${dto.num}">
						<!-- mouse over -->
						<div class="over">
							<img src="resources/main/images/coin.png" alt="" />
							<h2 style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">${ dto.point }P</h2>
						</div>
						<!-- icon div -->
						<div class="box_image">
							<img src="resources/main/images/mini_icon1.png" alt="" />
						</div>
						<!-- inner div -->
						<div class="inner">
							<h3>${ dto.title }</h3>
							<p>${dto.hashtag }</p>
							<font> 마감 날짜 : ${ dto.deadline } </font>
						</div>
					</a>
				</div>
			</c:forEach>
		<!--  검색결과 끝 -------------------------------------------------------------------------------->
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>
</body>
</html>