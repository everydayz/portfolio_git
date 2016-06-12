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







<style>
/* section_07 */
.bg_section_07 {display:block;position:relative;width:100%;background:url('') repeat left top; text-align:center;}
.section_07 {position:relative;width:680px; padding:0;margin:0;text-align:center;  margin:0 auto;}
.w_form {position:relative;width:680px; height:580px;background-color:#ffffff;padding:0px;text-align:left;}
.policy_title {position:relative;font-size:20px;color:#222222;font-weight:bold;}
.tbox {position:relative;width:650px; height:179px; display:block;border:1px solid #c8c8c8;background-color:#f3f3f3;color:#666666;padding:10px;margin-top:10px; overflow-y:scroll;}
.r_wrap {color:#666666;margin-top:10px;}
.mb_20 {position:relative; margin-top:30px;border-top:1px solid #757575;border-bottom:1px solid #d4d4d4;}
.mb_20 table {border:0px; border-collapse:collapse; padding:0px; border-spacing:0px;border-top:1px solid #757575; margin-top:10px;}
.mb_20 th {background-color:#f3f3f3;}
.mb_20 td.first {border-top:1px solid #757575;}
.mb_20 td, th {padding:0px;border-top:1px solid #cccccc;color:#555555;padding:5px 0 5px 10px;}
.mb_20 input {padding:0px;border:1px solid #cccccc;height:18px;}
.btn {margin-top:30px; text-align:center;}
</style>



















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
			<div id="sub_title">HOME > 고객센터 > 관심고객등록</div>
			<div id="title">
				<div id="title01">
					<ul>
						<li><span>관심고객등록</span></li>						
					</ul>
				</div>
				<div id="title02">
                
                
                
                
                
                
                
                
                
                
                
                <div class="bg_section_07">
		<div class="section_07">
			
			<div class="w_form">
				<p class="policy_title">개인정보정책 동의</p>

				 <div class="tbox"><p>롯데건설/금호건설은 정보통신망 이용촉진 및  정보보호 등에 관한 법률, 개인정보보호법 등 준수하여야 할 관련 법규상의 개인정보보호 규정을 준수하며, 개인정보보호법 제30조, 정보통신망이용촉진  및 정보보호에 관한 법률 제27조의2에 따라 고객의 개인정보  보호 및 권익을 보호하고 개인정보와 관련한 고객의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 제정하고 이를 준수하고 있습니다.<br />
  롯데건설/금호건설은  개인정보처리방침을 개정하는 경우 캐슬어울림(www.castleoullim.com)공지사항을 통하여  공지(또는 개별공지)할 것입니다.<br />
  <br />
  고객님께서는 롯데건설/금호건설 캐슬어울림홈페이지 방문 시 수시로 개인정보처리방침을 확인해 주시길 바랍니다.<br />
  <br />
  고객님은 개인정보의 수집, 이용, 제공, 위탁 등(이하 &quot;처리&quot;라 합니다.)과 관련한 아래 사항에 대하여 원하지 않는 경우  동의를 거부할 수 있습니다. 다만, 고객님이 동의를 거부하는  경우 서비스의 전부 또는 일부를 이용할 수 없음을 알려드립니다.<br />
  <br />
  롯데건설/금호건설의  개인정보처리방침은 다음과 같은 내용을 담고 있습니다.<br />
  <br />
  본 방침은 201X 년 X월 X일부터  시행됩니다.<br />
  <br />
  <strong>01 </strong><strong>개인정보 처리 목적</strong><br />
  <br />
  회사는 다음과 같은 이유로 개인정보를 수집합니다.<br />
  <br />
  <br />
  가. 회원관리<br />
  <br />
  - 서비스제공 : 콘텐츠 제공, 이벤트 참여  등 서비스 제공에 관련한 목적으로 개인정보를 처리합니다.<br />
  <br />
  - 회원 가입 및 관리 : 분쟁 조정을 위한 기록 보존,  불만처리 및 의견수렴 등 민원처리를 목적으로 개인정보를 처리합니다.<br />
  <br />
  - 마케팅 및 광고에의 활용 : 신규분양 등의 단지 안내 및 상담, 이벤트 및 광고성 정보 제공과 참여기회 제공, 경품발송 등을 목적으로  개인정보를 처리합니다.<br />
  <br />
  <br />
  나. 분양 계약서 : 본인확인, 계약내용 확인 및 각종 정보 전달(분양대금 관련)을 위한 수단<br />
  <br />
  다. 경품 응모권: 경품 배송에 대한 정확한  배송지의 확보, 이벤트 정보 안내 및 마케팅 자료로 활용(해당  이벤트 마다 응모권 내 별도 고지)<br />
  <br />
  <strong>02 </strong><strong>처리하는 개인정보의 항목</strong><br />
  <br />
  가. 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.<br />
  <br />
  <br />
  1)아산모종 캐슬어울림 관심고객 등록<br />
  <br />
  -필수정보 : 성명, 휴대번호, 이메일 계정, 주소 , 관심평형 , 청약통장보유현황<br />
  <br />
  <br />
  2)분양 계약서 <br />
  <br />
  -필수정보 : 이름, 자택 전화번호, 휴대폰 전화번호, 주소, 주민등록번호, 계약 아파트명, 계약 아파트 동호수, 총 분양대금, 계약일, 분양대금  납부내역 등<br />
  <br />
  -선택정보: 이메일, 실거주 주소, 연락 대리인 정보 등<br />
  <br />
  <strong>03 </strong><strong>개인정보의 처리 및 보유기간</strong><br />
  롯데건설/금호건설은  개인정보 수집 및 이용목적이 달성된 후에는 아래와 같이 해당 정보를 지체 없이 파기합니다.<br />
  <br />
  <br />
  1) 회원가입 및 수정을 통한 개인정보: 회원가입을 탈퇴하거나 회원에서 제명된 때<br />
  <br />
  <br />
  2) 이벤트 참여시 등록 정보 : 이벤트 종료 및 경품 발송 후<br />
  <br />
  단, 고객클레임 사후 AS대응을 위해 회원 탈퇴  후 1년은 회원정보를 삭제하지 않고 보관하고 있으며 관계법령의 규정에 의하여 보존할 필요가 있는 경우  회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원 정보를 보관합니다.<br />
  <br />
  <br />
  -계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래  등에서 소비자 보호에 관한 법률)<br />
  <br />
  -대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래  등에서 소비자 보호에 관한 법률)<br />
  <br />
  -소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래  등에서의 소비자보호에 관한 법률)<br />
  <br />
  <strong>04 </strong><strong>개인정보처리의 위탁에 관한 사항</strong><br />
  롯데건설/금호건설은  서비스 이행을 위해 아래와 같이 외부 전문업체에 전산업무를 위탁하여 운영하고 있습니다.<br />
  <br />
  <br />
  &lt; 수탁업체&gt; &lt; 위탁업무 내용 &gt;<br />
   <br />
  ㈜대홍기획 위탁  TM업무 <br />
  ㈜더다함커뮤니케이션즈 홈페이지 개발, 유지보수, 콘텐츠 서비스제공 <br />
  롯데건설/금호건설은  개인정보의 처리 위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 사고시의 책임부담, 위탁기간, 처리 종료 후의 개인정보의 반환 또는 파기 등을 명확히 규정하고 당해 계약내용을 서면 또는 전자적으로 보관하고  있습니다. 위탁하는 업무의 내용이 변경될 경우, 홈페이지  공지사항·서면·이메일·전화·SMS 또는 이와 유사한 방법 중 1개  이상의 방법으로 고지하겠습니다<br />
  <br />
  <strong>05 </strong><strong>개인정보의 제3자 제공에 관한 사항</strong><br />
  롯데건설/금호건설은  이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br />
  <br />
  <br />
  -이용자들이 사전에 동의한 경우<br />
  <br />
  -법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의  요구가 있는 경우<br />
  <br />
  <strong>06 </strong><strong>개인정보의 파기에 관한 사항</strong><br />
  롯데건설/금호건설은  원칙적으로 개인정보 수집 및 처리목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차  및 방법은 다음과 같습니다.<br />
  <br />
  1) 파기절차<br />
  <br />
  고객님이 고객문의, 기업탐방예약, 메일링 서비스, 제보 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로  옮겨져 (종이의 경우 별도의 서류함) 내부 방침 및 기타  관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정  기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는  법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br />
  <br />
  2) 파기방법<br />
  <br />
  -전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br />
  <br />
  -종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br />
  <br />
  <strong>07 </strong><strong>정보주체의 권리, 의무 및 그 행사 방법에 관한 사항</strong><br />
  <br />
  고객님은 정보주체로서 다음과 같은 권리를 행사할 수 있습니다.<br />
  <br />
  1) 개인정보 열람 요구<br />
  롯데건설/금호건설에서  보유하고 있는 개인정보파일은 「개인정보보호법」 제35조(개인정보의  열람)에 따라 열람을 요구할 수 있습니다. 개인정보 열람  요구 시 법 제35조 5항에 의하여 열람을 제한할 수 있습니다.<br />
  <br />
  <br />
  -법률에 따라 열람이 금지되거나 제한되는 경우<br />
  <br />
  -다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우<br />
  <br />
  2) 개인정보 정정·삭제 요구<br />
  롯데건설/금호건설에서  보유하고 있는 개인정보파일은 「개인정보보호법」 제36조(개인정보의  정정·삭제)에 따라 정정·삭제를 요구할 수 있습니다. 다만, 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br />
  <br />
  3) 개인정보 처리정지 요구<br />
  롯데건설/금호건설에서  보유하고 있는 개인정보파일은 「개인정보보호법」 제37조(개인정보의  처리정지 등)에 따라 처리정지를 요구할 수 있습니다. 개인정보  처리정지 요구 시 법 제37조 2항에 의하여 처리정지 요구를  거절할 수 있습니다.<br />
  <br />
  <br />
  1. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우<br />
  <br />
  2. 다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우<br />
  <br />
  3. 개인정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 정보주체가 그 계약의  해지 의사를 명확하게 밝히지 아니한 경우<br />
  <br />
  4) 만 14세 미만 아동의 개인정보 보호<br />
  <br />
  1. 롯데건설/금호건설은  원칙적으로 고객께서 만 14세 미만 아동일 경우 개인정보를 수집하지 않습니다.<br />
  <br />
  2. 부득이 업무 등의 필요로 인해 만 14세 미만 아동의 개인정보를 수집할 때에는 사전에  법정대리인의 동의를 구하고 관련 업무가 종료됨과 동시에 정보를 지체 없이 파기하도록 하겠으며 업무가 진행되는 동안 개인정보를 철저히 관리하겠습니다.<br />
  <br />
  3. 만 14세 미만 아동의 법정대리인은 회사에게 그 아동의 개인정보 열람, 정정·삭제, 처리정지 요구를 할 수 있습니다.<br />
  <br />
  -개인정보 열람, 정정·삭제, 처리정지, 동의철회를 하고자 할 경우에는 개인정보의 열람청구를 접수·처리하는 부서 및 개인정보담당자에게 서면, 전화 또는 이메일로 연락하시면 본인 확인 절차를 거쳐 지체 없이 조치하겠습니다.<br />
  <br />
  -고객님이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를  제3자에게 지체 없이 통지하여 정정이 이루어지도록 조치하겠습니다.<br />
  <br />
  -고객님은 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방하여 주시기 바랍니다. 고객님이  입력한 부정확한 정보로 인하여 발생하는 사고의 책임은 고객 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원자격의 상실 또는 서비스  이용에 제한이 될 수 있습니다.<br />
  <br />
  -고객님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 고객님의 개인정보가 유출되지 않도록 주의하여주시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의하여  주십시오. 만약 이 같은 책임을 다하지 못하고 타인 정보의 도용이나 침해, 허위정보를 입력하는 경우 서비스 해지 및 회원자격이 상실될 수 있으며 관련법령에 의하여 처벌받을 수 있습니다.<br />
  <br />
  <strong>08 </strong><strong>개인정보의 안전성 확보 조치에 관한 사항</strong><br />
  롯데건설/금호건설은  고객의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 「개인정보보호법」 제29조에 따라 다음과  같이 안전성 확보에 필요한 기술적, 관리적, 물리적 조치를  하고 있습니다. 단, 고객 개인의 부주의나 인터넷 상의 문제로  개인정보가 유출되어 발생한 문제에 대해서는 롯데건설/금호건설이 일체의 책임을 지지 않습니다.<br />
  <br />
  1) 내부관리계획의 수립 및 시행 <br />
  <br />
  - 롯데건설/금호건설의  내부관리계획 수립 및 시행은 행정안전부의 내부관리 지침을 준수하여 시행합니다.<br />
  <br />
  2) 개인정보 취급 담당자의 최소화 및 교육 <br />
  <br />
  -개인정보를 취급하는 담당자를 지정하고 최소화하며 담당자에 대한 수시 교육을 통해 개인정보를 안전하게 관리하고 있습니다.<br />
  <br />
  3) 개인정보에 대한 접근 제한 <br />
  <br />
  -개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제에 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단  접근을 통제하고 있습니다.<br />
  <br />
  4) 접속기록의 보관 및 위변조 방지<br />
  <br />
  -개인정보처리시스템에 접속한 기록(웹 로그, 요약정보  등)을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.<br />
  <br />
  5) 개인정보의 암호화 <br />
  <br />
  -고객님의 중요 개인정보는 암호화 되어 저장 및 관리되고 있습니다. 또한 중요한 데이터는  저장 및 전송 시 암호화하여 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br />
  <br />
  6) 해킹 등에 대비한 기술적 대책<br />
  <br />
  - 롯데건설/금호건설은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을  막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다. 또한 네트워크 트래픽의 통제(Monitoring)는 물론 불법적으로 정보를 변경하는 등의 시도를 탐지하고 있습니다.<br />
  <br />
  7) 개인정보의 안전한 보관을 위한 물리적 조치 <br />
  <br />
  -개인정보를 보관하고 있는 개인정보시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다. 또한 개인정보가 기록된 문서의 안전한 보관을  위하여 잠금 장치의 설치 등 물리적 조치를 취하고 있습니다.<br />
  <br />
  8) 개인정보보호 전담조직의 운영 <br />
  <br />
  -사내 개인정보보호 전담조직 등을 통해 개인정보보호조치의 이행사항 및 담당자의 준수여부를 확인하여 문제 발견 시 즉시 시정 조치하도록  하고 있습니다.<br />
  <br />
  <strong>09 </strong><strong>개인정보책임자에 관한 사항</strong><br />
  롯데건설/금호건설은  고객의 개인정보를 보호하고 개인정보와 관련한 고객의 불만사항을 처리하기 위하여 개인정보보호책임자를 두고 있습니다. 개인정보와 관련한 문의사항이 있으시면 아래의 개인정보보호책임자 또는 개인정보관리 담당자에게 연락하여 주시기  바랍니다.<br />
  <br />
  <br />
  개인정보보호관리자 <br />
  <br />
  <br />
  성명 : 김미남 소장 <br />
  소속 : 금호산업㈜ 마케팅팀 <br />
  <br />
  <br />
  개인정보담당자<br />
  <br />
  성명: 박종대 소장 <br />
  소속 : 롯데건설㈜ <br />
  메일 :  <a href="mailto:parkjongdae@lottenc.com">parkjongdae@lottenc.com</a> <br />
  전화번호 : 1688-5500 <br />
  <br />
  <strong>10 </strong><strong>개인정보의 열람청구를 접수, 처리하는 부서</strong><br />
  <br />
  롯데건설/금호건설은  개인정보의 열람청구와 관련하여 고객과의 원활한 의사소통을 위해 고객상담부서를 운영하고 있으며 연락처는 다음과 같습니다.<br />
  <br />
  1) 고객상담부서<br />
  <br />
  -금호산업㈜ 마케팅팀 <br />
  -전화번호 :  02-6303-0642<br />
  -주 소 : 서울시 종로구  새문안로 76 금호아시아나 본관 19층 <br />
  <br />
  -롯데건설㈜ 마케팅부문 <br />
  -전화번호 : 1688-5500<br />
  -주 소 : 서울시 서초구  잠원로 14길 29<br />
  <br />
  <strong>11 </strong><strong>정보주체의 권익침해에 대한 구제 방법</strong><br />
  <br />
  개인정보에  관한 권익을 침해당한 경우나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br />
  <br />
  <br />
  -한국인터넷진흥원 개인정보침해신고센터 (www.kopico.or.kr / 02-1336)<br />
  -정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)<br />
  -대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)<br />
  -경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)<br />
  -사이버경찰청 (www.police.go.kr / 1566-0112)<br />
  -개인정보보호위원회 (www.pipc.go.kr / 02-2180-3000)<br />
  <br />
  <strong>12 </strong><strong>개인정보 처리 방침의 변경에 관한 사항</strong><br />
  <br />
  본 개인정보처리방침은 2012년 1월 1일 개정되었으며, 관련 법률의 제·개정, 정부의 정책 변경, 롯데건설/금호건설 내부방침의 변경 또는 보안기술의  변경에 따라 내용의 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일  전부터 홈페이지를 통해 변경이유 및 내용 등을 공지하도록 하겠습니다.단, 개인정보의 제3자 제공, 수집·이용목적  변경, 보유기간 변경 등 중요한 사항이 변경되는 경우에는 고객의 동의를 얻도록 하겠습니다.<br />
  <br />
 <!-- 개인정보처리방침 버전번호 :  <br /> -->
  <br />
  개인정보처리방침 시행일자 : 2014년 11월 04일 </p></div>
            <div class="r_wrap">
                <strong>위 항목에 모두 동의 하십니까?</strong>
                <input type="radio" name="r_wrap_01" id="r_btn_01_01" value="1"/>
                <label for="r_btn_01_01">동의함</label>
                <input type="radio" name="r_wrap_01" id="r_btn_01_02" class="ml_30" value="2"/>
                <label for="r_btn_01_02">동의하지 않음</label>
            </div>
			<form id="frm" name="frm" method="post">
			 <table class="mb_20">
                <colgroup>
                    <col width="100px" />
                    <col width="580px" />
                </colgroup>
                <tbody>
                    <tr class="first">
                        <th>성명</th>
                        <td class="first">
                            <input type="text" class="textbar w_120" name="username" id="username" maxlength="20" />
                        </td>
                    </tr>
                    <tr class="hp">
                        <th>휴대폰</th>
                        <td>
							<input type="text" class="textbar w_120" name="mobile" id="mobile" maxlength="20" />
						</td>
                    </tr>
                    <!--<tr id="tr_check" style="display:none;">
                        <th>인증번호</th>
                        <td><input type="text" class="textbar w_120" /> <a href="#"><img src="../img/teaser/con_05_btn_02.gif" alt="실명인증" /></a></td>
                    </tr>-->
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" class="textbar w_120" name="email1" id="email1" maxlength="100" /> @ <input type="text" class="textbar w_200" name="email2" id="email2" maxlength="100" /></td>
                    </tr>
                    <tr class="addr">
                        <th>주소</th>
                        <td>
                            <p class="mb_5">
								<input type="text" class="textbar" name="post1" id="post1" maxlength="3" readonly="readonly"/> - 
								<input type="text" class="textbar" name="post2" id="post2" maxlength="3" readonly="readonly"/> <img src="/img/btn_postok.gif" alt="우편번호 찾기" id="imgFindPost" style="cursor:pointer; vertical-align:middle;"/></p>
							<p style="height:4px;">&nbsp;</p>
							<p><input type="text" class="textbar mr_4" name="addr1" id="addr1" maxlength="300" readonly="readonly" style="width:400px;"/></p>
							<p style="height:4px;">&nbsp;</p>
							<p><input type="text" class="textbar mr_4" name="addr2" id="addr2" maxlength="300" style="width:400px;"/></p>
                        </td>
                    </tr>
                    <tr class="type">
                        <th>관심평형타입</th>
                        <td>
                            <input type="checkbox" name="f_type" id="r_btn_02_01" value="1"/><label for="r_btn_02_01"><strong>&nbsp;59A,B㎡</strong></label>
                            <input type="checkbox" name="f_type" id="r_btn_02_02" value="2" class="ml_10"/><label for="r_btn_02_02"><strong>&nbsp;84A,B,C,D㎡</strong></label>
                            <input type="checkbox" name="f_type" id="r_btn_02_03" value="3" class="ml_10"/><label for="r_btn_02_03"><strong>&nbsp;112㎡</strong></label>
                   <br />
                        </td>
                    </tr>
                </tbody>
            </table>
			</form>
            <div class="btn">
                <img src="/img/btn_save.gif" alt="확인" id="imgSubmit" style="cursor:pointer"/>
            </div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	
	obj.initialize();
});

