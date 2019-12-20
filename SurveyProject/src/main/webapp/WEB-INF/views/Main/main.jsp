<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome!</title>

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

<!-- 헤더 / 푸터 인식용 추가 -->
<script src="resources/jquery-3.4.1.js"></script>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<style type="text/css">
</style>


</head>

<body>
	<%@include file="../include/header.jsp"%>

	<!-- main-->
	<div id="homemain">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails">

				<!-- best box 시작구역 ------------------------------------------------------------------------------------>
				<!-- best Survey -->
				<div class="best">
					<h3>&nbsp;&nbsp;BEST SURVEY</h3>
				</div>

				<!-- box(1) -->
				<div class="box">
					<a href="#"> <!-- mouse over -->
						<div class="over">
							<img src="resources/main/images/coin.png" alt="" />
							<h1
								style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">500P</h1>
						</div> <!-- icon div -->
						<div class="box_image">
							<img src="resources/main/images/icon-1.jpg" alt="" />
						</div> <!-- inner div -->
						<div class="inner">
							<h3>자바 수업 평가 설문조사</h3>

							<p>#자바 #수업 #설문조사 #개발자 #스프링 #체크 #컴공과 #한국대학교</p>
							<font> 마감 날짜 : 2019.12.03 </font>
						</div>
					</a>
				</div>
				<!-- box(1) end -->

				<!-- box(2) -->
				<div class="box">
					<a href="#"> <!-- mouse over -->
						<div class="over">
							<img src="resources/main/images/coin.png" alt="" />
							<h1
								style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">500P</h1>
						</div> <!-- icon div -->
						<div class="box_image">
							<img src="resources/main/images/icon-1.jpg" alt="" />
						</div> <!-- inner div -->
						<div class="inner">
							<h3>자바 수업 평가 설문조사</h3>

							<p>#자바 #수업 #설문조사 #개발자 #스프링 #체크 #컴공과 #한국대학교</p>
							<font> 마감 날짜 : 2019.12.03 </font>
						</div>
					</a>
				</div>
				<!-- box(2) end -->

				<!-- box(3) -->
				<div class="box">
					<a href="#"> <!-- mouse over -->
						<div class="over">
							<img src="resources/main/images/coin.png" alt="" />
							<h1
								style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">500P</h1>
						</div> <!-- icon div -->
						<div class="box_image">
							<img src="resources/main/images/icon-1.jpg" alt="" />
						</div> <!-- inner div -->
						<div class="inner">
							<h3>자바 수업 평가 설문조사</h3>

							<p>#자바 #수업 #설문조사 #개발자 #스프링 #체크 #컴공과 #한국대학교</p>
							<font> 마감 날짜 : 2019.12.03 </font>
						</div>
					</a>
				</div>
				<!-- box(3) end -->

				<div>
					<hr class="main" width="1920px" , size="4" , color="#9e9e9e">
				</div>

				<!-- new box mini 시작구역 ---------------------------------------------------------------------------->
				<div class="new">
					<h3>&nbsp;&nbsp;NEW SURVEY</h3>
				</div>

				<c:forEach var="dto" items="${ list }">
					<div class="boxmini">
						<a href="boarddetail?num=${dto.num }"> <!-- mouse over -->
							<div class="over">
								<img src="resources/main/images/coin.png" alt="" />
								<h2
									style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">${ dto.point }P</h2>
							</div> <!-- icon div -->
							<div class="box_image">
								<img src="resources/main/images/mini_icon1.png" alt="" />
							</div> <!-- inner div -->
							<div class="inner">
								<h3>${ dto.title }</h3>
								<p>${ dto.hashtag }</p>
								<font> 마감 날짜 : ${ dto.deadline } </font>
							</div>
						</a>
					</div>
				</c:forEach>
				<!--  boxmini end-------------------------------------------------------------------------------->

			</div>
			<!-- thumbnails end -->


			<!-- 페이징 DIV ---------------------------------------------------------------------------------------->
			<div class="paging">
				<!-- param.start 값 지정 -->
				<c:choose>
					<c:when test="${param.start == null }">
						<c:set var="start" value="1" scope="session" />
					</c:when>
					<c:otherwise>
						<c:set var="start" value="${param.start}" scope="session" />
					</c:otherwise>
				</c:choose>

				<ul>
					<!-- 이전버튼 -->
					<c:choose>
						<c:when test="${start > 1 }">
							<li><button class="paging_bf"
									onclick="location.href='mainpage?start=${start-1}'">&lt;</button></li>
						</c:when>
						<c:otherwise>
							<li><button class="paging_bf" disabled="disabled">&lt;</button></li>
						</c:otherwise>
					</c:choose>


					<!-- 전체 글수 를 계산하여 페이지수 보여주기 -->
					<c:forEach begin="1" end="${pc.totEndPage }" var="cnt">
						<c:choose>
							<c:when test="${start == cnt}">
								<li><a href="mainpage?start=${cnt}" class="focus">${cnt }</a></li>
							</c:when>

							<c:otherwise>
								<li><a href="mainpage?start=${cnt}" class="nofocus">${cnt }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>


					<!-- 다음 버튼 -->
					<c:choose>
						<c:when test="${start < pc.totEndPage }">
							<li><button class="paging_af"
									onclick="location.href='mainpage?start=${start+1}'">&gt;</button></li>
						</c:when>

						<c:otherwise>
							<li><button class="paging_af" disabled="disabled">&gt;</button></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<!-- 페이징 끝 ----------------------------------------------------------------------------------------------->


		</div>
		<!-- inner end -->
	</div>
	<!-- main end -->



	<%@include file="../include/footer.jsp"%>

</body>