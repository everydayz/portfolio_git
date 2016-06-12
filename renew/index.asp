<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"

%>
<!--#include file="include/dbcon.asp" -->
<!--#include file="include/common.asp" -->
<!--#include file="visit.asp"-->
<%
	Set rs = Server.CreateObject("ADODB.RecordSet")

	SQL = " select top 5 title, memo from notice order by seq desc "

	rs.Open SQL, dbcon, 1
	rsCount = rs.RecordCount
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

	<!-- //팝업창

<div style="position:absolute; left:50%; top:180px; margin-left:-620px; visibility:;z-index:99999" id=Popup1 onmousedown="ddInit('', 'Popup1');">
      <ilayer onSelectStart="return false">

      <layer onMouseover="isHot=true;if (isN4) ddN4(theLayer)" onMouseout="isHot=false" z-index="2" left="20" top="20">

        <table width="283" height="454" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"  id="titleBar">
          <tr> 
            <td valign=top><table width="283" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><img src="img/1124_popup.jpg" width="283" height="454" border="0" /></td>
  </tr>
</table></td>
          </tr>
          <tr> 
            <td height="25" align=center valign=top bgcolor="#632f00"><table width="283" height=20 border=0 cellpadding=0 cellspacing=0>
                <tr align=center> 
                   <td width="41" align=center><input type=checkbox name="popupHidden" onclick="setCookie('Popup1', 'on');" style="cursor:hand;border:0px;"></td>
                <td width="280"><div align="left" valign="top"><font style="font: 11px Dotum, sans-serif;color:#ffffff;">오늘하루 
                      열지 않음</font></div></td> 
                  <td width="71"><a onclick="document.getElementById('Popup1').style.visibility='hidden'" style="cursor:pointer;  border-width:0; border-style:none;" > 
                    <div align="center" valign="top"><font style="font: 11px Dotum, sans-serif;color:#ffffff;">&nbsp;&nbsp;&nbsp;닫기</font></div></td>
                </tr>
              </table></td>
          </tr>
        </table>
	</layer>
                            </ilayer>
</div>
 -->
	<!-- //팝업창 -->

<div id="hd">
	<div id="hd_wrapper">
		<div id="hd_logo">
			<a href="index.asp"><img src="img/logo.png" alt="LOTTE CASLE, 어울림"></a>
			<span class="ban"><img src="img/ban_tel.gif" alt="분양문의 전화 041)542.2102" /></span>
		</div>

		<div id="navigation">
			<div id="top_menu">
				<ul id="topnav">
					<li>
						<a href="sub1_1.asp">아산모종캐슬어울림</a>
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
					<li>
						<a href="sub5_1.asp">평면설계</a>
						<span>
							<a href="sub5_1.asp">평면설계</a>                          
						</span>
					</li>
					<li class="re_pose">
						<a href="sub6_1.asp">E-모델하우스</a>
						<span>
							<a href="sub6_1.asp">E-모델하우스</a>
							<a href="sub6_2.asp">E-카탈로그</a>
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
		<div id="top_menu_bg"></div>
	</div>
</div>

<script language="javascript" type="text/javascript">
	$(function() {
		$("#demo2").webwidget_slideshow_dot({
			slideshow_time_interval: '5000',
			slideshow_window_width: '480',
			slideshow_window_height: '200',
			slideshow_title_color: '#FFF',
			soldeshow_foreColor: '#7799BB',
			directory: 'img/'
		});
	});
</script>


<div id="wrapper" style="width:100% !important">
 <div id="wrapper_wrap">
	<div id="main_bottom2">
		<ul>
			<li>
				<div class="m_menu">
					<ul>					
						<li class="side_bn2"><a href="sub7_1.asp"><img src="img/img_menu1.gif"></a></li>
						<li class="side_bn2"><a href="sub1_3.asp"><img src="img/img_menu2.gif"></a></li>
						<li class="side_bn2"><a href="sub6_1.asp"><img src="img/img_menu3.gif"></a></li>
                         <!-- <li class="side_bn2"><a href="sub6_2.asp"><img src="img/m4.jpg"></a>--></li>
				
                       <a href="sub6_2.asp" onclick="if(screen.height < 800) {window.open('../e_book/', 'index', 'width=1024, height=700, scrollbars=yes, toolbar=no, menubar=no');}else {window.open('../e_book/', 'index', 'width=1024, height=800, scrollbars=no, toolbar=no, menubar=no');};return false;"><img src="img/img_menu4.gif"></a>                       
					</ul>
				</div>
			<li>
				<div id="demo2" class="webwidget_slideshow_dot">
					<ul>
							<li><a href="sub3_1.asp" title="생활프리미엄"><img src="img/main_b01.jpg" width="480" height="200" alt="slideshow_large"/></a></li>
							<li><a href="sub3_1.asp" title="교통프리미엄"><img src="img/main_b02.jpg" width="480" height="200" alt="slideshow_large"/></a></li>
							<li><a href="sub3_1.asp" title="교육프리미엄"><img src="img/main_b03.jpg" width="480" height="200" alt="slideshow_large"/></a></li>
							<li><a href="sub3_1.asp" title="가치프리미엄"><img src="img/main_b04.jpg" width="480" height="200" alt="slideshow_large"/></a></li>
					</ul>
						<div style="clear: both"></div>
				</div>			
			</li>
			<li class="notice">
				<div>
					<a href="sub7_2.asp"><img src="img/img_news.gif"></a>
					<div>
					  <%
						If rsCount > 0 Then 
							For i=1 To rsCount step 1
					  %>
						<a href="<%=rs("memo")%>" target="_blank"><span class="txt"><%=left(rs("title"),20)%></span><span class="date">15.02.18</span></a>
					
					  <%
							rs.MoveNext
							Next 
						Else 
					  %>
						<p>- 등록된 보도자료가 없습니다.</p>	
					  <%
						End If 
					  %>
					</div>
				</div>
			</li>
		</ul>
	</div>
  </div>
  <div id="bottom_line"></div>
</div>

<div id="ft">
	<div id="ft_catch">
		<img src="img/bottom.gif">
	</div>
</div>
</body>
</html>			


