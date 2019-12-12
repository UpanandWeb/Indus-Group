<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cert_login.aspx.cs" Inherits="Cert_login" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Cert_login</title>
    
    
        <script language="javascript" type="text/javascript">
	function alertsubmit()
{
alert("Please enter correct Username or Password!");
}
    </script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />             
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
   <tr>
    <td align="center" valign="top">
    <font size="5" color="blue"><strong>Digital Certificate Verification </strong></font>
    </td>
    </tr>
   <tr  width="100%">
   <td valign="top">
   <table align="center" border="0" cellspacing="2" cellpadding="2" class="text">
     <tr height="38">
     <td></td>
     </tr>
     <tr height="38">
     <td></td>
     </tr>
   <tr class="text" valign="bottom">
        <td width="98" align="right">
          <b><font color="#000000">User ID: </font></b>
        </td>
        <td width="225">
           <asp:TextBox ID="emailLogin" CssClass="tbox" Width="160px" MaxLength="40" runat="server"></asp:TextBox>
        </td>
   </tr>
   <tr class="text" valign="bottom">
        <td width="98" align="right">
           <b><font color="#000000">Password: </font></b>
        </td>
        <td width="225">
            <asp:TextBox ID="pass" CssClass="tbox" Width="160px" MaxLength="12" runat="server"
               TextMode="Password"></asp:TextBox>
        </td>
   </tr>
   <tr class="text">
        <td width="98" align="right" height="19">
             &nbsp;
        </td>
        <td width="225" height="36">
            <asp:Button ID="btnLogin" CssClass="but" Text="Login" runat="server" CausesValidation="False"
            OnClick="btnLogin_Click"  />
        </td>
   </tr>
   <tr class="text">
       <td id="tdmsg"  align="right" runat="server">
           
       </td>
   </tr>
    
    </table>
   </td>
   </tr> 
    </table>
    
    
    </form>
</body>
</html>

