<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndusAbroad :: Control Panel</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/style.css" rel="stylesheet" />
</head>

<body>
    <form id="main" runat="server" style="margin: 0 auto;">
        <div id="maindiv" class="mainmenu">
            <section class="container">
                <div style="margin-top: 35px; margin-left: 25px;">
                    <table width="100%" align="center">
                        <tr>
                            <td colspan="3">
                                <table width="90%" align="center">
                                    <tr>
                                        <td align="left" width="20%">
                                        <a href="Default.aspx">    <img src="images/indusabroad.png" alt="Logo" /></a>
                                        </td>
                                        <td align="right" width="80%">
                                            <img src="images/banneradmin.png" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="40%"  >
                                <asp:Label ID="lblusertype" runat="server" Text="User Type" CssClass="text4"></asp:Label>
                            </td>
                            <td align="center" width="10%" >
                                <strong>:</strong>
                            </td>
                            <td  width="50%" align="left">
                                <asp:DropDownList ID="ddlusertype" runat="server" Width="213px" Height="25px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Web Admin</asp:ListItem>
                                    <asp:ListItem>Supervisor</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="Select"
                                    ControlToValidate="ddlusertype" ErrorMessage="Plaese choose UserType" ForeColor="red"
                                    ValidationGroup="loginpage">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><br /></td>
                        </tr>
                        <tr>
                            <td align="right" width="40%" >
                                <asp:Label ID="lblusername" runat="server" Text="UserName" CssClass="text4"></asp:Label>
                            </td>
                            <td align="center" width="10%">
                                <strong>:</strong>

                            </td>
                            <td  width="50%" align="left">
                                <asp:TextBox ID="txtusername" runat="server" Width="211px" Height="25px" MaxLength="20"
                                    CssClass="mousehover"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="required1" runat="server" ControlToValidate="txtusername"
                                    ErrorMessage="Plaese Enter userName" ForeColor="red" ValidationGroup="loginpage">*</asp:RequiredFieldValidator><br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="40%" >
                                <asp:Label ID="Label1" runat="server" Text="Password" CssClass="text4"></asp:Label>

                            </td>
                            <td align="center" width="10%">
                                <strong>:</strong>
                            </td>
                            <td  width="50%" align="left">
                                <asp:TextBox ID="txtpassword" runat="server" TextMode="password" Width="211px" Height="25px" MaxLength="20" CssClass="mousehover"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="required2" runat="server" ControlToValidate="txtpassword"
                                    ErrorMessage="Plaese Enter password" ForeColor="red" ValidationGroup="loginpage">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><br /><br /></td>
                         </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="button1" runat="server" Text="Login" BackColor="#1249B9" ValidationGroup="loginpage"
                                    ForeColor="White" Font-Bold="true" OnClick="button1_Click"  Width="100px" Height="40px"/>
                                <asp:ValidationSummary ID="validation1" runat="server" ShowMessageBox="true"
                                    ShowSummary="false" ValidationGroup="loginpage" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
