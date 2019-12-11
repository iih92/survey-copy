<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				$("#div"+divnum).append("<h1>"+qu[1]);
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
</head>
<body>
	<h1>${ dto.title }</h1>
	<div id="question">
	</div>
	
</body>
</html>