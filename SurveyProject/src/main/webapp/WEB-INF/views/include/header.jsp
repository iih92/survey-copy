<script>
	$(document).ready(function() {
        var toggle = true;
		$(".link").click(function() {
			$(".link").css("color", "");
			$(this).css("color", "black");
		});
        $("#makeform").click(function(){
           location.href = "#"; 
        });
        
        $('.search , .searchclose').click(function(){
            if($('.top-search').hasClass('pullDown') || $('.top-search').hasClass('slide-out-up')){
                $('.top-search').toggleClass('pullDown');
                $('.top-search').toggleClass('slide-out-up');
            } else {
                $('.top-search').addClass('pullDown');
            }
            $('.top-search').toggle(); 
        });
	});
    
</script>
<link rel="stylesheet" href="resources/include/header.css">
<header>
    <div class="headerdiv">       
        <!-- Start Top Search -->
        <div class="top-search" >
            <div class="container">
                <div class="searchGroup">
                    <span class="seacrhIcon"><i class="fa fa-search"></i></span>
                    <input type="text" class="searchInput" placeholder="Search">
                    <span class="searchclose"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->
        
        <div class="container">
            <!-- 돋보기 아이콘 -->
            <!-- Start Header Navigation -->
	       <div class="menu">
                <!-- 로고 -->
                <div class="headerlogo">
                    <img src="resources/logo/logo-2.png" class="logo" alt=""> 
                </div> 
                <!-- navbar menu -->
                <div class="headermenu">
                    <ul class="menugroup">
                        <li class="link"><a href="#" class="hmenu">Home</a></li>
                        <li class="link"><a href="#" class="hmenu">Test</a></li>
                        <li class="link"><a href="#" class="hmenu">MyPage</a></li>
                        <li class="link"><button class="makeform" type="submit">START</button></li>
                        <li class="link"><button class="search"><i class="fa fa-search"></i></button></li>
				    </ul>
				</div>
            </div>
        </div>
    </div>
</header>