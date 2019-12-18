$(document).ready(function(){
	var divnum = 0;
	var code = $('#code').val();
	var s1 = code.split(",");
	for(i=0; i<s1.length; i++){
		if(s1[i].substring(0,1) == 'q'){
			var qu = s1[i].split(":");
			$("#question").append("<div id=div"+divnum+">");
			$("#div"+divnum).append("<h3>"+"["+(divnum+1)+"]&nbsp;"+qu[1]);
			divnum++;
		} else {
			var s2 = s1[i].split(":");
			if(s1[i].substring(0,1) == 'R'){
				if(s2[1] != ""){ 
					$("#div"+(divnum-1)).append("<input type='radio' name=R"+divnum+" value="+s2[1]+">");
					$("#div"+(divnum-1)).append("<font>"+s2[1]+"<br>");				
				}
			} else if(s1[i].substring(0,1) == 'C'){
				if(s2[1] != ""){ 
					$("#div"+(divnum-1)).append("<input type='checkbox' name=C"+divnum+" value="+s2[1]+">");	
					$("#div"+(divnum-1)).append("<font>"+s2[1]+"<br>");
				}
			} else if(s1[i].substring(0,1) == 'T'){
				$("#div"+(divnum-1)).append("<textarea rows='20' cols='20' name='T"+divnum+"'>");
			}
		}
	}
});