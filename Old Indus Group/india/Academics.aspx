<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Academics.aspx.cs" Inherits="india_Academics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="../Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
	 
  
  <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title> Corporate IT Solutions | IT Business Solution | IT Service Provider | Information Technology Company</title>
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

    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />

    <link href="../css/styles1.css" rel="stylesheet" type="text/css" />



  

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
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="../Images/software.jpg"/></td></tr>

    
      <tr>
        <td  height="650px" align="center" valign="top">
        <table height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <%--<td td width="180" valign="top" bgcolor="#EFEFEF" align="left"><table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  
                    <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">&nbsp;&nbsp;</span><span class="head-black">Software</span></span></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="12" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="12"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="hd1"><a href="Corporate.aspx"  class="sublink">Company Overview</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="../images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Management.aspx" class="sublink">Management</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="../images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Indus_Vision.aspx" class="sublink">Indus Vision</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="news_events.aspx" class="sublink">News &amp; Events</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
            </table></td>--%>
  <%--          <td width="5" align="right" valign="top">&nbsp;</td>--%>
            <td width="100%" align="right" valign="top">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>
                <td >&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top" class="head-black" width="100%" ><h3 style="color:#2471a3;"><span>Academic</span></h3></td>
              </tr>
              <tr>
                <td height="5" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="../Images/line_01.gif"><img src="../Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="../Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td height="400" valign="top"  width="100%"><div align="justify"><h4>When it comes to providing concrete academic based solutions, then Indus Group has the right solution for you. Currently we have got our Academic software, which is being currently used by schools in AP and Telangana. This software has been designed keeping in perspective the ongoing needs of a school regardless of its size and scale.<br />
Some information about our software product has been provided. IndusEdu management software is an exclusive and reliable software for schools, typically built to manage the huge and varied functions of a school in an easy and effective manner. By implementing the right technologies and a robust approach towards streamlining the school management model, this product is going to be highly rewarding for schools worldwide.   




</h4>


                   <h3> Benefits you can derive:</h3>

<h4>	Easily update, edit, modify or delete your departmental information.<br />
	Secure your vital data.<br />
	Find multiple solutions at a single platform.<br />
	Maintain huge amounts of data flawlessly.<br />
	Make important business decisions.<br />
	Refine your business processes.<br />
	An effective pathway to communicate between teachers and students.<br />
	Schedule important events and maintain student information effectively.<br />
	Optimize the power of Sms and send notifications and other important information to various classes.<br />
	Easily track, manage and maintain all your school related expenses.<br />
	Easily enhance and update your school activities.</h4>

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
