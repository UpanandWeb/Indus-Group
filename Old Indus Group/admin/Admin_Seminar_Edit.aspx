<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Seminar_Edit.aspx.cs" Inherits="admin_Admin_Seminar_Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel -Seminars_Edit</title>
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
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
     <center>
         <table border="0" class="border" width="998px">
    <tr width="998px">

<td colspan="2"> <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>

</tr>
<tr>
<td>&nbsp;</td>
</tr>
    <tr height="19">
      <td colspan="2"  style="height: 14px; font-size:medium; color:#00277a;"> Update Seminar </td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 132px; font-size:12px;" align="right"> Course Name : </td>
      <
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjname" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtjname" 
      ErrorMessage="Enter Course">*</asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 132px; font-size:12px;" align="right"> Faculity Name : </td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtfaculity" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
          <%--<cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdate">
          </cc1:CalendarExtender>--%>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtfaculity" 
      ErrorMessage="Enter Faculity Name">*</asp:RequiredFieldValidator>
      </td>
    </tr>
      <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 132px; font-size:12px;" align="right"> Course Date :</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtdate" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
          <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdate">
          </cc1:CalendarExtender>
      
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdate" 
      ErrorMessage="Select Date">*</asp:RequiredFieldValidator>
      </td>
    </tr>
      <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 132px; font-size:12px;"  align="right"> Course Description :</td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
      <asp:TextBox ID="txtjdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtjdesc" 
      ErrorMessage="Enter Description">*</asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" align="center" style="height: 6px"></td>
    </tr>
    <tr>
      <td style="width: 132px" class="lable6"> </td>
      <td style="height: 19px; width: 286px;" class="lable5">&nbsp;</td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#000040"
                        Height="29px" Text=" Update" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
      <tr>
      <td  colspan="2" height="6" align="center">
      <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
      </td>
    </tr>
  </table>
    </center>
    </form>
</body>
</html>