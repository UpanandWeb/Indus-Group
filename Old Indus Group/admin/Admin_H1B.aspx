<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_H1B.aspx.cs" Inherits="Admin_H1B" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - H1B</title>
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
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Employee Details has been edited Successfully");
}
function alertdelete()
{
alert("Employee Details has been deleted Successfully");
}
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    
    
  
    </table>
    
    
    </form>
</body>
</html>