<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문지</title>

<!-- 헤더 / 푸터 인식용 추가 -->
<script src="resources/jquery-3.4.1.js"></script>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<script src="resources/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function(){
		var divnum = 0;
		var code = '${code}';
		console.log(code);
		var s1 = code.split(",");
		console.log(s1);
		for(i=0; i<s1.length; i++){
			if(s1[i].substring(0,1) == 'q'){
				var qu = s1[i].split(":");
				$("#question").append("<div id=div"+divnum+">");
				$("#div"+divnum).append("<h3>"+"["+(divnum+1)+"]&nbsp;"+qu[1]);
				divnum++;
			} else {
				console.log(s1[i]);
				var s2 = s1[i].split(":");
				console.log(s2);
				if(s1[i].substring(0,1) == 'R'){
					$("#div"+(divnum-1)).append("<input type='radio' name='R"+divnum+"' value="+s2[1]+">");
					$("#div"+(divnum-1)).append("<font>"+s2[1]+"<br>");
				} else if(s1[i].substring(0,1) == 'C'){
					$("#div"+(divnum-1)).append("<input type='checkbox' name='C"+divnum+"'' 'value="+s2[1]+">");	
					$("#div"+(divnum-1)).append("<font>"+s2[1]+"<br>");
				} else if(s1[i].substring(0,1) == 'T'){
					$("#div"+(divnum-1)).append("<textarea rows='20' cols='20' name='T"+divnum+"'>");
				}
			}
		}
	});
</script>

<style type="text/css">

		body{ background-color: gainsboro;}
        
	     .main{
            width: 75%;
            height: 100%;
			margin : 5% 10% 3% 10%;
            background-color: whitesmoke;
            border-radius: 10px;
            box-shadow:0 10px 25px 0 rgba(0, 0, 0, 0.3), 0 10px 10px 0 rgba(0, 0, 0, 0.15);
            display: flex;
            flex-flow: column;
            padding: 5%;
                      
        }
        
        /*제목 css*/
        .title{
        	padding: .4em .2em;
            background-color: #D5D5D5;
            border-radius: 3px;
            text-align: center;       	
        }       
        
        /*체크박스 크키 css*/
		input[type=checkbox] {
		-ms-transform: scale(1.6);
		-moz-transform: scale(1.6);
		-webkit-transform: scale(1.6);
		-o-transform: scale(1.6);
		padding: 0px;
		margin-right: 2.2%;
		margin-left: 1%;
		margin-bottom: 1.5%;
		}

		/*radio 크키 css*/
		input[type=radio] {
		-ms-transform: scale(1.6);
		-moz-transform: scale(1.6);
		-webkit-transform: scale(1.6);
		-o-transform: scale(1.6);
		padding: 0px;
		margin-right: 2.2%;
		margin-left: 1%;
		margin-bottom: 1.5%;
		}
		
		
		/*textarea 크키 css*/
		textarea{
        padding:.5em .3em;
        width: 80%;
        margin-top: 0%;
            
        }
        
        /*수정 버튼*/
        .modify {
		border: none;
		color: #fff;
		/* padding: 1% 45% 1% 45%; */
		text-align: right;
		text-decoration: none;
		display: inline-block;
		font-size: 30px;
		cursor: pointer;
		background-color: #f8585b;
		border-radius: 4px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		margin-left: 85%;		
		}
		
		/*삭제 버튼*/
		.delButton{
		border: none;
		color: #fff;
		/* padding: 1% 45% 1% 45%; */
		text-align: right;
		text-decoration: none;
		display: inline-block;
		font-size: 30px;
		cursor: pointer;
		background-color: #f8585b;
		border-radius: 4px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		margin-left: 1%;	
		}


</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	

	
	<div id="form" class="main">
				<div style="text-align: center;" class="title"> <h1>${ dto.title }</h1> </div>
				<div id="question"></div>
	</div>
	

	<input type=button class=modify value="수정">
	<input type=button class=delButton value="삭제">

	
	<%@include file="../include/footer.jsp" %>
</body>
</html>