<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- 헤더 / 푸터 인식용 추가 -->
<script src="resources/jquery-3.4.1.js"></script>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

</head>
<style>
	.flex-container {
	  display: flex;
	  flex-direction: column;
	}
	
	.flex_item {
	  margin-top: auto;
	}
</style>
<body>

<div class=flex-container>


	<%@ include file="../include/header.jsp" %>

 
	<div>
	<jsp:include page="newmypage.jsp" flush="true"/>
	</div>
 
<%-- 	<div class=flex_item >
	<jsp:include page="../include/footer.jsp" flush="true"/>
	</div> --%>
	
	
	<%@ include file="../include/footer.jsp" %>
	 
 

</div>

</body>
</html>