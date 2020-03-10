<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-InvoiceCreate.aspx.cs" Inherits="Emp_InvoiceCreate" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon' />
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>:  : 1indus.com :  : </title>
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
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function autoTabTimes(input, len) {

            if (input.value.length == 2) {
                if (input.value.indexOf(":") == -1) {
                    input.value = input.value + ".";
                }
                var str = input.value.split(".");
                if (str[0].length == 1) {
                    input.value = "0" + str[0];
                }
            }

            if (input.value.length >= len) {
                input.value = input.value.slice(0, len);
                input.form[(getIndex(input) + 1)].focus();

            }

            return true;
        }
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
                window.location = "Login.aspx";
            }, timeout);
        };
        function ResetSession() {
            //Redirect to refresh Session.
            window.location = window.location.href;
        }
    </script>

    <script type="text/javascript">
        function Color_Changed(sender) {
            sender.get_element().value = "#" + sender.get_selectedColor();
            var txt = sender.get_element().value;
            document.getElementById("txtcolor1").style.backgroundColor = txt;
        }

        function Color_Changed1(sender) {
            sender.get_element().value = "#" + sender.get_selectedColor();
            var txt1 = sender.get_element().value;
            document.getElementById("txtcolor2").style.backgroundColor = txt1;
        }

        function Color_Changed2(sender) {
            sender.get_element().value = "#" + sender.get_selectedColor();
            var txt2 = sender.get_element().value;
            document.getElementById("txtcolor3").style.backgroundColor = txt2;
        }

        function Color_Changed3(sender) {
            sender.get_element().value = "#" + sender.get_selectedColor();
            var txt3 = sender.get_element().value;
            document.getElementById("txtcolor4").style.backgroundColor = txt3;
        }
    </script>

    <script type="text/javascript">
        function fetch() {
            var get = document.getElementById("get").value;
            document.getElementById("put").value = get;
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <head:Header ID="Header1" runat="server"></head:Header>
        </div>
        <hr />
        <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
        <br />
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>

            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr>
                    <td align="center" height="30px"><font color='#003399' size='6pt'><b>Create Clients/Vendors</b></font></td>
                </tr>
                <tr>
                    <td align="center" height="30px" style="padding-left: 978px;">
                        <asp:LinkButton ID="lnk" runat="server" Text="View Clients/Vendors" Font-Bold="true" Font-Size="24px" OnClick="lnk_Click"></asp:LinkButton></td>
                </tr>

                <tr>
                    <td align="center" width="20%" style="font-size: 16px; font-weight: bold;"><span style="color: red;">*      </span>Required Fileds</td>
                </tr>
                <tr>
                    <td height="10px">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <table width="100%" align="center">
                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label1" runat="server" Text="Company Type" Font-Size="18px"></asp:Label><span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:DropDownList ID="ddtype" runat="server" Font-Size="18px" Width="300px" TabIndex="1">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Vendors</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Reqempid" runat="server" ControlToValidate="ddtype" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Please Select Company Type " ForeColor="Red" SetFocusOnError="true" InitialValue="Select">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>

                                            <td width="40%" align="right">
                                                <asp:Label ID="lblcompany" runat="server" Text="Company  Name" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp; </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:TextBox ID="txtcompany" runat="server" Font-Size="18px" Width="300px" TabIndex="2"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtcompany" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Please enter Company Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" InvalidChars="1234567890"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,.-"
                                                    TargetControlID="txtcompany">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lblempname" runat="server" Text="Employee First Name" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp; </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:TextBox ID="txtempname" runat="server" Font-Size="18px" Width="300px" TabIndex="3"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtempname" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Please enter Employee First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" InvalidChars="1234567890"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz  ~`!@#$%^&*()_=+<>,.-"
                                                    TargetControlID="txtempname">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lbllast" runat="server" Text="Employee Last Name" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp; </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:TextBox ID="txtlast" runat="server" Font-Size="18px" Width="300px" TabIndex="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtlast" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Please enter Employee Last Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" InvalidChars="1234567890"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,.-"
                                                    TargetControlID="txtlast">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lbltimesheet" runat="server" Text="Timesheet" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:DropDownList ID="ddtimesheet" runat="server" Font-Size="18px" Width="300px" TabIndex="5">
                                                    <asp:ListItem Text="Select" />
                                                    <asp:ListItem Text="Online" />
                                                    <asp:ListItem Text="Bi Weekly" />
                                                    <asp:ListItem Text="Weekly" />
                                                    <asp:ListItem Text="Semi Monthly" />
                                                    <asp:ListItem Text="Monthly" />
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="ddtimesheet" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Select Timesheet" ForeColor="Red" SetFocusOnError="true" InitialValue="Select">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lblemail" runat="server" Text="Invoice Required" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:DropDownList ID="ddinvoice" runat="server" Font-Size="18px" Width="300px" TabIndex="6">
                                                    <asp:ListItem Text="Select" />
                                                    <asp:ListItem Text="Yes" />
                                                    <asp:ListItem Text="No" />
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="ddinvoice" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Select Invoice" ForeColor="Red" SetFocusOnError="true" InitialValue="Select">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lblpwd" runat="server" Text="Invoice Duraion " Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:DropDownList ID="ddrid" runat="server" Font-Size="18px" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="ddrid_SelectedIndexChanged" TabIndex="7">
                                                    <asp:ListItem Text="Select" />
                                                    <asp:ListItem Text="Online" />
                                                    <asp:ListItem Text="Bi Weekly" />
                                                    <asp:ListItem Text="Weekly" />
                                                    <asp:ListItem Text="Semi Monthly" />
                                                    <asp:ListItem Text="Monthly" />
                                                    <asp:ListItem Text="4 Weeks" />
                                                    <asp:ListItem Text="Other" />
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="ddrid" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Select Invoice Duration" ForeColor="Red" SetFocusOnError="true" InitialValue="Select">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label2" runat="server" Text="Invoice Dates" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:DropDownList ID="txtinvoicedate" runat="server" Font-Size="18px" Width="300px" AutoPostBack="true"
                                                    OnSelectedIndexChanged="txtinvoicedate_SelectedIndexChanged" TabIndex="8">
                                                    <asp:ListItem Text="Select" />
                                                    <asp:ListItem Text="Every Week Monday" />
                                                    <asp:ListItem Text="Every two weeks" />
                                                    <asp:ListItem Text="1st to 31st" />
                                                    <asp:ListItem Text="1st to 15 & 16 to 31st" />
                                                    <asp:ListItem Text="4 Weeks" />
                                                    <asp:ListItem Text="Other" />
                                                </asp:DropDownList>
                                                <%--<asp:TextBox ID="txtinvoicedate" runat="server" Font-Size="18px" Width="300px" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="ccinvoicedate" runat="server" TargetControlID="txtinvoicedate" Format="MM-dd-yyyy"></cc1:CalendarExtender>--%>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="txtinvoicedate" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Select Invoice Dates" ForeColor="Red" SetFocusOnError="true" InitialValue="Select">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>

                                <%--<tr runat="server" id="visible1" visible="false">--%>
                                <td height="7px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right"></td>
                                            <td width="10%" align="center"><b style="font-size: 18px;"></b></td>
                                            <td width="50%" align="left">
                                                <table width="100%" align="left" runat="server" id="visible2" visible="false">
                                                    <tr>
                                                        <td width="50%" align="left">From :    
                                                             <asp:TextBox ID="txtoher1" runat="server" Font-Size="18px" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtoher1" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtfrom" Display="Dynamic" ValidationGroup="Submit"
                                                             ErrorMessage="Select From Date " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td width="50%" align="left">To :   
                                                           <asp:TextBox ID="txtoher2" runat="server" Font-Size="18px" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtoher2" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtto" Display="Dynamic" ValidationGroup="Submit"
                                                             ErrorMessage="Select Last Date" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right"></td>
                                            <td width="10%" align="center"><b style="font-size: 18px;"></b></td>
                                            <td width="50%" align="left">
                                                <table width="100%" align="left" id="visible4" visible="false" runat="server">
                                                    <tr>
                                                        <td width="50%" align="left">From :    
                                                           <asp:TextBox ID="txtoher3" runat="server" Font-Size="18px" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtoher3" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtfrom" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select From Date " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td width="50%" align="left">To :   
                                                           <asp:TextBox ID="txtoher4" runat="server" Font-Size="18px" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtoher4" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtto" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select Last Date" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="lblrate" runat="server" Text="Invoice Period" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="5%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="55%" align="left" colspan="3">
                                                <table width="100%" align="left">
                                                    <tr>
                                                        <td width="40%" align="left"><span style="width: 40px;">From :    </span>
                                                            <asp:TextBox ID="txtfrom" runat="server" Font-Size="18px" Width="80px" TabIndex="9" OnTextChanged="txtfrom_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtfrom" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtfrom" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select From Date " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="50%" align="left"><span style="width: 40px;">To :    </span>
                                                            <asp:TextBox ID="txtto" runat="server" Font-Size="18px" Width="80px" TabIndex="10" OnTextChanged="txtto_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="ccal" runat="server" TargetControlID="txtto" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtto" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select To Date" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            <asp:TextBox ID="txtcolor1" runat="server" Width="50px" placeholder="Color" TabIndex="11" />
                                                            <cc1:ColorPickerExtender ID="ColorPicker1" runat="server" TargetControlID="txtcolor1"
                                                                SampleControlID="preview" PopupPosition="Right" OnClientColorSelectionChanged="Color_Changed" />
                                                            <%--PopupButtonID="btncolor1"--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label3" runat="server" Text="Timesheet Pending Period" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="5%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="55%" align="left" colspan="2">
                                                <table width="100%" align="left">
                                                    <tr>
                                                        <td width="40%" align="left"><span style="width: 40px;">From :    </span>
                                                            <asp:TextBox ID="tstxtfrom" runat="server" Font-Size="18px" Width="80px" TabIndex="12"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="tstxtfrom" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="tstxtfrom" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select From Date " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="50%" align="left"><span style="width: 40px;">To :  </span>
                                                            <asp:TextBox ID="tstxtto" runat="server" Font-Size="18px" Width="80px" TabIndex="13"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tstxtto" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator11" runat="server" ControlToValidate="tstxtto" Display="Dynamic" ValidationGroup="Submit"
                                                                ErrorMessage="Select To Date" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            <asp:TextBox ID="txtcolor2" runat="server" Width="50px" placeholder="Color" TabIndex="14" />
                                                            <cc1:ColorPickerExtender ID="ColorPickerExtender1" runat="server" TargetControlID="txtcolor2"
                                                                SampleControlID="preview" PopupPosition="Right" OnClientColorSelectionChanged="Color_Changed1" />
                                                            <%--PopupButtonID="btncolor1"--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="7px" colspan="2" style="border: 1px solid black;">
                                    <table align="center" width="100%">


                                        <tr>
                                            <td width="50%" align="center">
                                                <table width="100%" align="center">
                                                    <tr>
                                                        <td width="43%" align="right">
                                                            <asp:Label ID="Label8" runat="server" Text="Week Ranges" Font-Size="18px"></asp:Label>
                                                            <span style="color: red">*</span> &nbsp;&nbsp;
                                                        </td>
                                                        <td width="4%" align="center"><b style="font-size: 18px;">:</b></td>
                                                        <td width="50%" align="left" colspan="2">
                                                            <table width="100%" align="left">
                                                                <tr>
                                                                    <td width="80%" align="left"><span style="width: 40px;"></span>
                                                                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="16px" Width="170px" TabIndex="12">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator14" runat="server" ControlToValidate="DropDownList1" Display="Dynamic"
                                                                            ErrorMessage="Select  Date  Range" ForeColor="Red" SetFocusOnError="true" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td width="20%" align="left"><%--<span style="width:40px;">To :  </span> --%>
                                                                    </td>
                                                                </tr>
                                                            </table> 
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="50%" align="center">
                                                <table width="100%" align="center">
                                                    <tr>
                                                        <td width="4%" align="right"></td>
                                                        <td width="50%" align="center">
                                                            <table width="100%" align="center">
                                                                <tr>
                                                                    <td width="50%" align="left" colspan="2">
                                                                        <table width="100%" align="left">
                                                                            <tr>
                                                                                <td width="40%" align="left"><span style="width: 40px;">Actual Hours     </span><span style="color: red">* :</span> &nbsp;&nbsp;
                                                              <asp:TextBox ID="txtactualhours" runat="server" Font-Size="18px" Width="60px" TabIndex="12" MaxLength="5"  onkeyup="autoTabTimes(this)"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator16" runat="server" ControlToValidate="txtactualhours" Display="Dynamic" ValidationGroup="Submit"
                                                                                        ErrorMessage="Enter Actual Hours " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator ID="sss" runat="server" ControlToValidate="txtactualhours"  ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" SetFocusOnError="true"
                                                                                        ErrorMessage="enter format"></asp:RegularExpressionValidator>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                                                                        InvalidChars="~`!@#$%^&*()_=+<>,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                                        ValidChars="0123456789." TargetControlID="txtactualhours">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                </td>
                                                                                <td width="50%" align="left"><span style="width: 40px;">OT Hours   </span><span style="color: red">:</span> &nbsp;&nbsp;
                                                            <asp:TextBox ID="txtothours" runat="server" Font-Size="18px" Width="60px" TabIndex="13" MaxLength="5"  onkeyup="autoTabTimes(this)"></asp:TextBox>
                                                                                    <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator17" runat="server" ControlToValidate="txtothours" Display="Dynamic" 
                                                                                        ErrorMessage="Enter Ot Hours " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtothours" 
                                                                                           ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" SetFocusOnError="true"
                                                                                        ErrorMessage="enter format"></asp:RegularExpressionValidator>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                                                                        InvalidChars="~`!@#$%^&*()_=+<>,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                                        ValidChars="0123456789." TargetControlID="txtothours">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    &nbsp;&nbsp;   
                                                                    <asp:Button ID="add" runat="server" Text="Add" Width="80px" OnClick="add_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="7px">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td width="50%" align="right" colspan="2">
                                                <table width="100%" align="center">
                                                    <tr>
                                                        <td width="100%" align="center">
                                                            <div id="divgrid1" runat="server" style="width: 100%;" align="center">
                                                                <%--   <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                                                                <asp:GridView ID="GridView1" Width="90%" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server"
                                                                    OnRowEditing="GridView1_RowEditing" CellPadding="4" HeaderStyle-Font-Size="16px" OnRowUpdating="GridView1_RowUpdating1"
                                                                    ForeColor="#333333" GridLines="None" DataKeyNames="wid">
                                                                    <AlternatingRowStyle BackColor="White" />

                                                                    <Columns>
                                                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Week Range" DataField="Week" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30%" />
                                                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Regular Hours" DataField="reghours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Actual Rate" DataField="actualrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                                                                        <%-- <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalregamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />--%>
                                                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Hours" DataField="othours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Rate" DataField="otrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                                                                        <%--    <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalotamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />--%>

                                                                        <asp:TemplateField ItemStyle-Width="8%" HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton3" Text="Edit" runat="server" CommandName="Edit" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton5" Text="Update" runat="server" OnClick="OnUpdate" ForeColor="Black" CommandArgument='<%#Eval("wid") %>' />
                                                                                <asp:LinkButton ID="LinkButton6" Text="Cancel" runat="server" OnClick="OnCancel" ForeColor="Black" />
                                                                            </EditItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="imgbtndel" Width='20' Height='20' runat="server" Text="X" OnClick="imgbtndel_Click" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                                                <br />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="5%"></ItemStyle>
                                                                        </asp:TemplateField>

                                                                    </Columns>
                                                                    <EditRowStyle ForeColor="Black" Font-Size="14px" />
                                                                    <FooterStyle Font-Bold="True" ForeColor="Black" Font-Size="20px" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="Black" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="Black" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />


                                                                </asp:GridView>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="7px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label5" runat="server" Text="Invoice Date" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:TextBox ID="txtidate" runat="server" Font-Size="18px" Width="200px" TabIndex="15"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtidate" Format="MM-dd-yyyy"></cc1:CalendarExtender>

                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidastor12" runat="server" ControlToValidate="txtidate" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Select Invoice Date" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                &nbsp;
                                                  <asp:TextBox ID="txtcolor3" runat="server" Width="50px" placeholder="Color" TabIndex="16" />
                                                <cc1:ColorPickerExtender ID="ColorPickerExtender2" runat="server" TargetControlID="txtcolor3"
                                                    SampleControlID="preview" PopupPosition="Right" OnClientColorSelectionChanged="Color_Changed2" />
                                                <%--PopupButtonID="btncolor1"--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label6" runat="server" Text="Hourly Rate" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">$<asp:TextBox ID="txtrate" runat="server" Font-Size="18px" Width="200px" TabIndex="17"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtrate" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Enter Hourly Rate" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                    ValidChars="0123456789." TargetControlID="txtrate">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="17px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label7" runat="server" Text="Overtime" Font-Size="18px"></asp:Label>
                                                <%--span style="color: red">*</span> &nbsp;&nbsp;--%>&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">$
                                                <asp:TextBox ID="txtot" runat="server" Font-Size="18px" Width="200px" TabIndex="18"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                    ValidChars="0123456789." TargetControlID="txtrate">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="40%" align="right">
                                                <asp:Label ID="Label4" runat="server" Text="Consultant Email" Font-Size="18px"></asp:Label>
                                                <span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="50%" align="left">
                                                <asp:TextBox ID="txtemail" runat="server" Font-Size="18px" Width="240px" TabIndex="19"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtemail" Display="Dynamic" ValidationGroup="Submit"
                                                    ErrorMessage="Enter Email" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <%--<asp:RegularExpressionValidator ID="reg1" runat="server" 
                                    ErrorMessage="Enter Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail" ValidationGroup="Submit" ForeColor="Red"></asp:RegularExpressionValidator>--%> 
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="17px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="50%" align="center" colspan="2">
                                    <table width="80%" align="center">
                                        <tr>
                                            <td width="30%" align="right">
                                                <asp:Label ID="lblremarks" runat="server" Text="Remarks" Font-Size="18px"></asp:Label>
                                                <%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                                            </td>
                                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                                            <td width="30%" align="left">
                                                <asp:TextBox ID="txtremarks" runat="server" Font-Size="18px" Width="560px" Height="150px" TextMode="MultiLine" TabIndex="20"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtremarks" Display="Dynamic" ValidationGroup="Submit"
                                                   ErrorMessage="Enter Remarks" ForeColor="Red" SetFocusOnError="true" >*</asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td width="10%" align="left">&nbsp;
                                               <asp:TextBox ID="txtcolor4" runat="server" Width="90px" placeholder="Color" TabIndex="21" />
                                                <cc1:ColorPickerExtender ID="ColorPickerExtender3" runat="server" TargetControlID="txtcolor4"
                                                    SampleControlID="preview" PopupPosition="Right" OnClientColorSelectionChanged="Color_Changed3" />
                                                <%--PopupButtonID="btncolor1"--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" align="center" colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="You must enter a value in the following fields:"
                                        DisplayMode="List" ShowSummary="false" ShowMessageBox="true" ForeColor="Red" runat="server" ValidationGroup="Submit" EnableClientScript="true" />
                                </td>
                            </tr>
                            <tr>
                                <td height="17px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="100%" align="center" colspan="2">
                                    <asp:Button ID="btnsaveout" runat="server" Text="Submit" Font-Size="18px" Width="70px" Height="30px" ValidationGroup="Submit" OnClick="btnsaveout_Click" TabIndex="21" />
                                    <asp:Button ID="Button2" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="Button2_Click" />

                                    <asp:Button ID="Button1" runat="server" Text="Update" Font-Size="18px" Width="70px" Height="30px" ValidationGroup="Submit" OnClick="Button1_Click" Visible="false" />
                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Size="18px" Width="70px" Height="30px" OnClick="btncancel_Click" TabIndex="22" />
                                    <asp:Button ID="Button3" runat="server" Text="Inactive" Visible="false" Font-Size="18px" Width="70px" Height="30px" OnClick="Button3_Click" TabIndex="23" />
                                </td>
                            </tr>
                            <tr>
                                <td height="17px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="17px" colspan="2" align="center" width="100%">
                                    <asp:Label ID="lblshow" runat="server" Font-Size="18px" ForeColor="Green"></asp:Label>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>

                <tr>
                    <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
                </tr>
                <tr>
                    <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
                </tr>
            </table>
            <br />
        </center>
    </form>
</body>
</html>
