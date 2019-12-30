<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>

<script src="resources/jquery-3.4.1.js"></script>
<script src="resources/MyPage/mypage.js" type="text/javascript"></script>
<link href="resources/MyPage/mypage.css" rel="stylesheet">


<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">
</head>

<body>
   <div class=flex-container>
      <div>
         <%@ include file="../include/header.jsp"%>
      </div>

      <div>
         <div class=wrapperMy>
            <div id=navbarMy>
               <div class=navbarTitle>
                  <span class=nbarTitleSpan id="nbts1"> MY PAGE </span> <span
                     class=nbarTitleSpan id="nbts2"> <i class="fas fa-times"></i>
                  </span>
               </div>
				
				<!-- 나의 정보 칸 -->
				<div style="background-color: #d4d4d4; padding-top: 25px;">
				<!-- 닉네임  -->
               	<div class="navbarUserInfo">
               		<div><img src="resources/MyPage/image/myicon-01.png" id="myicon"></div>
                  <span class="nbarInfoSpan" id="nbIs1" style="font-size: 20px;"><b>${loginUser}</b>님</span> 
               	</div>
				<!-- 포인트 -->
               	<div class=navbarPoint>
                  <span class="navbarpointSpan" id="nbps1"> <font style="color: #242728">SURVEY POINT</font><br>
                  <font style="font-size: 35px; font-weight:bold; color: #01aef0;">${userPoint}P</font>  
                  </span>
               	</div>
               <hr id="navbarHr"> 
               </div>
               
               <!-- 메뉴칸 -->
               <div class="navbarMenu">
                  <ul>
                     <li id="navM1">내 정보 변경</li>
                     <li id="navM2">포인트 내역 열람</li>
                     <li id="navM3">나의 설문조사</li>
                     <li id="navM4">최근 참여한 설문조사</li>
                     <li id="navM5">문의하기</li>
                     <li id="navM6">회원 탈퇴</li>
                  </ul>
               </div>
            </div>

            <div id=sectionMy style="height:1000px;">
				MyPage
            </div>
         </div>
      </div>

      <div class=flex_item>
         <jsp:include page="../include/footer.jsp" flush="true" />
      </div>
   </div>

</body>
</html>