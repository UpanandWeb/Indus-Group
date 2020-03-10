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

                <table width="100%"  style="font-size:16px;">
              
                    <tr>
                      <td style="background:url(images/midiabg.png) repeat-x">
                        <table width="100%" border="0">
                          <tr>
                            <td width="34%" align="center">&nbsp;&nbsp;Select Catagory</td>
                            <td width="4%" style="padding-left:1px"><strong>:</strong></td>
                            <td width="62%" >
                                <asp:DropDownList ID="ddllogin" runat="server"  AutoPostBack="true" CssClass="feed"
                                    onselectedindexchanged="ddllogin_SelectedIndexChanged">
                                    <asp:ListItem Value="Choose" Selected="True">--Choose--</asp:ListItem>
                                    <asp:ListItem Value="Client">Client</asp:ListItem>
                                    <asp:ListItem Value="Vendor">Vendor</asp:ListItem>
                                    <asp:ListItem Value="Employee">Employee</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                          </tr>
                        </table>
                          <br />
                        <table width="100%" border="0" style="line-height:25px">
                            <tr>
                              <td width="34%" align="center"><asp:Label ID="lblsername" runat="server" Text="User Name"></asp:Label></td>
                              <td width="4%"><strong>:</strong></td>
                              <td width="62%"><asp:TextBox ID="txtusername" runat="server"  Width="40%" CssClass="feed"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><br /></td>
                            </tr>
                            <tr>
                              <td align="center"><asp:Label ID="lblpwd" runat="server" Text="Password" ></asp:Label></td>
                              <td><strong>:</strong></td>
                              <td width="63%"><asp:TextBox ID="txtpwd" runat="server"  CssClass="feed"
                                      TextMode="Password"></asp:TextBox></td>
                            </tr>
                            <tr><td><br /></td></tr>
                            <tr>
                              <td colspan="3" width="20%" valign="top" align="center">
                                   <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" CssClass="btn btn-success" Text="Submit"  OnClientClick="javascript:return Validate();" />
                  <asp:Button ID="cancelbtn" runat="server"  Text="Cancel"  onclick="cancelbtn_Click"  CssClass="btn btn-danger" />

                               <%--     <asp:ImageButton ID="btnlogin" runat="server" Height="22" ImageUrl="images/login.png"
                                        OnClick="btnlogin_Click" OnClientClick="javascript:return Validate();" Width="45" />--%>
                              </td>
                            </tr>
                         </table>

                         <table width="100%" border="0" style="line-height:25px">
                            <tr>
                                <td>
                                    <table width="100%" border="0" style="font-weight:normal">
                                       <tr>
                                         <td>
                                              <asp:Panel ID="pnlclient" runat="server" Visible="false">
                                                  <table id="tblclient" width="100%" border="0" style="font-weight:normal">
                                                    <tr>
                                                      <td width="23%" height="52"><%--<img src="images/Office-Client-Male-Light-icon.png" width="55" height="55" />--%></td>
                                                      <td width="57%">
                                                        <a href="Client-Forget-Pwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                                                        <a href="Client-Change-Pwd.aspx" style="font-weight:normal">Change Password?</a><br />
                                                        <a href="Client-Register.aspx" style="font-weight:normal">Register</a></td>
                                                    </tr>
                                                  </table>
                                              </asp:Panel>
                                         </td>
                                        </tr>
                                        <tr>
                                            <td>
                                              <asp:Panel ID="pnlvendor" runat="server" Visible="false">
                                                  <table id="tblvendor" width="100%" border="0" style="font-weight:normal">
                                                    <tr>
                                                      <td width="23%" height="52"><%--<img src="images/vendor_icon.png" width="55" height="55" />--%></td>
                                                      <td width="57%">
                                                        <a href="Vendor-Forget-Pwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                                                        <a href="Vendor-Change-Pwd.aspx" style="font-weight:normal">Change Password?</a><br />
                                                        <a href="Vendor-Register.aspx" style="font-weight:normal">Register</a></td>
                                                    </tr>
                                                  </table>
                                              </asp:Panel>
                                            </td>
                                       </tr>
                                       <tr>
                                            <td>                
                                              <asp:Panel ID="pnlemployee" runat="server" Visible="false">
                                                  <table id="tblemployee" width="100%" border="0" style="font-weight:normal">
                                                    <tr>
                                                      <td width="23%" height="52"><%--<img src="images/emplyee.png" width="55" height="55" />--%></td>
                                                      <td width="57%">
                                                        <a href="Employee-Forget-Pwd.aspx" style="font-weight:normal">Forgot Password?</a><br />
                                                        <a href="Employee-Change-Pwd.aspx" style="font-weight:normal">Change Password?</a><br />
                                                        <a href="Employee-Register.aspx" style="font-weight:normal">Register</a>

                                                        </td>
                                                    </tr>
                                                  </table>
                                              </asp:Panel>
                                            </td>
                                       </tr>
                                     </table>
                                </td>
                                
                            </tr>
                         </table>
                     </td>
                    </tr>
                    <tr>
                         <td><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <!--- end of the login tabs --->
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

</asp:Content>

