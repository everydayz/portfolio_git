<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
%>
<!--#include virtual="/include/dbcon.asp" -->
<!--#include virtual="/include/common.asp" -->
<%
	winner = getReplaceInput(fncDefault(request.form("winner"),""),"")
	jumin = getReplaceInput(fncDefault(request.form("jumin"),""),"")
	
	Set rs = Server.CreateObject("ADODB.RecordSet")

	SQLCnt = " select apt_type, apt_danji, apt_dong, apt_ho, waitno, win_type from WINNER "
	SQLCnt = SQLCnt & "WHERE winner ='"& winner &"' and jumin ='"& jumin &"' order by win_type asc "

	rs.Open SQLCnt, dbcon, 1
	rsCnt = rs.RecordCount

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

<style type="text/css">
	.t_prize { width:100%; height:64px; background-color:#1e2e5a; text-indent:20px}
	.prize_pop {width:480px;}
	.prize_pop .con_box { margin:20px 30px; width:100%; line-height:22px;}
	.prize_pop .con_box .t_prize01 { width:300px; margin-bottom:15px; font-family:'NanumGothicBold','NanumGothic' !important; color:#333; font-size:15px;}
	.prize_pop dl dt { padding:20px; background-color:#f5f6fa; font-family:'NanumGothicBold','NanumGothic' !important; color:#0046a8}
	.prize_pop dl dt .u_name, .prize_pop dl dt .u_rno { background-color:#f5f6fa; font-family:'NanumGothicBold','NanumGothic' !important; color:#444; padding-left:8px; font-size:15px;background:url('img/bu_pop.png') 0 8px no-repeat }
	.prize_pop dl dt .u_name { margin-right:10px;}
	.prize_pop dd { padding:20px 0; font-size:13px; color:#999}
	
	.prize_pop .reserve {padding:10px 20px;margin-right:30px; margin-bottom:30px;}
	.b{ font-size:15px; color:#444; font-family:'NanumGothicBold','NanumGothic' !important; }

	.f_red { color:#ca343d}
	.f_sky { color:#6980b4}
	.btn_a { text-align:center; padding:20px 20px 0 20px; border-top:1px solid #e6e6e6}
</style>
</head>


<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" >

<div id="page_wrap2">
	<h1 class="t_prize"><img src="img/t_pop_prize.gif" alt="당첨자 조회" /></h1>
    <div class="prize_pop">
        <div class="con_box">
    	<h2 class="t_prize01">청약 당첨자 조회</h2>
			<dl>
				<dt><span class="u_name">이름 : <%=winner%></span>&nbsp;&nbsp;<span class="u_rno">주민등록번호 : <span class="f_red"><%=jumin%></span>-*******</span></dt>

<%
	If rsCnt = 0 Then 
%>
				<!--3.비당첨자 멘트-->
				<dd><span class="b">죄송합니다.</span><br />
				귀하의 성명은 당첨자 명단에 없습니다.<br />
				성명과 주민번호를 확인하시기 바랍니다.</dd> <!--// 비당첨자 멘트-->
<%
	Else 


		For i=1 To rsCnt 

			If rs("win_type") = "4" Then 
	%>
					<!-- 2.예비당첨자 멘트-->
					<dd class="reserve">
					<p><span class="f_red">*</span> <span style="color:#333">예비당첨</span></p>
					<strong class="b f_sky"><%=rs("apt_danji")%>&nbsp;<%=rs("apt_type")%>㎡</strong> 예비당첨 <strong class="b"><%=rs("waitno")%></strong>순위입니다. </dd>
					<!--// 예비당첨자 멘트-->
	<%
			Else 
	%>
					<!--1. 당첨자 멘트-->
					<dd><span class="b f_red"><%=rs("apt_danji")%>&nbsp;<%=rs("apt_type")%>㎡ <%=rs("apt_dong")%>동 <%=rs("apt_ho")%>호에 당첨되셨습니다.</span><br />
					<span class="b f_red">귀하의 당첨을 축하드립니다!</span><br /><br />
					정확한 당첨여부는 당첨자 발표 장소에서 재확인하여<br />
					주시기 바랍니다.</dd><!--// 당첨자 멘트-->
	<%
			End If 

		rs.MoveNext
		Next 
	
	End If 
%>

			</dl>
			<div class="btn_a">
				<a href="javascript:window.close();" class="pw_btn2 ir"><img src="img/btn_pop_prize.gif" alt="확인" /></a>
			</div>
		</div>
    </div>
    
</div>

</body>

</html>			


