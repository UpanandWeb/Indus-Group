<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newemp.aspx.cs" Inherits="newemp" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
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

<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
 <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>
  <header id="header">
    <div class="container-fluide header-inner-wrap">
       <head:Header ID="Header1" runat="server"></head:Header>
    </div>
  </header>
  <section class="about text-left" id="about">
    <div class="container">
       <div class="row">
            <table align="center" >
                <tr>
                    <td height="650px">
                       <table border="0" width="100%"> 
                          <tr><td width="20px">&nbsp;</td></tr>    
      
                           <tr>
                              <td align="center" style="font-family: Tahoma, Geneva, sans-serif;font-size: 22px;font-weight: bold;color: #003366;background: url('images/innerbg.jpg') no-repeat;height: 40px;"> 
                                  New Employee Register
                              </td>
                           </tr>
                   
                           <tr><td><br /><br /></td></tr>  
                             
                           <tr>
                              <td align="center">
                                 <table width="100%" border="0">
                                   <tr>
                                      <td width="25%">
                                         <img src="images/regiter.jpg"  alt="REGISTER IMAGE" />
                                      </td>
                                      <td width="75%">
                                         <table border="0" width="100%">                        
                           <tr>
                           
                                <td valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                </td>
                                <td   valign="top" width="4px" class="style1"><strong>:</strong></td>
                                <td valign="top" align="left" style="padding-left:10px" width="400px" 
                                    class="style1">
                                    <asp:TextBox ID="txtfname" runat="server" Width="200px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                        ControlToValidate="txtfname" ErrorMessage="  Enter Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>

                                     <cc1:FilteredTextBoxExtender ID="sss" runat="server"  InvalidChars="1234567890~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                 TargetControlID="txtfname"></cc1:FilteredTextBoxExtender> 
                                </td>
                            </tr>
                           <tr><td colspan="3"><br /></td></tr>
                           <tr>
                                <td valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
                                </td>
                                <td  valign="top" class="style1" width="4px"><strong>:</strong></td>
                                <td valign="top" style="padding-left:10px">
                                    <asp:TextBox ID="txtlname" runat="server" Width="200px"  ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ControlToValidate="txtlname" ErrorMessage="  Enter Initial" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"  InvalidChars="1234567890~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                 TargetControlID="txtlname"></cc1:FilteredTextBoxExtender> 
                                </td>
                            </tr>
                           <tr><td colspan="3"><br /></td></tr>
                           <tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblusername" runat="server" Text="Email ID(User Name)"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td  valign="top" style="padding-left:10px">
                                    <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px"  
                                        ></asp:TextBox> <%--ontextchanged="txtusername_TextChanged" AutoPostBack="true"--%> 
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Display="Dynamic"
                                        ControlToValidate="txtusername" ErrorMessage="Enter Email Id" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator> 
                                          <asp:RegularExpressionValidator ID="reg1" runat="server" 
                                    ErrorMessage="Enter Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtusername" ValidationGroup="vendor" ForeColor="Red"></asp:RegularExpressionValidator> 
                                          <%--<asp:Image ID="imgcheck1" ImageUrl="~/Images/check.gif" runat="server" Width="17px" Height="17px" Visible="false"/>--%>
                                           <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>                              
                               </tr>
                           <tr><td colspan="3"><br /></td></tr>
                           <tr>
                                <td  valign="top" style="padding-right:15px" align="right" class="style4">
                                    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td  valign="top" style="padding-left:10px">
                                    <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" 
                                        ControlToValidate="txtpwd" ErrorMessage="  Enter Password" 
                                        Font-Size="Smaller" ValidationGroup="vendor"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                           <tr><td colspan="3"><br /></td></tr>
                           <tr>
                                <td  valign="top" style="padding-right:15px" align="right" class="style4">
                                    <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td  valign="top" style="padding-left:10px">
                                    <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px" 
                                        TextMode="Password"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" Display="Dynamic"
                                          ErrorMessage="Enter Confirm Password" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" 
                                        ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                                        ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="vendor"></asp:CompareValidator>
                                </td>
                            </tr> 
                           <tr><td colspan="3"><br /></td></tr>                        
                           <tr>
                                <td  valign="top" style="padding-right:15px" align="right" class="style4">
                                    <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px"  valign="top" >
                                    <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"  Display="Dynamic"
                                        ControlToValidate="txtphone" ErrorMessage="  Enter Phone Number." 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"  ></asp:RequiredFieldValidator>
                                      <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtphone"  ForeColor="Red" Display="dynamic"
                                            ErrorMessage="Enter Valid 10 digits number"  ValidationExpression="^[0-9]{10}$" ValidationGroup="RegForm1"></asp:RegularExpressionValidator>
                                                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars="~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="0123456789" TargetControlID="txtphone"></cc1:FilteredTextBoxExtender>
                                </td>
                            </tr> 
                           <tr><td colspan="3"><br /></td></tr>
                           <tr>
                                <td class="style1" valign="top" style="padding-right:15px" align="right" class="style4">
                                    &nbsp;
                                </td>
                                <td  valign="top">&nbsp;</td>
                                <td align="left"  >
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                                                    onclick="btnsubmit_Click" ValidationGroup="vendor" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnreset" runat="server" Text="Reset" 
                                                    onclick="btnreset_Click" />
                                </td>
                            </tr> 
                           <tr>
                                <td  align="center" class="style4">
                                    <table border="0" align="center" >
                                        <tr>
                                            <td>
                                            </td>
                                            <td></td>    
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                
                                </td>    
                            </tr>
                           <tr>
                                      <td class="style4">
                                          <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                      </td>
                                  </tr>
                       </table>
                                      </td>
                                   </tr>
                                </table>
                              </td>
                           </tr>
                           <tr><td height="300px">&nbsp;</td></tr>
                      </table>
                   </td>
                </tr>
            </table>
       </div>
    </div>
  </section>
    <div>
         <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
