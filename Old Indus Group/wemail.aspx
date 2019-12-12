<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wemail.aspx.cs" Inherits="wemail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:Label  ID="lblto" runat="server" Text="To" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtto" runat="server" width="300px" Height="30px" Font-Size="18px"></asp:TextBox>
            </td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            <td>
                <asp:Label  ID="lblcc" runat="server" Text="CC" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcc" runat="server" width="300px" Height="30px" Font-Size="18px"></asp:TextBox>
            </td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            <td>
                <asp:Label  ID="lblbcc" runat="server" Text="BCC" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtbcc" runat="server" width="300px" Height="30px" Font-Size="18px"> </asp:TextBox>
            </td>
        </tr>
        <tr><td><br /></td></tr>
         <tr>
            <td>
                <asp:Label  ID="lblsub" runat="server"  Text="Subject" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtsub" runat="server" width="300px" Height="30px" Font-Size="18px"></asp:TextBox>
            </td>
        </tr>
        <tr><td><br /></td></tr>

         <tr>
            <td>
                <asp:Label ID="lblmsg"  runat="server"  Text="Message" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtmsg" runat="server" width="300px" Height="30px" Font-Size="18px"></asp:TextBox>
            </td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            <td>
                <asp:Label ID="lblat"  runat="server"  Text="Attachment" Height="30px" Font-Size="18px"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadControl" runat="server" width="300px" Height="30px" Font-Size="18px"></asp:FileUpload>
            </td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            
            <td colspan="2" >
                <asp:Button ID="btnsend" runat="server" Text="Send" OnClick="btnsend_Click" Height="30px" Font-Size="18px" Width="60px"></asp:Button><br /><br />
            </td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            <td colspan="2">
                 <asp:Label  ID="lblsub1" runat="server"  Font-Size="18px" ></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
