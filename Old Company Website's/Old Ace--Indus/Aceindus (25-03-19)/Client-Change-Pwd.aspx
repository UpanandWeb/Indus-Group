<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Client-Change-Pwd.aspx.cs" Inherits="Client_Change_Pwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .feed1 {
            width: 60%;
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
                <h2 style="text-align: center;">Client Change Password</h2>
                <br />
                <table align="center" width="90%">
                    <tr>
                        <td width="40%" align="right">
                            <asp:Label ID="lblemail" runat="server" Text="Email ID "></asp:Label><span style="color:red;">*</span>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                        <td width="40%" align="left">
                            <asp:TextBox ID="email" runat="server" CssClass="feed1" Width="250px" > </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="r1" ForeColor="Red"
                                ControlToValidate="email" ErrorMessage="Enter Email ID"  ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                  <tr><td  style="height:2px;">&nbsp;</td></tr>
                    <tr>
                        <td width="40%" align="right">
                            <asp:Label ID="lbluname" runat="server" Text="User Name"></asp:Label><span style="color:red;">*</span>
                        </td>
                         <td width="10%" align="center"><strong>:</strong></td>
                         <td width="40%" align="left">
                            <asp:TextBox ID="txtuname" runat="server" CssClass="feed1" Width="250px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"  ForeColor="Red"
                                ErrorMessage="Enter User Name"   ValidationGroup="r1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr><td  style="height:2px;">&nbsp;</td></tr>
                    <tr>
                      <td width="40%" align="right">
                            <asp:Label ID="lbloldpwd" runat="server" Text="Old Password "></asp:Label><span style="color:red;">*</span>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                          <td width="40%" align="left">
                            <asp:TextBox ID="oldpassword" runat="server" CssClass="feed1"  TextMode="Password" Width="250px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="oldpassword" ForeColor="Red"
                                 ErrorMessage="Enter Old Password"  ValidationGroup="r1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr><td  style="height:2px;">&nbsp;</td></tr>
                 
                    <tr>
                       <td width="40%" align="right">
                            <asp:Label ID="lblnewpwd" runat="server" Text="New Password "></asp:Label><span style="color:red;">*</span>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                        <td style="width: 249px; height: 20px;">
                            <asp:TextBox ID="newpassword" runat="server" CssClass="feed1"  TextMode="Password" Width="250px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="newpassword" ValidationGroup="r1" ForeColor="Red"
                                ErrorMessage="Enter New Password" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr><td  style="height:2px;">&nbsp;</td></tr>
                   
                    <tr>
                        <td width="40%" align="right">
                            <asp:Label ID="lblcnfpwd" runat="server" Text="Confirm Password "></asp:Label><span style="color:red;">*</span>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                          <td width="40%" align="left">
                            <asp:TextBox ID="confirmpassword" runat="server" CssClass="feed1"  TextMode="Password" Width="250px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpassword" ValidationGroup="r1" ForeColor="Red"
                                ErrorMessage="Enter Confirm Password" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                  
                    <tr>
                        <td colspan="3" align="center">
                            <label></label>
                            <div align="center">
                                <asp:Button ID="ImageButton1" runat="server" CssClass="btn btn-success" Text="Submit"  ValidationGroup="r1"
                                    OnClick="ImageButton1_Click" />
                                <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" CssClass="btn btn-danger" Text="Reset" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label><br>
                            <asp:Label ID="lblerror" runat="server" Height="17px" Width="246px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>

