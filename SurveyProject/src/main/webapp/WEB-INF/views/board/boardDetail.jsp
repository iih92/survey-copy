<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

function reReply(){
	
	console.log("reReply() function here");
	
}

$(document).ready(function(){
	
	/*--------------- 답글 등록창을 띄우는 부분---------------- */
	//기본적으로 답글 등록창은 다 hide로 숨겨져있다. 
	//모든댓글마다 다 존재한다. "답글"을 누르면 그 댓글의 답글등록창만 띄워주는식으로 할거임.. 
	$('.reReplyWrite').hide();
	// 클래스 Rspan은 "답글" 에 달려있다. 
	$('.Rspan').click(function(e){
		
		console.log(".Rspan 클릭");
		//그 "답글"의 아이디를 얻어서 this_id에 저장.
		//아이디는 해당 댓글 DB의 cNum 이고, cNum은 intent와 같다. (cNum은 기본키이므로 유일하게 존재할수있음.. 테이블에 기본키설정은 안해놨다)  
		var this_id = e.target.getAttribute('id');
		
		//아이디가 비어있지않다면,
		if((this_id != '') && (this_id != null)){
			console.log("this_id >>>> " + this_id);
			$('.reReplyWrite').hide();
			
			//답글등록할수있는 창을 띄워준다. 그 답글등록창들은 id를 갖고있는데, reReply + this_id(cNum,intent) 이다.
			$('#reReply'+this_id).show();
		}
	});
	
	
	/*------------답글 등록창의 취소부분 -----------------       */
	$('.reReplyWriteCancel').click(function(e){
		
		$('.reReplyWrite').hide();
		
	});
	
	
	/*---------------------------          ---------------------------- */
	
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
		
		/*등록 버튼*/
        .surveySave {
		border: none;
		color: #fff;
		text-align: right;
		text-decoration: none;
		display: inline-block;
		font-size: 30px;
		cursor: pointer;
		background-color: #01aef0;
		border-radius: 4px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		margin-left: 91%;		
		}


/* 리플라이 테이블 CSS */
 .sReply table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
</style>

<script src="resources/board/boardDetail.js" ></script>

</head>
<body>

	<%@include file="../include/header.jsp" %>	
	<fmt:formatDate var="deadline" value="${ dto.deadline }" pattern="yyyy-MM-dd"/>
	<form action="vote">
		<input type="hidden" name="num" value="${ dto.num }">
		<div class="main">
		   <input type="hidden" id="code" value="${code}">   
		   <div style="text-align: center;" class="title"> <h1>${ dto.title }</h1> </div>
		   <div style="text-align: center; color:#a0a0a0; size:20px"> <h3>${ dto.hashtag }</h3> </div>
		   <h3 style="text-align: right; margin:0px">조회수 : ${dto.hit }</h3>
		   <h3 style="text-align: right; margin:0px">마감 날짜 : ${ dto.deadline }</h3>
		   <div id="question">
		   </div>
		</div>
	
		<c:choose>
			<c:when test="${dto.nick == loginUser }">
				<input type="button" class=modify onclick="location.href='boardmodify?num=${dto.num}'" value="수정">
				<input type="button" class=delButton onclick="location.href='boardDelete?num=${dto.num}'" value="삭제">
			</c:when>
			
			<c:otherwise>
				<input type="submit" class=surveySave value="등록">
			</c:otherwise>
		</c:choose>
	</form>
	
	
	
	<!-- 댓글 div 추가 -->
	<div class=reply style="background-color:white;"> 
		<div class=sReply style="border:1px solid yellow; ">
		<table id="Rtable" style="border:1px solid blue; width:80%; margin-left:10%; ">
            
            <c:forEach var="dto" items="${replyList }">
                      <!--  뎁스가 0 이상 (대댓글) 이라면 배경색을 라이트그레이로..  이걸 잘활용하면 가독성 높일수 있을듯..            -->
            <tbody <c:if test="${dto.depth>0 }">style="background-color:lightgray;"</c:if> class="tbody">
            <tr>
               <td>
				<c:if test="${ dto.depth > 0 }">┗</c:if>
				
				${ dto.nick}
               	
               	</td>
                <td>${ dto.getCDate() }</td>
                
                
                
                <td>
                	<c:if test="${ loginUser == dto.nick }">
                	수정 | 삭제 |
                	</c:if>
                	<c:if test="${ dto.depth == 0 }">
                	 <span class="Rspan" id="${dto.getCNum() }" onclick="reReply()">답글</span> 
                	 </c:if>
                </td>
            </tr>
            <tr>
            	<td class="sReplytd" colspan=3 >
            	<c:if test="${ dto.depth > 0 }">>> </c:if>
            	${ dto.content}
            	
            	<hr>
            	
            	</td>
            </tr> 
            
            </tbody>
            
            <tr class="reReplyWrite" id="reReply${dto.getCNum()}">
            	
            	<td colspan=3>
            	<form action=reReplySave method=post>
            	<input type="hidden" name="hnum" value="${dto.num }">
            	<input type="hidden" name="cnum" value="${dto.getCNum() }">
            	
            	<textarea style="resize:none; width:100%; height:50px;" name="reReplyWrite"></textarea>
            	<input type="submit" value="등록">
            	<span class="reReplyWriteCancel">취소</span>
            	<hr>
            	</form>
            	 </td>
            </tr>
            </c:forEach>
            
            
            
            
            </table>
		</div>
	
		<div class=wReply style="border:1px solid red; ">
		<form method=post action="replySave">
			<input type="hidden" name="hnum" value="${dto.num}">
			<textarea name=wReplyArea style="resize: none; margin-left:10%; width:80%; height:60px; vertical-align:middle;" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. &#13;&#10;댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>

			<input type=submit value="등록" style="width:40px; height:60px; vertical-align:middle;">
		</form>
		</div>
	<br>
	</div>
	
	
	
	
	<%@include file="../include/footer.jsp" %>

</body>
</html>