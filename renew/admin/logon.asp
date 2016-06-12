<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

Dim intRtnValue
Dim req_mem_id, req_password

req_id = getReplaceInput(fncDefault(request.form("id"),""),"")
req_pwd = getReplaceInput(fncDefault(request.form("pwd"),""),"")


intRtnValue = 1

'// Error Check
If Trim(req_id&"")="" Or Trim(req_pwd&"")="" Then
	intRtnValue = 0
End If


If intRtnValue<>0 Then

	'-- 사용객체
	Set objDb	= new cMSSQL

	'-- 파라메터
	strSQL = "Exec ADM_getLogin '" & req_id & "', '"& req_pwd &"' "

	Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

	If cmdRs.bof Or cmdRs.eof Then

		intRtnValue = 0
		Session("id")="" : 		Session("name")="" : 		Session("email")="" :		Session("level")=""
		Session.Abandon
	Else

		If cmdRs("pwd") = req_pwd Then
			Session.timeout = 180
			Session("id") = cmdRs("id")
			Session("name") = cmdRs("name")
			Session("email") = cmdRs("email")
			Session("level") = cmdRs("level")
		Else
			intRtnValue = 0
		End If
	End If

	objDb.closeRs cmdRs
	Set objDb = Nothing

End IF


'//로그인 결과 리턴
'Response.Write intRtnValue

If Int(intRtnValue) = 1Then
	Call MoveJavaAlert("",adm_path & "customer_list.asp")
Else
	Call MoveJavaAlert("정보가 정확하지 않습니다",adm_path & "login.asp")
End If
Response.End
%>
	


