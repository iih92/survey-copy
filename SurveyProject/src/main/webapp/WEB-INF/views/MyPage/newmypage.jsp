<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap|Bebas+Neue&display=swap" rel="stylesheet">
<style> 
	.wrapperMy{  
	font-family:'Noto Sans KR',sans-serif;
	    min-height:574px;
	    min-width:700px;
	    width:100%;
	    display:flex; 
	    
	}
	
	#navbarMy{ 
		 
	    background-color:#efefef;
	    min-width:250px;
	    width:20%;
	    /*
	    
	   min-height: inherit;
	    height:100%;
	    width:25%;
	    float:left;
	*/
	/*
		
		
		height:100%;
		 
	*/
		
	}
	#sectionMy{ 
	
	    min-width:700px;
	        width:80%;
	/*
	    height:100%;
	    min-height:inherit;
	*/
	}
	
	    .navbarTitle span{
	            
	        font-size:15pt;
	        margin: 10px 10px 10px 80px;
	        display:none;   
	    }
	    
	    .navbarUserInfo{
	        margin-top:20px;
	        text-align: center;
	    }
	    .navbarPoint{
	        margin-top:20px;
	        text-align: center;
	    }
	    .navbarMenu li{
	        margin:20px 0 20px 0;
	    }
	    .navbarMenu ul{
	    	list-style:none;
	    }
	    #navbarHr{
	    	border:1px solid white;
	    	
	    }
     
</style>
</head>
<body>

<div class=wrapperMy>
<div id=navbarMy>
    
    <div class=navbarTitle> 
        <span class=nbarTitleSpan id="nbts1">
        MY PAGE
        </span>
        <span class=nbarTitleSpan id="nbts2">
         <i class="fas fa-times"></i>
        </span>
        
    </div>

    <div class="navbarUserInfo">
            <span class="nbarInfoSpan" id="nbIs1"><b>김 아무개</b></span>     
            <span class="nbarInfoSpan" id="nbIs1">님</span>
    </div>
    
    <div class=navbarPoint> 
    <span class="navbarpointSpan" id="nbps1">
        You have <i>1000</i> Points
        </span>
    </div>
    
    
    <hr id="navbarHr">
    <div class="navbarMenu">   
       <ul>      
        <li id="navM1">내 정보 변경</li>     
      	<li id="navM2">포인트 내역 열람</li>    
      	<li id="navM3">내 설문조사</li>     
      	<li id="navM4">나비게이션 바 메뉴4</li>     
      	<li id="navM5">나비게이션 바 메뉴5</li>    
     	<li id="navM6">나비게이션 바 메뉴6</li>            
       </ul>    
    </div>
      
</div>

	<div id=sectionMy>
		<div>여기는 섹션.. ㄴㄴㅇ</div>					
	</div>
</div>

