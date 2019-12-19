<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>

<div style="text-align:center; width:100%; height:1000px; border:1px solid red;">내 정보 변경 예시</div>
<div id="test1" style="text-align:left; height:1000px;  ">
	<script src="resources/jquery-3.4.1.js"></script>
	<script>
	$(document).ready(function(){
		$('#pw').keyup(function(){
			$('#mesage').html('');
		});
		/* 비밀번호 & 재확인 비밀번호 일치 확인 */
		$("#pw").keyup(function(){
			var pw = $(this).val();
			var pwChk = $("#pwChk").val();
			if(!(pwChk === "")) {
				if(pw === pwChk) {
					$('#mesage').html('비밀번호 일치함<br><br>');
					$('#mesage').attr('color', '#199894b3');
					$('#btnPw').attr('disabled',false);
				} else {
					$('#mesage').html('비밀번호 일치하지 않음<br><br>');
					$('#mesage').attr('color', '#f82a2aa3');
					$('#btnPw').attr('disabled',true);
				}
			}
		});

		});

		/* 비밀번호 & 재확인 비밀번호 일치  확인_반대 */
		$('#pwChk').keyup(function(){
			var pw = $("#pw").val();
			var pwChk = $("#pwChk").val();
			if(!(pw === "")) {
				if(pw == pwChk) {
					$('#mesage').html('비밀번호 일치함<br><br>');
					$('#mesage').attr('color', '#199894b3');
					$('#btnPw').attr('disabled',false);
				} else {
					$('#mesage').html('비밀번호 일치하지 않음<br><br>');
					$('#mesage').attr('color', '#f82a2aa3');
					$('#btnPw').attr('disabled',true);
				}
			}
		});
		</script>
	<!-- 내 정보 변경 -->
	<div class="title">
		<font id="p">내정보 변경</font><br>
		비밀번호와 닉네임을 수정 하실 수 있습니다.
	</div>
	<hr>
	<div class="content">
		<ul>
			<li>아이디</li>
			<input name="id" value="${dto.id }" id="id" style="background-color: #f3f3f3;" readonly="readonly"><br>
			<form action="changenick">
				<li>변경할 닉네임</li>
				<input type="text" name="nick" autocomplete="off">
				<button type="submit" id="btnNick">수정</button>
			</form>
			<form action="changepw" method="post">
				<input type="hidden" name="nick" value="1">
				<li>변경할 비밀번호</li>
				<input type="password" name="pw" id="pw" autocomplete="off"><br>
				<li>변경할 비밀번호 재입력</li>
				<input type="password" name="pwChk" id="pwChk">
				<button type="submit" disabled="true" id="btnPw">수정</button>
				<font id="mesage" size="2"></font>
			</form>
		</ul>
	</div>
</div>

<div id="test2" style="text-align:center;  	height:100%;">테스트2  예시</div>
<div id="test3" style="text-align:center;   height:500px;">테스트3  예시</div>
<div id="test4" style="text-align:center;   height:500px;">테스트4  예시</div>
<div id="test5" style="text-align:center;   height:500px;">테스트5  예시</div>
<div id="test6" style="text-align:center;   height:500px;">테스트6  예시</div>

</body>
</html>