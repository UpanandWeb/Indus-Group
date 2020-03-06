<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
    <div style="padding: 10px;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Login</h2>
                <br />

                <table width="100%" style="font-size: 16px;">
                    <tr>
                        <td>
                            <table width="100%" border="0" style="line-height: 25px">

                                    <tr>
                                    <td width="34%" align="center">
                                        <asp:Label ID="Label2" runat="server" Text="User Type *"></asp:Label></td>
                                    <td width="4%"><strong>:</strong></td>
                                    <td width="62%">
                                        <asp:DropDownList ID="dd" runat="server" Width="40%" CssClass="feed">
                                            <asp:ListItem>Select User Type</asp:ListItem>
                                            <asp:ListItem>Admin</asp:ListItem>
                                            <asp:ListItem>Counsellor</asp:ListItem>
                                            <asp:ListItem>Manager</asp:ListItem>
                                            <asp:ListItem>Student</asp:ListItem>
                       <%--                     <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>--%>

                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dd" ValidationGroup="feedback" ForeColor="Red"
                                            InitialValue="Select User Type"
                                            ErrorMessage="Please Select User Type" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                       
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td width="34%" align="center">
                                        <asp:Label ID="lblsername" runat="server" Text="User Name (Email ID) *"></asp:Label></td>
                                    <td width="4%"><strong>:</strong></td>
                                    <td width="62%">
                                        <asp:TextBox ID="txtusername" runat="server" Width="40%" CssClass="feed"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ValidationGroup="feedback" ForeColor="Red"
                                            ErrorMessage="Please enter User Name" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="Please Enter Valid Email Address" ForeColor="Red"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="feedback"
                                            ControlToValidate="txtusername" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblpwd" runat="server" Text="Password *"></asp:Label></td>
                                    <td><strong>:</strong></td>
                                    <td width="63%">
                                        <asp:TextBox ID="txtpwd" runat="server" CssClass="feed" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ValidationGroup="feedback" ForeColor="Red"
                                            ErrorMessage="Please enter Password" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" width="20%" valign="top" align="center">
                                        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" CssClass="btn btn-success" Text="Submit" ValidationGroup="feedback" />
                                        <asp:Button ID="cancelbtn" runat="server" Text="Cancel" OnClick="cancelbtn_Click" CssClass="btn btn-danger" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" >
                                        <asp:LinkButton ID="Label1" runat="server" Text="Forget Password" Font-Bold="true" PostBackUrl="Forget-Password.aspx"></asp:LinkButton></td>
                                    <td></td>
                                    <td width="63%" align="right">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Text="CLICK HERE FOR SIGN UP" Font-Bold="true" PostBackUrl="Student-Register.aspx"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

</asp:Content>

