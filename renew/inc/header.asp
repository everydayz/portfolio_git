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
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,FF=3,otherUA=4" />
<title></title>
<link rel="stylesheet" type="text/css" href="/font/font.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<!-- topmenu -->
<div class="topmenu">
	<p>
		<span><a href=""><img src="/img/common/topmenu01.gif" alt="" /></a></span>
		<span><a href=""><img src="/img/common/topmenu02.gif" alt="" /></a></span>
	</p>
</div>
<!-- //topmenu -->