<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div  >
<%@ include file="../include/header.jsp" %>
</div> 
 
<div  >
<jsp:include page="newmypage.jsp" flush="true"/>
</div>
 
<div class=flex_item >
<jsp:include page="../include/footer.jsp" flush="true"/>
</div>

</div>

</body>
</html>