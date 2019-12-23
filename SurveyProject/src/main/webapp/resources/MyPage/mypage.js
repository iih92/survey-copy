document.write("<script src='resources/MyPage/moment.js'></script>");
$(document).ready(function(){
	$("#navM1").click(function(){
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
	
	$("#navM3").click(function(){
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test3", function() {
					$(".focus, .nofocus").click(function(){
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
						var cnt = $(this).attr('value');
						var output = "";
						$(this).css({
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
						$.ajax({
							url: "page.do?start="+cnt,
							success: function(data) {
								$(".RegisterSurbey").empty();
								output += "<tr> <th>설문조사 제목</th> <th>마감날짜</th> <th>조회수</th> <th>포인트</th> </tr>";
								for (var i = 0; i < data.length; i++) {
									var deadline = moment(data[i].deadline).format('YYYY-MM-DD');
									console.log(deadline);
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
	
	$("#navM4").click(function(){
		$.ajax({
			url: "mypage",
			type: "GET",
			success: function() {
				$('#sectionMy').load("../survey/detail #test4");   
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
});