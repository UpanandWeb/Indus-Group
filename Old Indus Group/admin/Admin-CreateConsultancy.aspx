<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-CreateConsultancy.aspx.cs" Inherits="admin_Admin_CreateConsultancy" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - TimeSheet</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/CSS3-digital-clock/index.html" />
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
</head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="tt" runat="server"></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" align="center">
                        <tr>
                            <td align="center" colspan="2" width="100%">
                                <font color='#003399' size='6pt'><b>Create Consultancy </b></font>
                            </td>
                        </tr>
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="25" colspan="2">
                                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="border: #dcdddf solid 1px;">
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="8px"></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" colspan="2">
                                                        <center>
                                                                    <table id="Table1" width="100%" runat="server">
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <table width="100%">
                                                                                       <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Company Name</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="CName" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtCName"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">First Name</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtFname" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtCName"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Designation</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtDesg" runat="server" Height="35px" Font-Size="18px" Width="240px">

                                                                                            </asp:TextBox><span style="font-family: Verdana; font-size: 16px"> (Ex:- CEO/Manger etc.)</span>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtTitle"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Email</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtMail" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtMail"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail"
                                                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Visa Status</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtstatus" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtUrl"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                            <%--<asp:RegularExpressionValidator ID="regular1" runat="server" ControlToValidate="txtUrl"
                                                                                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                     <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>
                                                                                      <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Skills </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtskill" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px" ></asp:TextBox>
                                                                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtFax"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>
                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                                                                    FilterType="Numbers" TargetControlID="txtFax">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFax"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>--%>

                                                                                        </td>

                                                                                    </tr>
                                                                                </table>
                                                                               
                                                                            </td>

                                                                           

                                                                            <td style="width: 40%">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle"> Last Name</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td height="30" align="left" valign="middle">
                                                                                            <asp:TextBox ID="txtLname" MaxLength="12" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>

                                                                                            <%--  <cc1:MaskedEditExtender ID="mskSuperPhone" runat="server"  TargetControlID="txtmobile"
                                                                                                  ClearMaskOnLostFocus ="false"  MaskType="None"   Mask="999-999-9999"  MessageValidatorTip="true" InputDirection="LeftToRight"
                                                                                                     ErrorTooltipEnabled="True">  </cc1:MaskedEditExtender>--%>

                                                                                            <%--                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="1" runat="server" ControlToValidate="txtmobile"
                                                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
                                                                                                <cc1:FilteredTextBoxExtender ID="fil12" runat="server" FilterType="Numbers" TargetControlID="txtmobile"></cc1:FilteredTextBoxExtender>
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtmobile"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{12}" >*</asp:RegularExpressionValidator>--%>
                                                                                            <%-- ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[\.| |\-]{0,1}|^[0-9]{3}[\.|\-| ]?)?[0-9]{3}(\.|\-| )?[0-9]{4}$" --%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Phone </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtph" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtWork"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>
                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                                                                    FilterType="Numbers" TargetControlID="txtWork">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtWork"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>--%>

                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Current Location </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtLoc" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtDirect"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>
                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                                                                    FilterType="Numbers" TargetControlID="txtDirect">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDirect"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>--%>

                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Remarks </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtRemark" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px" TextMode="MultiLine"></asp:TextBox>
                                                                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtFax"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>
                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                                                                    FilterType="Numbers" TargetControlID="txtFax">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFax"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>--%>

                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                            </center>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;<br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="100px" Height="50px" Text="Save" Font-Size="20px"
                                                                OnClick="btnsubmit_Click" />

                                                             <asp:Button ID="btnupdate"  runat="server" Width="100px" Height="50px" Text="Update" Font-Size="20px"
                                                                OnClick="btnupdate_Click" />
                                                             <asp:Button ID="btncancel"  runat="server" Width="100px" Height="50px" Text="Cancel" Font-Size="20px"
                                                                OnClick="btncancel_Click" />

                                                            <asp:ValidationSummary ID="val1" runat="server" ShowSummary="false" ValidationGroup="1" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
