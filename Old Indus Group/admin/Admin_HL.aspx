<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_HL.aspx.cs" Inherits="Admin_HL" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/JobSeeker_LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - HL</title>
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
alert("Headlines Info has been edited Successfully");
}
function alertdelete()
{
alert("Headlines Info has been deleted Successfully");
}
    </script>
    
    
  <link rel="stylesheet" href="Admin Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#99cccc">
    <tr height="25">
                        <td style="height: 25px">
                         <uc1:MainMenu ID="MainMenu1" runat="server" />
                        
                        </td>
                           
                      </tr>
                     
   <tr>
    <td>
     <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#99cccc">
    <tr height="25">
    <td align="left" valign="top" width='20%' style="height: 19px">
    
        <uc2:LeftMenu ID="MainMenu2" runat="server" />
    
 
    </td>
    
    <td id="td1" runat="server" align="center" valign="top" width="100%" class="lable" style="height: 11px"> 
    <table align='center' border='1' valign='top' cellspacing='0' cellpadding='0' style="width: 96%">

        <tr>
        
         <td colspan='4' align='center' bgcolor='#cccc99' width='100%'><font color='#003399' size='3pt'><b>Head Lines (Top Stories)</b></font></td> </tr>

       <%-- <tr> 
        
        <td align='right' bgcolor='#cccccc' width='100%'><font color='#003399' size='3pt'><b>Search By Country</b></font> </td>

        <td  align='left' bgcolor='#cccccc' width='100%'><font color='#003399' size='1pt'>
             <asp:TextBox ID="srchtxt" runat="server" ></asp:TextBox>
        </td>
        
        <td  align='left' bgcolor='#cccccc' style="width: 223%"><font color='#003399' size='2pt'>
             <asp:Button ID="gobut" runat="server" Text="Go" OnClick="gobut_Click" CausesValidation="false"  />
        </td>
        </tr>--%>
   
    <tr>
      <td  colspan="4" id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
    
    
    </td>
    </tr>
    
    
    <tr>
      <td id="tdcontents" runat="server" align="center" valign="top" width="100%" class="lable" style="height: 16px"> 
    
    
    </td>
    </tr>
    </table> 
    
    </td>
    </tr>
    </table>
  
     </td>
    </tr>
 </table>
  
    </form>
  
  </body>
</html>