<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<!--#include virtual="/_lib/config.asp" -->
<!--#include virtual="/_lib/common.asp"-->
<!--#include virtual="/_lib/cMSSQL.asp"-->
<%

'//권한 체크
Call SubAdminSessionChk2(Session("id"), SESSION("level"), 0)

Dim strDepth01		: strDepth01 = "02"
Dim strDepthTitle	: strDepthTitle = "보도자료"
Dim strMode			: strMode = "I"

Dim nSeq
Dim keyword ,category

'-- 파라메터
nPage		= getReplaceInput(fncDefault(Request("page"),"1"),"")

category	= getReplaceInput(fncDefault(Request("category"),""),"")
keyword		= getReplaceInput(fncDefault(Request("keyword"),""),"")

nVnum		= getReplaceInput(fncDefault(Request("vnum"),""),"")
nSeq		= getReplaceInput(fncDefault(Request("seq"),""),"")

'//변수 숫자 처리
If Trim(nPage&"")<>"" Then Call f_NumericCheck(nPage)
If Trim(nSeq&"")<>"" Then Call f_NumericCheck(nSeq)

'-- 사용객체
Set objDb	= new cMSSQL

'// Error Check
If Trim(nSeq&"")<>"" Then

	strSQL = "Exec ADM_NOTICE_View '" & nSeq & "' "
	Set cmdRs = objDb.CmmReQuery(adCmdText, strSQL)

	If cmdRs.bof Or cmdRs.eof Then
		objDb.closeRs  cmdRs
		Set objDb = Nothing
		rtnString = DisplayJavaAlert("정보가 정확하지 않습니다.", "1")
		response.write rtnString
		response.End
	End If

	strTitle		= cmdRs("title")
	strMemo			= cmdRs("memo")
	nHits			= cmdRs("hit")
	nIsUrl			= cmdRs("isUrl")
	strSource		= cmdRs("source")
	strReg_dt		= cmdRs("reg_dt")

	strThMemo = "내용"
	if nIsUrl="1" Then strThMemo = "기사URL"
	strMode = "U"

	objDb.closeRs cmdRs
End If

' // 객체 연결 끊기
Set objDb	= Nothing

%>
<!--#include virtual="/admin/inc/inc_top.asp" -->
<script type="text/javascript">
	$(document).ready(function(){
		<% if nIsUrl<>"1" Then %>
		//$("#trSite1").hide();
		//$("#trSite2").hide();
		//$("#thMemo").html("내용");
		$("#thMemo").html("기사URL");
		<% end if %>

		$("#isUrl").click(function(){			

			if( $(this).attr("checked") ){
				//$("#trSite1").show();
				//$("#trSite2").show();
				$("#thMemo").html("기사URL");
			}else{
				//$("#trSite1").hide();
				//$("#trSite2").hide();
				//$("#thMemo").html("내용");
			}
		});
	});
</script>
		  <table width="680" border="0" cellpadding="0" cellspacing="0">
			<form name="frmWrite" method="post" action="notice_write_ok.asp" onsubmit="return fncInputNotice('<%=strMode%>')">
			<input type="hidden" name="page" id="page" value="<%=nPage%>" />
			<input type="hidden" name="seq" id="seq" value="<%=nSeq%>" />
			<input type="hidden" name="category" id="category" value="<%=req_category%>" />
			<input type="hidden" name="keyword" id="keyword" value="<%=req_keyword%>" />

              <tr> 
                <td height="10"><table width="680" border="0" cellspacing="0" cellpadding="0">
                    <tr bgcolor="dbdbdb"> 
                      <td height="2" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="173" height="27" bgcolor="fbfbfb" align="center">제목</td>
                      <td width="507" colspan="3">
							<input name="title" id="title" value="<%=strTitle%>" type="text" class="input_t" size="80" maxlength="250" />
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					<!--
                    <tr> 
                      <td width="173" height="27" bgcolor="fbfbfb" align="center">바로가기</td>
                      <td width="507" colspan="3">
							<input name="isUrl" id="isUrl" value="2" type="checkbox" class="input_t" <%=fncPrintSelected("1",nIsUrl," checked=""checked""")%> /><label for="isUrl">예</label>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb" id="trSite1"> 
                      <td height="1" colspan="4"></td>
                    </tr>
					-->
                    <tr id="trSite2"> 
                      <td width="173" height="27" bgcolor="fbfbfb" align="center">출처</td>
                      <td width="507" colspan="3">
							<input name="source" id="source" value="<%=strSource%>" type="text" class="input_t" size="80" maxlength="200" />
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="173" height="27" bgcolor="fbfbfb" align="center" id="thMemo"><%=strThMemo%></td>
                      <td width="507" colspan="3">
							<textarea name="memo" id="memo" cols="80" rows="20"><%=strMemo%></textarea>
                      </td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
                    <tr bgcolor="ebebeb"> 
                      <td height="1" colspan="4"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="15">&nbsp;</td>
              </tr>
              <tr> 
                <td><table width="101" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td><input type="image" src="./images/03_board/btn_ok.jpg" width="48" height="20" border="0"></td>
                      <td width="5">&nbsp;</td>
                      <td><a href="#" onclick="fncMovePageNotice('L','<%=nPage%>')"><img src="./images/03_board/btn_cancle.jpg" width="48" height="20" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
			  </form>
            </table>
<!--#include virtual="/admin/inc/inc_bottom.asp" -->
