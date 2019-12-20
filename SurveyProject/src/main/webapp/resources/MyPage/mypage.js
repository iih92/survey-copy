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
				$('#sectionMy').load("../survey/detail #test3");   
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
});