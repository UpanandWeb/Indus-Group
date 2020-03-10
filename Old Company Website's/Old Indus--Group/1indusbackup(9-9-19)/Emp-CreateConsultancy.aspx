<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-CreateConsultancy.aspx.cs" Inherits="Emp_CreateConsultancy" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .headings2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 15px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 15px;
        }

        .headings3 {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
        }

        .style2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 18%;
        }

        .style3 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 19%;
        }

        .AlgRgh {
            text-align: right;
            /*font-family:Verdana, Arial, Helvetica, sans-serif;*/
        }

        .style4 {
            height: 20px;
        }

        .style5 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 5px;
        }

        th {
            text-align: center !important;
        }
    </style>


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
                window.location = "Login.aspx";
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
        <cc1:ToolkitScriptManager ID="tt" runat="server"></cc1:ToolkitScriptManager>

        <div class="container-fluide header-inner-wrap">
            <head:Header ID="Header1" runat="server" />
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <br />
                <br />
                <br />
                <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
            </div>
            <br />
            <br />


            <table width="100%" align="center">
                <tr>
                    <td align="center" width="100%" colspan="2">
                        <font color='#003399' size='6pt'><b>Create Consultancy</b></font>
                    </td>
                </tr>
                 <tr>
                                <td height="25" colspan="2">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border: #dcdddf solid 1px;">
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
                                                        <td>&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                 
                                                    <tr>
                                                        <td height="8px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;<br /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="100px" Height="50px" Text="Save" Font-Size="20px"
                                                                OnClick="btnsubmit_Click" />
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
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>

    </form>
</body>
</html>
