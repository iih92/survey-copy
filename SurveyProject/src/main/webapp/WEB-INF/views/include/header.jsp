<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">
<head>
<script>
   $(document).ready(function() {
        var toggle = true;
      $(".link").click(function() {
         $(".link").css("color", "");
         $(this).css("color", "black");
      });
        $("#makeform").click(function(){
           location.href = "#"; 
        });
        
        $('.search , .searchclose').click(function(){
            if($('.top-search').hasClass('pullDown') || $('.top-search').hasClass('slide-out-up')){
                $('.top-search').toggleClass('pullDown');
                $('.top-search').toggleClass('slide-out-up');
            } else {
                $('.top-search').addClass('pullDown');
            }
            $('.top-search').toggle(); 
        });
        
        $(".searchInput[type=text]").keypress(function(e) { 
            if (e.keyCode == 13){
            location.href = "search?hashtag="+ $(this).val();
            }    
        });

   });
</script>
<link rel="stylesheet" href="resources/include/header.css">
     <div class="headerdiv">       
        <!-- Start Top Search -->
        <div class="top-search" >
            <div class="container">
                <div class="searchGroup">
                    <span class="seacrhIcon"><i class="fa fa-search"></i></span>
                    <input type="text" class="searchInput" placeholder="Search">
                    <span class="searchclose"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->
        
        <div class="container">
            <!-- 돋보기 아이콘 -->
            <!-- Start Header Navigation -->
          <div class="menu">
                <!-- 로고 -->
            <div class="headerlogo">
               <a href="mainpage"><img src="resources/logo/logo-2.png" class="logo" alt=""></a> 
            </div> 

            <!-- navbar menu -->
            <div class="headermenu">
               <ul class="menugroup">
                  <c:choose>
                     <c:when test="${loginUser == null}">
                     <script>
                        alert("로그인 후 사용 가능합니다.");
                        location.href="/survey/";
                     </script>
                     </c:when>
                     <c:otherwise>
                     <div class="middle">
                        <font style="color:#00ebfc">${ loginUser }</font> 님의 포인트
                        <font size="4px" style="color:#ffaa45">${ userPoint }P</font>
                     </div>
                     <li class="link"><a href="mainpage" class="hmenu">Home</a></li>
                     <li class="link"><a href="mypage" class="hmenu">My Page</a></li>
                     <li class="link"><a href="signOut" class="hmenu">Sign Out</a></li>
                     </c:otherwise>
                  </c:choose>
                        <li class="link"><button class="makeform" type="submit" onClick="location.href='board'">설문등록</button></li>
                        <li class="link"><button class="search"><i class="fa fa-search"></i></button></li>
                </ul>
            </div>
         </div>
      </div>
   </div>
</head>