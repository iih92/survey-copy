<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/jquery-3.4.1.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="resources/board/main.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">

<script src="resources/board/board.js"></script>

<meta charset="UTF-8">
<title>설문조사 만들기</title>
</head>

<body>
	<%@include file="../include/header.jsp" %>
	<!-- 옆에 버튼 만들어주는 div start -->
	<div class="container">
		<div class="row" >
			<div id="inbox">
				<div class="fab btn-group show-on-hover dropup" id="remote">
					<div data-toggle="tooltip" data-placement="left" title="Compose"
						style="margin-left: 42px;">
						<button type="button"
							class="btn btn-danger btn-io dropdown-toggle"
							data-toggle="dropdown" >
							<span class="fa-stack fa-2x"> <i
								class="fa fa-circle fa-stack-2x fab-backdrop"></i> 
								<i class="fa fa-plus fa-stack-1x fa-inverse fab-primary"></i> 
								<i class="fa fa-pencil fa-stack-1x fa-inverse fab-secondary" ></i>
							</span>
						</button>
					</div>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li><button type="button" id="radio" data-toggle="tooltip"
								data-placement="left" title="radio">
								<i class="far fa-dot-circle"></i>
							</button></li>
						<li><button type="button" id="text" data-toggle="tooltip"
								data-placement="left" title="text">
								<i class="fa fa-comments-o"></i>
							</button></li>
						<li><button type="button" id="check" data-toggle="tooltip"
								data-placement="left" title="checkbox">
								<i class="fas fa-check-square" style="font-size: 17px"></i>
							</button></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 옆에 버튼 만들어주는 div end -->
		
		<!-- 설문조사 폼 만들기 div start -->
		<form id="surveyForm" action="surveySave" method="post">
			<div id="form" class="main">

				<!--제목-->
				<div class="title">
					<!-- 아이콘 -->
					<img src="resources/board/images/mini_icon1.png" id="boder_icon"><br>
					<input type="button" id="icon_Change" value="이미지 변경">
				
					<input type="hidden" value="resources/board/images/mini_icon1.png" name="boardIcon" id="board_icon_input">
					
					<!-- 아이콘 수정 -->
				    <div id="border_icon_Change">
				    	<img src="resources/board/images/mini_icon1.png" style="margin: 3%; width: 25%;" id="board_icon01">
					    <img src="resources/board/images/mini_icon2.png" style="margin: 3%; width: 25%;" id="board_icon02">
					    <img src="resources/board/images/mini_icon3.png" style="margin: 3%; width: 25%;" id="board_icon03">
					    <img src="resources/board/images/mini_icon4.png" style="margin: 3%; width: 25%;" id="board_icon04">
					    <img src="resources/board/images/mini_icon5.png" style="margin: 3%; width: 25%;" id="board_icon05">
					    <img src="resources/board/images/mini_icon6.png" style="margin: 3%; width: 25%;" id="board_icon06">				    
				    </div>

					<input type="hidden" value="${loginUser}" name="nick">
            		<input type="text" class="title_input" placeholder="나만의 설문 만들기" name="title">
            		<input type="text"  name="hashtag" class="hash_input" id="hash" placeholder="#해시태그">
            		
            		<div class="dedline">마감날짜 : <input id="deadline" type="date" name="deadline"></div> 
            		   
            		<input type="hidden" value="${userPoint}" id="userPoint">   
            		<div class="point">포인트 : <SELECT  id="point" name="point" size=1>
										        <OPTION VALUE=1>100</OPTION> <OPTION VALUE=2>200</OPTION>
										        <OPTION VALUE=3>300</OPTION> <OPTION VALUE=4>400</OPTION>
										        <OPTION VALUE=5>500</OPTION> <OPTION VALUE=6>600</OPTION>
										        <OPTION VALUE=7>700</OPTION> <OPTION VALUE=8>800</OPTION>
										        <OPTION VALUE=9>900</OPTION> <OPTION VALUE=10>1000</OPTION>
										        </SELECT>
						<h4 id="h4" style="color: red;"></h4>
						
					</div>    
        		</div>
			</div>
			<input type="button" id="save" value="설문등록">
		</form>
		<!-- 설문조사 폼 만들기 div end -->
	</div>
	
	<%@include file="../include/footer.jsp" %>
</body>
</html>