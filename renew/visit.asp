<%
	Response.CharSet = "UTF-8"

%>
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

	Flag = Request.ServerVariables("http_user_agent")
	remote_ip = Request.ServerVariables("remote_addr")
	
	If InStr(Flag,"Mozilla") <> 0 Then
		browser = "Not IE"
	Else 
		browser = "IE"
	End If 

	If InStr(Flag,"Android") <> 0 Then
		device = "Android"
	ElseIf InStr(Flag,"iPhone") <> 0 Then
		device = "iPhone"
	ElseIf InStr(Flag,"iPad") <> 0 Then
		device = "iPad"
	Else 
		device = "PC"
	End If 

	Set objDb	= new cMSSQL

	strSQL = "Exec SP_STAT '" & remote_ip &"','" & browser & "','" & device  & "' "

	Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)
	objDb.CloseRs cmdRs

	Set objDb = Nothing
%>