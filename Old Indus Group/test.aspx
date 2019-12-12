<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
     
        <asp:Label ID="Label1" runat="server" Text="User"></asp:Label>   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>   <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />

        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />

        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </form>
</body>
</html>
