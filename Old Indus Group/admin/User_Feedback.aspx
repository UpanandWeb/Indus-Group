<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Feedback.aspx.cs" Inherits="User_Feedback" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - UserFeedBack</title>
    
    
        <script language="javascript" type="text/javascript">
	function alertdelete()
{
alert("Selected FeedBack has been deleted Successfully");
}
function alertaccept()
{
alert("Selected FeedBack has been Accepted");
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
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
    
    
    </td>
    </tr>
    
    
    
  
    </table>
    
    
    </form>
</body>
</html>