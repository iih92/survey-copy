<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome!</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="resources/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		$(".link").click(function() {
			$(".link").css("color", "");
			$(this).css("color", "#01aef0");
		});
	});
</script>
<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap"
	rel="stylesheet">

<!-- css link -->
<link rel="stylesheet" href="resources/home/css/slick.css">
<link rel="stylesheet" href="resources/home/css/slick-theme.css">
<link rel="stylesheet" href="resources/home/css/animate.css">
<link rel="stylesheet" href="resources/home/css/iconfont.css">
<link rel="stylesheet" href="resources/home/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/home/css/bootstrap.css">
<link rel="stylesheet" href="resources/home/css/magnific-popup.css">
<link rel="stylesheet" href="resources/home/css/bootsnav.css">
<!--another template's css-->
<link rel="stylesheet" href="resources/home/css/main.css" />
<!--For Plugins external css-->
<link rel="stylesheet" href="resources/home/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="resources/home/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/home/css/responsive.css" />
<script
	src="resources/home/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>

<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">
<c:if test="${loginUser != null}">
   <c:redirect url="mainpage"/>
</c:if>
	<!-- Preloader -->
	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>
	<!--End off Preloader -->

	<div class="culmn">
		<!--Home page style-->
		<nav class="navbar navbar-default bootsnav navbar-fixed no-background white">
			<div class="container">

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-menu">
						<i class="fa fa-bars" style="color: black"></i>
					</button>
					<a class="navbar-brand" style="height: 20px; width: 160px;"> 
						<img onclick="javascript:location.href='/survey/';"
                     	style="cursor:pointer;" src="resources/logo/logo-1.png" alt="" />
					</a>
				</div>
				<!-- End Header Navigation -->

				<!-- navbar menu -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						
						<c:choose>
							<c:when test="${loginUser != null}">
								<li><a href="mainpage" class="link">Home</a></li>
								<li><a href="signOut" class="link">Sign out</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="#"><label for="modal" class="link">Home</label></a></li>
								<li><a href="#">
									<label for="modal" class="link">Sign In</label>
								</a></li>
							</c:otherwise>
						</c:choose>
						

						<li><a href="#">
							<label for="modal_regi" class="link">Sign Up</label>
						</a></li>
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>

		<!--Home Sections-->
		<section id="home" class="home bg-black fix">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="main_home text-center">
						<div class="col-md-12">
							<div class="hello">
								<div class="slid_item">
									<div class="home_text ">
										<!--  style.css line 110 -->
										<h1 class="text-yellow">Welcome to Surveying</h1>
										<h3 class="text-white text-uppercase">Make your own survey and share it</h3>
										<br> <br>
										<div
											style="display: inline-block; text-align: center; width: 200px;">
											<a href="#" class="button style2 fit"
												data-poptrox="youtube,800x400"><label for="modal"
												class="labelB">START</label></a>
										</div>
									</div>
								</div>
								<!-- End off slid item -->
							</div>
						</div>
					</div>
					<br />
					<!--<i class="fa fa-angle-down m-top-10 fadeIn mouse-message"></i>-->
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Home Sections-->

		<!-- 추가 main-->
		<div id="main">
			<div class="inner">
			
				<!-- Boxes -->
				<div class="thumbnails">

				<!-- box-->
				<c:forEach var="dto" items="${ bestSurvey }">
					<div class="box">
						<a href="boarddetail?num=${dto.num }"><!-- mouse over -->
							<div class="over">
								<img src="resources/main/images/coin.png" alt="" />
								<h1
									style="font-family: 'Bebas Neue', sans-serif; font-weight: 1000; color: #ff8b02">${ dto.point }P</h1>
							</div> <!-- icon div -->
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
					
				</div>
			</div>
		</div>
		<!-- main end -->

		<input type="checkbox" id="modal" class="hiddenC">
		<div class="box_modal">
			<p style="visibility: hidden;">
				<label for="modal"
					style="display: inline-block; visibility: visible;"> <img
					class="logcloseicon" src="resources/home/images/exit.png"
					width=30px height=30px>
				</label>
			</p>
			<div class="text">
				<c:import url="../login/login.jsp"></c:import>
			</div>
		</div>

		<!--  -->
		<input type="checkbox" id="modal_regi" class="hiddenC">
		<div class="box_modal_regi">
			<p style="visibility: hidden;">
				<label for="modal_regi"
					style="display: inline-block; visibility: visible;"> <img
					class="regcloseicon" src="resources/home/images/exit.png"
					width=30px height=30px>
				</label>
			<div class="text">
				<c:import url="../login/register.jsp"></c:import>
			</div>
		</div>
		
		<!--  -->
		<div
			class="main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-80">
			<div class="col-md-12">
				<p class="wow fadeInRight" data-wow-duration="1s">
					Copyright ⓒ 
					<a target="_blank" href="#">Made by Surveying 2019</a>
                    <i class="fa fa-heart"></i> All Rights Reserved.
				</p>
			</div>
		</div>
	</div>

	<!-- JS includes -->
	<script src="resources/home/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="resources/home/js/vendor/bootstrap.min.js"></script>
	<script src="resources/home/js/jquery.magnific-popup.js"></script>
	<script src="resources/home/js/jquery.easing.1.3.js"></script>
	<script src="resources/home/js/slick.min.js"></script>
	<script src="resources/home/js/js.isotope.js"></script>
	<script src="resources/home/js/jquery.collapse.js"></script>
	<script src="resources/home/js/bootsnav.js"></script>
	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
	<script src="resources/home/js/plugins.js"></script>
	<script src="resources/home/js/main.js"></script>

</body>
</html>
