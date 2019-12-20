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
	$('.replyUpdateSeconddiv').hide();
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
	
	
	/*------------답글 등록창의 취소부분 -----------------*/
	$('.reReplyWriteCancel').click(function(e){	
		$('.reReplyWrite').hide();	
	});
	 
	/*---------------------------  댓글 삭제       ---------------------------- */
	$('.replyDelete').click(function(e){
		
		  var temp = e.target.getAttribute('id'); // 클릭한 해당 태그의 id는 repleyDelete38 이런식으로 써져있습니다.. 
		  										// ***** 삭제하려면 id 뒤에 38만 얻어와야하기때문에 
		  										// 문자열을 잘라서 38만 가져올것입니다..
		  var cnum_length = temp.length - 12; // 12는 repleyDelete 의 길이임..  
		  										// 총 길이에서 replyDelete 만큼 빼면
		  										// 숫자의 길이가 나온다
		  var cnum = temp.substr(12,cnum_length); // substr 을 이렇게 쓰면 끝에 숫자만 얻어올수가있다! 

		  
		  location.href = 'replyDelete?num=${dto.num}&cnum='+cnum;
		  // 이렇게 하면.. num 과 cnum 둘다 request.getPar 로 얻을수있다.. 그럼 삭제도 시킬수있음..
	});
	$('.replyUpdateSpan').click(function(e){
		
		  var temp = e.target.getAttribute('id'); // 클릭한 해당 태그의 id는 replyUpdate38 이런식으로 써져있습니다.. 
		  										// ***** 삭제하려면 id 뒤에 38만 얻어와야하기때문에 
		  										// 문자열을 잘라서 38만 가져올것입니다..
		  var cnum_length = temp.length - 11; // 12는 replyUpdate 의 길이임..  
		  										// 총 길이에서 replyUpdate 만큼 빼면
		  										// 숫자의 길이가 나온다
		  var cnum = temp.substr(11,cnum_length); // substr 을 이렇게 쓰면 끝에 숫자만 얻어올수가있다! 



		  var content = $('#replycontent'+cnum).text();
		  
		  $('.replyUpdatediv').show();
		  $('.replyUpdateSeconddiv').hide();
		  

		  $('#replyUpdatediv'+cnum).hide();
		  $('#replyUpdateSeconddiv'+cnum).show();
		  
	});
	$('.replyUpdateCancel').click(function(e){
		
			$('.replyUpdatediv').show();
		  $('.replyUpdateSeconddiv').hide();
		  
	}); 
	
});

</script>

