<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Vendor.aspx.cs" Inherits="User_Vendor" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel -User_Vendor</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Vendor Details has been edited Successfully");
}
function alertdelete()
{
alert("Vendor Details has been deleted Successfully");
}
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>

    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    
    
  
    </table>
    
    
    </form>
</body>
</html>
