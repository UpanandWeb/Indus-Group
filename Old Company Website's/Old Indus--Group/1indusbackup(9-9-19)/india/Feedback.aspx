<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
 <%@ Register  TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>


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

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />
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
    <div class="container">
     <div class="row">
     <br />
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="../Images/conpfeedback.jpg"/></td></tr>
 <tr>
        <td   height="650px" align="center" valign="top"><table  height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
        <td  height="650px" align="center" valign="top"><table width="100%"  height="650px" border="0" align="center" cellpadding="0" cellspacing="0">
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
                    <td align="left" valign="top" class="mainhead"><a href="Management.aspx" >Management</a></td>
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
                 <!-- <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Employee_Newform.aspx" class="sublink">New Employee Form</a></td>
                  </tr>-->
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
                <td align="left" valign="top" class="head-black"><h3 style="color:#2471a3;">Feedback</h3></td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="../Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
                <td align="justify" valign="top"><table width="100%" border="0">
                  <tr>
                    <td width="58%" align="center" valign="top"><img src="../Images/feedback.jpg" width="322" height="307"></td>
                    <td width="2%">&nbsp;</td>
                    <td width="40%"  style="background:#F4F4F4; border:1px solid #666; padding:5px 10px 10px 10px;"><table width="75%" cellpadding="3" cellspacing="5"   align="center">
              <tbody>
                
                <tr>
                  <td width="29%" align="center"> Name </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield32" id="fname" runat="server" />--%>
                      <asp:TextBox ID="txtfname" runat="server" Width="180px"></asp:TextBox>
                       <%--<asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtfname"
                                ErrorMessage="Enter Name" ValidationGroup="feedform">*</asp:RequiredFieldValidator>--%>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtfname" ForeColor="Red" Text="*" ValidationGroup="feedform"></asp:RequiredFieldValidator>
                   <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtfname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Last Name </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield32" id="fname" runat="server" />--%>
                      <asp:TextBox ID="txtNname" runat="server" Width="180px"></asp:TextBox>
                      
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left"> <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtNname"
                                ErrorMessage="Enter Last Name" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>                        
                      <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtNname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Organization</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="phno" runat="server"  />--%>
                    <asp:TextBox ID="txtorg" runat="server" Width="180px"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtorg"
                                ErrorMessage="Enter Organisation name" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>
                </tr>
                    <tr>
                  <td width="29%" align="center">Address</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="phno" runat="server"  />--%>
                    <asp:TextBox ID="txtaddr" TextMode="MultiLine" runat="server" Width="180px" Height="50px"
                               ></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                       <asp:RequiredFieldValidator ID="rfvtxtaddr" runat="server" ControlToValidate="txtaddr"
                                ErrorMessage="Enter address" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>
                </tr>
                <tr>
                  <td width="29%" align="center">Country</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="email" runat="server"  />--%>
                   <asp:Dropdownlist ID="country" runat="server" Width="184px" 
                                >
                                <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                               </asp:Dropdownlist>
                  </td>
                </tr>
                 <tr>
                    <td colspan="2"></td>
                    <td align="left">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select country" 
                              ControlToValidate="country" InitialValue="Select Country" 
                                        ValidationGroup="feedform" ForeColor="Red" >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                  <td width="29%" align="center">Tel No</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="email" runat="server"  />--%>
                   <asp:TextBox ID="txttel" runat="server" MaxLength="10" onkeypress="return isNumberKey(event)" Width="180px"></asp:TextBox>
                  </td>
                </tr>
                 <tr>
                    <td colspan="2"></td>
                    <td align="left">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttel"
                                ErrorMessage="Enter Mobile Number" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                  <td width="29%" align="center">E-Mail</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="email" runat="server"  />--%>
                   <asp:TextBox ID="txtemail" runat="server" Width="180px"></asp:TextBox>
                   
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="Please Enter Valid Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail" Font-Size="Smaller" 
                  ValidationGroup="feedform" ForeColor="Red">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  
                                    ErrorMessage="Please Enter Your Email Address." ControlToValidate="txtemail"  
                                    Font-Size="Smaller" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Kindly describe your requirements </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                     <asp:TextBox ID="txtdec" runat="server" Height="50px" Width="180px" TextMode="MultiLine"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Description"  
                                     ControlToValidate="txtdec" ValidationGroup="feedform" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                  <td colspan="3" align="center">
                  <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6LcCWvMSAAAAAD1zl9Tz8o0tdxtltjLoicVwXBhG"
                   BackColor="WhiteSmoke" PrivateKey="6LcCWvMSAAAAAGDEDPzv8l083xM9Ayf353jYwiwG" Theme="clean" />
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                   
                       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter image text"  
                                     ControlToValidate="txtCapcha" ValidationGroup="feedform">*</asp:RequiredFieldValidator>--%>
                  
                    </td>
                </tr>
                <tr>
                  <td align="center" colspan="3"><asp:Button ID="btnsubmit" 
                    runat="server" Text="Submit" onclick="btnsubmit_Click" ValidationGroup="feedform" Width="80px" />&nbsp;&nbsp;
                      <asp:Button ID="btnreset" runat="server" Text="Reset" onclick="btnreset_Click"  CausesValidation="false" Width="80px"/></td>
                </tr>
                 <tr>
                    <td colspan="3" align="center">
                        <asp:ValidationSummary ID="valsumm" runat="server" ShowMessageBox="true" ShowSummary="false"
                              ValidationGroup="feedform" />
                    </td>
                </tr>
                <tr><td colspan="3" align="center"><asp:Label ID="lblerror" runat="server" ></asp:Label></td></tr>
              </tbody>
            </table></td>
                  </tr>
                </table>
                  <p>&nbsp;</p>
                  <p><br>
              </p></td>
              </tr>
             
            </table></td>
          </tr>
         
      
        </table></td>
      </tr>
         
      
        </table></td>
      </tr>
   
 
</table>
    
    </div></div>
    <div >
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>