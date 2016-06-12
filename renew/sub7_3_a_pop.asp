<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/common.asp"-->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%
Dim nCnt : nCnt=0
Dim nApplyCnt : nApplyCnt=0

'//입력 변수
strCw_nm			= getReplaceInput(fncDefault(Request.Form("cw_nm"),""),"")
nCw_jumin1		= getReplaceInput(fncDefault(Request.Form("cw_jumin1"),""),"")
nCw_jumin2		= getReplaceInput(fncDefault(Request.Form("cw_jumin2"),""),"")

'//페이지 체크
Dim domainNm : domainNm = request.serverVariables("SERVER_NAME")

If InStr(Request.ServerVariables("HTTP_REFERER"),domainNm&"/customer/prizewinner.asp")=0 _
 And InStr(Request.ServerVariables("HTTP_REFERER"),domainNm&"/test/prizewinner.asp")=0  Then
	message = "정보가 정확하지 않습니다."
	rtnString = DisplayJavaAlert(message, "")
	response.write rtnString

	response.End
End If

'//변수 체크
If Trim(strCw_nm&"")="" Or Trim(nCw_jumin1&"")="" Then
	message = "정보가 정확하지 않습니다."
	rtnString = DisplayJavaAlert(message, "")
	response.write rtnString

	response.End
End If

'//숫자 변수 처리
If Trim(nCw_jumin1&"")<>"" Then Call f_NumericCheck(nCw_jumin1)
If Trim(nCw_jumin2&"")<>"" Then Call f_NumericCheck(nCw_jumin2)

'nCw_jumin = nCw_jumin1 & "-" & nCw_jumin2
nCw_jumin = nCw_jumin1 

'-- 사용객체
Set objDb	= new cMSSQL

'//당첨자 체크
strSQL = "Exec USR_CUSTOMER_WINNER_View '"  & strcw_nm & "','"& nCw_jumin  & "'"
Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL) 
If Not(cmdRs.bof Or cmdRs.eof) Then
	nCnt = 1
	strCw_area	= Trim(cmdRs("cw_area")&"")
	strCw_dong	= Trim(cmdRs("cw_dong")&"")
	strCw_ho	= Trim(cmdRs("cw_ho")&"")
	nDiv		= cmdRs("div")
	strPre_num	= cmdRs("pre_num")
	If Trim(strPre_num&"")<>"" Then strPre_num = Cint(strPre_num)

	If Trim(strCw_area&"")<>"" Then
		strCw_area1 = Cint(Left(strCw_area,3))
		strCw_area2 = mid(strCw_area,4,Len(strCw_area))
		strCw_area = strCw_area1 & "." & strCw_area2
	End IF
End If


objDb.CloseRs cmdRs
Set objDb = Nothing

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: 당첨자조회 ::</title>
<link href="../css/pop_style.css" type="text/css" rel="stylesheet" charset="utf-8" media="screen" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/css.browser.detect.js"></script>

</head>

<body>
<div id="page_wrap2">
	<h1><img src="../img/customer/prize_pop_01.gif" alt="당첨자 조회" /></h1>
    <div class="pre_pop2">
    	<h2 class="ir"><span>청약 당첨자 조회</span></h2>
        	<div class="con_box2">
            	<dl class="">
            		<dt><img src="../img/customer/prize_pop_03.gif" alt="이름" /><strong><span class="u_name"><%=strcw_nm%></span></strong> &nbsp;&nbsp;<img src="../img/customer/prize_pop_04.gif" alt="주민등록번호" /><span class="rr_num"><%=nCw_jumin%></span><span> - *******</span></dt>
	<%	If nCnt>0 Then 
			If nDiv=1 Then		'//당첨자
	%>
            		<dd><strong class="b"><%=strCw_area%>㎡ <%=strCw_dong%>동 <%=strCw_ho%>호에 당첨되셨습니다.</strong><br />
                    <strong class="o">귀하의 당첨을 축하드립니다!</strong><br />
                    정확한 당첨여부는 당첨자 발표 장소에서 재확인하여<br />
                    주시기 바랍니다.</dd><!--당첨자 멘트-->
	<%		ElseIf nDiv=2 Then				'//예비당첨자 %>
            		<dd><strong class="b"><%=strCw_area%>㎡</strong> 예비당첨 <strong class="b"><%=strPre_num%></strong>순위입니다.
	<%
			End If
		Else
	%>
            		<dd><strong>죄송합니다.</strong><br />
                    귀하의 성명은 당첨자 명단에 없습니다.<br />
                    성명과 주민번호를 확인하시기 바랍니다.</dd> <!--비당첨자 멘트-->
	<%
		End If
	%>

            	</dl>
                <a href="javascript:window.close();" class="pw_btn2 ir"><span>확인</span></a>
            </div>
    </div>
    
</div>
</body>
</html>
