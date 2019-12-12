<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeSheet_Mail.aspx.cs" Inherits="TimeSheet_Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TimeSheet_Mail</title>
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
    <table width="1000">
    <tr>
    <td width="100">&nbsp;</td>
    <td id="tdcontent" runat="server" align="left" width="800px" class="lable">
    laxmi
    </td>
    <td width="100">&nbsp;</td>
    </tr>
    
    <tr>
    <td colspan="3" align="center">
        <asp:Button ID="maillbtn" runat="server" Text="Submit" 
            onclick="maillbtn_Click" />
    </td>
    
    
    </tr>
    
    </table>
    </form>
</body>
</html>
