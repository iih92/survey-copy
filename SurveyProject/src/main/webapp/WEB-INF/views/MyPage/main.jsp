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

               <div class="navbarUserInfo">
                  <span class="nbarInfoSpan" id="nbIs1"><b>${ loginUser }</b></span> <span
                     class="nbarInfoSpan" id="nbIs1">님</span>
               </div>

               <div class=navbarPoint>
                  <span class="navbarpointSpan" id="nbps1"> You have <i>${userPoint}</i>
                     Points
                  </span>
               </div>

               <hr id="navbarHr">
               <div class="navbarMenu">
                  <ul>
                     <li id="navM1">내 정보 변경</li>
                     <li id="navM2">포인트 내역 열람</li>
                     <li id="navM3">내 설문조사</li>
                     <li id="navM4">최근 설문조사</li>
                     <li id="navM5">나비게이션 바 메뉴5</li>
                     <li id="navM6">나비게이션 바 메뉴6</li>
                  </ul>
               </div>
            </div>

            <div id=sectionMy>
               <div>여기는 섹션.. ㄴㄴㅇ</div>
            </div>
         </div>
      </div>

      <div class=flex_item>
         <jsp:include page="../include/footer.jsp" flush="true" />
      </div>
   </div>

</body>
</html>