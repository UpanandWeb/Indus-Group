<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-H1B-CheckList.aspx.cs" Inherits="admin_Admin_H1B_CheckList" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .sign {
            border: 0;
            outline: 0;
            background: transparent;
            border-bottom: 1px solid black;
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
<body>
    <form id="form1" runat="server">
        <%--<cc1:toolkitscriptmanager id="tl" runat="server"></cc1:toolkitscriptmanager>--%>

        <table width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
            <tr width="100%">
                <td valign="top" width="100%" class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="30px" align="center">
                    <hr />
                </td>
            </tr>

            <tr>
                <td height="30px" align="center">
                    <asp:RadioButton ID="h1checklist" runat="server" Text="H-1B PETITION CHECKLIST" Checked="true" GroupName="h1b" OnCheckedChanged="h1checklist_CheckedChanged" AutoPostBack="true" />
                    <asp:RadioButton ID="h4application" runat="server" Text="H4 APPLICATION CHECKLIST" GroupName="h1b" OnCheckedChanged="h4application_CheckedChanged" AutoPostBack="true" />
                    <asp:RadioButton ID="h1information" runat="server" Text="H-1B INFORMATION SHEET" GroupName="h1b" OnCheckedChanged="h1information_CheckedChanged" AutoPostBack="true" />
                    <asp:RadioButton ID="downloadfile" runat="server" Text="Download Filled Applications" GroupName="h1b" OnCheckedChanged="downloadfile_CheckedChanged" AutoPostBack="true" />

                </td>
            </tr>
            <tr>
                <td height="30px" align="center"></td>
            </tr>
            <tr>
                <td height="30px" align="center">
                    <h3>H-1B PETITION CHECKLIST</h3>
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
                <td colspan="3" align="center" width="100%">
                    <table align="center" width="80%">
                        <tr>
                            <td align="right" width="35%">
                                Select Employee
                            </td>
                            <td align="center" width="10%">
                                <b>:</b>
                            </td>
                            <td align="left" width="35%">
                                 <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="160px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddemp_SelectedIndexChanged">
                                            </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="re1" runat="server" ControlToValidate="ddemp" InitialValue="Select Employee"
                                                    ErrorMessage="Please Select Employee" ForeColor="Red" ValidationGroup="permission">
                                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr><td><br /></td></tr>
                        <tr>
                            <td colspan="3" align="center" width="80%">
                                <table align="center" width="80%">
                                    <tr>
                                        <td align="center" width="25%">
                                            <asp:CheckBox ID="chk1" runat="server" Text="H-1B Application CheckList  2019" />
                                        </td>
                                        <td align="center" width="25%">
                                            <asp:CheckBox ID="chk2" runat="server" Text="H-4 Application CheckList 2019" />
                                        </td>
                                        <td align="center" width="25%">
                                            <asp:CheckBox ID="chk3" runat="server" Text="H1-B Information Sheet for New Emp  2019" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
             <tr><td><br /></td></tr>

             <tr>
                 <td colspan="3" align="center" width="80%">
                     <asp:Button ID="btnsave" runat="server" Text="Submit" OnClick="btnsave_Click" ValidationGroup="permission" />
                 </td>
             </tr>
        </table>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
