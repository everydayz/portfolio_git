<!--#include virtual ="/include/config.asp"-->

<%
	Dim Sql, Rs, arrParams
	Dim arrList,listLen,i,arrListMe,listLenMe
	Dim arrsale,saleLen

	
	Dim Db : Set Db = New DbManager

	'공지사항
	Sql = "select TOP 3 BOARD_ID,DOC_ID, SUBJECT,PRESS_DATE from "& MIT_TB_BOARD
	Sql = Sql &" WHERE BOARD_ID=? And IS_OPEN='Y' ORDER BY DOC_ID DESC"
	arrParams = Array( _
		Db.makeParam("@BOARD_ID", adVarWchar, adParamInput, 20, "NOTICE") _
	)
	arrList = Db.execRsList(sql, DB_CMDTYPE_TEXT, arrParams, listLen, Nothing)

	'분양정보
	Sql = "select TOP 3 SEQ,IMG_THUMB_NAME,LOCATION,NAME,MAIN_IMG,code from LOT_SOLID_INFO "
	'Sql = Sql &" WHERE code='lotsolid' and STATE = 'I' And IS_OPEN='Y' AND IS_MAINOPEN='Y' ORDER BY SEQ DESC"
	Sql = Sql &" WHERE code='lotsolid' And IS_OPEN='Y' AND IS_MAINOPEN='Y' ORDER BY SEQ DESC"
	arrListMe = Db.execRsList(sql, DB_CMDTYPE_TEXT, null, listLenMe, Nothing)

	Call closeDb

	Dim viewType
	Randomize()
	viewType = int((Rnd*2) +1 )
%>

<!DOCTYPE html>
<html lang="ko"><head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="keywords" content="HDC, 아이앤콘스, 현대산업개발" />
<meta name="description" content="아이앤콘스 기업 홍보" />
<meta name="author" content="현대산업개발, HDC 아이앤콘스, MidasIT Online, 마이다스아이티 온라인" />
<meta http-equiv="X-UA-Compatible" content="IE=9" >
<title>HDC 아이앤콘스</title>
<link rel="stylesheet" type="text/css" href="/common/css/common.css" />
<link rel="stylesheet" type="text/css" href="/common/css/main.css" />
<link rel="stylesheet" type="text/css" href="/common/css/jquery.fancybox.css?v=2.1.5" />
<link rel="stylesheet" type="text/css" href="/common/css/jquery.mCustomScrollbar.css"/>

<script type="text/javascript" src="/common/js/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.easing.1.3.js"></script>
<!--<script type="text/javascript" src="/common/js/jquery/jquery-ui.min.js"></script>-->
<!--<script type="text/javascript" src="/common/js/jquery/jquery.mousewheel.min.js"></script>-->
<!--<script type="text/javascript" src="/common/js/jquery/jquery.mCustomScrollbar.js"></script> -->
<script type="text/javascript" src="/common/js/publish.js"></script>
<script type="text/javascript" src="/common/js/uiscript.js"></script>
<script type="text/javascript">

// 쿠키값 체크하기
function getCookie( name )
{
  var nameOfCookie = name + "=";
  var x = 0;
  while ( x <= document.cookie.length )
  {
    var y = (x+nameOfCookie.length);
    if ( document.cookie.substring( x, y ) == nameOfCookie ) {
      if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
        endOfCookie = document.cookie.length;
      return unescape( document.cookie.substring( y, endOfCookie ) );
    }
    x = document.cookie.indexOf( " ", x ) + 1;
    if ( x == 0 )
      break;
  }
  return "";
}

/*
if ( getCookie( "popup_20130510" ) != "checked"  )
{
    var win = window.open("/popup/popup_20130510.asp","popup_20130510","width=500,height=680,toolbar=no,menubar=no,scrollbars=no,resizable=no,left=0, top=0");
    win.focus();
}
*/

</script>

