<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-H4-CheckList.aspx.cs" Inherits="admin_Admin_H4_CheckList" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style>
        .sign {
  border: 0;
  outline: 0;
  background: transparent;
  border-bottom: 1px solid black;
}
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
            <tr width="100%">
                <td valign="top" width="100%" class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="30px" align="center">
                    <hr />
                </td>
            </tr>

            <tr>
                <td height="30px" align="center">
                   <asp:RadioButton ID="h1checklist"  runat="server" Text="H-1B PETITION CHECKLIST"  GroupName="h1b" OnCheckedChanged="h1checklist_CheckedChanged" AutoPostBack="true" />
                    <asp:RadioButton ID="h4application"  runat="server" Text="H4 APPLICATION CHECKLIST" Checked="true" GroupName="h1b" OnCheckedChanged="h4application_CheckedChanged"  AutoPostBack="true"/>
                    <asp:RadioButton ID="h1information"  runat="server" Text="H-1B INFORMATION SHEET"  GroupName="h1b" OnCheckedChanged="h1information_CheckedChanged" AutoPostBack="true"/>
                </td>
            </tr>
            <tr>
                <td height="30px" align="center">
                   
                </td>
            </tr>
            <tr>
                <td height="30px" align="center">
                    <h3>H4 APPLICATION CHECKLIST</h3>
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
 </table>
        <br /><br /><br />
    </form>
</body>
</html>
