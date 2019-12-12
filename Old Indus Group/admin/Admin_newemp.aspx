<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_newemp.aspx.cs" Inherits="admin_Admin_newemp" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - newemp</title>

    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div>
            <table border="0" style="width:100%">
                <tr>
                    <td colspan="3" valign="top" width='100%' class="lblog" >
                         <uc1:TopMenu ID="Topmenu2" runat="server" />
                    </td>
                </tr>
                <tr style="height:300px">
                    <td>
                        <table border="0" align="center" style="width:400px" cellpadding="10">
                            <tr><td colspan="3" style="height:30px"></td></tr>
                            <tr><td colspan="3" style="height:30px" class="headings"><u>New Employee Registration</u></td></tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lblempid" runat="server" Text="Emp ID"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txtempid" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtempid" ErrorMessage="Enter Employee Id" 
                                        ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lblemail" runat="server" Text="Email ID"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txtemail" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtemail" ErrorMessage="Enter Email Id" 
                                        ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="txtemail" ErrorMessage="Enter Correct Email" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="employee">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtpwd" ErrorMessage="Enter Password" 
                                        ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lblfname" runat="server" Text="First Name"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txtfname" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtfname" ErrorMessage="Enter First Name" 
                                        ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lbllname" runat="server" Text="Last Name"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:TextBox ID="txtlname" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtlname" ErrorMessage="Enter Last Name" 
                                        ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="headings2">
                                    <asp:Label ID="lblcountry" runat="server" Text="Country"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:DropDownList ID="ddlcountry" runat="server" Width="152px">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                        <asp:ListItem>USA</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="ddlcountry" ErrorMessage="Select Country" 
                                        InitialValue="Select" ValidationGroup="employee">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr><td colspan="4" style="height:30px"></td></tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <asp:Button ID="btnempcreate" runat="server" Text="Submit" ValidationGroup="employee" 
                                        onclick="btnempcreate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="lblmsg" CssClass="headings2" runat="server" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ValidationGroup="employee" ShowMessageBox="True" ShowSummary="False" />
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
