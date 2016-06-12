<%@ Language = "VBScript" CodePage = 65001 %>
<%
	Response.CharSet = "UTF-8"
	Session.CodePage = 65001
%>
<%
Dim site_link
site_link = "/"

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>＃ 관리자 ＃</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./inc/admn_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./inc/jquery-1.7.2.js"></script>
<script type="text/javascript" src="./inc/common.js"></script>
<script type="text/javascript" src="./inc/admn.js"></script>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body onLoad="MM_preloadImages('images/login_btn_ov.jpg')">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="right"><img src="images/login_top.jpg" width="106" height="71" border="0" usemap="#Map"></div></td>
  </tr>
  <tr>
    <td height="419"><table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center"><b>관리자</b><!-- img src="images/login_01.jpg" width="1000" height="108" border="0" usemap="#Map3" //-->
		    <map name="Map3">
              <area shape="rect" coords="366,24,635,84" href="<%=site_link%>" target="_blank">
            </map></td>
        </tr>
        <tr> 
          <td height="203"><table width="265" border="0" align="center" cellpadding="0" cellspacing="0">
              <form name="frmWrite" id="frmWrite" action="./logon.asp" method="post">
              <tr> 
                <td><img src="images/login_03.jpg" width="64" height="50"></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="33"><input name="id" type="text" class="input_log" size="17" maxlength="20"></td>
                    </tr>
                    <tr>
                      <td height="33"><input name="pwd" type="password" class="input_log" size="17" maxlength="20" onKeypress="enterCheck(document.frmWrite)"></td>
                    </tr>
                  </table></td>
                <td width="10">&nbsp;</td>
                <td><a href="#" onClick="CheckLogin(document.frmWrite)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','images/login_btn_ov.jpg',1)"><img src="images/login_btn.jpg" name="Image6" width="62" height="62" border="0"></a></td>
              </tr>
              </form>
            </table></td>
        </tr>
        <tr> 
          <td><img src="images/login_02.jpg" width="1000" height="108"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="bottom"><div align="center"><img src="./images/sub_footer.jpg" width="1000" height="66" border="0" usemap="#Map2"></div></td>
  </tr>
</table>
<map name="Map">
  <area shape="rect" coords="7,33,84,67" href="<%=site_link%>" target="_blank">
</map>
</body>
</html>
