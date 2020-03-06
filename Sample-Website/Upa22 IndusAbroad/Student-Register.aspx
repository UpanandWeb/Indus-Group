<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Student-Register.aspx.cs" Inherits="Student_Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .feed {
            width: 40%;
            border: 1px solid gray;
            border-radius: 4px;
            padding: 4px 0px 4px 10px;
            background-position: 10px 5px;
            background-repeat: no-repeat;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
            height: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="ss" runat="server"></cc1:ToolkitScriptManager>
    <div style="padding: 10px;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Student Registration</h2>
                <br />

                <table width="100%" style="font-size: 16px;">

                    <tr>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td align="center" width="80%">
                            <table width="80%" border="0">
                                <tr>
                                    <td width="45%" align="right">
                                        <img src="img/regiter.jpg" alt="REGISTER IMAGE" />
                                    </td>
                                    <td width="55%" align="left">
                                        <table border="0" width="100%" align="center">
                                            <tr>

                                                <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>
                                                <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtfname" runat="server" Width="230px" CssClass="feed"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                        ControlToValidate="txtfname" ErrorMessage="  Enter Name"
                                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>

                                                    <cc1:FilteredTextBoxExtender ID="sss" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                        ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                        TargetControlID="txtfname">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                 <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>

                                                  <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtlname" runat="server" Width="230px" CssClass="feed"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                        ControlToValidate="txtlname" ErrorMessage="  Enter Initial"
                                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                        ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                        TargetControlID="txtlname">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="lblusername" runat="server" Text="Email ID(User Name)"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>

                                                  <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtusername" runat="server" Width="230px" CssClass="feed" a></asp:TextBox>
                                                    <%--ontextchanged="txtusername_TextChanged" AutoPostBack="true"--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                        ControlToValidate="txtusername" ErrorMessage="Enter Email Id"
                                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="reg1" runat="server" Display="Dynamic" Font-Size="Smaller"
                                                        ErrorMessage="Enter Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ControlToValidate="txtusername" ValidationGroup="vendor" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <%--<asp:Image ID="imgcheck1" ImageUrl="~/Images/check.gif" runat="server" Width="17px" Height="17px" Visible="false"/>--%>
                                                    <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>

                                                 <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtpwd" runat="server" Width="230px" CssClass="feed" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtpwd" ErrorMessage="  Enter Password"
                                                        Font-Size="Smaller" ValidationGroup="vendor"></asp:RequiredFieldValidator>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>

                                                  <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtconfirmpwd" runat="server" Width="230px" CssClass="feed"
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" Display="Dynamic" Font-Size="Smaller"
                                                        ErrorMessage="Enter Confirm Password" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" Display="Dynamic"
                                                        ErrorMessage="Confirm Password is incorrect." Font-Size="Smaller" ValidationGroup="vendor"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                 <td valign="top" align="right" width="40%">
                                                    <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                                </td>
                                                <td valign="top" width="10%" align="center"><strong>:</strong></td>

                                                 <td valign="top" align="left" width="50%">
                                                    <asp:TextBox ID="txtphone" runat="server" Width="230px" CssClass="feed" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" Display="Dynamic"
                                                        ControlToValidate="txtphone" ErrorMessage="  Enter Phone Number."
                                                        Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtphone" ForeColor="Red" Display="dynamic" Font-Size="Smaller"
                                                        ErrorMessage="Enter Valid 10 digits" ValidationExpression="^[0-9]{10}$" ValidationGroup="vendor"></asp:RegularExpressionValidator>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,."
                                                        ValidChars="0123456789" TargetControlID="txtphone">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style1" valign="top" style="padding-right: 15px" align="right" class="style4">&nbsp;
                                                </td>
                                                <td valign="top">&nbsp;</td>
                                                <td align="left">
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success"
                                                        OnClick="btnsubmit_Click" ValidationGroup="vendor" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnreset" runat="server" Text="Reset"
                                         OnClick="btnreset_Click" CssClass="btn btn-danger" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="style4">
                                                    <table border="0" align="center">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="300px">&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

</asp:Content>

