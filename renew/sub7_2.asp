<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
%>
<!--#include file="visit.asp"-->
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->

<%

Dim strDepth01		: strDepth01 = "03"
Dim strDepthTitle	: strDepthTitle = "공지사항"
Dim req_seq

Dim strListPage : strListPage = "sub7_2.asp"

'-- 사용객체
Set objDb	= new cMSSQL

'-- 공용파라메터
Dim nPageSize, nPageBlock, nPage, strSQL, nTotalCnt, vnum

nPageSize = 10
nPageBlock = 10

'-- 파라메터
nPage		= getReplaceInput(fncDefault(Request("page"),"1"),"")
Dim keyword ,category
category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

'--검색
Dim arKeyField : arKeyField = Array("","","")
Select Case category
	Case ""	: arKeyField(0) = " selected=""selected"""
	Case "01"	: arKeyField(1) = " selected=""selected"""
	Case "02"	: arKeyField(2) = " selected=""selected"""
End Select

'리스트 총 갯수
strSQL = "Exec ADM_NOTICE_Count '"  & category & "','"& keyword & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL) 
nTotalCnt = cmdRs("nCnt")

nTotalPage = Int((nTotalCnt-1)/nPageSize)+1

if Cint(nPage) = Cint(nTotalPage) then
	RowPage = ( nTotalCnt - (Int(nPage)-1)*nPageSize )
else
	RowPage = nPageSize
end if

'리스트
strSQL = "Exec ADM_NOTICE_List " & (nPage*nPageSize) &"," & RowPage & ",'" & category  & "','" & keyword & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
Set List	   = objDb.GetRows(cmdRs)

objDb.CloseRs cmdRs

Set objDb = Nothing
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
			<div id="sub_title">HOME > 고객센터 > 보도자료</div>
			<div id="title">
				<div id="title01">
					<ul>
						<li><span>보도자료</span></li>						
					</ul>
				</div>
				<div id="title02">
                   
      <table width="733" height="28" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="#0066CC" style="padding:3px"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="BORDER: #582931 1px solid">
              <tr>
                <td bgcolor="#FFFFFF"><table width="100%" height="20"  border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td width="35" class="board_dark" style="padding-top:2px">번호</td>
                      <td class="board_dark" style="padding-top:2px">제목</td>
                      <td width="100" class="board_dark" style="padding-top:2px">작성자</td>
                      <td width="100" class="board_dark" style="padding-top:2px">날짜</td>
                   
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="733" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="7"></td>
        </tr>
      </table>
     
<!-- list -->

      <table width="733" border="0" cellpadding="0" cellspacing="0">
<%
	isNullList = True
	'공지사항 리스트
	If IsObject(List) Then
		If List.count > 0 Then
			isNullList = False
			vnum = nTotalCnt-((nPage-1)*nPageSize)
			For i=0 to List.count-1
				Set row = List.item(i)

				
%>  
		<tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#FFFFFF"><table width="100%" height="20"  border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
						<td width="35" height="30" align="center" class="num_small"><%=vnum%></td>
						<td style="padding-left:5px; text-align:left;"><a href="<%=row("memo")%>" target="_blank" class="board_t30"><%=f_stringCut(row("title"),68)%></a></td>
						<td width="100" align="center">캐슬어울림</td>
						<td width="100" align="center" class="num_small"><%=f_dateFormat(row("reg_dt"),"")%></td>
                   
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="1" bgcolor="E5E5E5"></td>
        </tr>

<%
				Set row = Nothing
				vnum = vnum-1
			Next
		End If
	End If
%>
<%
	If isNullList=True Then
%>        
		<tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="60" align="center"><div align="center"> 등록된 데이타가 없습니다.</div></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="1" bgcolor="E5E5E5"></td>
        </tr>
<%
	End If
%>		


      </table>


      <table width="733"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="1" bgcolor="D9D9D9"></td>
        </tr>
        <tr>
          <td><table width="733"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="150">&nbsp;</td>
                <td align="center" style="padding-top:15px; padding-bottom:15px"><table width="433" border="0" cellspacing="0" cellpadding="0">
                    
					<tr><td width="100%" align="center">
						<!--
                      <td width="20"><a href="#"><img src="img/btn/num_l2.gif" width="13" height="11" border="0" align="absmiddle"></a></td>
                      <td width="11"><a href="#"><img src="img/btn/num_l.gif" width="11" height="11" border="0" align="absmiddle"></a></td>
                      <td align="center"><a href="#" class="page_num">1</a><span class="num_middle">|</span><a href="#" class="page_numo">2</a><span class="num_middle">|</span><a href="#" class="page_num">3</a><span class="num_middle">|</span><a href="#" class="page_num">4</a><span class="num_middle">|</span><a href="#" class="page_num">5</a><span class="num_middle">|</span><a href="#" class="page_num">6</a><span class="num_middle">|</span><a href="#" class="page_num">7</a><span class="num_middle">|</span><a href="#" class="page_num">8</a><span class="num_middle">|</span><a href="#" class="page_num">9</a><span class="num_middle">|</span><a href="#" class="page_num">10</a></td>
                      <td width="18"><a href="#"><img src="img/btn/num_r.gif" width="11" height="11" border="0" align="absmiddle"></a></td>
                      <td width="13"><a href="#"><img src="img/btn/num_r2.gif" width="13" height="11" border="0" align="absmiddle"></a></td>
						-->
						
