<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-DailyReportsView.aspx.cs" Inherits="admin_Admin_DailyReportsView" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <title>: : Indus Group : : - Admin Control Panel - Reports</title>
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
        <link rel="stylesheet" href="Styles/stylesheet.css" />
    <style type="text/css">
        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            font-size: 25px;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }

        .GVPager {
            /*width: 1500px;*/
            border-right-style: solid;
            position: absolute;
            height: 35px;
            font-size: 25px;
            text-align: center;
            border-right-color: navy;
        }
    </style>
</head>
<body  id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD" oncontextmenu="return false;" onselectstart="return false">
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

  <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='1500px' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td align="center" valign="top" width="1500px" class="lable">
                    <table>
                        <tr>
                            <td>
                                <br />
                                <br />
                            </td>
                        </tr>
                        
                    </table>
                </td>
               
            </tr>
      <tr><td align="center"><asp:Label ID="lbltitle" runat="server" Text="Daily Reports" Font-Bold="true" Font-Size="26px"></asp:Label></td></tr>
            <tr>
                <td>
                    <br />
                    <hr />
                    <br />
                </td>
            </tr>


         <table align="center"  width="80%">
                      <tr>
                        <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="lblFirstName" runat="server" Text="First Name" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtFirstName" runat="server"  Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                       <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label1" runat="server" Text="Last Name" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtlast" runat="server"  Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                        <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label2" runat="server" Text="Emp ID" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtempid" runat="server"  Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                       <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label3" runat="server" Text="Email Id" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtemailid" runat="server"  Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                     <tr>
                        <td  colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label5" runat="server" Text="Mobile Number" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtmobile" runat="server"  Width="640px" Font-Size="16px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rv1" runat="server" ValidationGroup="report" ControlToValidate="txtmobile" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"  ForeColor="Red" Display="dynamic"
                                            ErrorMessage="Enter Valid 10 digits number"  ValidationExpression="^[0-9]{10}$" ValidationGroup="report"></asp:RegularExpressionValidator>
                                                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars="~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="0123456789" TargetControlID="txtmobile"></cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>
                       <tr>
                        <td  colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label4" runat="server" Text="Subject" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtsubject" runat="server"  Width="640px" Font-Size="16px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="report" ControlToValidate="txtsubject" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                        <td colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label6" runat="server" Text="Description" Font-Size="16px" ></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtdes" runat="server"  Width="640px" Font-Size="16px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="report" ControlToValidate="txtdes" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                <td  colspan="2" align="center">

            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Font-Size="16px"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
               </table>

                <br />
                <br />
        </table>
   
    </form>
</body>
</html>