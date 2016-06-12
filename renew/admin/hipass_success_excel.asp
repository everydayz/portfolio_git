<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
	Server.ScriptTimeOut = 600
%>
<!--#include virtual="/_lib/cMSSQL.asp"-->
<!--#include virtual="/_lib/common.asp" -->
<%

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

'//페이징 변수
Dim keyword ,category
Dim f_nm : f_nm = "hipass_success_" & Year(now()) & Month(now()) & Day(now()) & Hour(now()) & Minute(now()) & Second(now())
Dim arVote : arVote = Array("","","","","","")

'//전달변수 확인
category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

'-- 사용객체
Set objDb	= new cMSSQL

'//목록정보
strSQL = "Exec ADM_HIPASS_SUCCESS_Xls '" & category  & "','" & keyword  & "'"

Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
Set List	   = objDb.GetRows(cmdRs)

'//객체 연결 끊기
objDb.CloseRs cmdRs

If IsObject(List) Then
	If List.count > 0 Then
		For i=0 to List.count-1
			Set row = List.item(i)
			strU_nm			= row("u_nm")
			strMobile		= row("strMobile")
			strDayOfWeek	= row("strDayOfWeek")
			dRegDate		= row("dRegDate")

			If strDayOfWeek = "1" Then strDayOfWeek="금요일" End If
			If strDayOfWeek = "2" Then strDayOfWeek="토요일" End If
			If strDayOfWeek = "3" Then strDayOfWeek="일요일" End If

			strXls = strXls & "	<tr>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strU_nm & "</td>" & vbcrlf
			strXls = strXls & "		<td style=""mso-number-format:'\@'"">" & strMobile& "</td>" & vbcrlf
			strXls = strXls & "		<td>" & strDayOfWeek & "</td>" & vbcrlf
			strXls = strXls & "		<td>" & dRegDate & "</td>" & vbcrlf
			strXls = strXls & "	</tr>" & vbcrlf

			Set row = Nothing
		Next
	End If
End If


Response.Buffer = True
Response.ContentType = "appllication/vnd.ms-excel" '// 엑셀로 지정
Response.CacheControl = "public"
Response.AddHeader "Content-Disposition","attachment; filename=" & f_nm & ".xls"
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<table border="1" cellspacing="0" cellpadding="0">
	<tr>
		<th width="100">이름</th>
		<th width="100">휴대폰</th>
		<th width="100">참석요일</th>
		<th width="150">당첨일</th>
	</tr>
	<%=strXls%>
</table>
