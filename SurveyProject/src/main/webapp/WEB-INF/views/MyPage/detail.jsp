<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/jquery-3.4.1.js"></script>
<script src="resources/MyPage/mypage.js" type="text/javascript"></script>
<link href="resources/MyPage/mypage.css" rel="stylesheet">

<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
<div style="text-align:center; width:100%; height:1000px; border:1px solid red;">내 정보 변경 예시</div>
<!-- 내 정보 변경 -->
<div id="test1" style="text-align:left; height:1000px;  ">
	<div class="title">
		<font id="p">내정보 변경</font><br>
		비밀번호와 닉네임을 수정 하실 수 있습니다.
	</div>
	<hr>
	<div class="content">
		<ul>
			<li>아이디</li>
			<input name="id" value="${dto.id }" id="id" style="background-color: #f3f3f3;" readonly="readonly"><br>
			<form action="changenick">
				<li>변경할 닉네임</li>
				<input type="text" name="nick" id="nickname" autocomplete="off">
				<button type="submit" id="btnNick">수정</button>
			</form>
			<form action="changepw" method="post">
				<input type="hidden" name="nick" value="1">
				<li>변경할 비밀번호</li>
				<input type="password" name="pw" id="pw" autocomplete="off"><br>
				<li>변경할 비밀번호 재입력</li>
				<input type="password" name="pwChk" id="pwChk">
				<button type="submit" disabled="true" id="btnPw">수정</button>
				<font id="mesage" size="2"></font>
			</form>
		</ul>
	</div>
</div>

<div id="test2" style="text-align:center;  	height:100%;">테스트2  예시</div>

<!-- 내가 등록한 설문조사 -------------------------------------------------------------------------------->
<div id="test3" style="text-align:center;   height:500px;">
	
	<table class="RegisterSurbey">
		<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>

	<c:forEach var="dto" items="${list}">
		<c:if test="${dto.nick eq loginUser}">
			<tr onclick="location.href='result?num=${dto.num}'">
			<td>${dto.title}</td> <td>${dto.deadline}</td> <td>${dto.hit}</td> <td>${dto.point}</td>
			</tr>	
		</c:if>
	</c:forEach>
	</table>
	
	<!-- 페이징 DIV ---------------------------------------------------------------------------------------->
	<div class="paging">
		<!-- param.start 값 지정 -->
		<c:choose>
			<c:when test="${param.start == null }">
				<c:set var="start" value="1" scope="session" />
			</c:when>
			<c:otherwise>
				<c:set var="start" value="${param.start}" scope="session" />
			</c:otherwise>		</c:choose>
		<ul>
		<!-- 이전버튼 -->
			<c:choose>
				<c:when test="${start > 1 }">
					<li><button class="paging_bf" onclick="location.href='mypage?start=${start-1}'">&lt;</button></li>
				</c:when>
				<c:otherwise>
					<li><button class="paging_bf" disabled="disabled">&lt;</button></li>
				</c:otherwise>
			</c:choose>
			
			<!--mypage 를 계산하여 페이지수 보여주기 -->
			<c:forEach begin="1" end="${pc.totEndPage}" var="cnt">
				<c:choose>
					<c:when test="${start == cnt}">
						<li><a href="mypage?start=${cnt}" class="focus">${cnt }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mypage?start=${cnt}" class="nofocus">${cnt }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${start < pc.totEndPage }">
					<li><button class="paging_af" onclick="location.href='mypage?start=${start+1}'">&gt;</button></li>
				</c:when>
				<c:otherwise>
					<li><button class="paging_af" disabled="disabled">&gt;</button></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- 페이징 끝 ---------------------------------------------------------------------------------------->

</div>
<!----내가 등록한 설문조사 끝----------------------------------------------------------------------------------------->


<!-- 최근 참여한 설문조사 -------------------------------------------------------------------------------------------->
<div id="test4" style="text-align:center;   height:500px;">

<div class="RegisterSurbey">
<hr>	
	<nav class="Registernav" >
	<ul class="Registernav" > <li>설문조사 제목</li> <li>마감날짜</li> <li>조회수</li> <li>포인트</li> </ul>
	</nav>
	
	<c:forEach var="Tdto" items="${Tdto}">
		<div class="box">
		<nav class="Registernav" >
		<ul> <li>${Tdto.title}</li> <li>${Tdto.deadline}</li> <li>${Tdto.hit}</li> <li>${Tdto.point}</li> </ul>
		</nav>
		</div>
	</c:forEach>
</div>

</div>
<!-- 최근 참여한 설문조사 끝------------------------------------------------------------------------------------------>




<div id="test5" style="text-align:center;   height:500px;">테스트5  예시</div>
<div id="test6" style="text-align:center;   height:500px;">테스트6  예시</div>

</body>
</html>