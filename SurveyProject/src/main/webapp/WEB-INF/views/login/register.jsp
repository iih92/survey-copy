<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>
    <script src="resources/jquery-3.4.1.js"></script>
    <!-- Font Icon -->
    <link rel="stylesheet" href="resources/register/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="resources/register/css/style.css">
    <script>
    	
    	
        /* 비밀번호 보이게 하거나 안보이게 하는 기능*/
    	$(document).ready(function(){
            $(".toggle-password").click(function(){
                $(this).toggleClass("zmdi-eye zmdi-eye-on");
                var input = $($(this).attr("toggle"));
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });
            
            /* 비밀번호와 재확인 비밀번호가 일치하는지 확인 & 비밀번호가 7자리가 넘어가는지 확인*/
            $("#password").keyup(function(){
                var password = $(this).val();
                var repassword = $("#re_password").val();
                if(!(repassword === "")) {
                    if(password === repassword) {
                        $(".confirm").css("color","green");
                        $(".confirm").text("비밀번호 일치");
                    } else {
                        $(".confirm").css("color","red");
                        $(".confirm").text("비밀번호 불일치");
                    }
                }
                if(password.length < 7) {
                    $(".condition").text("7자 이상 32자 이내로 입력하세요 :p");
                } else {
                    $(".condition").text("");
                }
            });
            
            /* 비밀번호와 재확인 비밀번호가 일치하는지 확인 */
            $("#re_password").keyup(function(){
                var password = $("#password").val();
                var repassword = $(this).val();
                if(password === repassword) {
                    $(".confirm").css("color","green");
                    $(".confirm").text("비밀번호 일치");
                } else {
                    $(".confirm").css("color","red");
                    $(".confirm").text("비밀번호 불일치");
                }
            }); 
            
            
           
            /* 모든 칸에 입력을 해야 submit 버튼을 활성화 시킴 */
            $(':input').keyup(function(){
                var nickname = $("#nickname").val();
                var id = $("#id").val();
                var password = $("#password").val();
                var repassword = $('#re_password').val();
                if(nickname === "" || id === "" || password === "" || repassword === "" || (password.length < 7) || !(password === repassword) || (id_check === false)|| (nick_check === false)){
                    $("#submit").attr('disabled', true); 
                    console.log("버튼 활성화 : 실패");
                } else {
                    $("#submit").attr('disabled', false);
                    console.log("버튼 활성화 : 성공");
                } 
            });
            
            /* 회원가입 창에서 로그인 하러가기를 눌렀을시 회원가입창 닫기 */
            $('#checkfail').click(function() {
				$('.hiddenC').attr("checked",false);
			});
           
            
  
            /*아이디 중복 검사*/ 
            var id_check = false;
            
            $("#id").blur(function() {       	
            	var id = $('#id').val().replace(/ /gi, '');
            	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?^(가-힣)]/gi;
            	var pattern = /[^(가-힣)]/;
            	console.log("사용자 id : " + id);

            	$.ajax({
            		async: true,
            		url : 'idCheck',
            		type : 'POST',
            		data : id,
            		dataType : "json",
            		contentType: "application/json; charset=UTF-8",
            		
            		success : function(data){
            			console.log("0이면 중복 아님 : " + data);
            			
            		if (data > 0){
	            			//아이디가 중복되는 문구
	            			$("#id_check").text("사용중인 아이디입니다 :p");
							$("#id_check").css("color", "red");
							/* $('#id').val(" "); */
							/* $("#submit").attr("disabled", true); */
            			
            		}else{       
            				if(id.match(special_pattern)){
    	            			$("#id_check").text("특수문자/한글 쓸수 없습니다 :p");
    							$("#id_check").css("color", "red");
    							/* $('#id').val(" "); */
            				}else{
                				//아이디가 중복안되는 문구 (아이디 성공)
    	            			$("#id_check").text("사용가능한 아이디 입니다 :D");
    							$("#id_check").css("color", "blue");
    							$('#id').val(id);
    							id_check = true;        					
            				}

            		}//if 외부문
            			
            		}, error : function(){
            			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            			console.log("ajax실패")
            		}
            	});
            });
            

            /*닉네임 중복 체크*/
			var nick_check = false;
            
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
            		
            		success : function(data){
            			console.log("0이면 중복 아님 : " + data);
            			
            		if (data > 0){
	            			//아이디가 중복되는 문구
	            			$("#nick_check").text("사용중인 닉네임입니다 :p");
							$("#nick_check").css("color", "red");
							/* $('#id').val(" "); */
							/* $("#submit").attr("disabled", true); */
            			
            		}else{       
            				if(nick.match(special_pattern)){
    	            			$("#nick_check").text("특수문자 쓸수 없습니다 :p");
    							$("#nick_check").css("color", "red");
    							/* $('#id').val(" "); */
            				}else{
                				//아이디가 중복안되는 문구 (아이디 성공)
    	            			$("#nick_check").text("사용가능한 닉네임 입니다 :D");
    							$("#nick_check").css("color", "blue");
    							$('#nickname').val(nick);
    							nick_check = true;        					
            				}

            		}//if 외부문
            			
            		}, error : function(){
            			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            			console.log("ajax실패")
            		}
            	});
            });
            
            
            
            
        });
    </script>
</head>

<body class="reg_body1">
    <div class="main">
        <section class="signup">
            <div class="reg_container">
                <div class="signup-content">
                
                    <form action="signUp" id="register" method="post">
                        <h2 class="form-title">Create account</h2>
                        
                        <!-- 닉네임 -->
                        <div class="form-group">
                            <input type="text" class="form-input" name="nick" id="nickname" placeholder="Your NickName"/>
                            <span class="focus-input"></span>  
                            <span class="check_font" id="nick_check"></span>                        
                        </div>
                        
                        <!-- 아이디 -->
                        <div class="form-group">
                            <input type="text" class="form-input" name="id" id="id" placeholder="Your ID"/>
                            <span class="focus-input"></span>
                            <span class="check_font" id="id_check"></span>
                        </div>
                        
                        <!-- 비밀번호 -->
                        <div class="form-group">
                            <input type="password" class="form-input" name="pw" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye-off field-icon toggle-password"></span>  
                            <span class="focus-input"></span>
	                        <span class="condition"></span> 
	                    </div>
	                    
	                    <!-- 비밀번호 확인 -->
                        <div class="form-group">
                            <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Repeat your password"/>
                            <span class="focus-input"></span>
                        	<span class="confirm"></span>
                        </div>
                        
                        <!-- Sign up -->
                        <div class="form-group">
                            <input type="submit" id="submit" class="form-submit" value="Sign up" disabled="true"/>
                        </div>
                        
                    </form>
                    
                    <p class="loginhere">
                        Have already an account ? 
                        <label for="modal">
                        	<font id="checkfail">Login here</font>
                        </label>
                    </p>
                </div>
            </div>
        </section>
    </div>
</body>
</html>