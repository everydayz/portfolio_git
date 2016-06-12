<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp" -->
<%

	SESSION("id")    = ""
	SESSION("name") = ""
	SESSION("level")       = ""
	SESSION("email")       = ""
	SESSION("level")       = ""
	SESSION.ABANDON
	message = ""
	url = adm_path & "login.asp"
	Call MoveJavaAlert(msg, url)

	RESPONSE.END
%>