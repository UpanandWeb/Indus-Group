<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeSheet_Mail.aspx.cs" Inherits="TimeSheet_Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
      <link rel="stylesheet" href="Styles/stylesheet.css" />   
</head>
<body>
    <form id="form1" runat="server">
    <table width="1000">
    <tr>
    <td width="100">&nbsp;</td>
    <td id="tdcontent" runat="server" align="left" width="800px" class="lable">
       
    </td>
    <td width="100"> &nbsp;</td>
    </tr>
    <tr>
    <td width="100"><asp:Label ID="lblmail" runat="server"></asp:Label></td>
  
       
    
  
    </tr>
    <tr>
    <td colspan="3" align="center">
        <asp:Button ID="maillbtn" runat="server" Text="Submit" 
            onclick="maillbtn_Click" />
    </td>
    
    
    </tr>
    
    </table>
    </form>
</body>
</html>
