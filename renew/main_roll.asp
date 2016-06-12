<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
%>
<!--#include file="visit.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>아산모종캐슬어울림</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=0, maximum-scale=1" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script language="JavaScript" type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/webwidget_slideshow_dot.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#top_menu_bg").hide();

$("ul#topnav li").hover(function() { 
	//$(this).css({ 'background' : '#6283b5 url(topnav_active.gif) repeat-x'}); //Add background color + image on hovered list item
	$(this).find("span").show(); 
	$("#top_menu_bg").show();
} , function() { //on hover out...
	$(this).css({ 'background' : 'none'}); 
	$(this).find("span").hide();
	$("#top_menu_bg").hide();
});



});
</script>


</head>


<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" >

<div id="hd">
	

	<div id="hd_wrapper">
			<div id="hd_logo"><a href="index.asp"><img src="img/logo.png"></a></div>
			<div id="top_menu_bg_o">
				</div>

				<div id="top_menu_bg">
				</div>
			<div id="navigation">
				
				<div id="top_menu">
					<ul id="topnav">
						<li><a href="sub1_1.asp">아산모종캐슬어울림</a>
							<span>
								<a href="sub1_1.asp">사업개요</a> 
								<a href="sub1_2.asp">브랜드소개</a> 
								<a href="sub1_3.asp">찾아오시는길</a>
							</span>
						</li>
						<li>
							<a href="sub2_1.asp">분양안내</a>
							<span>
								<a href="sub2_1.asp">분양일정</a> 
								<a href="sub2_2.asp">모집공고</a>
								<a href="sub2_3.asp">청약안내</a>
							</span>
						</li>
						<li>
							<a href="sub3_1.asp">프리미엄</a>
							<span>
								<a href="sub3_1.asp">프리미엄</a>
							</span>
						</li>
						<li>
							<a href="sub4_1.asp">단지정보</a>
							<span>
								<a href="sub4_1.asp">단지설계</a> 
<a href="sub4_3.asp">커뮤니티</a> 
<a href="sub4_4.asp">시스템</a>
<a href="sub4_2.asp">동·호수 배치도</a> 
							</span>
						</li>
						<li><a href="sub5_1.asp">평면설계</a>
							<span>
								<a href="sub5_1.asp">평면설계</a>                          
							</span>
						</li>
						<li>
							<a href="sub6_1.asp">E-모델하우스</a>
							<span>
								<a href="sub6_1.asp">E-모델하우스</a>
								<a href="#">E-카탈로그</a>                 
							</span>
						</li>
						<li>
							<a href="sub7_1.asp">고객센터</a>
							<span>
								<a href="sub7_1.asp">관심고객등록</a> 
								<a href="sub7_2.asp">보도자료</a> 
								<a href="sub7_3.asp">당첨자발표</a>
							</span>
						</li>
					</ul>
				</div>
				
				


			</div>
		</div>
</div>

<script type="text/javascript" src="./js/jquery.cycle.all.min.js"></script>


<script language="javascript" type="text/javascript">
            $(function() {
                $("#demo2").webwidget_slideshow_dot({
                    slideshow_time_interval: '5000',
                    slideshow_window_width: '587',
                    slideshow_window_height: '175',
                    slideshow_title_color: '#FFF',
                    soldeshow_foreColor: '#7799BB',
                    directory: 'img/'
                });
            });
</script>


<div class="main_slider">
	<ul id="rolling" class="slider">
		<li class='slideImg1'  style='z-index:-1;background:url(./img/main.jpg) 50% 0 no-repeat; cursor:pointer;min-width:1200px;height:850px;'>&nbsp;</li>
		<li class='slideImg1'  style='z-index:-1;background:url(./img/main.jpg) 50% 0 no-repeat; cursor:pointer;min-width:1200px;height:850px;'>&nbsp;</li>
	</ul>

	<div id="wrapper2">
		 <div id="wrapper_wrap">
			<div id="q_banner"><img src="img/top_img.png"></div>
			<div id="main_bottom2">
				<ul>
					<li style="padding-left:5px;">
						<div style="width:202px;height:176px;margin:0;padding:0;position:relative;">
							<ul style="width:202px;height:176px;margin:0;padding:0;position:relative;">					
								<li class="side_bn2"><a href="sub7_1.asp"><img src="img/m1.jpg"></a></li>
								<li class="side_bn2"><a href="sub1_3.asp"><img src="img/m2.jpg"></a></li>
								<li class="side_bn2"><a href="sub6_1.asp"><img src="img/m3.jpg"></a></li>
								<li class="side_bn2"><a href="sub6_2.asp"><img src="img/m4.jpg"></a></li>
							</ul>
						</div>
					
						
					<li>			
					<li>

						<div id="demo2" class="webwidget_slideshow_dot">
							<ul>
									<li><a href="link1" title="0"><img src="img/main_b01.jpg" width="587" height="175" alt="slideshow_large"/></a></li>
									<li><a href="link2" title="0"><img src="img/main_b01.jpg" width="587" height="175" alt="slideshow_large"/></a></li>
									<li><a href="link3" title="0"><img src="img/main_b01.jpg" width="587" height="175" alt="slideshow_large"/></a></li>
									<li><a href="link4" title="0"><img src="img/main_b01.jpg" width="587" height="175" alt="slideshow_large"/></a></li>
							</ul>
								<div style="clear: both"></div>
						</div>			
					</li>
					<li class="notice"><img src="img/main_new_bg.png">
						<a href="">[공지] 아산캐슬어울림 홈페이지 오픈!</a>
						<a href="">[공지] 아산캐슬어울림 홈페이지 오픈!</a>
						<a href="">[공지] 아산캐슬어울림 홈페이지 오픈!</a>
						<a href="">[공지] 아산캐슬어울림 홈페이지 오픈!</a>
						<a href="">[공지] 아산캐슬어울림 홈페이지 오픈!</a>
						
					</li>
				</ul>
			</div>
		  </div>
		</div>
	 <div id="bottom_line"></div>
</div>





<script type="text/javascript" src="./js/main.js"></script>


<div id="ft">
	<div id="ft_catch">
		<img src="img/bottom.jpg">
	</div>
</div>



</body>

</html>			


