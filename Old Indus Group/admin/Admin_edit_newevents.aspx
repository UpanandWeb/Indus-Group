<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_edit_newevents.aspx.cs" Inherits="Admin_edit_newevents" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Edit_Newevents</title>
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
    <script language="javascript" type="text/javascript">

function alertsubmit()
{
alert("JobPost has been saved Successfully");
}
</script>

 <link rel="stylesheet" href="Styles/stylesheet.css" />   
</head>
<body id="body1" runat="server">
    <form id="form1" runat="server">
    <div><center>
    <table>
    <tr><td>
    <table border="0" class="border" width="998px">
    <tr>
        <td colspan="2">
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr height="19">
      <td colspan="2" bgcolor="#336699" class="headings style21" style="height: 34px; font-size:medium;"> <br />Event Edit<br /><br /></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 332px;" class="lable"> Event Date :</td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
          <CC1:ToolkitScriptManager ID="ScriptManager1" runat="server">
          </CC1:ToolkitScriptManager>
         <asp:TextBox ID="txtsdate" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
        <CC1:CalendarExtender ID="extcalender" runat="server" TargetControlID="txtsdate"></CC1:CalendarExtender>
         
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 332px;">Event Title :</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjobtitle" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>

          <tr>
      <td class="lable" style="height: 19px; width: 332px;">Event Location :</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtaddress" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>

    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 332px;" class="lable"> Event Description :</td>
      <td style="height: 19px; width: 286px; " class="lable5" align="left">
          <asp:TextBox ID="txtjobdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 332px" class="lable6"> </td>
      <td style="height: 19px; width: 286px;" class="lable5">&nbsp;</td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#000040"
                        Height="30px" Text="Update" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
  </table>
    </td></tr></table></center>
    </div>
    </form>
</body>
</html>
