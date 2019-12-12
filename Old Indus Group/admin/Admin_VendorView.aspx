<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_VendorView.aspx.cs" Inherits="Admin_VendorView" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - VendorView</title>
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
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
   
    <tr>
    <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" RowStyle-VerticalAlign="Middle"  SelectedRowStyle-VerticalAlign="Middle">
        </asp:GridView>
        &nbsp;
        </td>
    </tr>
        </table>
    </form>
</body>
</html>