</head>
<body>
   <!-- 바로가기메뉴 -->    
    <dl id="skiptoContent">
      <dt><strong class="hidden">바로가기 메뉴</strong></dt>
      <dd><a href="#header" class="accessibility01">메인메뉴 바로가기</a></dd>
      <dd><a href="#container" class="accessibility01">본문바로가기</a></dd>
      <dd><a href="#footer" class="accessibility01">푸터바로가기</a></dd>      
    </dl>
   <!--// 바로가기메뉴 -->
    
    <!-- header -->
    <div id="header">
      <!--#include virtual="/inc/inc_menu.asp"-->
      <!-- header_wrap -->
      <div class="header_wrap">      
      <!-- header_inner -->
      <div class="header_inner">
          <h1><a href="/"><img src="/common/img/hdc_logo.gif" alt="HDC 아이앤콘스" /></a></h1>      
          <!--#include virtual="/inc/inc_gnb.asp"-->        
          <!-- top_util -->
          <div class="top_util">
             <ul class="util_list">                
                 <li class="list02"><a href="#" id="MenuOpen"><img src="/common/img/btn_all_menu.png" alt="전체메뉴"  /></a></li>
             </ul>
          </div>
          <!-- //top_util -->
        </div>
        <!-- //header_inner -->
       </div>
       <!-- //header_wrap -->
    </div>
    <!-- //header -->
    
    <!-- container -->
    <div id="container"> 
        <!-- main_visusal -->
        <div class="main_visusal">
            <!-- v_page_control -->
             <ul class="v_page_control">
               <li class="list01"><a href="#" id="Chgbrand">브랜드</a></li>
               <li class="list02"><a href="#" id="Chgsales">Sales LIst</a></li>
             </ul>
             <!-- //v_page_control -->
         
         <!-- LoadView -->
         <div id="LoadView">             
         </div>
         <!-- //LoadView -->
          
        </div>
        <!-- //main_visusal -->
       
       <!-- section_contents --> 
       <div id="section_contents">
                  
         <!-- banner_list_top -->
         <div class="banner_list_top">
            
            <!-- now_info_banner -->
            <div class="now_info_banner">
              <a href="/pages/02field/houseinfo.asp" title="바로가기">
                <h2><img src="/common/img/main/h2_banner01.gif" alt="현장정보" /></h2>
                <p class="summary"><img src="/common/img/main/banner_txt01.gif" alt="아이앤콘스의 다양한 공사정보를 안내해 드립니다." /></p>
                <span class="btn_go"><img src="/common/img/main/ico_go.gif" alt="바로가기"></span>
              </a>  
            </div>
            <!-- //now_info_banner -->
            
            
    <!-- //팝업창3 -->

<div style="position:absolute; left:-34px; top:-588px; visibility:;z-index:9999" id="Popup3">
      <ilayer onSelectStart="return false">

      <layer  z-index="2" left="20" top="20" width="335" height="438">


        <table width="335" height="438" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"  id="titleBar">
          <tr> 
            <td valign=top><table width="335" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td valign="top"><img src="common/img/main/popup_1106.png"border="0" /></td>
  </tr>
</table></td>
          </tr>
          <tr> 
            <td height="25" align=center valign=top bgcolor="#0072bb"><table width="335" height=20 border=0 cellpadding=0 cellspacing=0>
                <tr align=center> 
                   <td width="41" align=center><input type=checkbox name="popupHidden" onclick="setCookie('Popup3', 'on');" style="cursor:hand;border:0px;"></td>
                <td width="288"><div align="left" valign="top"><font style="font: 11px Dotum, sans-serif;color:#ffffff;">오늘하루 
                      열지 않음</font></div></td> 
                  <td width="71"><a onclick="document.getElementById('Popup3').style.visibility='hidden'" style="cursor:pointer;  border-width:0; border-style:none;" > 
                    <div align="center" valign="top"><font style="font: 11px Dotum, sans-serif;color:#ffffff;">&nbsp;&nbsp;&nbsp;닫기</font></div></td>
                </tr>
              </table></td>
          </tr>
      </table>
	</layer>
    </ilayer>
