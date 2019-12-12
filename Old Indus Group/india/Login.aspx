<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="../Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
   <title>:  : 1indus.com :  : </title>


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
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />

    <link href="../css/styles1.css" rel="stylesheet" type="text/css" />
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
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="../Images/login-banner.jpg"/></td></tr>
 <tr>
        <td  height="650px" align="center" valign="top"><table  height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td td width="180" valign="top" bgcolor="#EFEFEF" align="left"><table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">&nbsp;&nbsp;</span><span class="head-black">Corporate</span></span></td>
              </tr>
              <tr>
                <td height="12" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="12"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top"><a href="Corporate.aspx" class="sublink">Company Overview</a></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Management.aspx" class="sublink">Management</a></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
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
                <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">&nbsp;&nbsp;</span><span class="head-black">Careers</span></span></td>
              </tr>
              <tr>
                <td height="12" align="left" valign="top"><img src="../Images/spacer.gif" alt="spacer" width="1" height="12"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top"><a href="Careers.aspx" class="sublink">Overview</a></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top"><a href="Benefits.aspx" class="sublink">Benefits</a></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" class="sublink">Fulltime Jobs</a></td>
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
                    <td width="12" align="left" valign="middle"><img src="../Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Postyour_Resume.aspx" class="sublink">Post your Resume</a></td>
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
                 <%-- <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Employee_Newform.aspx" class="sublink">New Employee Form</a></td>
                  </tr>--%>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
            </table></td>
            <td width="5" align="right" valign="top">&nbsp;</td>
            <td width="863" align="right" valign="top" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2" align="left" valign="top" class="head-black" ><h3 style="color:#2471a3;">Logins</h3></td>
                </tr>
              <tr>
                <td height="2" colspan="2" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
                </tr>
              <tr>
                <td colspan="2" align="left" valign="top" width="100%" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="../Images/line_01.gif"><img src="../Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="../Images/line_02.gif" width="9" height="5"></td>
                    </tr>
                </table></td>
                </tr>
              <tr>
                <td colspan="2" align="left" valign="top">&nbsp;</td>
                </tr>
              <tr>
                <td width="33%" align="justify" valign="top">&nbsp;</td>
                <td width="67%" align="left" valign="top">
               
               <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>

               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                <table width="380" cellpadding="10" border="0" style="padding:10px">
                  <tr>
                    <td style="background:url(../Images/midial.png) repeat-x top; height:30px;"><font class="innertext" style="padding-left:5px; color:#ff0000">Login Form</font>
                      <div class="hright"></div></td>
                  </tr>
                  <!--- start the login tabs --->
                  <tr>
                    <td style="background:url(../Images/midiabg.png) repeat-x">
                      <table width="100%" border="0">
                        <tr>
                        <td width="34%">Login</td>
                        <td width="4%" style="padding-left:1px"><strong>:</strong></td>
                        <td width="62%">
                            <asp:DropDownList ID="ddllogin" runat="server" Width="150px" AutoPostBack="true" 
                                onselectedindexchanged="ddllogin_SelectedIndexChanged">
                                <asp:ListItem Value="Choose" Selected="True">--Choose--</asp:ListItem>
                                <asp:ListItem Value="Client">Client</asp:ListItem>
                                <asp:ListItem Value="Vendor">Vendor</asp:ListItem>
                                <asp:ListItem Value="Employee">Employee</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        </tr>
                        <tr><td colspan="3" height="5px"></td></tr>
                      </table>
                      <table width="100%" border="0" style="line-height:25px">
                        <tr>
                            <td width="34%"><asp:Label ID="lblsername" runat="server" Text="Email"></asp:Label></td>
                            <td width="4%"><strong>:</strong></td>
                            <td width="63%">
                            <asp:TextBox ID="txtusername" runat="server" Width="150px"></asp:TextBox>
                            <cc1:textboxwatermarkextender ID="TextBoxWatermarkExtender1" runat="server" Enabled="true"
                            TargetControlID="txtusername" WatermarkText="Enter Email Id" 
                                    WatermarkCssClass="watermarked"></cc1:textboxwatermarkextender>
                            </td>
                        </tr>
                        <tr><td colspan="3" height="5px"></td></tr>
                        <tr>
                            <td><asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label></td>
                            <td><strong>:</strong></td>
                            <td width="63%">
                            <asp:TextBox ID="txtpwd" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                            <cc1:textboxwatermarkextender ID="TextBoxWatermarkExtender2" runat="server" Enabled="true"
                            TargetControlID="txtpwd" WatermarkText="Enter Password" 
                                    WatermarkCssClass="watermarked"></cc1:textboxwatermarkextender>
                            </td>
                        </tr>
                        <tr><td colspan="3" height="5px"></td></tr>
                        <tr>
                            <td colspan="3" width="20%" valign="top" align="center">
                            <asp:ImageButton ID="btnlogin" runat="server" Height="22" ImageUrl="../Images/login.png"
                                OnClick="btnlogin_Click" OnClientClick="javascript:return Validate();" Width="45" />
                            </td>
                            <tr><td colspan="3" height="5px"></td></tr>
                             <tr>
                            <td colspan="3" width="20%" valign="top" align="center">
                               
                            </td>
                            
                          
                        </tr>
                          <tr>
                            <td colspan="3" width="20%" valign="top" align="center">
                               
                            </td>
                            
                          
                        </tr>
                        </table>
                        <asp:Panel ID="pnlclient" runat="server" Visible="false">
                            <table id="tblclient" width="100%" border="0" style="font-weight:normal">
                            <tr>
                                <td width="23%" height="52"><img src="../Images/Office-Client-Male-Light-icon.png" width="55" height="55" /></td>
                                <td width="57%">
                                <a href="client_forgot_pwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                              <%--  <a href="client_change_pwd.aspx" style="font-weight:normal">Change Password?</a><br />--%>
                               
                                </td>
                                <td>
                                 <asp:HyperLink ID="hyplnkcreg" NavigateUrl="Client_register.aspx" runat="server">Register</asp:HyperLink>
                                </td>
                            </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlvendor" runat="server" Visible="false">
                            <table id="tblvendor" width="100%" border="0" style="font-weight:normal">
                            <tr>
                                <td width="23%" height="52"><img src="../Images/vendor_icon.png" width="55" height="55" /></td>
                                <td width="57%">
                                <a href="vendor_forgot_pwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                              <%--  <a href="Vendor_change_pwd.aspx" style="font-weight:normal">Change Password?</a><br />--%>
                              <td> <asp:HyperLink ID="hyplnkvreg" NavigateUrl="vendor_register.aspx" runat="server">Register</asp:HyperLink></td>
                            </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlemployee" runat="server" Visible="false">
                            <table id="tblemployee" width="100%" border="0" style="font-weight:normal">
                            <tr>
                                <td width="23%" height="52"><img src="../Images/emplyee.png" width="55" height="55" /></td>
                                <td width="57%">
                                <a href="newemp_forgetpwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                               <%-- <a href="Emp_change_pwd.aspx" style="font-weight:normal">Change Password?</a><br />--%>
                               
                               </td><td>
                               <asp:HyperLink ID="Hyperreg" Visible="false" NavigateUrl="newemp.aspx" runat="server">Register</asp:HyperLink>
                                </td>
                            </tr>
                            </table>
                        </asp:Panel>
                    </td>
                  </tr>
                  <tr style="height:20px">
                     <td colspan="3" align="center"><asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                  <!--- end of the login tabs --->
                </table>
                   <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
                </td>
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
