<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
$(document).ready(function(){
	$("#recentLineup").click(function(){
		var form = document.createElement("form"); 
		form.setAttribute("charset", "UTF-8");
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'lineupMain');
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lineup');
		hiddenField.setAttribute('value', '1');
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	    }); 
	$("#deadLineup").click(function(){
		$.post("lineupMain", {
			lineup : "2"
		},function(data){
			location.href="mainpage";
            }); 
	    }); 
	$("#hitLineup").click(function(){
		$.post("lineupMain", {
			lineup : "3"
		},function(data){
			location.href="mainpage";
            }); 
	    }); 
	});

</script>

<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<style type="text/css">
	#hitLineup, #deadLineup, #recentLineup {
		cursor: pointer;
	}
	
	
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
				<c:forEach var="dto" items="${ bestSurvey }">
					<div class="box">
						<a href="boarddetail?num=${dto.num }"><!-- mouse over -->
							<div class="over">
								<img src="resources/main/images/coin.png" alt="" />
								<h1 style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">${ dto.point }P</h1>
								<c:set var="tag" value="${dto.hashtag}" />
								<c:set var="#" value="#"/>									
								<c:set var="tagArr" value="${fn:split(tag,'#')}"></c:set>
								<div class="hashDiv">
								<c:forEach var="val" items="${tagArr}" varStatus="status">
									<a href="search?hashtag=${val}" class="hashtagLink">#${val}</a>
									<c:if test="${(status.count mod 4) == 0}"> <br> </c:if>
								</c:forEach>
								</div>
							</div>
							
							<!-- icon div -->
							<div class="box_image">
								<img src="${dto.boardIcon}" style="width: 150px; height:  150px;" />
							</div> <!-- inner div -->
							<div class="inner">
								<h3>${ dto.title }</h3>
								<p>${ dto.hashtag }</p>
								<font> 마감 날짜 : ${ dto.deadline } </font>
							</div>
						</a>
					</div>
				</c:forEach> 

				<div>
					<hr class="main" width="1920px" , size="4" , color="#9e9e9e">
				</div>

				<!-- new box mini 시작구역 ---------------------------------------------------------------------------->
				<div class="new">
					<h3>&nbsp;&nbsp;NEW SURVEY
						
						<!-- 정렬 구간 -->
						<span id="lineUp" class="lineUp" style="font-weight:normal; font-size:10pt; float:right;">
							<span id="recentLineup"
									<c:if test="${ lineupSession == '1' }"> style="color:#ff8b02" </c:if>
							>최신순</span>
							
							<span style="color:#ff8b02;">|</span> 

							<span id="deadLineup"
								<c:if test="${ lineupSession == '2' }">style="color:#ff8b02" </c:if> 
							>마감순</span>
							
							<span style="color:#ff8b02;">|</span> 
							
							<span id="hitLineup"
								<c:if test="${ lineupSession == '3' }">style="color:#ff8b02" </c:if>
							>조회순</span>  
						</span>
						
					</h3>			
				</div>
 				
 				<!-- box 구간 -->
				<c:forEach var="dto" items="${ list }">
					<div class="boxmini">
						<a href="boarddetail?num=${dto.num }">
						
							<!-- mouse over -->
							<div class="over">
								<img src="resources/main/images/coin.png" alt="" />
								<h2 style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">${ dto.point }P</h2>
									<c:set var="tag" value="${dto.hashtag}" />
									<c:set var="#" value="#"/>									
									<c:set var="tagArr" value="${fn:split(tag,'#')}"></c:set>
									<c:forEach var="val" items="${tagArr}" varStatus="status">
										<a href="search?hashtag=${val}" class="hashtagLink">#${val}</a>
										<c:if test="${(status.count mod 4) == 0}"> <br> </c:if>
									</c:forEach>
							</div>
							
							<!-- icon div -->
							<div class="box_image">
								<img src="${dto.boardIcon}" style="width: 150px; height:  150px;" />
							</div>
							<!-- inner div -->
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