</div>

	<!-- //팝업창3 -->





            <!-- sales_banner -->
            <div class="sales_banner">
             <%If IsArray(arrListMe) Then %>
              <div class="bannerslide_wrap">
                <h2><img src="/common/img/main/h2_banner02.png" alt="분양안내" /></h2>
                <p class="summary"><img src="/common/img/main/banner_txt02.gif" alt="한눈에 보는 전국분양정보" /></p>
                <ul id="bannerSlide" class="bannerslide">
				<%
				'SEQ,IMG_THUMB_NAME,LOCATION,NAME,MAIN_IMG,code
				Dim bgImg
				For i = 0 To listLenMe
					bgImg = Trim(arrListMe(4, i))
					If Trim(arrListMe(4, i)) <> "" Then 
						bgImg = glBOARD_FOLDER & "/movein/"& Trim(arrListMe(5, i))&"/"&Trim(arrListMe(4, i))
					Else
						bgImg = "common/img/main/flicker_banner_bg01.jpg"
					End if
				%>
                   <li>                     
                       <a href="/pages/03sales/supply_info_view.asp?code=<%=Trim(arrListMe(5, i))%>&seq=<%=Trim(arrListMe(0, i))%>">
                           <img src="<%=bgImg%>">
                       </a>
                   </li>
                   <%next%>
                 </ul> 
               </div>
                <%End if%> 
            </div>
            <!-- //sales_banner -->
            




            
            <!-- direct_banner -->
            <div class="direct_banner">          
                <ul>
                   <li class="first"><a href="https://as.i-park.com/cust/" target="_blank" ><img src="/common/img/main/banner_as.gif" alt="as접수" ></a></li>
                   <li><a href="/pages/05prcenter/location.asp"><img src="/common/img/main/banner_location.gif" alt="오시는길" ></a></li>
                </ul>
            </div>
            <!-- //direct_banner -->           
         </div>
         <!-- //banner_list_top --> 
         








         <!-- banner_list_btm -->
         <div class="banner_list_btm">
            
            <div class="recruit_banner">
              <a href="http://blog.naver.com/iparkstory" title="바로가기" target="_blank">
                <h2><img src="/common/img/main/h2_banner03.gif" alt="IPARK 블로그" /></h2>
                <p class="summary"><img src="/common/img/main/banner_txt03.gif" alt="아이앤콘스는 기업과 개인과 함께 성장합니다." /></p>
                <span class="btn_go"><img src="/common/img/main/ico_go.gif" alt="바로가기"></span>
              </a>  
            </div>
            
            <!-- family_banner -->
            <div class="family_banner">
              <a href="/pages/01company/subsidiary.asp">
              <h2><img src="file:///C|/Users/daham1/Documents/네이트온 받은 파일/common/img/main/h2_banner05.gif" alt="HDC 계열사 소개"></h2>
              <p class="summary"><img src="file:///C|/Users/daham1/Documents/네이트온 받은 파일/common/img/main/banner_txt04.gif" alt="아이앤콘스는 기업과 개인과 함께 성장합니다."/></p>
              <span class="btn_go"><img src="/common/img/main/ico_go.gif" alt="바로가기"></span>
              </a>
            </div>
            <!--// family_banner -->
            
            <!-- notice_banner 
            <div class="notice_banner">
              <h2><img src="common/img/main/h2_banner04.gif" alt="공지&amp;소식"><span class="more"><a href="/pages/05prcenter/notice.asp"><img src="/common/img/main/ico_more.gif" alt="more" /></a></span></h2>
              <ul>
			  <%If Not IsArray(arrList) Then %>

			  <%	Else
						'BOARD_ID,DOC_ID, SUBJECT,PRESS_DATE
						For i = 0 To listLen
			  %>
                 <li>

				 <a href="/pages/05prcenter/notice_view.asp?Board_ID=<%=Trim(arrList(0, i))%>&DOC_ID=<%=Trim(arrList(1, i))%>">
                     <dl>
                       <dt><%=cutString(Trim(arrList(2, i)),20)%></dt>
                       <dd><%=Trim(arrList(3, i))%></dd>
                     </dl>  
                   </a>  
                 </li>
			<%
				Next
				End If
			%>
              </ul>
            </div>
            // notice_banner -->
            
            <div class="information_banner">
               <ul>
                   <li>대표전화 : 031.785.1850</li>
                   <li>옵션관련 문의사항 : 031.785.1898~9</li>
               </ul>
            </div>
              
         </div>
         <!-- //banner_list_btm -->
               
       </div>   
       <!-- //section_contents -->   
   </div>
   <!-- //container -->
   
   <!-- footer -->
    <div id="footer">
      <div class="footer_con">
          <p class="copyright"><img src="/common/img/foot_copyright.gif" alt="Copyright 2013 &copy; I&amp;CONS ALL RIGHTS RESERVED"  /></p>     
          <!-- addr_info_wrap -->
          <div class="addr_info_wrap">            
             <ul class="foot_util">
                 <li class="addr"><img src="/common/img/address_txt.gif" alt="경기도 성남시 분당구 정자일로 239 분당아이파크 102동 8층" /></li>
                 <li><a href="http://intra.incons.co.kr/" target="_blank"><img src="/common/img/btn_footer_fn01.gif" alt="인트라넷" /></a></li>
                 <li><a href="http://www.incons.co.kr/admin3/" target="_blank"><img src="/common/img/btn_footer_fn02.gif" alt="관리자" /></a></li>
                 <li><a href="javascript:animatedcollapse.toggle('family');"><img src="/common/img/btn_footer_fn03.gif" alt="Family site" /></a></li>
             </ul>
             <div id="family">     
                  <ul>
                    <li><a href="http://www.Hyundai-dvp.com" target="_blank">현대산업개발</a></li>
                    <li><a href="http://www.Hyundai-ep.com" target="_blank">현대EP</a></li>
                    <li><a href="http://www.icontrols.co.kr" target="_blank">아이콘트롤스</a></li>
                    <li><a href="http://www.parkhyattseoul.co.kr" target="_blank">호텔아이파크</a></li>
                    <li><a href="http://www.ycpiano.co.kr" target="_blank">영창뮤직</a></li>
                    <li><a href="http://www.iparkmall.co.kr" target="_blank">현대아이파크몰</a></li>
                    <li><a href="http://www.i-service.co.kr" target="_blank">아이서비스</a></li>
                    <li><a href="http://www.i-cius.com" target="_blank">아이시어스</a></li>
                    <li><a href="http://www.busanipark.com" target="_blank">아이파크스포츠</a></li>
                    <li><a href="http://www.hdcasset.com" target="_blank">HDC자산운용</a></li>
                  </ul>                     
             </div>
          </div>
          <!-- //addr_info_wrap --> 
        </div>   
        <!-- //footer_con -->
    </div>
    <!-- //footer -->
    
    <script type="text/javascript">
			animatedcollapse.addDiv("family", "fade=0, speed=200, group=pets, hide=1");
			animatedcollapse.ontoggle = function ($, divobj, state) { }
			animatedcollapse.init();
			
		//<![CDATA[
			var pagecode = '00-00-00';
			var getGnbController = new gnbController();
			getGnbController.opts =
			 {
				 gnbobj: '#header .gnb',
				 gnbsubContent: '#header .gnb > ul > li > div',
				 variousClass:
				{
					hoverclass: "hover",
					onclass: "on"
				}
			 }
			getGnbController.initialize();

		//]]>
 </script>

