document.write("<script src='resources/MyPage/moment.js'></script>");
$(document).ready(function(){
	/*-----------footer 공간 제거-----------*/
	$(".content").remove();
	// 내 정보 변경 
	function change(){	
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test1", function(){		
					
					/* 사용자 아이디 보여주기 */
					$.ajax({
						url: "info.do",
						type: "GET",
						success: function(data) {
							id = data.id;
							$("#id").val(id);
						},
						error:function(){}
					});
					
	                /* 닉네임 중복 확인  */
	                var nick_check = false;
	                $("#nickname").blur(function() {
	                	var nick = $('#nickname').val().replace(/ /gi, '');
	                	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	                	$.ajax({
	                		async: true,
	                		url : 'nickCheck',
	                		type : 'POST',
	                		data : nick,
	                		dataType : "json",
	                		contentType: "application/json; charset=UTF-8",
	                		success : function(data) {
	                			if (data > 0) {
	                				$("#nick_check").text("사용중인 닉네임입니다.");
	                				$("#nick_check").css("color", "#f82a2aa3");
	                				$('#btnNick').attr('disabled',true);
	                            } else {
	                            	//특수문자 불가 확인
	                            	if(nick.match(special_pattern)) {
	                            		$("#nick_check").text("특수문자 사용할 수 없습니다.");
	                            		$("#nick_check").css("color", "#f82a2aa3");
	                            		$('#btnNick').attr('disabled',true);
	                               } else {
	                            	   //닉네임 가능 확인
	                            	   $("#nick_check").text("사용가능한 닉네임 입니다.");
	                            	   $("#nick_check").css("color", "#01aef0");
	                            	   $('#btnNick').attr('disabled',false);
	                            	   $('#nick').val(nick);
	                            	   nick_check = true;
	                               }
	                            }//if 외부문
	                         },
	                         error : function(){}
	                	});
	                });   //nick 종료
					
					$('#pw').keyup(function(){
						$('#mesage').html('');
					});
					
	                /* 비번 7자리 이상 입력 확인 */
	                $("#pw").blur(function() {
	                	var pw = $(this).val();
	                	if(pw != "") {
	                		if(pw.length < 7) {
	                			$("#mesage").html("*비밀번호 7자리 이상 입력해주세요.");
	                			$('#mesage').attr('color', '#f82a2aa3');
	                			$('#btnPw').attr('disabled',true);
	                		}
	                	}  
		                /* 비번 & 재비번 일치 확인 */
		                $("#pw").keyup(function(){
		                	var pw = $(this).val();
		                	var pwChk = $("#pwChk").val();
		                	if(!(pwChk === "")) {
		                		if(pw.length < 7) {
		                			$("#mesage").html("*비밀번호 7자리 이상 입력해주세요.");
		                			$('#mesage').attr('color', '#f82a2aa3');
		                			$('#btnPw').attr('disabled',true);
		                       } else if(pw === pwChk) {
		                    	   	$('#mesage').html('비밀번호 일치합니다.');
		                    	   	$('#mesage').attr('color', '#01aef0');
		                    	   	$('#btnPw').attr('disabled',false);
		                      } else {
		                    	  	$('#mesage').html('비밀번호 일치하지 않습니다.');
		                    	  	$('#mesage').attr('color', '#f82a2aa3');
		                    	  	$('#btnPw').attr('disabled',true);
		                      }
		                   }
		               });
	
		                /* 재비번 & 비번 일치 확인  */
		                $('#pwChk').keyup(function() {
		                	var pw = $("#pw").val();
		                	var pwChk = $("#pwChk").val();
		                	if(!(pw === "")) {
		                		if(pw.length < 7) {
		                			$("#mesage").html("*비밀번호 7자리 이상 입력해주세요.");
		                			$('#mesage').attr('color', '#f82a2aa3');
		                			$('#btnPw').attr('disabled',true);
		                       } else if(pw === pwChk) {
		                    	   $('#mesage').html('비밀번호 일치합니다.');
		                    	   $('#mesage').attr('color', '#01aef0');
		                    	   $('#btnPw').attr('disabled',false);
		                      } else {
		                    	  $('#mesage').html('비밀번호 일치하지 않습니다.');
		                    	  $('#mesage').attr('color', '#f82a2aa3');
		                    	  $('#btnPw').attr('disabled',true);
		                      }
		                   }
		                });
	                });
	                $("#mesage").html("");
	             });   //sectionMy 종료
	          },
	          error:function(){
	             alert("문제가 발생했습니다"); 
	          }
		});
	}
	change();	// 첫화면
	$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
	$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
	$("#navM1").css("background-color","white");
	$("#navM1").css("font-weight","bold"); 
	
	$("#navM1").click(function(){
		$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		// 다른 mouseleave 이벤트 on 시켜야함
		change();
	});

	$("#navM2").click(function(){
		$("#navM1, #navM3, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM3, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		// 다른 mouseleave 이벤트 on 시켜야함
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test2", function() {
						
					cnt = 0;
					if(cnt<=0){
						$(".mypleft").attr('disabled',true);
					}
					
						$('.mypleft').click(function(){
								
							--cnt;
							$(".mypright").attr('disabled',false);
					 		var output="";
							
							$.ajax({
								url: "page3.do?start="+cnt,
								success: function(data) {
									//$(".RegisterSurbey").empty(); 
									
								//	console.log("ajax 안으로 들어왔다"); 
								//	console.log(data.length); 
								//	for(var i=0;i<data.length;i++){
								//		console.log(data[i].title);
								//	}
									//$(".RegisterSurbey").html(output);
									
									var pagingCntF= cnt * 5;
									var pagingCntL= cnt * 5 + 5;
							 		
									var pagingLength = pagingCntL;
									if( cnt <= 0 ){ 
										pagingLength = 5;
										pagingCntF = 0;
									}
									
									
									for(var i = pagingCntF ; i<pagingLength; i++){
									 		
										output += "<tr>";
										output += "<td>"+data[1][i]+"</td>";
										output += "<td>"+data[2][i].title+"</td>";
										output += "<td><span style='color:orange;'>+</span>"+data[2][i].point+"</td>";
										output += "</tr>";
										
									 	
									}
									$("#pointTbody").html(output);
									
									if(cnt<=0){
										$(".mypleft").attr('disabled',true);
									}
									
								}, error: function() {}
							});
							
					}); 	
						$('.mypright').click(function(){
							$(".mypleft").attr('disabled',false);
							++cnt;
							$('#pointTbody').empty();
							
							var output="";
							
							$.ajax({
								url: "page4.do?start="+cnt,
								success: function(data) {
									//$(".RegisterSurbey").empty(); 
									
								 	
									var pagingCntF= cnt * 5;
									var pagingCntL= cnt * 5 + 5;
								 	
									var pagingLength = pagingCntL;
									if( pagingLength >= data[2].length ){
										pagingLength = data[2].length;
										$(".mypright").attr('disabled',true);
									}
									
									
									for(var i = pagingCntF ; i<pagingLength; i++){
								 	
										output += "<tr>";
										output += "<td>"+data[1][i]+"</td>";
										output += "<td>"+data[2][i].title+"</td>";
										output += "<td><span style='color:orange;'>+</span>"+data[2][i].point+"</td>";
										output += "</tr>";
										
								 			
									}
					
									$("#pointTbody").html(output);
									
								//	console.log("ajax 안으로 들어왔다");  
								//	console.log(data[2]);
								//	console.log(data[1]);
								//	console.log( data[2][1] );
								//	
									//$(".RegisterSurbey").html(output);
								}, error: function() {
									alert("문제가 발생")
								}
							});
							
							
							
						}); 	
				 
				
			});   
			},
			error:function(){
				alert("문제가 발생했습ㅇㅇ니다"); 
			}
		});
	}); 
	
	
	/*나의 설문조사 페이징*/
	$("#navM3").click(function(){
		$("#navM1, #navM2, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		// 다른 mouseleave 이벤트 on 시켜야함
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test3", function() {
					$(".focus, .nofocus, .paging_bf, .paging_af" ).click(function(){
						
						var endpage = $("#endpage").attr('value');
						console.log('마지막 페이지 :'+ endpage);
						
						var cnt = $(this).attr('value');
						console.log('현재 페이지 :'+ cnt);
						
						$(".paging_bf").attr('value', cnt-1);
						$(".paging_af").attr('value', parseInt(cnt)+1);
						
						$(".focus, .nofocus").css({
							float: 'left',
							padding: '4px',
							'margin-right': '3px',
							width: '25px',
							color: '#474c4c',
							font: '20px tahoma',
							'font-weight': '500',
							border: '1px solid #d2d2d2',
							'text-align': 'center',
							'text-decoration': 'none',
							'border-radius': '50%',
							'background-color': "white"
						});
						
						$("#num"+cnt).css({
							color: "white",
							border: "1px solid #01aef0",
							'background-color': "#01aef0",
							float: "left",
							padding: "4px",
							'margin-right': '3px',
							width: '25px',
							font: '20px tahoma',
							'font-weight': '500',
							'text-align': 'center',
							'text-decoration': 'none',	
							'border-radius': '50%'
						});			

						/*이전 버튼 제한*/
						if(cnt<=1){
							$(".paging_bf").attr('disabled',true);
						} else{
							console.log("start");
							$(".paging_bf").attr('disabled',false);	
						}
						/*다음 버튼 제한*/
						if(cnt == endpage){
							$(".paging_af").attr('disabled',true);
						} else{
							$(".paging_af").attr('disabled',false);
							console.log("end");
						}
		
						var output = "";
						
						$.ajax({
							url: "page.do?start="+cnt,
							success: function(data) {
								$(".RegisterSurbey").empty();
								output += "<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>";
								for (var i = 0; i < data.length; i++) {
									var deadline = moment(data[i].deadline).format('YYYY-MM-DD');
//									console.log(data[i]);
									output += "<tr onclick=location.href='result?num="+data[i].num+"'>"
									output += "<td>"+data[i].title+"</td>"
									output += "<td>"+deadline+"</td>"
									output += "<td>"+data[i].hit+"</td>"
									output += "<td>"+data[i].point+"</td>"
									output += "</tr>"
								}
								$(".RegisterSurbey").html(output);
							}, error: function() {
								alert("문제가 발생")
							}
						});
					});

				});   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	});
	/*페이징---------------------끝*/
	
	$("#navM4").click(function(){
		$("#navM1, #navM2, #navM3 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM3 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		// 다른 mouseleave 이벤트 on 시켜야함
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test4", function() {
					$(".focus, .nofocus, .paging_bf, .paging_af" ).click(function(){
						
						var endpage = $("#endpage").attr('value');
						console.log('마지막 페이지 :'+ endpage);
						
						var cnt = $(this).attr('value');
						console.log('현재 페이지 :'+ cnt);
						
						$(".paging_bf").attr('value', cnt-1);
						$(".paging_af").attr('value', parseInt(cnt)+1);
						
						$(".focus, .nofocus").css({
							float: 'left',
							padding: '4px',
							'margin-right': '3px',
							width: '25px',
							color: '#474c4c',
							font: '20px tahoma',
							'font-weight': '500',
							border: '1px solid #d2d2d2',
							'text-align': 'center',
							'text-decoration': 'none',
							'border-radius': '50%',
							'background-color': "white"
						});
						
						$("#num"+cnt).css({
							color: "white",
							border: "1px solid #01aef0",
							'background-color': "#01aef0",
							float: "left",
							padding: "4px",
							'margin-right': '3px',
							width: '25px',
							font: '20px tahoma',
							'font-weight': '500',
							'text-align': 'center',
							'text-decoration': 'none',	
							'border-radius': '50%'
						});			

						/*이전 버튼 제한*/
						if(cnt<=1){
							$(".paging_bf").attr('disabled',true);
						} else{
							console.log("start");
							$(".paging_bf").attr('disabled',false);	
						}
						/*다음 버튼 제한*/
						if(cnt == endpage){
							$(".paging_af").attr('disabled',true);
						} else{
							$(".paging_af").attr('disabled',false);
							console.log("end");
						}

						
						var output = "";
						
						$.ajax({
							url: "page2.do?start="+cnt,
							success: function(data) {
								$(".RegisterSurbey").empty();
								output += "<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>";
								for (var i = 0; i < data.length; i++) {
									var deadline = moment(data[i].deadline).format('YYYY-MM-DD');
//									console.log(data[i]);
									output += "<tr>"
									output += "<td>"+data[i].title+"</td>"
									output += "<td>"+deadline+"</td>"
									output += "<td>"+data[i].hit+"</td>"
									output += "<td>"+data[i].point+"</td>"
									output += "</tr>"
								}
								$(".RegisterSurbey").html(output);
							}, error: function() {
								alert("문제가 발생")
							}
						});
					});

				});   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	});
	/*페이징---------------------끝*/ 
	
	$("#navM5").click(function(){
		$("#navM1, #navM2, #navM3 ,#navM4, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM3 ,#navM4, #navM6").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		// 다른 mouseleave 이벤트 on 시켜야함
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test5");   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	});
	
	/*---------------------- 회원 탈퇴 --------------------*/ 
	var pwChk = "";
	$("#navM6").click(function(){
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5").css("background-color","#efefef");
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test6", function(){
					$('#leavepw').keyup(function(key){
						pwChk = $(this).val();
						if (key.keyCode == 13) {
							leave();
				        }
					});
					$('#leave').click(function(){
						leave();
					});
				});   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	});  
	
	function leave(){
		$.ajax({
    		url : 'leave.do',
    		type : 'POST',
    		success : function(data) {
    			if(data.pw == pwChk){
    				var result = confirm('정말 회원 탈퇴를 하시겠습니까?'); 
    				if(result) { 
        				location.href = "leave";
    				} else { }	
    			} else {
    				alert("비밀번호가 틀렸습니다.");
    			}
             },
             error : function(){}
    	});
	}
	/*---------------------- 회원 탈퇴 끝--------------------*/ 
	
	/*--------------------- 메뉴 선택 마우스 이벤트 ----------------------------------*/
	$("#navM1, #navM2, #navM3 ,#navM4, #navM5, #navM6").mouseenter(function(){
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5, #navM6").css("background-color","#efefef");
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5, #navM6").css("font-weight","normal");  
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
	}); 
 

});