</body>
 <script src="resources/jquery-3.4.1.js"></script>
        <script>
        $(document).on('click','#navM1',function(){
        	  $.ajax({
            	    
            	    url: "mypage",
            	    type: "GET",
            	    success: function() {
            	    	      $('#sectionMy').load("../survey/detail #test1");   
            	    	      
            	    	      for(var i=2;i<=6;i++){
            	    	    	  $("#navM"+i).css("background-color","#efefef");
                	    	      $("#navM"+i).css("font-weight","normal");
            	    	      }           	    	      
            	    	      
            	    	      $("#navM1").css("background-color","white");
            	    	      $("#navM1").css("font-weight","bold");
	      
            	    },
            	    error:function(){
            			alert("문제가 발생했습니다"); 
            		}
            	  });
        });
        
           
        $("#navM2").click(function(){
        	$.ajax({
        	    
        	    url: "mypage",
        	    type: "GET",
        	    success: function() {
        	    	      $('#sectionMy').load("../survey/detail #test2");   
        	    	      for(var i=1;i<=6;i++){
        	    	    	  if(i==2){
        	    	    		  i++;
        	    	    	  }
        	    	    	  $("#navM"+i).css("background-color","#efefef");
            	    	      $("#navM"+i).css("font-weight","normal");
        	    	      }
        	    	      
        	    	      
        	    	      $("#navM2").css("background-color","white");
        	    	      $("#navM2").css("font-weight","bold"); 
        	    	       
        	    	      
        	    },
        	    error:function(){
        			alert("문제가 발생했습니다"); 
        		}
        	  });
        }); 
        
        $("#navM3").click(function(){
        	$.ajax({
        	    
        	    url: "mypage",
        	    type: "GET",
        	    success: function() {
        	    	      $('#sectionMy').load("../survey/detail #test3");   
        	    	      for(var i=1;i<=6;i++){
        	    	    	  if(i==3){
        	    	    		  i++;
        	    	    	  }
        	    	    	  $("#navM"+i).css("background-color","#efefef");
            	    	      $("#navM"+i).css("font-weight","normal");
        	    	      }
        	    	      
        	    	      
        	    	      $("#navM3").css("background-color","white");
        	    	      $("#navM3").css("font-weight","bold");  
        	    	       
        	    },
        	    error:function(){
        			alert("문제가 발생했습니다"); 
        		}
        	  });
        }); 
        $("#navM4").click(function(){
        	$.ajax({
        	    
        	    url: "mypage",
        	    type: "GET",
        	    success: function() {
        	    	      $('#sectionMy').load("../survey/detail #test4");   
        	    	      for(var i=1;i<=6;i++){
        	    	    	  if(i==4){
        	    	    		  i++;
        	    	    	  }
        	    	    	  $("#navM"+i).css("background-color","#efefef");
            	    	      $("#navM"+i).css("font-weight","normal");
        	    	      }
        	    	      
        	    	      
        	    	      $("#navM4").css("background-color","white");
        	    	      $("#navM4").css("font-weight","bold"); 
        	    	       
        	    },
        	    error:function(){
        			alert("문제가 발생했습니다"); 
        		}
        	  });
        }); 
        $("#navM5").click(function(){
        	$.ajax({
        	    
        	    url: "mypage",
        	    type: "GET",
        	    success: function() {
        	    	      $('#sectionMy').load("../survey/detail #test5");   
        	    	      for(var i=1;i<=6;i++){
        	    	    	  if(i==5){
        	    	    		  i++;
        	    	    	  }
        	    	    	  $("#navM"+i).css("background-color","#efefef");
            	    	      $("#navM"+i).css("font-weight","normal");
        	    	      }
        	    	      
        	    	      
        	    	      $("#navM5").css("background-color","white");
        	    	      $("#navM5").css("font-weight","bold"); 
        	    	       
        	    },
        	    error:function(){
        			alert("문제가 발생했습니다"); 
        		}
        	  });
        }); 
        $("#navM6").click(function(){
        	$.ajax({
        	    
        	    url: "mypage",
        	    type: "GET",
        	    success: function() {
        	    	      $('#sectionMy').load("../survey/detail #test6");   
        	    	      for(var i=1;i<=5;i++){
        	    	    	  
        	    	    	  $("#navM"+i).css("background-color","#efefef");
            	    	      $("#navM"+i).css("font-weight","normal");
        	    	      }
        	    	      
        	    	      
        	    	      $("#navM6").css("background-color","white");
        	    	      $("#navM6").css("font-weight","bold"); 
        	    	       
        	    },
        	    error:function(){
        			alert("문제가 발생했습니다"); 
        		}
        	  });
        });  
        $("#navM1").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM1").css("background-color","white");
         	    	      $("#navM1").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM1").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM1").css("background-color","#efefef");
         	    	      $("#navM1").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM2").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM2").css("background-color","white");
         	    	      $("#navM2").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM2").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM2").css("background-color","#efefef");
         	    	      $("#navM2").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM3").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM3").css("background-color","white");
         	    	      $("#navM3").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM3").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM3").css("background-color","#efefef");
         	    	      $("#navM3").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM4").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM4").css("background-color","white");
         	    	      $("#navM4").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM4").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM4").css("background-color","#efefef");
         	    	      $("#navM4").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM5").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM5").css("background-color","white");
         	    	      $("#navM5").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM5").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM5").css("background-color","#efefef");
         	    	      $("#navM5").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM6").mouseenter(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM6").css("background-color","white");
         	    	      $("#navM6").css("font-weight","bold"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        $("#navM6").mouseleave(function(){
        	$.ajax({
        		 url: "mypage",
         	    type: "GET",
         	    success: function() {
         	    	      
         	    	      
         	    	      
         	    	      $("#navM6").css("background-color","#efefef");
         	    	      $("#navM6").css("font-weight","normal"); 
         	    	       
         	    },
         	    error:function(){
         			alert("문제가 발생했습니다"); 
         		}
        	});
        }); 
        
        
        </script>
</html>