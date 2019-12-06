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
                        $(".confirm").text("Concide");
                    } else {
                        $(".confirm").css("color","red");
                        $(".confirm").text("Inconsistency");
                    }
                }
                if(password.length < 7) {
                    $(".condition").text("* The password must be 7 to 32 characters long");
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
                    $(".confirm").text("Concide");
                } else {
                    $(".confirm").css("color","red");
                    $(".confirm").text("Inconsistency");
                }
            });
            
            /* 모든 칸에 입력을 해야 submit 버튼을 활성화 시킴 */
            $(':input').keyup(function(){
                var nickname = $("#nickname").val();
                var id = $("#id").val();
                var password = $("#password").val();
                var repassword = $('#re_password').val();
                if(nickname === "" || id === "" || password === "" || repassword === "" || (password.length < 7) || !(password === repassword)){
                    $("#submit").attr('disabled', true); 
                    console.log("실패");
                } else {
                    $("#submit").attr('disabled', false);
                    console.log("성공");
                } 
            });
            
            /* 회원가입 창에서 로그인 하러가기를 눌렀을시 회원가입창 닫기 */
            $('#checkfail').click(function() {
				$('.hiddenC').attr("checked",false);
			});          
        });
    </script>
</head>
<body class="reg_body1">
    <div class="main">
        <section class="signup">
            <div class="reg_container">
                <div class="signup-content">
                    <form action="#" id="register" method="post">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="nickname" id="nickname" placeholder="Your NickName"/>
                            <span class="focus-input"></span>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="id" id="id" placeholder="Your ID"/>
                            <span class="focus-input"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye-off field-icon toggle-password"></span>  
                            <span class="focus-input"></span>
	                        <span class="condition"></span> 
	                    </div>
	                    
                        <div class="form-group">
                            <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Repeat your password"/>
                            <span class="focus-input"></span>
                        </div>
                        <span class="confirm"></span>
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