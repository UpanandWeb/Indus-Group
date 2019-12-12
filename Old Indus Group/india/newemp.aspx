<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newemp.aspx.cs" Inherits="newemp" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>



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
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
     <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server"></head:Header>
    </div>
    </header>
    <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
    <table>
    <tr>
        <td height="650px">
<table border="0" width="100%"> 
   <tr><td width="20px">&nbsp;</td></tr>    
      
                <tr>
                    <td align="center" style="font-family: Tahoma, Geneva, sans-serif; font-size: 18px;  font-weight: bold;
        color: #003366;    background: url('../Images/innerbg.jpg') no-repeat;height: 32px;"> New Employee Register</td>
                </tr>
                     <tr>
                         <td><br /></td>
                     </tr>  
                <tr>

                     <td align="center">
                     <table width="100%" border="0">
      <tr>
   <%--   <td width="25%"></td>--%>
      <td ><img src="../Images/regiter.jpg"  /></td>
        <td>
                        <table border="0" width="100%">                        
                          <%--<tr>
                           <td height="30" colspan="3" ><font class="crentopenings"><b>New Employee Register</b></font></td>
                          </tr>--%>
                           <tr>
                           
                                <td valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                </td>
                                <td   valign="top" width="4px" class="style1"><strong>:</strong></td>
                                <td valign="top" align="left" style="padding-left:10px" width="400px" 
                                    class="style1">
                                    <asp:TextBox ID="txtfname" runat="server" Width="200px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                        ControlToValidate="txtfname" ErrorMessage="Please enter Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                        ControlToValidate="txtlname" ErrorMessage="Please enter Lastname" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                             <tr><td colspan="3"><br /></td></tr>
                             <tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblusername" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td  valign="top" style="padding-left:10px">
                                    <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px"  AutoPostBack="true"
                                        ontextchanged="txtusername_TextChanged" ></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator> 
                                          <asp:RegularExpressionValidator ID="reg1" runat="server" 
                                    ErrorMessage="Please Enter Valid Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtusername" 
                  ValidationGroup="vendor" ForeColor="Red">*</asp:RegularExpressionValidator> 
                                          <asp:Image ID="imgcheck1" ImageUrl="../Images/check.gif" runat="server" Width="17px" Height="17px" Visible="false"/>
                                           <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>                              
                                </td>
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
                                        ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
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
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd"
                                          ErrorMessage="*" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" 
                                        ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                                        ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="vendor">*</asp:CompareValidator>
                                </td>
                            </tr> 
                             <tr><td colspan="3"><br /></td></tr>                        
                            <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanyname" runat="server" Text="Company Name"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>
                           
                            <%--<tr>
                                <td   valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanymailid" runat="server" Text="Company Mail ID"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Please Enter Valid Email Address" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="vendor">*</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtcompanymailid" ValidationGroup="vendor">*
                                    </asp:RequiredFieldValidator>    
                                </td>
                            </tr>--%>
                            <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                        ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>
                          
                            <tr>
                                <td  valign="top" style="padding-right:15px" align="right" class="style4">
                                    <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td class="style1" valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px"  valign="top" >
                                    <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                        ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"  >*</asp:RequiredFieldValidator>
                                </td>
                            </tr> 
                             <tr><td colspan="3"><br /></td></tr>
                            <tr><td class="style4">&nbsp;</td></tr>
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
          <td class="style4"><asp:Label ID="lblmsg" runat="server"></asp:Label></td>
          </tr>
                        </table>
                    </td>
                     <td width="25%"></td>
                     <%--<td width="350px" align="center" valign="middle" ></td>  --%>         
                </tr>
       <tr><td height="370px">&nbsp;</td></tr>
      
                </table>
                </td>
                </tr></table></div>
    </div></section>
    <div>
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
