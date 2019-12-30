<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/jquery-3.4.1.js"></script>
<script src="resources/MyPage/mypage.js" type="text/javascript"></script>
<script src="resources/MyPage/moment.js"></script>
<link href="resources/MyPage/mypage.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
<div style="text-align:center; width:100%; height:1000px; border:1px solid red;">내 정보 변경 예시</div>
<!-- 내 정보 변경 -->
<div id="test1" style="text-align:left;  ">
   <div class="title">
      <font id="p">내정보 변경</font><br>
      비밀번호와 닉네임을 수정 하실 수 있습니다.
   </div>
   <hr>
   <div class="content">
      <ul>
         <li>아이디</li>
         <input name="id" value="${dto.id }" id="id" style="background-color: #f3f3f3;" readonly="readonly"><br>
         <form action="changenick" method="post">
            <li>변경할 닉네임</li>
            <input type="text" name="nick" id="nickname" autocomplete="off">
            <button type="submit" disabled="true" id="btnNick">수정</button>
            <font id="nick_check" size="2"></font>
         </form>
         <form action="changepw" method="post">
            <input type="hidden" name="nick" value="1">
            <li>변경할 비밀번호</li>
            <input type="password" name="pw" id="pw" autocomplete="off"><br>
            <li>변경할 비밀번호 재입력</li>
            <input type="password" name="pwChk" id="pwChk" autocomplete="off">
            <button type="submit" disabled="true" id="btnPw">수정</button>
            <font id="mesage" size="2"></font>
         </form>
      </ul>
   </div>
</div>

<div id="test2" style="text-align:center;">  

<table  id="pointHistoryTable" class="RegisterSurbey" >
		<tr><th>적립일시</th>   <th>내역</th> <th>포인트</th> </tr>
			<tbody id="pointTbody"> 
 <c:forEach var="dto" items="${pointHistory}" varStatus="status2">
 
   <c:if test="${not doneLoop}">
			<tr> <td>
 		
 		
 			<c:forEach var="dateSecond" items="${dateSecond }" varStatus="status1">
			
			<c:if test="${ status1.count eq status2.count }">
 
				${dateSecond} 
			
			</c:if>
			 
			</c:forEach>
			
		 
		
			</td>         <td>${dto.title}   
			</td>     <td><span style="color:orange;">+</span>${dto.point}</td> </tr>
				<c:if test="${status2.count == 5}">
     <c:set var="doneLoop" value="true"/>
   </c:if>
 </c:if>
 		 
</c:forEach>
	 
	</tbody>
</table>

	 <button class="mypleft"> 왼쪽 </button> 
	 <button class="mypright"> 오른쪽 </button> 
	 

</div>

<!-- 내가 등록한 설문조사 -------------------------------------------------------------------------------->
<div id="test3" style="text-align:center;">
	<input type="hidden" value="${pc.totEndPage}" id="endpage">

	
	<table class="RegisterSurbey">
		<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>

	<c:forEach var="dto" items="${list}">
		<c:if test="${dto.nick eq loginUser}">
			<tr onclick="location.href='boarddetail?num=${dto.num}'">
			<td>${dto.title}</td> <td>${dto.deadline}</td> <td>${dto.hit}</td> <td>${dto.point}</td>
			</tr>	
		</c:if>
	</c:forEach>

	</table>
	
	<!-- 페이징 DIV ---------------------------------------------------------------------------------------->
	<div class="paging">	
		<ul>
		<!-- 이전버튼 -->
		<li><button class="paging_bf" disabled="true">&lt;</button></li>

			<!--mypage 를 계산하여 페이지수 보여주기 -->
			<c:forEach begin="1" end="${pc.totEndPage}" var="cnt">
				<c:choose>
					<c:when test="${1 == cnt}">
						<li><a id="num${cnt}" value="${cnt}" class="focus">${cnt }</a></li>
					</c:when>
					<c:otherwise>
						<li><a id="num${cnt}" value="${cnt}" class="nofocus">${cnt }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
		<!-- 다음 버튼 -->
		<li><button class="paging_af" value=2>&gt;</button></li>
		</ul>
	</div>
	<!-- 페이징 끝 ---------------------------------------------------------------------------------------->
	
</div>
<!----내가 등록한 설문조사 끝----------------------------------------------------------------------------------------->

<!-- 최근 참여한 설문조사 -------------------------------------------------------------------------------------------->
<div id="test4" style="text-align:center;">
<input type="hidden" value="${pc.totEndPage}" id="endpage">

<table class="RegisterSurbey">
	<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>
	
	<c:forEach var="Tdto" items="${Tdto}">
		<tr><td>${Tdto.title}</td> <td>${Tdto.deadline}</td> <td>${Tdto.hit}</td> <td>${Tdto.point}</td> </tr>
	</c:forEach>
</table>
	<!-- 페이징 DIV ---------------------------------------------------------------------------------------->
	<div class="paging">	
		<ul>
		<!-- 이전버튼 -->
		<li><button class="paging_bf" disabled="true">&lt;</button></li>

			<!--mypage 를 계산하여 페이지수 보여주기 -->
			<c:forEach begin="1" end="${pc.totEndPage}" var="cnt">
				<c:choose>
					<c:when test="${1 == cnt}">
						<li><a id="num${cnt}" value="${cnt}" class="focus">${cnt}</a></li>
					</c:when>
					<c:otherwise>
						<li><a id="num${cnt}" value="${cnt}" class="nofocus">${cnt}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
		<!-- 다음 버튼 -->
		<li><button class="paging_af" value=2>&gt;</button></li>
		</ul>
	</div>
	<!-- 페이징 끝 ---------------------------------------------------------------------------------------->
</div>

<div id="test5" style="text-align:center;">테스트5  예시</div>
<div id="test6" style="text-align:center;">
	<form >
		<input type="password" name="pw">
		<input type="button" id="" value="회원 탈퇴하기">	
	</form>
</div>


</body>
</html>