<script type="text/javascript" src="/common/js/jquery/jquery.bxslider.js"></script>
<script type="text/javascript">
  $(function(){
<%'if viewType = 1 then%>
	 //jQuery("#LoadView").load("index_visual_ajax.asp"); 
	 //$('#Chgbrand').addClass('active');	
<%'else%>
	 jQuery("#LoadView").load("index_sales_ajax.asp");
	 $('#Chgsales').addClass('active');	
<%'end if%>
		
	$('#Chgbrand').click(function(){
		    $(this).addClass('active');
			$('#Chgsales').removeClass('active');			
			jQuery("#LoadView").load("index_visual_ajax.asp"); //ajax 비쥬얼 컨텐츠를 불러옵니다.						
	});	
	
	$('#Chgsales').click(function(){		
	       $(this).addClass('active');
		   $('#Chgbrand').removeClass('active');			
			jQuery("#LoadView").load("index_sales_ajax.asp"); //ajax 분양정보 컨텐츠를 불러옵니다.				
	});	   	
	
	 /* 배너 슬라이드 */
		$('#bannerSlide').bxSlider({
		  slideWidth: 465,
		  minSlides: 1,
		  maxSlides: 1,
		  slideMargin: 0,		  
		  infiniteLoop: true,
		  pagerType:'short',
		  pagerShortSeparator: ' / '		 
    });
	
	//$(".scroll_contain").mCustomScrollbar({scrollEasing:"easeOutQuint",autoDraggerLength:false}); //배너 스크롤 기능		
  });  
</script>
        
</body>
</html>