<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Create-User.aspx.cs" Inherits="admin_Admin_Create_User" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" height="30px"><font color='#003399' size='5pt'><b>Create Employee</b></font></td>
                 
            </tr>
            <tr>
                <td align="center" height="30px" style="padding-left:978px;"><asp:LinkButton ID="lnk" runat="server" Text="View User" Font-Bold="true" Font-Size="24px" OnClick="lnk_Click"></asp:LinkButton></td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>

            <tr>
                <td align="center">

                    <table width="50%" align="center">
                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="Label1" runat="server" Text="Employee Id" Font-Size="18px"></asp:Label><span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtempid" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                             <asp:RequiredFieldValidator ID="Reqempid" runat="server" ControlToValidate="txtempid" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Please enter Hourly Rate "  ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblempname" runat="server" Text="Employee First Name" Font-Size="18px"></asp:Label>
                           <span style="color: red">*</span> &nbsp;&nbsp; </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtempname" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtempname" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Please enter Employee First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                          <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="Label2" runat="server" Text="Employee Last Name" Font-Size="18px"></asp:Label>
                           <span style="color: red">*</span> &nbsp;&nbsp; </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtlast" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtlast" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Please enter Employee Last Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblphone" runat="server" Text="Employee Phone Number" Font-Size="18px"></asp:Label>
                            <span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtphone" runat="server" Font-Size="18px" Width="320px" MaxLength="10" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtphone" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="txtphone"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblemail" runat="server" Text="Employee Email" Font-Size="18px"></asp:Label>
                            <span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtemail" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtemail" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers, LowercaseLetters, Custom"
                                       ValidChars=".@" TargetControlID="txtemail" />
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblpwd" runat="server" Text="Password " Font-Size="18px"></asp:Label>
                            <span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtpwd" runat="server" Font-Size="18px" Width="320px" TextMode="Password"  MaxLength="10" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtpwd" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                          <tr>
                            <td width="100%" align="center" colspan="6">
                                <table width="100%" align="center">
                                    <tr>
                            <td width="20%" align="right">
                                <asp:Label ID="lblrate" runat="server" Text="Hourly Rate" Font-Size="18px"></asp:Label>
                            <span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtrate" runat="server" Font-Size="18px" Width="100px" ></asp:TextBox>
                                <asp:DropDownList ID="ddsymbol" runat="server" Font-Size="18px" Width="60px" >
                                    <asp:ListItem>$</asp:ListItem>
                                    <asp:ListItem>Rs</asp:ListItem>

                                </asp:DropDownList>

                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtrate" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Please enter Hourly Rate " ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                                        <td width="20%" align="right">
                                <asp:Label ID="lbldate" runat="server" Text="Start Date" Font-Size="18px"></asp:Label>
                            <span style="color: red">*</span> &nbsp;&nbsp;
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtdate" runat="server" Font-Size="18px" Width="160px" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="ccal" runat="server" TargetControlID="txtdate" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtdate" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                         <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lbladdress" runat="server" Text="Address" Font-Size="18px"></asp:Label>
                           <%-- <span style="color: red">*</span> &nbsp;&nbsp;--%>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                              <asp:TextBox ID="txtaddress" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <%--  <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtaddress" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblnbank" runat="server" Text="Bank Name" Font-Size="18px"></asp:Label>
                            <%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtbank" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtbank" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblrout" runat="server" Text="Routing Number" Font-Size="18px"></asp:Label>
                            <%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtrout" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="txtrout" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="40%" align="right">
                                <asp:Label ID="lblaccount" runat="server" Text="Account Number " Font-Size="18px"></asp:Label>
                            <%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtaccount" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="txtaccount" Display="Dynamic" ValidationGroup="Submit"
                             ErrorMessage="Provide First Name" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtaccount"></cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>

                        <tr>
                            <td height="17px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td width="100%" align="center" colspan="3">
                                              <asp:Button ID="btnsaveout" runat="server" Text="Submit" Font-Size="18px" Width="70px" Height="30px" ValidationGroup="Submit" OnClick="btnsaveout_Click" />
                                  <asp:Button ID="Button1" runat="server" Text="Update" Font-Size="18px" Width="70px" Height="30px" ValidationGroup="Submit" OnClick="Button1_Click" Visible="false"  />
                                              <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Size="18px" Width="70px" Height="30px" OnClick="btncancel_Click" />

                            </td>
                        </tr>

                        <tr>
                            <td height="7px">&nbsp;</td>
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
    </form>
</body>
</html>
