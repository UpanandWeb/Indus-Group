<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Edit-User.aspx.cs" Inherits="Admin_Admin_Edit_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="dd" runat="server"></asp:ScriptManager>

          <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                    <tr>
                        <td height="30px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table width="100%" align="center">
                                <tr>
                                    <td align="center" colspan="2" width="100%">
                                        <font color='#003399' size='5pt'><b>Create User</b></font>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" width="40%">
                                        <asp:LinkButton ID="lnkback" Text="Back" runat="server" OnClick="lnkback_Click" Font-Size="18px"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10px">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>
                                        <table width="100%" border="0" id="create" runat="server">
                                            <tr>
                                                <td class="datab" align="right" width="25%">
                                                    <span style="font-size: 17px;">First Name</span>
                                                </td>
                                                <td width="5%">:</td>
                                                <td align="left" width="20%">
                                                    <asp:TextBox ID="txtFName" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                                </td>
                                                <td class="datab" align="right" width="10%">
                                                    <span style="font-size: 17px;">Last Name</span>
                                                </td>
                                                <td width="5%">:</td>
                                                <td align="left" width="35%">
                                                    <asp:TextBox ID="txtLName" runat="server" Width="180px" Height="20px"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvFName" runat="server" ForeColor="Red"
                                                        ErrorMessage="Please enter First Name" ControlToValidate="txtFName"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvLName" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtLName" ErrorMessage="Please enter Last Name"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Designation</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlUserType" runat="server" Width="183px" Height="29px">
                                                        <asp:ListItem>Select User Type</asp:ListItem>
                                                        <asp:ListItem>Accounts</asp:ListItem>
                                                        <asp:ListItem>Admin</asp:ListItem>
                                                        <asp:ListItem>Attorney</asp:ListItem>
                                                        <asp:ListItem>CEO</asp:ListItem>
                                                        <asp:ListItem>Client</asp:ListItem>
                                                        <asp:ListItem>Consultant</asp:ListItem>
                                                        <asp:ListItem>Contractor</asp:ListItem>
                                                        <asp:ListItem>CPA</asp:ListItem>
                                                        <asp:ListItem>Employee</asp:ListItem>
                                                        <asp:ListItem>Employer</asp:ListItem>
                                                        <asp:ListItem>HR</asp:ListItem>
                                                        <asp:ListItem>Manager</asp:ListItem>
                                                        <asp:ListItem>Operation Manager</asp:ListItem>
                                                        <asp:ListItem>Recruiter</asp:ListItem>
                                                        <asp:ListItem>Vendor</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Country</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlCountry" runat="server" Width="183px" Height="29px">
                                                        <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                                        <asp:ListItem Value="India">India</asp:ListItem>
                                                        <asp:ListItem Value="USA">USA</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvddlUserType" runat="server" ForeColor="Red"
                                                        ControlToValidate="ddlUserType" ErrorMessage="Please select designation"
                                                        ValidationGroup="UserIdCreation" InitialValue="Select User Type"></asp:RequiredFieldValidator>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                        ControlToValidate="ddlCountry" ErrorMessage="Please select Country"
                                                        ValidationGroup="UserIdCreation" InitialValue="Select Country"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">User </span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtUserId" runat="server" OnTextChanged="txtUserId_TextChanged" AutoPostBack="true"
                                                                Width="180px" Height="20px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 15px">

                                                    <asp:RequiredFieldValidator ID="rfvtxtUserId" runat="server" Display="Dynamic" ForeColor="Red"
                                                        ControlToValidate="txtUserId" ErrorMessage="Please enter User"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>

                                                <%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                                                        ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx" Display="Dynamic"
                                                        ControlToValidate="txtUserId"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>--%>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Password</span></td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtPwd" runat="server"  Width="180px" Height="20px"></asp:TextBox>

                                                </td>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Confirm Password</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtconPwd" runat="server"  Width="180px" Height="20px"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtPwd" ErrorMessage="Please enter password"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rftxtconPwd" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtconPwd" ErrorMessage="Please Confirm Password"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator><br />
                                                    <asp:CompareValidator ID="cmvalPwd" runat="server"
                                                        ErrorMessage="Please enter password correctly" ControlToCompare="txtPwd"
                                                        ControlToValidate="txtconPwd" ValidationGroup="UserIdCreation"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Address</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtAddress" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                                </td>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Mobile</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtMobile" runat="server" Width="180px" Height="20px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;&nbsp; Eg:9xxxxxxxxx                               
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvtxtAddress" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtAddress" ErrorMessage="Please enter address"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtMobile" ErrorMessage="Please enter mobile number"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Contact Number</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtConNumber" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="180px" Height="20px"></asp:TextBox>
                                                </td>
                                                <td class="datab" align="right">
                                                    <span style="font-size: 17px;">Email Id</span>
                                                </td>
                                                <td>:</td>
                                                <td align="left">

                                                    <asp:TextBox ID="txtEmailId" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvtxtConNumber" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtConNumber" ErrorMessage="Please enter contact number"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td align="left" style="height: 5px">
                                                    <asp:RequiredFieldValidator ID="rfvtxtEmailId" runat="server" ForeColor="Red"
                                                        ControlToValidate="txtEmailId" ErrorMessage="Please enter Email Id"
                                                        ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="rfvEmailid" runat="server" ForeColor="Red"
                                                        ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx"
                                                        ControlToValidate="txtEmailId"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>

                                                </td>
                                            </tr>



                                            <tr>
                                                <td>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" align="center">
                                                    <table>
                                                        <tr>
                                                            <td colspan="6" align="center">
                                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                                    <ContentTemplate>
                                                                        <table border="0">
                                                                            <tr>

                                                                                <td class="datab" width="30%" valign="top">
                                                                                    <table id="Table13" border="0">
                                                                                        <tr>
                                                                                            <td class="datab" style="width: 140px; font-size: 14px;">Post News/Work</td>
                                                                                            <td class="style4" style="width: 140px">
                                                                                                <asp:RadioButton ID="Clientyes" runat="server" GroupName="Client" Text="Yes" Checked="true" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Clientyes_CheckedChanged" />
                                                                                                <asp:RadioButton ID="Clientno"  runat="server" GroupName="Client" Text="No" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Clientno_CheckedChanged" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="tr91" runat="server">
                                                                                            <td colspan="2" style="padding-left: 10px">
                                                                                                <table border="0">
                                                                                                    <tr id="tr92" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label75" runat="server" Text="Select All"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox73" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox73_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr93" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label76" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox74" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox74_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr94" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label77" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox75" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox75_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr95" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label78" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox76" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox76_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr96" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label79" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox77" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox77_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>


                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>

                                                                                <td class="datab" width="30%" valign="top">
                                                                                    <table id="Table14" border="0">
                                                                                        <tr>
                                                                                            <td class="datab" style="width: 140px; font-size: 14px;">Gallery/Events</td>
                                                                                            <td class="style4" style="width: 140px">
                                                                                                <asp:RadioButton ID="Vendoryes" runat="server" GroupName="Vendor" Checked="true" Text="Yes" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Vendoryes_CheckedChanged" />
                                                                                                <asp:RadioButton ID="Vendorno"  runat="server" GroupName="Vendor" Text="No" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Vendorno_CheckedChanged" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="tr98" runat="server">
                                                                                            <td colspan="2" style="padding-left: 10px">
                                                                                                <table border="0">
                                                                                                    <tr id="tr99" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label81" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox79" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox79_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr100" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label82" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox80" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox80_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr101" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label83" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox81" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox81_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr102" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label84" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox82" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox82_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr id="tr103" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label85" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox83" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox83_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>


                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td class="datab" width="30%" valign="top">
                                                                                    <table id="Table18" border="0">
                                                                                        <tr>
                                                                                            <td class="datab" style="width: 140px; font-size: 14px;">Users</td>
                                                                                            <td class="style4" style="width: 140px">
                                                                                                <asp:RadioButton ID="Usersyes" runat="server" GroupName="Users" Checked="true" Text="Yes" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Usersyes_CheckedChanged" />
                                                                                                <asp:RadioButton ID="Usersno"  runat="server" GroupName="Users" Text="No" AutoPostBack="True" Font-Size="13px" OnCheckedChanged="Usersno_CheckedChanged" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="tr13" runat="server">
                                                                                            <td colspan="2" style="padding-left: 10px">
                                                                                                <table border="0">
                                                                                                    <tr id="tr17" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label8" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox6" runat="server"
                                                                                                                AutoPostBack="true" OnCheckedChanged="CheckBox6_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr20" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label11" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox9" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox9_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr27" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label14" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox12" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox12_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr32" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label20" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox18" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox18_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr id="tr33" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label24" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox22" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox22_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr id="tr34" runat="server">
                                                                                                        <td class="datap5" align="left">
                                                                                                            <asp:Label ID="Label25" runat="server" Text="Status" Font-Size="13px"></asp:Label>
                                                                                                        </td>
                                                                                                        <td class="style4" style="width: 100px">
                                                                                                            <asp:CheckBox ID="CheckBox23" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox23_CheckedChanged" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="height: 50px" align="center">
                                                    <asp:Button ID="btnCreate" runat="server" Text="Update User"
                                                        OnClick="btnCreate_Click" ValidationGroup="UserIdCreation" Font-Size="18px" Width="120px" Height="25px" />

                                                    <asp:Button ID="Button1" runat="server" Text="Cancel " Font-Size="18px" Width="80px" Height="25px"
                                                        OnClick="Button1_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
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

