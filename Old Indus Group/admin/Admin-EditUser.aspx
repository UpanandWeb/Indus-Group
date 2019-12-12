<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-EditUser.aspx.cs" Inherits="admin_Admin_EditUser" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Edit USer</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <script language="Javascript" type="text/javascript">
       <!--        Users_Information
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </script>

       <script type="text/javascript">
           function SessionExpireAlert(timeout) {
               var seconds = timeout / 1000;
               document.getElementsByName("secondsIdle").innerHTML = seconds;
               document.getElementsByName("seconds").innerHTML = seconds;
               setInterval(function () {
                   seconds--;
                   document.getElementById("seconds").innerHTML = seconds;
                   document.getElementById("secondsIdle").innerHTML = seconds;
               }, 1000);
               setTimeout(function () {
                   //Show Popup before 20 seconds of timeout.
                   $find("mpeTimeout").show();
               }, timeout + 1 * 1000);
               setTimeout(function () {
                   window.location = "Default.aspx";
               }, timeout);
           };
           function ResetSession() {
               //Redirect to refresh Session.
               window.location = window.location.href;
           }
            </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr width="998px">
                    <td valign="top" width='100%' class="lblog">
                        <table width="100%">
                            <tr>
                                <td>
                                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="20px"></td>
                </tr>

                <tr>
                    <td colspan="8" align="center">
                        <font size="5" color="#00277a"><strong>Edit Users</strong></font>

                    </td>
                </tr>
                <tr>
                    <td height="20px"></td>
                </tr>
                <tr>
                    <td>
                        <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
                        <table width="90%" align="center">
                            <tr>
                                <td class="datab" align="right" width="20%"><span style="font-size: 17px;">First Name</span>
                                </td>
                                <td width="5%">:</td>
                                <td align="left" width="20%">
                                    <asp:TextBox ID="txtedfname" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedfname" ErrorMessage="Please Enter First name"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter First name" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="datab" align="right" width="20%"><span style="font-size: 17px;">Last Name</span>
                                </td>
                                <td width="5%">:</td>
                                <td align="left" width="30%">
                                    <asp:TextBox ID="txtedlname" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedfname" ErrorMessage="Please Enter Last name"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Last name" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="datab" align="right"><span style="font-size: 17px;">Designation</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:DropDownList ID="ddleddesgn" runat="server" Width="183px" Height="29px">
                                    </asp:DropDownList>
                                </td>
                                <td class="datab" align="right"><span style="font-size: 17px;">Country</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:DropDownList ID="ddledcountry" runat="server" Width="183px" Height="29px">
                                        <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                        <asp:ListItem Value="India">India</asp:ListItem>
                                        <asp:ListItem Value="USA">USA</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true"
                                        ControlToValidate="ddledcountry" ErrorMessage="Please select Country"
                                        ValidationGroup="UserIdCreation1" InitialValue="Select Country">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="datab" align="right"><span style="font-size: 17px;">User</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtUserId" runat="server" OnTextChanged="txtUserId_TextChanged" AutoPostBack="true" Width="180px" Height="20px"></asp:TextBox>

                                            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td class="datab" align="right"><span style="font-size: 17px;">Password</span></td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedpwd" runat="server" Width="180px" Height="20px" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedpwd" ErrorMessage="Please Enter Password"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Password" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="datab" align="right"><span style="font-size: 17px;">Address</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedaddress" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedaddress" ErrorMessage="Please Enter Address"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Address" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="datab" align="right"><span style="font-size: 17px;">Mobile</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedmob" runat="server" Width="180px" Height="20px" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ControlToValidate="txtedmob" ErrorMessage="Please Enter Mobile Number"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Mobile Number" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="datab" align="right"><span style="font-size: 17px;">Contact Number</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedcontact" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="180px" Height="20px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedcontact" ErrorMessage="Please Enter Contact Number"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Contact Number" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="datab" align="right"><span style="font-size: 17px;">Email Id</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                    <asp:TextBox ID="txtedmail" runat="server" Width="180px" Height="20px" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" SetFocusOnError="true"
                                        ControlToValidate="txtedmail" ErrorMessage="Please Enter Email"
                                        ValidationGroup="UserIdCreation1" ToolTip="Please Enter Email" Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                 <tr>
                    <td height="20px"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table border="0" id="Table29">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Immigration Docs</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdimmy" runat="server" GroupName="gImmig" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdimmn"  runat="server" GroupName="gImmig" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr142" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr159" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label113" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox111" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox111_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr160" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label127" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox125" runat="server" OnCheckedChanged="CheckBox125_CheckedChanged"  AutoPostBack="true"/>
                                                                </td>
                                                            </tr>
                                                            <tr id="tr161" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label128" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox126" runat="server" OnCheckedChanged="CheckBox126_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr162" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label129" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox127" runat="server" OnCheckedChanged="CheckBox127_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr163" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label130" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox128" runat="server" OnCheckedChanged="CheckBox128_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr164" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label131" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox129" runat="server" OnCheckedChanged="CheckBox129_CheckedChanged" AutoPostBack="true"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table30" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Accounting Docs      </td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdaccy" runat="server" GroupName="gAcc" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="rdaccn"  runat="server" GroupName="gAcc" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr165" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr166" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label132" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox130" runat="server" OnCheckedChanged="CheckBox130_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr167" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label133" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox131" runat="server" OnCheckedChanged="CheckBox131_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr168" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label134" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox132" runat="server" OnCheckedChanged="CheckBox132_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr169" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label135" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td style="height: 20px; width: 100px;">
                                                                    <asp:CheckBox ID="CheckBox133" runat="server" OnCheckedChanged="CheckBox133_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr170" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label136" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox134" runat="server" OnCheckedChanged="CheckBox134_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr171" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label137" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox135" runat="server" OnCheckedChanged="CheckBox135_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table31" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">HR Docs     </td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdhry" runat="server" GroupName="gHR" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdhrn"  runat="server" GroupName="gHR" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr172" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr173" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label138" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox136" runat="server" OnCheckedChanged="CheckBox136_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr174" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label139" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox137" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox137_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr175" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label140" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox138" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox138_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr176" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label141" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox139" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox139_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr177" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label142" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox140" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox140_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr178" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label143" runat="server" Text="Approval" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox141" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox141_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table32" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">ARP Docs</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdarpy" runat="server" GroupName="gARP" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdarpn"  runat="server" GroupName="gARP" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr179" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr180" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label144" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox142" runat="server" OnCheckedChanged="CheckBox142_CheckedChanged" AutoPostBack="true" Font-Size="13px" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr181" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label145" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox143" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox143_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr182" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label146" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox144" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox144_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr183" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label147" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox145" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox145_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr184" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label148" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox146" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox146_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr185" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label149" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox147" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox147_CheckedChanged" />
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
                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table33" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Daily Reports   </td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rddailyy" runat="server" GroupName="gDR" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rddailyn" runat="server" GroupName="gDR" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr186" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr187" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label150" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox148" runat="server" OnCheckedChanged="CheckBox148_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr188" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label151" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox149" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox149_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr189" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label152" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox150" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox150_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr190" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label153" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td style="height: 20px; width: 100px;">
                                                                    <asp:CheckBox ID="CheckBox151" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox151_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr191" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label154" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox152" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox152_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr192" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label155" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox153" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox153_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table34" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Time & attendance      </td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdtimey" runat="server" GroupName="gLS" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdtimen"  runat="server" GroupName="gLS" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr193" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr194" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label156" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox154" runat="server" OnCheckedChanged="CheckBox154_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr195" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label157" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox155" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox155_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr196" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label158" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox156" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox156_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr197" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label159" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox157" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox157_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr198" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label160" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox158" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox158_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr199" runat="server">
                                                                <td class="datap5">
                                                                    <asp:Label ID="Label161" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox159" runat="server" Enabled="false" OnCheckedChanged="CheckBox159_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table35" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Excel Docs</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdexcely" runat="server" GroupName="gExcel" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="rdexceln"  runat="server" GroupName="gExcel" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr200" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr201" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label162" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox160" runat="server" OnCheckedChanged="CheckBox160_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr202" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label163" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox161" runat="server" OnCheckedChanged="CheckBox161_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr203" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label164" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox162" runat="server" OnCheckedChanged="CheckBox162_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr204" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label165" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox163" runat="server" OnCheckedChanged="CheckBox163_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr205" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label166" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox164" runat="server" OnCheckedChanged="CheckBox164_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr206" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label167" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox165" runat="server" OnCheckedChanged="CheckBox165_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table36" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Employee Docs</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdempy" runat="server" GroupName="gEmpDoc" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdempn"  runat="server" GroupName="gEmpDoc" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr207" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr208" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label168" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox166" runat="server" OnCheckedChanged="CheckBox166_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr209" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label169" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox167" runat="server" OnCheckedChanged="CheckBox167_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr210" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label170" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox168" runat="server" OnCheckedChanged="CheckBox168_CheckedChanged"  AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr211" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label171" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox169" runat="server" OnCheckedChanged="CheckBox169_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr212" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label172" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox170" runat="server"  OnCheckedChanged="CheckBox170_CheckedChanged"  AutoPostBack="true" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr213" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label173" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox171" runat="server" OnCheckedChanged="CheckBox171_CheckedChanged"  AutoPostBack="true" />
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
                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table37" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Word Documents</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdwordy" runat="server" GroupName="gWrdDoc" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdwordn"  runat="server" GroupName="gWrdDoc" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr214" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr215" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label174" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox172" runat="server" OnCheckedChanged="CheckBox172_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr216" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label175" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox173" runat="server" OnCheckedChanged="CheckBox173_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr217" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label176" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox174" runat="server" OnCheckedChanged="CheckBox174_CheckedChanged"  AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr218" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label177" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox175" runat="server" OnCheckedChanged="CheckBox175_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr219" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label178" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox176" runat="server"  OnCheckedChanged="CheckBox176_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr220" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label179" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox177" runat="server" OnCheckedChanged="CheckBox177_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table38" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Resumes</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdresumey" runat="server" GroupName="gResume" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="rdresumen"  runat="server" GroupName="gResume" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr221" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr222" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label180" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox178" runat="server" OnCheckedChanged="CheckBox178_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr223" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label181" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox179" runat="server" OnCheckedChanged="CheckBox179_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr224" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label182" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px"> 
                                                                    <asp:CheckBox ID="CheckBox180" runat="server" OnCheckedChanged="CheckBox180_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr225" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label183" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox181" runat="server" OnCheckedChanged="CheckBox181_CheckedChanged" AutoPostBack="true"  />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr226" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label184" runat="server" Text="Delete" Font-Size="13px"> </asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox182" runat="server" OnCheckedChanged="CheckBox182_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr227" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label185" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox183" runat="server" OnCheckedChanged="CheckBox183_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table1" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Employee List</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdempyes" runat="server" GroupName="employeelist" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="rdempno"  runat="server" GroupName="employeelist" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr1" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr8" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label3" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr9" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label4" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr10" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label5" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr11" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label6" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox4" runat="server" OnCheckedChanged="CheckBox4_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr12" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label7" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="CheckBox5_CheckedChanged" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table2" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">H1B List</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdh1byes" runat="server" GroupName="rdh1b" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="rdh1bno"  runat="server" GroupName="rdh1b" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr14" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr15" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label9" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox7_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr16" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label10" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox8" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox8_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr18" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label12" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox10" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox10_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr19" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label13" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox11" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox11_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table21" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Profile</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Profileyes" runat="server" GroupName="Profile" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Profileno" runat="server" GroupName="Profile" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr126" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr127" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label56" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox54" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox54_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr128" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label62" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox60" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox60_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr129" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label68" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox66" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox66_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr130" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label105" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox103" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox103_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr131" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label106" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox104" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox104_CheckedChanged" />
                                                                </td>
                                                            </tr>


                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table3" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Careers</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Careersyes" runat="server" GroupName="Careers" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="Careersno"  runat="server" GroupName="Careers" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr21" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr22" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label15" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox13" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox13_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr23" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label16" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox14" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox14_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr24" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label17" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox15" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox15_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr25" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label18" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox16" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox16_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr26" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label19" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox17" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox17_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table4" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Monthly TimeSheet</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="TimeSheetyes" runat="server" GroupName="TimeSheet" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="TimeSheetno"  runat="server" GroupName="TimeSheet" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr28" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr29" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label21" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox19_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr30" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label22" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox20" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox20_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr31" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label23" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox21" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox21_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table5" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Documents</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Documentsyes" runat="server" GroupName="Documents" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Documentsno"  runat="server" GroupName="Documents" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr35" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr36" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label27" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox25" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox25_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr37" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label28" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox26" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox26_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr38" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label29" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox27" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox27_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr40" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label31" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox29" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox29_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr41" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label32" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox30" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox30_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table6" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Seminars</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Seminarsyes" runat="server" GroupName="Seminars" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="Seminarsno"  runat="server" GroupName="Seminars" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr42" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr43" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label33" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox31" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox31_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr44" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label34" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox32" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox32_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr45" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label35" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox33" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox33_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr46" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label36" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox34" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox34_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr47" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label37" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox35" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox35_CheckedChanged" />
                                                                </td>
                                                            </tr>


                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table7" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Feedback</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Feedbackyes" runat="server" GroupName="Feedback" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Feedbackno"  runat="server" GroupName="Feedback" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr49" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr50" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label39" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox37" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox37_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr51" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label40" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox38" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox38_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr54" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label43" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox41" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox41_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table8" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Performance</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Performanceyes" runat="server" GroupName="Performance" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Performanceno"  runat="server" GroupName="Performance" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr56" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr59" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label47" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox45" runat="server" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table9" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Roles</td>
                                                    <td class="style4" style="width: 140px"> 
                                                        <asp:RadioButton ID="Rolesyes" runat="server" GroupName="Roles" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Rolesno"  runat="server" GroupName="Roles" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr63" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr64" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label51" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox49" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox49_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr65" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label52" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox50" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox50_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr66" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label53" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox51" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox51_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr68" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label55" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox53" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox53_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table10" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Company</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Companyyes" runat="server" GroupName="Company" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="Companyno"  runat="server" GroupName="Company" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr70" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr71" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label57" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox55" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox55_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr72" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label58" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox56" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox56_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr73" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label59" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox57" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox57_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr74" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label60" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox58" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox58_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr75" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label61" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox59" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox59_CheckedChanged" />
                                                                </td>
                                                            </tr>


                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table11" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Projects</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Projectsyes" runat="server" GroupName="Projects" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Projectsno"  runat="server" GroupName="Projects" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr77" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr78" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label63" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox61" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox61_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr79" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label64" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox62" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox62_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr80" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label65" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox63" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox63_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr81" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label66" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox64" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox64_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr82" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label67" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox65" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox65_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table12" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Departments</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Departmentsyes" runat="server" GroupName="Departments" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Departmentsno"  runat="server" GroupName="Departments" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr84" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr85" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label69" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox67" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox67_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr86" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label70" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox68" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox68_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr87" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label71" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox69" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox69_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr88" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label72" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox70" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox70_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr89" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label73" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox71" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox71_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table13" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Client</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Clientyes" runat="server" GroupName="Client" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Clientno"  runat="server" GroupName="Client" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr91" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr92" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label75" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
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
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table14" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Vendor</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Vendoryes" runat="server" GroupName="Vendor" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="Vendorno"  runat="server" GroupName="Vendor" Text="No" AutoPostBack="True" Font-Size="13px" />
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
                                                            <tr id="tr90" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label74" runat="server" Text="Status" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox72" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox72_CheckedChanged" />
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
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table15" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Appointments</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Appointmentsyes" runat="server" GroupName="Appointments" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Appointmentsno"  runat="server" GroupName="Appointments" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr105" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr106" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label87" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox85" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox85_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr107" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label88" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox86" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox86_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr108" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label89" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox87" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox87_CheckedChanged" />
                                                                </td>
                                                            </tr>


                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table16" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Pay Roll</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Pay_Rollyes" runat="server" GroupName="PayRoll" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Pay_Rollno"  runat="server" GroupName="PayRoll" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr112" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr113" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label93" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox91" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox91_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr114" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label94" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox92" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox92_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr115" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label95" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox93" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox93_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table17" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">News & Events</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="News_Eventsyes" runat="server" GroupName="News_Events" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="News_Eventsno"  runat="server" GroupName="News_Events" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr119" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr120" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label99" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox97" runat="server"
                                                                        AutoPostBack="true" OnCheckedChanged="CheckBox97_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr121" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label100" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox98" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox98_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr122" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label101" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox99" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox99_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr123" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label102" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox100" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox100_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr124" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label103" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox101" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox101_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table18" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Users</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Usersyes" runat="server" GroupName="Users" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Usersno"  runat="server" GroupName="Users" Text="No" AutoPostBack="True" Font-Size="13px" />
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
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table19" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Emp Contacts</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Emp_Contactsyes" runat="server" GroupName="Emp_Contacts" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Emp_Contactsno"  runat="server" GroupName="Emp_Contacts" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr39" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr48" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label26" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox24" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox24_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr52" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label30" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox28" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox28_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr53" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label38" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox36" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox36_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr55" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label41" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox39" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox39_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr57" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label42" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox40" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox40_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table20" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Support</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="Supportyes" runat="server" GroupName="Support" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="Supportno"  runat="server" GroupName="Support" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr60" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr61" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label45" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox43" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox43_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr76" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label50" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox48" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox48_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr83" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label54" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox52" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox52_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table22" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Daily Timesheet</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rddailyy2" runat="server" GroupName="Daily" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true" />
                                                        <asp:RadioButton ID="rddaiilyn"  runat="server" GroupName="Daily" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr58" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr62" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label44" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox42" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox42_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr67" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label46" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox44" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox44_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr97" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label49" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox47" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox47_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr104" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label80" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox78" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox78_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table23" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Invoicing</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdInvoicingy" runat="server" GroupName="Invoicing" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdInvoicingn"  runat="server" GroupName="Invoicing" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr110" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr111" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label90" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox88" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox88_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr116" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label91" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox89" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox89_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr117" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label92" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox90" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox90_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr118" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label96" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox94" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox94_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr125" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label97" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox95" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox95_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table24" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Principles</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdpriny" runat="server" GroupName="Principles" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdprinn"  runat="server" GroupName="Principles" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr132" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr133" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label98" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox96" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox96_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr134" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label104" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox102" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox102_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr69" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label48" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox46" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox46_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr135" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label107" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox105" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox105_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table25" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Calender</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdcalendery" runat="server" GroupName="Calender" Text="Yes" AutoPostBack="True" Font-Size="13px"  Checked="true"/>
                                                        <asp:RadioButton ID="rdcalendern"  runat="server" GroupName="Calender" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr136" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr137" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label108" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox106" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox106_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr138" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label109" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox107" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox107_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr139" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label110" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox108" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox108_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr140" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label111" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox109" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox109_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr141" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label112" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox110" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox110_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table26" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Reports</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdreportsy" runat="server" GroupName="Reports" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdreportsn"  runat="server" GroupName="Reports" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr143" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr144" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label114" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox112" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox112_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr145" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label115" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox113" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox113_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr146" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label116" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox114" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox114_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr147" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label117" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox115" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox115_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr148" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label118" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox116" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox116_CheckedChanged" />
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

                <tr>
                    <td colspan="8" align="center">
                        <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table27" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Salary Stmt</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdSalaryy" runat="server" GroupName="Salary" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdSalaryn"  runat="server" GroupName="Salary" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr149" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr150" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label119" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox117" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox117_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr151" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label120" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox118" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox118_CheckedChanged" />
                                                                </td>
                                                            </tr>

                                                            <tr id="tr152" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label121" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox119" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox119_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr109" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label86" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox84" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox84_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="datab" width="25%" valign="top">
                                            <table id="Table28" border="0">
                                                <tr>
                                                    <td class="datab" style="width: 140px; font-size: 14px;">Current Resumes</td>
                                                    <td class="style4" style="width: 140px">
                                                        <asp:RadioButton ID="rdcurrenty" runat="server" GroupName="Current" Text="Yes" AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                        <asp:RadioButton ID="rdcurrentn"  runat="server" GroupName="Current" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                                <tr id="tr153" runat="server">
                                                    <td colspan="2" style="padding-left: 10px">
                                                        <table border="0">
                                                            <tr id="tr154" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label122" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox120" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox120_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr155" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label123" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox121" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox121_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr156" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label124" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox122" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox122_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr157" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label125" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox123" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox123_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr id="tr158" runat="server">
                                                                <td class="datap5" align="left">
                                                                    <asp:Label ID="Label126" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                </td>
                                                                <td class="style4" style="width: 100px">
                                                                    <asp:CheckBox ID="CheckBox124" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox124_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                         <td class="datab" width="25%" valign="top">                  
                                                    <table id="tablecheck"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">H1B Checklist</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdChecklistyes" runat="server" GroupName="Checklist" Text="Yes"    AutoPostBack="True" Font-Size="13px" Checked="true"/>
                                                                <asp:RadioButton ID="rdChecklistno"  runat="server" GroupName="Checklist" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr2" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr3" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label1" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox184" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox184_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr4" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label2" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox185" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox185_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr5" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label186" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox186" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox186_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr6" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label187" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox187" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox187_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr7" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label188" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox188" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox188_CheckedChanged"/>
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

                <tr>
                    <td align="center" style="padding-top: 15px;">
                        <asp:Button ID="btnsave" runat="server" Text="Update" ValidationGroup="UserIdCreation1" OnClick="btnsave_Click" Font-Size="18px" Width="70px" Height="25px" />&nbsp;&nbsp;
              <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Font-Size="18px" Width="70px" Height="25px"  /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
