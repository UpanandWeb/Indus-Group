<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Corporate.aspx.cs" Inherits="Corporate" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
	 
  
  <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>Corporate IT Solutions | IT Business Solution | IT Service Provider | Information Technology Company</title>
      <style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<script src="jquery.js" type="text/javascript"></script>

<style media="screen" type="text/css">
    .defaultText { width: 300px; }
    .defaultTextActive { color: #a1a1a1; font-style: italic; }
</style>

<script language="javascript">
<!--
    $(document).ready(function () {
        $(".defaultText").focus(function (srcc) {
            if ($(this).val() == $(this)[0].title) {
                $(this).removeClass("defaultTextActive");
                $(this).val("");
            }
        });

        $(".defaultText").blur(function () {
            if ($(this).val() == "") {
                $(this).addClass("defaultTextActive");
                $(this).val($(this)[0].title);
            }
        });

        $(".defaultText").blur();
    });
//-->
</script>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">
         function SessionExpireAlert(timeout) {
             var seconds = timeout / 1000;
             document.getElementsByName("secondsIdle").innerHTML = seconds;
             document.getElementsByName("seconds").innerHTML = seconds;
             setInterval(function () {
                 seconds--;
                 document.getElementById("seconds").innerHTML = seconds;
                 document.getElementById("secondsIdle").innerHTML = seconds;
             }, 1000);
             setTimeout(function () {
                 //Show Popup before 20 seconds of timeout.
                 $find("mpeTimeout").show();
             }, timeout + 1 * 1000);
             setTimeout(function () {
                 window.location = "Default.aspx";
             }, timeout);
         };
         function ResetSession() {
             //Redirect to refresh Session.
             window.location = window.location.href;
         }
            </script> 

  

<style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
 </style>
</head>
<script type="text/javascript">
    function entries(val) {
        if (val == '') {
            window.location.href = "#";
        }
        else if (val == 'middle-east') {
            window.open('#', '_blank');
        }
        else {
            window.location.href = "#" + val;
        }

    }

</script>
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>

    <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
  </header>
  <div style="height:10px;"></div>
   <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/corporate1.jpg"/></td></tr>

    
      <tr>
        <td  height="650px" align="center" valign="top">
        <table height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  width="180" valign="top" bgcolor="#EFEFEF" align="left">

                    <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                  <tr><td><br /><br /></td></tr>
                                                        <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  
                    <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">
                        &nbsp;&nbsp;</span><span class="head-black" style="color:black;font-size:18px;">Overview</span></span></td>
                  </tr>
                </table></td>
              </tr>
                                                  <tr><td><br /></td></tr>

                       <tr>
                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top"><a href="Corporate.aspx"  style="color:black;font-size: 15px">Corporate</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
                  </tr>
                  <tr>
                    <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
                  </tr>
                  <tr>
                    <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="Management.aspx" style="color:black;font-size: 15px">Management</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
                  </tr>
                  <tr>
                    <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
                  </tr>
                  <tr>
                    <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="Indus_Vision.aspx" style="color:black;font-size: 15px">Indus Vision</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
                  </tr>
                  <tr>
                    <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
                  </tr>
                  <tr>
                    <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="news_events.aspx" style="color:black;font-size: 15px">News &amp; Events</a></td>
                      </tr>
                    </table></td>
                  </tr>

                </table>

            </td>
            <td width="5" align="right" valign="top">&nbsp;</td>
            <td width="863" align="right" valign="top" style="padding:10px;" >
             <table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>
                <td >&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="top" class="head-black" width="100%" ><h3 style="color:#2471a3;">Company <span>Overview</span></h3></td>
              </tr>
              <tr>
                <td height="5" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td height="400" valign="top"  width="100%"><div align="justify" style="padding-right:5px;"><h4>
Indus Group is a Global software development, Web design and development cum IT staffing services organization attuned to provide hassle-free quality solutions to our clients worldwide. Transparency is something which drives us to move forward because it is the transparent attitude of our organization that helps our clients to understand us in a more satisfying manner.
Indus GroupThe teams at Indus Group are a mix of technical and management candidates who are able to handle large scale software development and web design projects with ease, and also execute the project within a specified budget. Project handling is another important aspect as there are a defined number of steps that has to be executed in a flawless manner, in order to derive expected outcome from a particular IT Project.
IT staffing solutions is another area where Indus Group has got a good amount of expertise. No doubt, IT staffing requires candidates with specific skill sets, who are not only able to understand the recruitment process, but at same time, are able to communicate and negotiate the customers elegantly..
</h4>
                  <p>&nbsp;</p>
                 </div></td>
              </tr>
             
            </table></td>
          </tr>
         
      
        </table></td>
      </tr>
    
     </table>
     </div></div></section>
     <div>
     <foot:footer ID="foot1" runat="server" />
     </div>

    </form>
</body>
</html>
