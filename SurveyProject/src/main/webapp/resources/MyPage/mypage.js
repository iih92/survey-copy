document.write("<script src='resources/MyPage/moment.js'></script>");
$(document).ready(function(){
	$(".content").remove();
	$("#navM1").click(function(){
		$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM2, #navM3, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).off('mouseleave');
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test1", function(){		
					$('#pw').keyup(function(){
						$('#mesage').html('');
					});
					/* 비밀번호 & 재확인 비밀번호 일치 확인 */
					$("#pw").keyup(function(){
						var pw = $(this).val();
						var pwChk = $("#pwChk").val();
						if(pw.length < 7) {
							$('#mesage').html('비밀번호 7자리 이상 작성해주세요<br><br>');
							$('#mesage').attr('color', '#f82a2aa3');
							$('#btnPw').attr('disabled',false);
						}
						if(!(pwChk === "")) {
							if(pw.length < 7) {
								$('#mesage').html('비밀번호 7자리 이상 작성해주세요<br><br>');
								$('#mesage').attr('color', '#f82a2aa3');
								$('#btnPw').attr('disabled',false);
							} else if(pw === pwChk) {
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

					/* 비밀번호 & 재확인 비밀번호 일치  확인_반대 */
					$('#pwChk').keyup(function(){
						var pw = $("#pw").val();
						var pwChk = $("#pwChk").val();
						if(!(pw === "")) {
							if(pw.length < 7) {
								$('#mesage').html('비밀번호 7자리 이상 작성해주세요<br><br>');
								$('#mesage').attr('color', '#f82a2aa3');
								$('#btnPw').attr('disabled',false);
							} else if(pw == pwChk) {
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
				   
					$("#nickname").blur(function() {       	
						var nick = $('#nickname').val().replace(/ /gi, '');
			        	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			            console.log("사용자 닉네임 : " + nick);
			            $.ajax({
			            	async: true,
			            	url : 'nickCheck',
			            	type : 'POST',
			            	data : nick,
			            	dataType : "json",
			            	contentType: "application/json; charset=UTF-8",
			            	success : function(data) {
			            		console.log("0이면 중복 아님 : " + data);
			            		if (data > 0){
			            			//아이디가 중복되는 문구
			            			$("#nick_check").text("사용중인 닉네임입니다 :p");
			            			$("#nick_check").css("color", "red");
			            		} else {
			            			if(nick.match(special_pattern)){
			            				$("#nick_check").text("특수문자 쓸수 없습니다 :p");
			            				$("#nick_check").css("color", "red");
			            			} else {
			            				//아이디가 중복안되는 문구 (아이디 성공)
			            				$("#nick_check").text("사용가능한 닉네임 입니다 :D");
			            				$("#nick_check").css("color", "blue");
			            				$('#nickname').val(nick);
			            				nick_check = true;        					
			            			}
			            		}//if 외부문
			            	}, 
			            	error : function(){
			            		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			            		console.log("ajax실패")
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

	$("#navM2").click(function(){
		$("#navM1, #navM3, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM3, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).off('mouseleave');
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test2");   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	}); 
	
	
	/*나의 설문조사 페이징*/
	$("#navM3").click(function(){
		$("#navM1, #navM2, #navM4 ,#navM5, #navM6").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM4 ,#navM5, #navM6").css("background-color","#efefef");
		$(this).off('mouseleave');
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
							width: '35px',
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
							width: '35px',
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
		$(this).off('mouseleave');
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
							width: '35px',
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
							width: '35px',
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
		$(this).off('mouseleave');
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
	
	$("#navM6").click(function(){
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5").css("font-weight","normal"); 
		$("#navM1, #navM2, #navM3 ,#navM4, #navM5").css("background-color","#efefef");
		$(this).off('mouseleave');
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test6", function(){
					
				});   
			},
			error:function(){
				alert("문제가 발생했습니다"); 
			}
		});
	});  
	
	$("#navM1, #navM2, #navM3 ,#navM4, #navM5, #navM6").mouseenter(function(){
		$(this).css("background-color","white");
		$(this).css("font-weight","bold"); 
	}); 
	
	$("#navM1, #navM2, #navM3 ,#navM4, #navM5, #navM6").mouseleave(function(){
		$(this).css("background-color","#efefef");
		$(this).css("font-weight","normal"); 
	});

});