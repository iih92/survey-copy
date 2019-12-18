<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function(){	
		var a = '${ answer }';
		for(i=0; i < 6; i++){
			console.log(a.indexOf(i));
		}
	});
</script>
</head>
<body>
	
</body>
</html>