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

/*------------------------------------------*/
$(document).ready(function(){
	
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
});