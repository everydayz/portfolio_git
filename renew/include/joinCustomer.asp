<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include file="./dbcon.asp" -->
<!--#include file="./common.asp" -->
<%
	username = getReplaceInput(fncDefault(request.form("username"),""),"")
	mobile = getReplaceInput(fncDefault(request.form("mobile"),""),"")
	email1 = getReplaceInput(fncDefault(request.form("email1"),""),"")
	email2 = getReplaceInput(fncDefault(request.form("email2"),""),"")
	post1 = getReplaceInput(fncDefault(request.form("post1"),""),"")
	post2 = getReplaceInput(fncDefault(request.form("post2"),""),"")
	addr1 = getReplaceInput(fncDefault(request.form("addr1"),""),"")
	addr2 = getReplaceInput(fncDefault(request.form("addr2"),""),"")
	f_type = getReplaceInput(fncDefault(request.form("f_type"),""),"")

	Set rs = Server.CreateObject("ADODB.RecordSet")

	SQLCnt = " select count(*) from CUSTOMER "
	SQLCnt = SQLCnt & "WHERE username ='"& username &"' and mobile ='"& mobile &"' "

	rs.Open SQLCnt, dbcon 

	isCnt = rs(0)

	If isCnt > 0 Then 
%>
<script type="text/javascript">
	alert("이미 등록된 고객님입니다.");
	history.back();
</script>
<%
	Response.End
	
	Else 

	JoinSQL = " insert into CUSTOMER (username, mobile, post1, post2, addr1, addr2, email1, email2, f_type, regdate, jointype ) values "
	JoinSQL = JoinSQL & " ( '"&username &"', '"&mobile &"', '"&post1 &"', '"&post2 &"', '"&addr1 &"', '"&addr2 &"', '"&email1 &"', '"&email2 &"', '"&f_type &"', getdate(), '1' ) " 

	dbcon.Execute JoinSQL

%>
<script type="text/javascript">
	alert("관심고객등록이 완료되었습니다.\n\n감사합니다.");
	window.location.href="http://castleoullim.com/";
</script>
<%
	Response.End
	End If 

%>
