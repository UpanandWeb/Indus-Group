<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_HLCreate.aspx.cs" Inherits="Admin_HLCreate" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/JobSeeker_LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - HLCreate</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
       <script language="javascript" type="text/javascript">
	function alertsubmit()
{
alert("Head Lines has been saved Successfully");
}
</script>
    
    
  <link rel="stylesheet" href="Admin Styles/stylesheet.css" />   
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
    <td align="right" class="lable">
        <asp:Label ID="LblEmbasy" runat="server" Text="HeadLine * " CssClass="lable1"></asp:Label>
    </td>
    <td>
            <asp:TextBox ID="TxtHead" runat="server"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RFEmbassy" runat="server" ErrorMessage="Enter HeadLine" ControlToValidate="TxtHead" Font-Size="XX-Small"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
    <tr>
    <td align="right" class="lable">
        <asp:Label ID="Label1" runat="server" Text="Description * " CssClass="lable1" ></asp:Label>
    </td>
    <td>
            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="377px" Width="658px"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Description" ControlToValidate="txtdesc" Font-Size="XX-Small"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
    
        <tr>
            <td align="right">
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="center">
            <asp:Button ID="btnsubmit" runat="server" Text="Save" OnClick="btnsubmit_Click" />
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td>
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