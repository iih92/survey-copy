<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="resources/admin/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/admin/css/main.css">
<title>게시글 보기(관리자)</title>
</head>
<body>
	<c:if test="${ admin == 0 }">
		<c:redirect url="mainpage"/>
	</c:if>
	<%@include file="../include/header.jsp" %>
		<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">글번호</th>
									<th class="cell100 column2">제목</th>
									<th class="cell100 column3">해쉬태그</th>
									<th class="cell100 column4">생성일자</th>
									<th class="cell100 column5">마감일자</th>
									<th class="cell100 column6">포인트</th>
									<th class="cell100 column7">조회수</th>
									<th class="cell100 column8">작성자</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach var="dto" items="${ list }">
									<tr class="row100 body">
										<td class="cell100 column1">${ dto.num }</td>
										<td class="cell100 column2"><a href="boarddetail?num=${ dto.num }">${ dto.title }</a></td>
										<td class="cell100 column3">${ dto.hashtag }</td>
										<td class="cell100 column4">${ dto.createDate }</td>
										<td class="cell100 column5">${ dto.deadline }</td>
										<td class="cell100 column6">${ dto.point }</td>
										<td class="cell100 column7">${ dto.hit }</td>
										<td class="cell100 column8">${ dto.nick }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp" %>
	
	<script src="resources/admin/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/admin/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/admin/vendor/select2/select2.min.js"></script>
	<script src="resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);
			$(window).on('resize', function(){
				ps.update();
			})
		});			
	</script>
	<script src="resources/admin/js/main.js"></script>
</body>
</html>
