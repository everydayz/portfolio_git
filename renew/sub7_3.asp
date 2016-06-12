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



<div id="sub_wrap" style="width:100% !important">
	<div id="sub_bg">

		<div id="sub_left">
			<div><img src="img/sub_left01.png"></div>
			<ul>
				<li><a href="sub7_1.asp">관심고객등록</a></li>
				<li><a href="sub7_2.asp">보도자료</a></li>
				<li><a href="sub7_3.asp">당첨자발표</a></li>

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
			<form id="frm" name="frm" method="post">
			<div id="sub_title">HOME > 고객센터 > 당첨자발표</div>
			<div id="title">
				<div id="title01">
					<ul>
						<li><span>당첨자발표</span></li>						
					</ul>
				</div>
			</div>
				<!-- <div id="title02"><img src="img/ing.jpg"></div>-->
				<br /><br /><br /><br />
				<h1 style="padding-bottom:20px;"><img src="img/t_prize.png" alt="당첨자 조회" /></h1>
				<div class="frm_wrap clear">
				<div class="clause_box">
					<p class=""><strong>개인정보 수집 및 이용목적</strong><br />
<br />
<strong>1. 수집하는 개인정보 항목</strong><br />
회사는 관심고객등록 등을 통하여 아래와 같은 개인정보를 수집하고 있습니다.<br />
- 수집항목 : 이름, 생년월일, 휴대전화번호, 주소, 이메일 등<br />
- 수집방법 : 홈페이지 관심고객등록<br />
<br />
<strong>2. 개인정보의 수집 및 이용목적</strong>  <br />
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
- 분양정보 및 분양상담 등 문의 처리<br />
- 마케팅 및 광고홍보에 활용<br />
<br />
<strong>3. 개인정보의 보유 및 이용기간</strong> <br />
회사는 개인정보수집 및 이용목적이 달성된 후에는 예외 없이 해당정보를 지체없이 파기합니다.<br /><br /></p>
				<div class="rBox">
					<span class="fred">개인정보보호정책에 동의 하십니까?</span>
					<input type="radio" id="r_btn_01_01" name="r_wrap3" checked="checked" value="1" class="ml_20" /><label for="rbtn_03_01"> 동의함</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="r_btn_01_02" name="r_wrap3" value="2" /><label for="rbtn_03_02"> 동의하지 않음</label>
				</div>
			</div><!--// clause_box-->
			<div class="form_box">
				<ul>
					<li class="list_01">고객성명 <input type="text" name="winner" id="winner" maxlength="20" /></li>
					<li class="list_02">주민번호 앞자리 <input type="text" name="jumin" id="jumin" maxlength="6" /></li>
					<li class="list_03">(성명은 반드시 공백없이 일렬로 입력하세요.)</li>
				</ul>
				<a href="#" class="btn"><img src="img/btn/btn_prize.png" id="btn_search" style="cursor:pointer;" alt="당첨자조회" /></a>
			</div><!--// form_box -->
			</form>
	    </div><!--// form wrap -->

		</div>

	</div>
</div>


<div id="ft">
	<div id="ft_catch">
		<img src="img/bottom.gif">
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	
	obj.initialize();
});

var obj = {
		
	initialize : function() {
		
		$("#btn_search").click(function() {	// submit

			if(!$("#r_btn_01_01").is(":checked") == true) {
				alert("개인정보보호정책에 동의해주셔야\n\n당첨자 조회가 가능합니다.");
				$("#r_btn_01_01").focus();
			} else if($("#winner").val() == "") {
				alert("성명을 입력해 주십시오.");
				$("#winner").focus();
			} else if($("#jumin").val() == "") {
				alert("주민번호(6자리)를 입력해 주십시오.");
				$("#jumin").focus();
			} else {
				
				var f = document.frm;
				window.open("", "WinnerPOP", "width=530, height=500, scrollbars=auto");
				f.action = "sub7_3_pop.asp";
				f.target = "WinnerPOP";
				f.method = "post";
				f.submit();				
				
			}
			
			//console.log("post popup");
			// obj.layer_pop("");
		});

	}

};


	
</script>	

</body>

</html>			


