<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="University-Edit.aspx.cs" Inherits="admin_University_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                    <asp:Label ID="Label1" runat="server" Text="Post New University" CssClass="lblheading"
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
                <td></td>
            </tr>

            <tr>
                <td align="center" width="100%">
                    <table>
                        <tr>
                            <td align="center">
                                <table align="center" width="100%">
                                    <tr style="color: #000080; font-weight: bold;">
                                        <td colspan="2" id="chead" runat="server" align="center" style="font-size: 16px;">
                                            <%--                                            <asp:Label ID="lbl123" runat="server" Text=" Course"></asp:Label>--%>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td id="mand1" runat="server" align="right" colspan="3"><span style="color: red;">*</span><asp:Label ID="mand" runat="server" Text="Mark Fields are Mandatory"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">University Name :<span style="color: red;">*</span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtname" runat="server" Width="250px" CssClass="bor"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                 ErrorMessage="Please Enter Name" ControlToValidate="txtname" ValidationGroup="form" ForeColor="Red" ></asp:RequiredFieldValidator>

                                        </td>
                                    </tr>
                                        <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                      <tr>
                                        <td align="right" style="width: 45%" valign="top">Country : <span style="color: red;">*</span>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddc" runat="server" Width="250px">
                                                <asp:ListItem >Select Country </asp:ListItem>
                                                 <asp:ListItem>USA</asp:ListItem>
                <asp:ListItem>CANADA</asp:ListItem>
                <asp:ListItem>AUSTRALIA</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="ddc" ErrorMessage="Please Select country" ValidationGroup="form" ForeColor="Red" InitialValue="Select Country"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">State : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtstate" runat="server" Width="250px" Height="20px"  />
                                            <br />
                                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtstate" 
                                                ErrorMessage="Please Enter State" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                  
                                 <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">City : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtcity" runat="server" Width="250px" Height="20px" />
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcity" 
                                                ErrorMessage="Please Enter city" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                     <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">Website URL : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txturl" runat="server" Width="250px" Height="20px"  />
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txturl" 
                                                ErrorMessage="Please Enter URL" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">World Rank : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtw" runat="server" Width="250px" Height="20px"  />
                                            <br />
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" 
                                                ErrorMessage="Please Enter University" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">Country Rank : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtc" runat="server" Width="250px" Height="20px"  />
                                          <%--  <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtt" 
                                                ErrorMessage="Please Enter University" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>

                                  <tr><td><br /></td></tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnupload" runat="server" Text="Update" ValidationGroup="form" OnClick="btnupload_Click" />
                                            <asp:Button ID="Button5" runat="server" Text="Cancel"  OnClick="Button5_Click"/> <%--OnClientClick="javascript:history.go(-1)"--%> 
                                            <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="false" ValidationGroup="form" ShowSummary="false" />
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
