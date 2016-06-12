<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
%>
<!--#include file="visit.asp"-->

<%
pageNum =1
subNum =1
%> 
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

<!--#include file="include/inc_header.asp"-->


<div id="sub_wrap" style="width:100% !important">
	<div id="sub_visu"></div>
	<div id="sub_bg">
		<div id="sub_left">
			<div><img src="img/sub_left01.gif"></div>
			<ul>
				<li><a href="sub1_1.asp">사업개요<span class="arr"></span></a></li>
				<li><a href="sub1_2.asp">브랜드소개<span class="arr"></span></a></li>
				<li><a href="sub1_3.asp">찾아오시는길<span class="arr"></span></a></li>
			</ul>
		</div>

		<div id="sub_right">
			<div id="sub_title"><img src="img/ico_home.gif" alt="홈" />  모종캐슬어울림 <span class="arr">&gt;</span><strong>사업개요</strong></div>
			<div id="title">
				<div id="title01">
					<img src="img/tit_sub1_1.gif" alt="사업개요" />
				</div>
				<div id="title02"><img src="img/sub_img.jpg"></div>
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


