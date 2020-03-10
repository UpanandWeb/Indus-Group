<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newemp_forgetpwd.aspx.cs" Inherits="newemp_forgetpwd" %>

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
      <br />
      <div style=" height:100px;"></div>
     <section class="about text-left" id="about">
   
    
   <table width="100%">
    <tr>
    <td></td>
    </tr>
   <tr >
        <td align="center" >
        <div >
        <table border="0" width="100%" align="center" cellpadding="2" cellspacing="2" style="width: 800px; height:600px;">
        <tr>
            <td colspan="2" align="center" class="heading"  style=" background-image:url(../Images/yellowmenubg_1.jpg); background-repeat:repeat-x; border:1px; height:25px; font-weight:bold; color:#fff" valign="top">Forget Password</td>
        </tr>
        <tr bgcolor="f5f5f5">
             <td colspan="2" align="center">
                 <font color="000099">Please enter your Email Id.</font>
             </td>
         </tr>
         <tr bgcolor="f5f5f5">
             <td align="right" width="40%">
                 <b>User Id:</b>
             </td>
             <td width="60%">
                <asp:TextBox ID="txtmail" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter EmailId"
                    ControlToValidate="txtmail" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Invalid EmailID" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator><!--<input type="text" name="ELID" maxlength="40">-->
             </td>
         </tr>
         <tr bgcolor="f5f5f5">
             <td>
                 <b>&nbsp;</b></td>
             <td>
                 Ex:<b>xxxx@xxxx.com</b>
             </td>
        </tr>
        <tr>
             <td colspan="2"><label> </label>
               <div align="center">
                  <asp:Button ID="submitbtn" runat="server"  Text="Submit" onclick="submitbtn_Click" />
                    &nbsp;&nbsp;
                  <asp:Button ID="cancelbtn" runat="server" Text="Cancel"  
                      ImageUrl="../Images/cancel_btn.gif"  onclick="cancelbtn_Click" CausesValidation="false"  />
                    &nbsp; &nbsp; &nbsp; &nbsp;
               </div>
             </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="f5f5f5">
                    <asp:Label ID="lblMsg" runat="server" CssClass="ErrMsg"></asp:Label>
            </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
      </table>
   </div>
        </td>
      </tr>
   </table>

    </section>
    <div>
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