<style type="text/css">

		body{ background-color: gainsboro;}
        
	     .main{
            width: 75%;
            height: 100%;
			margin : 5% 0% 3% 8%;
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
		
	.resultButton{
		border: none;
		color: #fff;
		/* padding: 1% 45% 1% 45%; */
		text-align: right;
		text-decoration: none;
		display: inline-block;
		font-size: 30px;
		cursor: pointer;
		background-color: #01aef0;
		border-radius: 4px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 500;
		margin-left: 85%;	
		margin-top: 2%;
	}

/* 댓글 테이블 CSS */
 .sReply table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  
.Rspan:hover{color: #353535;}


/*댓글 등록 버튼*/
.ReplyBt{
	border: none;
	width:40px;
	height:70px;
	vertical-align:middle;
	background-color: #8C8C8C;
	color: white;
	border-radius: 4px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
}

.ReplyBt:hover{background-color: #4C4C4C;}

/*답글 등록 버튼*/
.RereplyBt{
	border: none;
	vertical-align:middle;
	background-color: #8C8C8C;
	color: white;
	border-radius: 3px;
	font-family: 'Noto Sans KR', sans-serif;
}

.RereplyBt:hover{background-color: #4C4C4C;}
  
</style>

<script src="resources/board/boardDetail.js"></script>

</head>
<body>

	<%@include file="../include/header.jsp" %>	
	<fmt:formatDate var="deadline" value="${ dto.deadline }" pattern="yyyy-MM-dd"/>
	<form action="vote" id="voteForm">
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
				<input type="button" class="modify" onclick="location.href='boardmodify?num=${dto.num}'" value="수정">
				<input type="button" class="delButton" onclick="location.href='boardDelete?num=${dto.num}'" value="삭제">
				<input type="button" class="resultButton" onclick="location.href='result?num=${dto.num}'" value="결과보기">
			</c:when>
			
			<c:otherwise>
				<input type="button" class=surveySave value="등록">
			</c:otherwise>
		</c:choose>
	</form>
	
	
	
	<!-- 댓글 div 추가 -->
	<div class=reply style="background-color:gainsboro; margin-top: 5%;"> 
		<!-- 전체 댓글창 -->
		<div class="sReply">
		
		<table id="Rtable" style="width:80%; margin-left:10%; ">
            
            <c:forEach var="dto" items="${replyList }">
             <!--  뎁스가 0 이상 (대댓글) 이라면 배경색을 라이트그레이로.. 이걸 잘활용하면 가독성 높일수 있을듯..            -->
            <tbody <c:if test="${dto.depth>0 }">style="background-color:lightgray;"</c:if> class="tbody">
            <tr>
               <td>
				<c:if test="${ dto.depth > 0 }">┗</c:if>
				
				<font style="color:#ff8b02; font-weight: 600; size: 20px">${dto.nick}</font>
               	
                
                <td style="text-align: right; color: #747474">
                	<c:if test="${ loginUser == dto.nick }">
                	<span class="replyUpdateSpan" id="replyUpdate${dto.getCNum() }">수정</span> | <span class="replyDelete" id="repleyDelete${dto.getCNum() }">삭제</span> |
                	</c:if>
                	
                	<c:if test="${ dto.depth == 0 }">
                	 <span class="Rspan" id="${dto.getCNum()}" onclick="reReply()">답글</span> 
                	 </c:if>
                	 
                </td>
            </tr>
            <tr>
            	 
            	<td class="sReplytd" colspan=3 >
            	<c:if test="${ dto.depth > 0 }">&nbsp;&nbsp;&nbsp;</c:if>
            	 	<span class="replyUpdatediv" id="replyUpdatediv${dto.getCNum() }">
         
            			<span class="replycontent" id="replycontent${dto.getCNum() }" style="white-space: pre-line;">${ dto.content}</span>
              
			            <c:choose>
			           		<c:when test="${ dto.depth > 0 }"><br>&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: #747474;">${ dto.getCDate() }</font></c:when>
			           		<c:otherwise><br><font style="color: #747474;">${dto.getCDate()}</font></c:otherwise>
			           	</c:choose>
            		</span>
            		
            		<div class="replyUpdateSeconddiv" id="replyUpdateSeconddiv${dto.getCNum() }">
            		
            		
            			<form method=post action=replyUpdate>
    	        			<input type="hidden" name="hnum" value="${dto.num }">
	    		        	<input type="hidden" name="cnum" value="${dto.getCNum() }">
            				<textarea name=replyUpdate style="resize: none;  width:85%; height:50px;">${dto.content}</textarea>
            				<input type="submit" class="RereplyBt" value="등록">
            				<span class="replyUpdateCancel" style="color: #747474; padding-top: 10%; ">취소</span>
            			</form>
            		
            		
            		</div>
            		 
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
            	<input type="submit" class="RereplyBt" value="등록">
            	<span class="reReplyWriteCancel" style="color: #747474; padding-top: 10%; ">취소</span>
            	<hr>
            	</form>
            	 </td>
            </tr>
            </c:forEach>
            
            
            
            
            </table>
		</div>
	
		<div class=wReply style="margin-top: 2%;">
		<form method=post action="replySave">
			<input type="hidden" name="hnum" value="${dto.num}">
			<textarea name=wReplyArea style="resize: none; margin-left:10%; width:80%; height:60px; vertical-align:middle;" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. &#13;&#10;댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>

			<input type=submit class="ReplyBt" value="등록">
		</form>
		</div>
	<br>
	</div>
	
	
	
	
	<%@include file="../include/footer.jsp" %>

</body>
</html>