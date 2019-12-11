<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.4.1.js"></script>
<style>
.title {
    font-family: 'Ubuntu-Bold', sans-serif;
    font-size: 16px;
    color: #474c4c;
    width: 100%;
    margin-top: 10px;
	padding: 5px;
    position: relative;
}
#p {
    font-size: 30px;
	color: #373737;
	line-height: 0.5;
    font-weight: 900;
}
.content{
	font-family: 'Ubuntu-Regular', sans-serif;
	font-size: 16px;
	color: #474c4c; 
	font-weight: 700;
	width: 100%;
	padding: 5px;
	border: 1px solid transparent;
}
.content ul {
    list-style: none;
    display: block;
	float: left;
    padding: 0px;
}
.content li {
    float: left;
    width: 200px;
    height: 30px;
    text-align: left;
}

input {
	width: 200px;
	height: 30px;
	border: 1px solid #ebebeb;
	background: transparent;
	box-sizing: border-box;
    }
input:focus, select:focus, textarea:focus {
	outline: none;
	box-shadow: none !important;
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	-o-box-shadow: none !important;
	-ms-box-shadow: none !important; 
}
hr {
    display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    border-style: inset;
    border-width: 1px;
}

</style>
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

		/* 비밀번호가 7자리 미만 입력 확인 */
		    if(pw.length < 7) {
		        $(".mesage").text("* 비밀번호 7자리 미만으로 입력하세요");
		    } else {
		        $(".mesage").text("");
		    }
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
	});
   </script>
</head>

<body>
<div style="text-align:center; width:100%; height:1000px; border:1px solid red;">내 정보 변경 예시</div>
<div id="test1" style="text-align:left; height:1000px;  ">
	<!-- 내 정보 변경 -->
	<div class="title">
		<font id="p">내정보 변경</font><br>
		비밀번호와 닉네임을 수정 하실 수 있습니다.
	</div>
	<hr>
	<div class="content">
		<ul>
			<li>아이디</li>
			<input name="id" value="${dto.id }" id="id"
				style="background-color: #f3f3f3;" readonly="readonly"><br>
			<form action="changenick">
				<li>변경할 닉네임</li>
				<input type="text" name="nick" autocomplete="off">
				<button type="submit" id="btnNick">수정</button>
			</form>
			<form action="changepw">
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












<div id="test2" style="text-align:center;  height:100%;  ">테스트2  예시</div>
<div id="test3" style="text-align:center;   height:500px;">테스트3  예시</div>
<div id="test4" style="text-align:center;   height:500px;">테스트4  예시</div>
<div id="test5" style="text-align:center;   height:500px;">테스트5  예시</div>
<div id="test6" style="text-align:center;   height:500px;">테스트6  예시</div>

</body>
</html>