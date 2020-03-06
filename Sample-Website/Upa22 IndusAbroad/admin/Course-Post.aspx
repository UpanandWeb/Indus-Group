<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Course-Post.aspx.cs" Inherits="admin_Course_View" %>

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
                    <asp:Label ID="Label1" runat="server" Text="Post New Course" CssClass="lblheading"
                        Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green"> </asp:Label>
                </td>
            </tr>

            <tr>
                <td align="right">
                    <asp:Button ID="Button1" runat="server" Text="All Courses" BackColor="#256EA4"
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
                                        <td align="right" style="width: 45%" valign="top">Course Name :<span style="color: red;">*</span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cor" runat="server" Width="250px" CssClass="bor"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                 ErrorMessage="Please Select course Type" ControlToValidate="cor" ValidationGroup="form" ForeColor="Red" ></asp:RequiredFieldValidator>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">University : <span style="color: red;">*</span>
                                        </td>
                                        <td>

                                            <asp:TextBox ID="txtt" runat="server" Width="250px" Height="20px" AutoPostBack="true" />
                                            <%--<asp:Label ID="ext" runat="server" Text="Already Course is Exists" ForeColor="Red" Visible="false"></asp:Label>--%>
                                            <br />
                                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtt" 
                                                ErrorMessage="Please Enter University" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 45%" valign="top">Country : <span style="color: red;">*</span>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlcon" runat="server" Width="250px">
                                                <asp:ListItem >Select

                                                </asp:ListItem>
                                            </asp:DropDownList>
                                            <%--<asp:Label ID="Label2" runat="server" Text="Already Course is Exists" ForeColor="Red" Visible="false"></asp:Label>--%>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="ddlcon" ErrorMessage="Please Select country" ValidationGroup="form" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr id="fil1" runat="server">
                                        <td align="right" valign="top" style="width: 45%">Description : <span style="color: red;">*</span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtdescription" runat="server" Width="250px" TextMode="MultiLine" /><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ErrorMessage="Please Enter description" ControlToValidate="txtdescription" ValidationGroup="form" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />

                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Label ID="Label3" runat="server" Text="Course Added Successfully !" Font-Bold="true" ForeColor="Green" Visible="false"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnupload" runat="server" Text="Submit" ValidationGroup="form" OnClick="btnupload_Click" />
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


