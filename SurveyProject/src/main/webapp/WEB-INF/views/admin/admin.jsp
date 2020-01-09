<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>

	<style type="text/css">
	
	body{background-color: gainsboro;}

	.mainBox{
		width:80%;
		margin: 3% auto;
	}
	
	.main {
		width:45%;
		height:100%;
		margin:2.2%;
		background-color: white;
		border-radius: 20px;
		box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.3), 0 10px 10px 0
			rgba(0, 0, 0, 0.15);
		display: inline-block;
		padding: 8% 0% 5% 0%;
		text-align: center;
	}
	
	.main:hover{
		background-color:#ffaa45;
	}
	
	.main:hover font{
		color: white;
	}
	
	.mainfont{
		font-size: 65px;
		font-weight: 1000;
		color:#337ab7;
	}


	

	
	</style>

</head>
<body>



	<c:if test="${ admin == 0 }">
		<c:redirect url="mainpage"/>
	</c:if>
	
	<%@include file="../include/header.jsp" %>
	
<div class="mainBox">
	
	<!-- 사용자 정보 -->
	<div class="main">
	<a href="adminUser">	
		<font class="mainfont">사용자 정보</font><br>
		<img src="resources/admin/image/admin_user.png" style="width: 80%; margin-top: 15%;">
	</a>
	</div>
	
	<!-- 게시글 정보 -->
	<div class="main">
	<a href="adminBoard">
		<font class="mainfont">게시글 정보</font><br>
		<img src="resources/admin/image/admin_board.png" style="width: 80%; margin-top: 15%;">
	</a>
	</div>

</div>
	<%@include file="../include/footer.jsp" %>
</body>
</html>