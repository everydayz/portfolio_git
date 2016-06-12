<%Response.ContentType="text/html;charset=UTF-8"%>
<% 
'// ' 또는 공백 체크
	Function getReplaceInput(str, ns)
		Dim rtnString

		If isNull(str) = false Then
			rtnString = str
'			rtnString = trim(replace(rtnString,";","&#59;"))
'			rtnString = trim(replace(rtnString,"'","&#39;"))
'			rtnString = trim(replace(rtnString,"-","&#45;"))
'			rtnString = trim(replace(rtnString,";",""))
			rtnString = trim(replace(rtnString,"<","&lt;"))
			rtnString = trim(replace(rtnString,">","&gt;"))
			rtnString = trim(replace(rtnString,"'","''"))
			rtnString = trim(replace(rtnString,"--",""))
			if ns = "ns" Then rtnString=replace(rtnString, " ", "")
		End If

		'getReplaceInput = f_encode(rtnString)
		getReplaceInput = rtnString
	End Function

	' html encode  
	function f_encode(CheckValue)
		f_encode = Server.HTMLEncode(trim(CheckValue))
	end Function

	'// ' 또는 공백 체크 
	'// 알림마당>수시채용의 주소창의 '-' 입력을 위해 추가 081203
	Function getReplaceInput2(str, ns)
		Dim rtnString

		if str <> "" and isNull(str) = false Then
			rtnString = str
'			rtnString = trim(replace(rtnString,";","&#59;"))
'			rtnString = trim(replace(rtnString,"'","&#39;"))
'			rtnString = trim(replace(rtnString,"-","&#45;"))
			rtnString = trim(replace(rtnString,";",""))
			rtnString = trim(replace(rtnString,"'","''"))
			'rtnString = trim(replace(rtnString,"-",""))
			if ns = "ns" Then rtnString=replace(rtnString, " ", "")
		End If

		getReplaceInput2=rtnString
	End Function

	Function fncDefault(s,ValDefault)
		If Not(IsNull(s) and IsEmpty(s)) Then
			If Trim(s&"") = "" Then
				fncDefault = ValDefault
			Else
				fncDefault = s
			End If
		Else
			fncDefault = ValDefault
		End If	
	End Function	

'--------------------------------------------------------------------
'// 자바 스크립 페이지 이동 처리 함수
'--------------------------------------------------------------------
	SUB MoveJavaAlert(msg, url)
		Dim str
		str = "<script type=""text/javascript"">" & vbcrlf 
		If Trim(msg&"")<>"" Then str = str & "alert('" & msg & "');" & vbcrlf
		str = str & "location.href='" & url & "';" & vbcrlf
		str = str & "</script>"
		response.write str
	End Sub

	Sub SubAdminSessionChk2(obj, admin_level, page_level)
		Dim message
		Dim blnLoginChk

		If Trim(obj&"") = "" Then
			blnLoginChk = -1
		Else
			If Int(admin_level) >= Int(page_level) Then
				blnLoginChk = 1
			Else
				blnLoginChk = 0
			End IF
		End If

		If blnLoginChk = 0 Then
			response.write "<script>alert('권한이 부족합니다.');history.back(-1);</script>"
			response.End
		ElseIf blnLoginChk = -1 Then
			response.write "<script>alert('권한이 부족합니다.');location.href='../admin/login.asp';</script>"
			response.End
		End IF

	End Sub
%>
