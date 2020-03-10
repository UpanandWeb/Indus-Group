<%@ Page Language="C#" AutoEventWireup="true" CodeFile="check_useravailable.aspx.cs" Inherits="check_useravailable" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table border="1">
                  <tr>
                    <td>UserName:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" AutoPostBack="true" ontextchanged="txtUsername_TextChanged"/>
                    </td>
                    <td>
                        <div id="checkusername" runat="server"  Visible="false">
                            <asp:Image ID="imgstatus" runat="server" Width="17px" Height="17px"/>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </div>
                    </td>
                  </tr>
                </table>
           </ContentTemplate>
       </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
