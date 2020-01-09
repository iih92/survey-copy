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
<title>Insert title here</title>
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
									<th class="cell100 column1">아이디</th>
									<th class="cell100 column2">닉네임</th>
									<th class="cell100 column3">포인트</th>
									<th class="cell100 column4">Admin 권한</th>
									<th class="cell100 column5">수정</th>
									<th class="cell100 column6">탈퇴</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach var="dto" items="${ userList }">
									<tr class="row100 body">
										<form action="adminModify">
											<input type="hidden" name="nick" value="${ dto.nick }">
											<td class="cell100 column1">${ dto.id }</td>
											<td class="cell100 column2">${ dto.nick }</td>
											<td class="cell100 column3"><input type="text" name="point" value="${ dto.point }"></td>
											<c:choose>
												<c:when test="${ dto.admin == 0 }">
													<td class="cell100 column4">없음</td>
												</c:when>
												<c:otherwise>
													<td class="cell100 column4">있음</td>
												</c:otherwise>
											</c:choose>
											<td class="cell100 column5"><input type="submit" class='modify' value="수정"></td>
											<td class="cell100 column6"><input type="button" class='leave'onclick="location.href='adminLeave?nick=${ dto.nick }'" value="탈퇴"></td>
										</form>
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
