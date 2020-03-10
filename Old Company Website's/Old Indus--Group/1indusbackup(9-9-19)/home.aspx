<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <h1 align="center"> WELCOME :::: </h1><br /><br />
<center> <asp:Label ID="lblDisplayUserName" runat="server" Font-Size="X-Large"></asp:Label><br /><br />
<asp:Button ID="killall" runat="server" Text="Log Out" onclick="killall_Click" />
</center>
    </div>
    </form>
</body>
</html>
