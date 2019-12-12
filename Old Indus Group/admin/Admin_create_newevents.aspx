<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_create_newevents.aspx.cs" Inherits="Admin_create_newevents" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Create_NewEvent</title>
    <script language="javascript" type="text/javascript">
function alertsubmit()
{
alert("JobPost has been saved Successfully");
}
</script>

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
<body id="body1" runat="server">
    <form id="form1" runat="server">
             <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
   <center>
    <table border="0" class="border" style="width: 100%">
    <tr>
        <td colspan="2">
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr height="29">
      <td colspan="2" bgcolor="#336699" class="headings style21" style="height: 14px" align="center"> 
          <font color='#003399' size='4pt'><b>Event Postings</b></font> </td>
    </tr>
        <tr><td><br /></td></tr>
    <tr>
      <td  align="right" > Event Date :</td>
      <td style="height: 19px; width: 286px;" class="" align="left">
       <asp:TextBox ID="txtjobdate" runat="server" Width="238px" Height="19px"></asp:TextBox>
          <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID ="txtjobdate" Format="MM/dd/yyyy">
          </asp:CalendarExtender>
       <asp:RequiredFieldValidator ID="rfvdate" runat="server"  ControlToValidate="txtjobdate" ValidationGroup="newsgrp"
              ErrorMessage="Please Select job Date">*</asp:RequiredFieldValidator>         
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td  align="right">Event Title :</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjobtitle" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvjobtitle" runat="server" ControlToValidate="txtjobtitle"
              ValidationGroup="newsgrp" ErrorMessage="Please Enter Job Title">*</asp:RequiredFieldValidator>
      </td>
    </tr>
         <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
            <tr>
      <td  align="right">Event Location :</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtaddress" runat="server" MaxLength="500" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress"
              ValidationGroup="newsgrp" ErrorMessage="Please Enter Job Title">*</asp:RequiredFieldValidator>
      </td>
    </tr>

    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  align="right" > Event Description :</td>
      <td style="height: 19px; width: 286px;" align="left">
          <asp:TextBox ID="txtjobdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="446px" Height="140px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvjobdesc" runat="server"  ControlToValidate="txtjobdesc"
              ValidationGroup="newsgrp" ErrorMessage="Please Enter Job description">*</asp:RequiredFieldValidator>
      </td>
    </tr>
 <%--   <tr>
      <td  colspan="2" align="center" style="height: 6px">
      <asp:ValidationSummary ID="valsumm" runat="server" ValidationGroup="newsgrp" />
      </td>
    </tr>--%>
    <tr>
      <td style="width: 132px" class="lable6"> </td>
      <td style="height: 19px; width: 286px;" class="lable5">&nbsp;</td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#000040"
                        Height="30px" Text=" Save" Width="100px" OnClick="btnsubmit_Click" ValidationGroup="newsgrp" /></td>
    </tr>
  </table>
   </center>
    </form>
</body>
</html>