<%



		Dim blockpage, i
		blockpage = Int((nPage-1)/10)*10+1

		if blockpage = 1 Then
			response.write "<img src=""img/btn/num_l.gif"" alt=""Prev"" width=""11"" height=""11"" border=""0"" align=""absmiddle"">"
		Else
			'response.write "<a href='"&url&"?page=" & blockpage-10 & "&pagesize=" & pagesize & param & "'><img src=""/images/common/btn_prev.gif"" alt=""Prev"" width=""62"" height=""16"" border=""0"" align=""absmiddle""></a> "
			response.write "<a href=""javascript:fncMovePage('document.frmList','list','" & blockpage-10 & "')""><img src=""img/btn/num_l.gif"" alt=""Prev"" width=""12"" height=""11"" border=""0"" align=""absmiddle""></a> "
		End If

		i = 1
		Do Until i > 10 or blockpage > nTotalPage
			If blockpage=int(nPage) Then
				response.write " <b>" & blockpage & "</b> "
			Else 
'				response.write "[<a href='"&url&"?page=" & blockpage & "&pagesize=" & pagesize & param & "'>" & blockpage & "</a>]"

				response.write "[<a href=""javascript:fncMovePage('document.frmList','list','" & blockpage & "')"">" & blockpage & "</a>]"

			End If

			blockpage = blockpage + 1
			i = i + 1
		Loop


		If blockpage > nTotalPage Then
			response.write "<img src=""img/btn/num_r.gif"" alt=""Next"" width=""11"" height=""11"" border=""0"" align=""absmiddle"">"
		Else
			'response.write " <a href='"&url&"?page=" & blockpage & "&pagesize=" & pagesize & param & "'><img src=""/images/common/btn_next.gif"" alt=""Next"" width=""62"" height=""16"" border=""0"" align=""absmiddle""></a>"

			response.write " <a href=""javascript:fncMovePage('document.frmList','list','" & blockpage & "')""><img src=""img/btn/num_r.gif"" alt=""Next"" width=""11"" height=""11"" border=""0"" align=""absmiddle""></a>"
		End If
%>
                    </td></tr>


                </table></td>
                <td width="150" align="right">&nbsp;</td>
              </tr>
          </table>
<form name="frmList" method="post" action="<%=strListPage%>" onSubmit="return false">
	<input type="hidden" name="page" id="page" value="<%=page%>" />
	<input type="hidden" name="seq" id="seq" />
	<input type="hidden" name="category" id="category" value=""/>
			<table width="733" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="right" width="398"><input name="keyword" id="keyword" type="text" class="input" style="width:150px;" value="<%=keyword%>"></a></td>
				<td align="right" width="10">&nbsp;</td>
				<td align="left" width="340"><a href="javascript:fncMovePage(document.frmList, 'search', '');"><img src="img/btn/search_grey.gif" width="44" height="19" border="0"></a></td>
              </tr>
            </table>
</form>			
			</td>
        </tr>
      </table>
                
                
      <script type="text/javascript">
function fncMovePage(frm, mode, no){

	if( mode=="write" ){
		if( no == "" ){ no = '1';}
		frm.page.value=no;

	}else if( mode=="edit" ){
		frm.id.value=no;
	}else if( mode == "list" ){
		if( no == "" ){ no = '1';}
		frm.page.value = no;
	}else if( mode=="view" ){
		frm.id.value=no;

	}else if( mode=="search" ){
		if( frm.keyword.value == "" ){
			alert("검색어를 입력해주세요.");
			frm.keyword.focus();
			return false;
		}else{
			no = '1';
			frm.page.value = no;
		}
	}else if( mode=="delete" ){
		if (confirm("해당 정보를 삭제하시겠습니까?")){
			frm.id.value=no;
		}else{
			return false;
		}

	}else{
		alert("정확한 경로가 아닙니다.");
		return false;
	}

	frm.submit();
}
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


