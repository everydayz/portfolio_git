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
								<a href="sub4_2.asp">동,호수 배치도</a> 
								<a href="sub4_3.asp">커뮤니티</a> 
								<a href="sub4_4.asp">시스템</a>
							</span>
						</li>
						<li><a href="sub5_1.asp">세대정보</a>
							<span>
								<a href="sub5_1.asp">세대정보</a>                          
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



<div id="sub_wrap" style="width:100% !important">
	<div id="sub_bg">

		<div id="sub_left">
			<div><img src="img/sub_left01.png"></div>
			<ul>
				<li><a href="sub2_1.asp">분양일정</a></li>
				<li><a href="sub2_2.asp">모집공고</a></li>
				<li><a href="sub2_3.asp">청약안내</a></li>
			</ul>
			<div id="sub_img_bottom">

				<ul style="margin:0;padding:0;position:relative;">
					<li><img src="img/s1.jpg"></li>
				</ul>
				

				<ul style="margin:0;padding:0;position:absolute;">
					
					<li class="side_bn"><a href="sub7_1.asp"><img src="img/s2.jpg"></a></li>
					<li class="side_bn"><a href="sub1_3.asp"><img src="img/s3.jpg"></a></li>
					<li class="side_bn"><a href="sub6_1.asp"><img src="img/s4.jpg"></a></li>
					<li class="side_bn">   <a href="sub6_2.asp"><img src="img/s5.jpg"></a></li>
				</ul>
				
					
			</div>
		</div>

		<div id="sub_right">
			<div id="sub_title">HOME > 분양안내 > 청약안내</div>
			<div id="title">
				<div id="title01">
					<ul>
						<li><span>청약안내</span></li>						
					</ul>
				</div>
				<div id="title02">
                
                
              <img src="img/chung.jpg" usemap="#Map" border="0" />
<map name="Map" id="Map">
  <area shape="rect" coords="123,258,249,286" href="https://www.kbstar.com/" target="_blank" />
  <area shape="rect" coords="511,258,635,286" href="http://www.apt2you.com/" target="_blank" />
</map>
                </div>
			</div>

		</div>

	</div>
</div>


<div id="ft">
	<div id="ft_catch">
		<img src="img/bottom.gif">
	</div>
</div>



</body>

</html>			


