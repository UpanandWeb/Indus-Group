<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="admin_Profile" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Company_Create</title>
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
    <style type="text/css">
        .style1 {
            width: 143px;
        }

        .style13 {
            height: 330px;
        }

        .class123 {
            font-family: Verdana;
            font-size: 12px;
        }
    </style>
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .inpt {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            width: 210px;
            height: 25px;
            border: #CCC solid 1px;
        }

        .inpt1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            width: 210px;
            height: 35px;
            border: #CCC solid 1px;
        }

        .inpt2 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            width: 210px;
            height: 25px;
            border: #CCC solid 1px;
        }

        .inpt_EFL {
            width: 80px;
            height: 25px;
            border: #CCC solid 1px;
        }
    </style>
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
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript1.2" src="js/statesopt.js" type="text/javascript">
    </script>
    <script language="JavaScript1.2" src="Jscripts/empregvalidation.js" type="text/javascript"></script>

    <script type="text/javascript">
        function allowonlynumbers() {
            if (event.keyCode >= 48 && event.keyCode <= 57) {
                return true;
            }
            else {
                alert('Only numbers can be entered.'); return false;
            }
        }

    </script>
</head>


<body id="body1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <div>
            <table width="100%">
                <tr>
                    <td valign="top" width='100%' class="lblog">
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td id="crtopt" runat="server" align="right" class="lblog"></td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="80%" style="color: #00277a">
                            <tr>
                                <td height="25" align="center" style="width: 90%"><b style="color: maroon">Profile</b></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                      <table width="90%" align="center">
                                             <tr>
                                <td class="datab" align="right"><span style="font-size: 17px;">User</span>
                                </td>
                                <td>:</td>
                                <td align="left">
                                   
                                            <asp:TextBox ID="txtUserId" runat="server" Enabled="false"  Width="180px" Height="20px"></asp:TextBox>
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
                                          <tr><td height="10px"></td></tr>

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
                                          <tr><td height="10px"></td></tr>

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
                                          <tr><td height="10px"></td></tr>
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
                                          <tr><td height="10px"></td></tr>

                                          <tr>
                                              <td colspan="6" align="center">
                                                  <asp:Button ID="btnupdate" runat="server" Text="Update" Width="80px" Font-Size="18px" OnClick="btnupdate_Click"  ValidationGroup="UserIdCreation1" />
                                                  <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="80px" Font-Size="18px" OnClick="btncancel_Click" />

                                              </td>
                                          </tr>
                        </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>

    </form>
</body>
</html>
