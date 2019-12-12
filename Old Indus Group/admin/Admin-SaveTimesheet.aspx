<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-SaveTimesheet.aspx.cs" Inherits="admin_Admin_SaveTimesheet" MaintainScrollPositionOnPostback="true"   %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<!DOCTYPE html>

<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - TimeSheet</title>

    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
        }

        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete ' + username + ' record Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <style type="text/css">
        .style24 {
            height: 15px;
        }
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }

        .updateProgress {
            border-width: 1px;
            border-style: solid;
            background-color: White;
            position: absolute;
            width: 180px;
            height: 65px;
        }
    </style>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1000px;
            height: 600px;
            background-color: #333;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 350px;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 200px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }

        .style24 {
            color: #7a7a7b;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            text-decoration: none;
            height: 29px;
        }

        #empdata td {
            border: 0.1px solid #CCCCCC;
        }

        #empdata th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td align="center">

                 <%--   <asp:UpdatePanel ID="up" runat="server">
                        <ContentTemplate>--%>
                            <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu2" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" height="30px"><font color='#003399' size='5pt'><b>Employee Save Timesheet</b></font></td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>

            <tr>
                <td align="center">
                    <table width="50%" align="center">
                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblempname" runat="server" Text="Employee Name" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:DropDownList ID="ddemp" runat="server" Font-Size="18px" Width="320px" OnSelectedIndexChanged="ddemp_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblid" runat="server" Text="Employee ID" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtid" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblemail" runat="server" Text="Employee Email" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtemail" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                                <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="Label2" runat="server" Text="Leave Type" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:DropDownList ID="ddtype" runat="server" Width="320px" Font-Size="18px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="ddtype_SelectedIndexChanged">
                                      <asp:ListItem>Select</asp:ListItem>
                                      <asp:ListItem>Holiday</asp:ListItem>
                                      <asp:ListItem>Leave</asp:ListItem>
                                      <asp:ListItem>Sunday</asp:ListItem>
                                      <asp:ListItem>Saturday</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                          </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                        <tr runat="server" id="noleave" visible="false">
                            <td width="40%" align="right" >
                                <asp:Label ID="lbldate" runat="server" Text="Work Date " Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left" >
                                <asp:TextBox ID="txtdate" runat="server" Font-Size="18px" Width="320px" AutoCompleteType="Disabled" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="ccal" runat="server" TargetControlID="txtdate" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                            </td>
                        </tr>

                         <tr runat="server" id="leave" visible="false" >
                             <td colspan="3" width="100%" align="center">
                                 <table width="100%" align="center">
                                     <tr>

                                    
                            <td width="20%" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Leave From Date " Font-Size="18px"></asp:Label>
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtfrom" runat="server" Font-Size="18px" Width="160px" AutoCompleteType="Disabled" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfrom" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                            </td>
                              <td width="20%" align="right">
                                <asp:Label ID="Label4" runat="server" Text="TO Date " Font-Size="18px"></asp:Label>
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtto" runat="server" Font-Size="18px" Width="160px" AutoCompleteType="Disabled" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtto" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                            </td>
                              </tr>
                                 </table>
                             </td>
                        </tr>

                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                        <tr id="lunch1" runat="server">
                            <td colspan="7" width="100%" align="center">
                                <table width="80%" align="center">
                                    <tr>
                                        <td width="20%" align="right">
                                            <asp:Label ID="lblin" runat="server" Text="Work In" Font-Size="18px"></asp:Label>
                                        </td>
                                        <td width="10%" align="center" id="out1" runat="server"><b style="font-size: 18px;">:</b></td>
                                        <td width="20%" align="left">
                                            <asp:TextBox ID="txtin" runat="server" Font-Size="18px" Width="100px" AutoCompleteType="Disabled" MaxLength="4" OnTextChanged="txtin_TextChanged" AutoPostBack="true"></asp:TextBox>

                                            <asp:Label ID="lb1" Text="*Enter time in 24hr format" runat="server"></asp:Label>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"  InvalidChars=";~`!@#$%^&*()_=+<>,.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" 
                                                  ValidChars="0123456789:" TargetControlID="txtin"></cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtin" ValidationGroup="save" ErrorMessage="Enter in time" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </td>
                                        <td width="20%" align="right">
                                            <asp:Label ID="lblout" runat="server" Text="Lunch Out" Font-Size="18px"></asp:Label>
                                        </td>
                                        <td width="10%" align="center" id="out2" runat="server"><b style="font-size: 18px;">:</b></td>
                                        <td width="20%" align="left">
                                            <asp:TextBox ID="txtout" runat="server" Font-Size="18px" Width="100px" AutoCompleteType="Disabled" MaxLength="4" OnTextChanged="txtout_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                               <!--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"  InvalidChars=";~`!@#$%^&*()_=+<>,.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" 
                                                  ValidChars="0123456789:" TargetControlID="txtout"></cc1:FilteredTextBoxExtender> -->
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr id="lunch2" runat="server">
                            <td width="40%" align="right">
                                <asp:Label ID="lbllunch" runat="server" Text="Lunch Hours" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtlunch" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr id="lunch3" runat="server">
                            <td colspan="6" width="100%" align="center">
                                <table width="80%" align="center">
                                    <tr>
                                        <td width="20%" align="right">
                                            <asp:Label ID="llblin" runat="server" Text="Lunch In" Font-Size="18px"></asp:Label>
                                        </td>
                                        <td width="10%" align="center" id="Td1" runat="server"><b style="font-size: 18px;">:</b></td>
                                        <td width="20%" align="left">
                                            <asp:TextBox ID="ltxtin" runat="server" Font-Size="18px" Width="100px" AutoCompleteType="Disabled" MaxLength="4" OnTextChanged="ltxtin_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"  InvalidChars=";~`!@#$%^&*()_=+<>,.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" 
                                                  ValidChars="0123456789:" TargetControlID="ltxtin"></cc1:FilteredTextBoxExtender>
                                        </td>
                                        <td width="20%" align="right">
                                            <asp:Label ID="llbnout" runat="server" Text="Work Out" Font-Size="18px"></asp:Label>
                                        </td>
                                        <td width="10%" align="center" id="Td2" runat="server"><b style="font-size: 18px;">:</b></td>
                                        <td width="20%" align="left">
                                            <asp:TextBox ID="ltxtout" runat="server" Font-Size="18px" Width="100px" AutoCompleteType="Disabled" MaxLength="4" OnTextChanged="ltxtout_TextChanged" AutoPostBack="true"></asp:TextBox> <%--OnTextChanged="ltxtout_TextChanged" AutoPostBack="true"--%>
                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars=";~`!@#$%^&*()_=+<>,.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" 
                                                  ValidChars="0123456789:" TargetControlID="ltxtout"></cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="re1" runat="server" ControlToValidate="ltxtout" ValidationGroup="save" ErrorMessage="Enter Out time" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr id="lunch4" runat="server">
                            <td width="40%" align="right">
                                <asp:Label ID="Label1" runat="server" Text="Work Hours" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtworktime" runat="server" Font-Size="18px" Width="320px" Enabled="false"  ></asp:TextBox>
                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"  InvalidChars=";~`!@#$%^&*()_=+<>,.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" 
                                                  ValidChars="0123456789:" TargetControlID="txtworktime"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>

                        <tr>
                            <td height="30px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="8" width="100%" align="center">
                                <asp:Button ID="btnupdate" runat="server" Text="Save" Font-Size="18px" Width="80px" Height="30px" OnClick="btnupdate_Click" ValidationGroup="save" />
                                              <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Size="18px" Width="70px" Height="30px" OnClick="btncancel_Click" />

                            </td>
                        </tr>
                    </table>


                </td>
            </tr>


            <tr>
                <td id="td3" runat="server" align="center" valign="top" width="100%" class="lable"></td>
            </tr>
            <tr>
                <td id="td4" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
            </tr>
        </table>
                       <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>

        
                
                </td>
            </tr>


            <tr>
                <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
            </tr>
            <tr>
                <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>