<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-CreateVendor.aspx.cs" Inherits="Emp_CreateVendor" %>

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
                        <font color='#003399' size='6pt'><b>Create Vendor</b></font>
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
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Name of Firm :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                <asp:TextBox ID="txtname" Width="240px" runat="server" Height="35px" Font-Size="18px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtname" ValidationGroup="1"
                                                                            ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Tax ID : </td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;&nbsp;<asp:TextBox ID="txtTax" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="1" runat="server" ControlToValidate="txtTax"
                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr><td height="4px"></td></tr>--%>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Select Employee :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                <asp:DropDownList ID="ddemp" Width="242px" runat="server" Height="35px" Font-Size="18px" OnSelectedIndexChanged="ddemp_SelectedIndexChanged"
                                                                    AutoPostBack="true">
                                                                    <asp:ListItem>Select Employee</asp:ListItem>
                                                                </asp:DropDownList>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddemp" ValidationGroup="1"
                                                                            ErrorMessage="Select Employee" InitialValue="Select Employee">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Employee ID :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                         <asp:TextBox ID="txtid" Width="240px" runat="server" Height="35px" Font-Size="18px" ReadOnly="true"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Starting Date :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                               <asp:TextBox ID="txtstart" Width="240px" runat="server" Height="35px" Font-Size="18px" ></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtstart" ValidationGroup="1"
                                                                            ErrorMessage="Enter Start Date">*</asp:RequiredFieldValidator>--%>
                                                                         <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtstart"></cc1:CalendarExtender>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Invoice Cycle :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                <asp:DropDownList ID="ddcycle" Width="242px" runat="server" Height="35px" Font-Size="18px">
                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                   <asp:ListItem  Text="Online" />
                                                    <asp:ListItem  Text="Bi Weekly" />
                                                    <asp:ListItem  Text="Weekly" />
                                                    <asp:ListItem  Text="Semi Monthly" />
                                                    <asp:ListItem  Text="Monthly" />
                                                                </asp:DropDownList>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddcycle" ValidationGroup="1"
                                                                            ErrorMessage="Select Invoice Cycle" InitialValue="Select">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Select Rate Type :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                              <asp:DropDownList ID="ddrate" Width="240px" runat="server" Height="35px" Font-Size="18px">
                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                    <asp:ListItem  Text="Hourly"  Value="0"/>
                                                                   <asp:ListItem  Text="Day Wise" Value="1" />
                                                                </asp:DropDownList>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle"></td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                      <asp:TextBox ID="TextBox2" Width="240px" runat="server" Height="35px" Font-Size="18px"  BorderStyle="None" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <%--  <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Select Rate Type :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                               
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle"></td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Hour Rate ($) :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                               <asp:TextBox ID="txthour" Width="240px" runat="server" Height="35px" Font-Size="18px" ></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txthour" ValidationGroup="1"
                                                                            ErrorMessage="Enter Hour Rate">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">OT Rate ($)  :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                      <asp:TextBox ID="txtot" Width="240px" runat="server" Height="35px" Font-Size="18px" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Net Period :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                               <asp:TextBox ID="txtnet" Width="240px" runat="server" Height="35px" Font-Size="18px" ></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtname" ValidationGroup="1"
                                                                            ErrorMessage="Enter Net Period">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Used Email :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                <asp:TextBox ID="txtuser" Width="240px" runat="server" Height="35px" Font-Size="18px" Enabled="false"></asp:TextBox>
                                                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtuser" ValidationGroup="1"
                                                                            ErrorMessage="Enter User Name">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td colspan="2" align="center">
                                                            <table width="80%" align="center">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Remarks(%) :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                        <asp:DropDownList ID="txtremarks" runat="server" Width="240px"  Height="30px" Font-Size="18px">
                                                                            <asp:ListItem>Select</asp:ListItem>
                                                                            <asp:ListItem>80 * 20 %</asp:ListItem>
                                                                            <asp:ListItem>75 * 25 %</asp:ListItem>
                                                                            <asp:ListItem>70 * 30 %</asp:ListItem>
                                                                            <asp:ListItem>Salary</asp:ListItem>

                                                                        </asp:DropDownList>
                                                               <%--<asp:TextBox ID="txtremarks" Width="240px" runat="server" Height="55px" Font-Size="18px" TextMode="MultiLine" ></asp:TextBox>--%>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtremarks" ValidationGroup="1"
                                                                            ErrorMessage="Enter Net Period" InitialValue="Select">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px; width: 45%" height="30" align="right" valign="middle">Remarks :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                               <asp:TextBox ID="txtremarks1" Width="240px" runat="server" Height="55px" Font-Size="18px" TextMode="MultiLine" ></asp:TextBox>
                                                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtremarks1" ValidationGroup="1"
                                                                            ErrorMessage="Enter Net Period">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            <span style="border-bottom: 1px solid Gray; font-size: 20px; font-weight: bold; margin-left: 10%; width: 80%">Contact Information</span>
                                                            <center>
                                                                <div style="border: 1px dotted Gray; width: 80%">
                                                                    <table id="Table1" width="100%" runat="server">
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <table width="100%">

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Contact Name</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtCName" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtCName"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="8px"></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Title</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtTitle" runat="server" Height="35px" Font-Size="18px" Width="240px">

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
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Website</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtUrl" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtUrl"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                            <%--<asp:RegularExpressionValidator ID="regular1" runat="server" ControlToValidate="txtUrl"
                                                                                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td style="width: 40%">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Phone </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td height="30" align="left" valign="middle">
                                                                                            <asp:TextBox ID="txtmobile" MaxLength="12" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>

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
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Work </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtWork" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
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
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Direct Phone </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtDirect" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
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
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="middle">Fax </td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtFax" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
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
                                                                </div>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <span style="border-bottom: 1px solid Gray; font-size: 20px; font-weight: bold; margin-left: 10%; width: 100%">Address Details</span>
                                                            <center>
                                                                <div style="border: 1px dotted Gray; width: 80%">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 60%">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px; width: 23%" height="30" align="right">Address Line1</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtaddress1" Height="80" Font-Size="18px" Width="80%" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="1" runat="server" ControlToValidate="txtaddress1"
                                                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="font-family: Verdana; font-size: 18px" height="30" align="right">Address Line2</td>
                                                                                        <td><strong>:</strong></td>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtaddress2" Height="80" Font-Size="18px" Width="80%" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td style="width: 40%">
                                                                                <asp:UpdatePanel ID="updateAddress" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <table width="100%">
                                                                                            <tr>
                                                                                                <td style="font-family: Verdana; font-size: 18px; width: 30%" height="30" align="right">Country</td>
                                                                                                <td><strong>:</strong></td>
                                                                                                <td align="left">
                                                                                                    <asp:DropDownList ID="ddlCountry" runat="server" class="inpt" AutoPostBack="true" Height="35px" Font-Size="18px" Width="242px"
                                                                                                        OnSelectedIndexChanged="Country_Change" DataTextField="txtCountry_name" DataValueField="intCountry_id">
                                                                                                    </asp:DropDownList>
                                                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" InitialValue="Select Country" ControlToValidate="ddlCountry"
                                                                                                            ErrorMessage="" ValidationGroup="1">*</asp:RequiredFieldValidator>--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="8px"></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="font-family: Verdana; font-size: 18px" height="30" align="right">State</td>
                                                                                                <td><strong>:</strong></td>
                                                                                                <td align="left">
                                                                                                    <asp:DropDownList ID="ddlstate" runat="server" class="inpt" Height="35px" Font-Size="18px" Width="242px"
                                                                                                        AutoPostBack="true" DataTextField="txtState" DataValueField="intState_id" OnSelectedIndexChanged="ddlstate_change">
                                                                                                        <asp:ListItem>Select State</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                    <%--<asp:RequiredFieldValidator ID="req5" ValidationGroup="1" runat="server" InitialValue="Select State" ControlToValidate="ddlstate"
                                                                                                            ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="8px"></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="font-family: Verdana; font-size: 18px" height="30" align="right" valign="top">City</td>
                                                                                                <td valign="top"><strong>:</strong></td>
                                                                                                <td align="left">
                                                                                                    <asp:DropDownList ID="ddlcity" runat="server" class="inpt" Height="35px" Font-Size="18px" Width="242px"
                                                                                                        AutoPostBack="true" DataTextField="CityName" DataValueField="CityID" OnSelectedIndexChanged="ddlcity_changed">
                                                                                                        <asp:ListItem>Select City</asp:ListItem>
                                                                                                    </asp:DropDownList><br />
                                                                                                    <asp:TextBox ID="txtcity" runat="server" Visible="false" />
                                                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator24" InitialValue="Select City" runat="server" ControlToValidate="ddlcity"
                                                                                                            ErrorMessage="select city">*</asp:RequiredFieldValidator>--%>
                                                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator25" ValidationGroup="1" runat="server" ControlToValidate="txtcity"
                                                                                                            ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="8px"></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="font-family: Verdana; font-size: 18px" height="30" align="right">Zip</td>
                                                                                                <td><strong>:</strong></td>
                                                                                                <td align="left">
                                                                                                    <asp:TextBox ID="txtZip" runat="server" MaxLength="5" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator26" ValidationGroup="1" runat="server"
                                                                                                            ControlToValidate="txtZip"
                                                                                                            ErrorMessage="">*</asp:RequiredFieldValidator>
                                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                                                                            FilterType="Numbers" TargetControlID="txtZip">
                                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                                        <asp:RegularExpressionValidator ID="regZip" runat="server" ControlToValidate="txtZip"
                                                                                                            ValidationGroup="1" ValidationExpression="\d{5}">*</asp:RegularExpressionValidator>--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td  colspan="2" align="center" width="80%">
                                                            <table >
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" height="30" align="right">Headquarters Office : </td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txthead" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="1" runat="server" ControlToValidate="txthead"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="font-size: 18px; font-family: Verdana">
                                                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" Height="35px" Font-Size="18px" Width="500px"
                                                                            ValidationGroup="1"  >
                                                                            <asp:ListItem>Corporation</asp:ListItem>
                                                                            <asp:ListItem>Partnership</asp:ListItem>
                                                                            <asp:ListItem>Individual</asp:ListItem>
                                                                            <asp:ListItem>Other</asp:ListItem>
                                                                        </asp:CheckBoxList>

                                                                        <%-- <asp:CustomValidator runat="server" ID="cvmodulelist"
                                                                    ClientValidationFunction="ValidateModuleList"
                                                                    ErrorMessage=" " ValidationGroup="1"></asp:CustomValidator>--%>

                                                                    </td>
                                                                    <td align="left">:
                                                               &nbsp;<asp:TextBox ID="txtother" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">Date Business Started :</td>
                                                                    <td align="left">&nbsp;&nbsp;
                                                                <asp:TextBox ID="txtdatabusiness" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="1" ControlToValidate="txtdatabusiness"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdatabusiness"></cc1:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">President/Principal Owner :</td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtpre" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="1" runat="server" ControlToValidate="txtpre"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" height="30" align="right">Other Officers :</td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtotherofficers" Height="35px" Font-Size="18px" Width="240px" runat="server"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="1" runat="server" ControlToValidate="txtotherofficers"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">Has this company provided products or services to our company before?</td>
                                                                    <td align="left" style="font-family: Verdana; font-size: 18px" width="100px" height="20px">&nbsp;             
                                                                <asp:RadioButton ID="rbtnyes" Text="Yes" GroupName="check" runat="server" Font-Size="18px" />
                                                                        <asp:RadioButton ID="rbtnno" Text="No" GroupName="check" runat="server" Font-Size="18px" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">If so, when and what type?</td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txttype" Height="35px" Font-Size="18px" Width="240px" runat="server">
                                                                    </asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="1" runat="server" ControlToValidate="txttype"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">List current customers and their approximate purchase value :
                                                                    </td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtpurchasevalue" Height="35px" Font-Size="18px" Width="240px" runat="server"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="1" runat="server" ControlToValidate="txtpurchasevalue"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">List trade references (name, phone) :</td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtrefrences" Height="35px" Font-Size="18px" Width="240px" runat="server"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="1" runat="server" ControlToValidate="txtrefrences"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" align="right" height="30">list bank references (name, branch, phone) :
                                                                    </td>
                                                                    <td align="left">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtlistofbank" Height="35px" Font-Size="18px" Width="240px" runat="server"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="1" runat="server" ControlToValidate="txtlistofbank"
                                                                    ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="8px"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                               <%--     <tr>
                                                        <td height="30" colspan="2" align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" width="450" height="30" align="right" valign="middle">User Email :</td>
                                                                    <td width="180" height="30" align="left" valign="middle">&nbsp;
                                                                            <asp:TextBox ID="txtuploademail" runat="server" Height="30px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px" width="100" height="30" align="left" valign="middle"></td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                     
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="8px"></td>
                                                    </tr>--%>

                                                    <tr>
                                                        <td height="30" colspan="2" align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" width="450" height="30" align="right" valign="middle">Completed by :</td>
                                                                    <td width="180" height="30" align="left" valign="middle">&nbsp;
                                                                            <asp:TextBox ID="txtcompleteby" runat="server" Height="30px" Font-Size="18px" Width="240px" Enabled="false"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="1" runat="server" ControlToValidate="txtcompleteby"
                                                                                ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td style="font-family: Verdana; font-size: 18px" width="100" height="30" align="left" valign="middle">Date :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                            <asp:TextBox ID="txtcomby" runat="server" Height="30px" Font-Size="18px" Width="240px" Enabled="false"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="1" runat="server" ControlToValidate="txtcomby"
                                                                                ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                        <cc1:CalendarExtender ID="cal1" runat="server" TargetControlID="txtcomby"></cc1:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="8px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" colspan="2" align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td style="font-family: Verdana; font-size: 18px" width="450" height="30" align="right" valign="middle">Approved by :</td>
                                                                    <td width="180" height="30" align="left" valign="middle">&nbsp;
                                                                            <asp:TextBox ID="txtapporvedby" runat="server" Height="35px" Font-Size="18px" Width="240px" Enabled="false"></asp:TextBox>
                                                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="1" ControlToValidate="txtapporvedby"
                                                                                ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td width="100" height="30" style="font-family: Verdana; font-size: 18px" align="left" valign="middle">Date :</td>
                                                                    <td height="30" align="left" valign="middle">&nbsp;
                                                                            <asp:TextBox ID="txtapby" runat="server" Height="35px" Font-Size="18px" Width="240px" Enabled="false"></asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="1" runat="server" ControlToValidate="txtapby"
                                                                                ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtapby"></cc1:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;<br /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="100px" Height="50px" Text="Save" Font-Size="20px"
                                                                OnClick="btnsubmit_Click" />
                                                              <asp:Button ID="btncancel" runat="server" Width="100px" Height="50px" Text="Cancel" Font-Size="20px" OnClick="btncancel_Click" />
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

