<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="newsletter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - NewsLetters</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
    <tr>
    <td>
    News Letters
    </td>
    </tr>
    <tr><td>
    <asp:TextBox ID="newscontent" runat="server" Rows="20" Columns="100" TextMode="MultiLine"></asp:TextBox>
    </td></tr>
    <tr><asp:Label ID="lblerror" runat="server"></asp:Label></tr>
    <tr><td><asp:Button ID="btnview" runat="server" Text="View" OnClick="btnview_Click"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Back" onclick="Button1_Click"/>
    </td></tr>
    </table></div>
    <div id="maildata" runat="server"></div>
    <asp:Button ID="btnsend" runat="server" Text="Send Mail" onclick="btnsend_Click" />
    </form>
</body>
</html>
