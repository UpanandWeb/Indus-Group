<%@ Page Language="C#" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="services" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
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

</head>
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
 
    <style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
     </style>
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
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/conservices.jpg"/></td></tr>
 <tr>
        <td   height="650px" align="center" valign="top"><table  height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
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
            <td width="863" align="right" valign="top" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <%-- <tr>
                <td >&nbsp;</td>
              </tr>--%>
              <tr>
            <td align="center" valign="top" class="head-black">	<h3 style="color:#2471a3;">Services</h3><span class="head-red"></span></td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
                <td height="400" align="justify" valign="top" width="100%" ><div align="justify">
                   
             <h3> Web design and Development:</h3>
<h4>In today’s online business world, a website says a lot about the company’s ongoing business functions. It depends upon the company how well they design their website and thereby uplift their credibility levels.</h4>
<h4>Indus Group is specialized in offering customized web design and development solutions to our website needy clients. Color combinations, exceptional template designs, seamless content writing, displaying almost all the company functionalities in an easy to understand manner, is something where our web design team excels at.</h4>
<h3>Staffing and recruitment:</h3>
<h4>IT Staffing and recruitment services is another sphere, where we have decent amount of expertise. Providing specific candidates to a particular organization and that too with the relevant candidature and other pertinent credentials requires a definite amount of understanding in the current HR processes.</h4>
<%--<h3>International Ticketing:</h3>
<h4>We have a separate team of skilled, experienced and dedicated professionals comprising of travel agents and online 
    ticketing executives who are well-versed in booking flight tickets both nationally and internationally. Apart from Online
     ticket booking, our executives will book hotel rooms and make other specific arrangements as per your need for your safe 
    stay. Rest assured, you can expect the best of travels and tours services form our caring and committed team.</h4>--%>
</div></td>
              </tr>
             
            </table></td>
          </tr>
         
      
        </table></td>
      </tr>
   
 
</table>
    
    </div></div></section>
    <div >
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
