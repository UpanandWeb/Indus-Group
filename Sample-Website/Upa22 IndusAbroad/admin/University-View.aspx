<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="University-View.aspx.cs" Inherits="admin_University_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .bor {
            border: 1px solid gray;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <table width="100%" align="center">
        <tr>
            <td align="center" id="t" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Details of University" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green"> </asp:Label>
            </td>
        </tr>

        <tr>
            <td align="right">
                <asp:Button ID="Button1" runat="server" Text="All Universities" BackColor="#256EA4"
                    ForeColor="white" Font-Bold="true" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>

        <tr>
            <td align="center" width="100%">
                <table>
                    <tr>
                        <td align="center">
                            <table align="center" width="100%">
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" style="width: 45%" valign="top">University Name :<span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtname" runat="server" Width="250px" CssClass="bor" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">Country : <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddc" runat="server" Width="250px" Enabled="false">
                                            <asp:ListItem>Select Country </asp:ListItem>
                                            <asp:ListItem>USA</asp:ListItem>
                                            <asp:ListItem>CANADA</asp:ListItem>
                                            <asp:ListItem>AUSTRALIA</asp:ListItem>
                                            <asp:ListItem>UK</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">State : <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtstate" runat="server" Width="250px" Height="20px" Enabled="false" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">City : <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtcity" runat="server" Width="250px" Height="20px" Enabled="false" />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">Website URL : <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txturl" runat="server" Width="250px" Height="20px" Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">World Rank : <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtw" runat="server" Width="250px" Height="20px" Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 45%" valign="top">Country Rank : <span style="color: red;">*</span>
                                    </td>
                                    <td> 
                                        <asp:TextBox ID="txtc" runat="server" Width="250px" Height="20px" Enabled="false" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="Button5" runat="server" Text="Cancel" OnClick="Button5_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

