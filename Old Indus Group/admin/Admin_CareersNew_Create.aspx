<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_CareersNew_Create.aspx.cs" Inherits="Admin_CareersNew_Create" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Careersnew_Create</title>
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
    <center>
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
    <table border="0" class="border" width="998px">
    <tr width="998px">
        <td colspan="2"> <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr><td colspan="2" style="height:19px"></td></tr>
    <tr height="19">
      <td colspan="2" bgcolor="#336699" class="headings style21" style="height: 14px">Add 
          New Job Postings</td>
    </tr>
    <tr><td colspan="2" style="height:25px"></td></tr>
    <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right"> Job ID</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjid" runat="server" MaxLength="10" TextMode="SingleLine"
      ReadOnly="true" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
    
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right"> Job Title</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="jtitle" runat="server" MaxLength="50" TextMode="SingleLine"
       CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="jtitle" ErrorMessage="Enter Job title">*
      </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right">Reqd. Quql.</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="jqual" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jqual" ErrorMessage="Enter Required qulification">*
      </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right">Reqd.Skills</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="jskills" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jskills" ErrorMessage="Enter Required skills">*
      </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right">Location</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="jlocation" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="jlocation" ErrorMessage="Enter Location">*</asp:RequiredFieldValidator>

      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right">Open From</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
          <asp:TextBox ID="jofrom" runat="server" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="jofrom" ErrorMessage="Select from date">*
      </asp:RequiredFieldValidator>
          &nbsp; (Ex:MM/DD/YYYY)
          <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="jofrom">
          </cc1:CalendarExtender>
                  </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;" align="right">Open Until</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
          <asp:TextBox ID="joto" runat="server"  CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="joto" ErrorMessage="Select To date">*
      </asp:RequiredFieldValidator>
          &nbsp; (Ex:MM/DD/YYYY)
          <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="joto">
          </cc1:CalendarExtender>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 132px;" class="lable" align="right">Job Desc.</td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
        <asp:TextBox ID="jdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="jdesc" ErrorMessage="Enter job description">*
      </asp:RequiredFieldValidator>
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
                        Height="19px" Text=" Submit" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
  </table>
  </center>
    </form>
</body>
</html>