var obj = {
		
	initialize : function() {
		
		$("#imgSubmit").click(function() {	// submit

			if(!$("#r_btn_01_01").is(":checked") == true) {
				alert("개인정보정책에 동의해주셔야 관심고객등록이 가능합니다.");
				$("#r_btn_01_01").focus();
			} else if($("#username").val() == "") {
				alert("성명을 입력해 주십시오.");
				$("#username").focus();
			} else if($("#mobile").val() == "") {
				alert("휴대폰번호를 입력해 주십시오.");
				$("#mobile").focus();
			} else if($("#email1").val() == "") {
				alert("이메일주소를 입력해 주십시오.");
				$("#email1").focus();
			} else if($("#email2").val() == "") {
				alert("이메일주소를 입력해 주십시오.");
				$("#email2").focus();
			} else if($("#post1").val() == "") {
				alert("우편번호확인을 누르신 후, 주소를 검색해 주십시오.");
				$("#imgFindPost").focus();
			} else if($("#addr1").val() == "") {
				alert("우편번호확인을 누르신 후, 주소를 검색해 주십시오.");
				$("#imgFindPost").focus();
			} else if($("#addr2").val() == "") {
				alert("주소를 입력해 주십시오.");
				$("#addr2").focus();
			} else if($("#r_btn_02_01").is(":checked") == false && $("#r_btn_02_02").is(":checked") == false && $("#r_btn_02_03").is(":checked") == false && $("#r_btn_02_04").is(":checked") == false) {
				alert("관심평형타입을 한개 이상 선택해 주십시오.");
				$("#r_btn_02_01").focus();
			} else {
				
				if(confirm("관심고객등록을 하시겠습니까?")) {
				
					$("#frm").attr({action:'/include/joinCustomer.asp'}).submit();

				}
			}
			
			//console.log("post popup");
			// obj.layer_pop("");
		});

		$("#imgFindPost").click(function() {
			find_post_url = "/include/popup_addr.asp";
			window.open(find_post_url,'displayWindow','toolbar=no,scrollbars=yes,width=470,height=500');
		});
			
	}

};


	
</script>	

                
                
                
                
                
               
               
               
               
               
               
               
               
               
               
               
               
               
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


