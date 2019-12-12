<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_CareersNew_Edit.aspx.cs" Inherits="Admin_CareersNew_Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - CareersNew_Edit</title>
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
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
    <div align="center">
    <table>
    <tr><td>
    <table border="0" class="border" width="100%">
    <tr>
        <td colspan="2"> <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr><td colspan="2" style="height:19px"></td></tr>
    <tr>
      <td colspan="2" bgcolor="#336699" class="headings" style="height: 14px">Edit Job Postings</td>
    </tr>
    <tr><td colspan="2" style="height:25px"></td></tr>
    <tr>
      <td class="data" style="height: 19px; width: 132px;"> Job ID</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="txtjid" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;"> Job Title</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="jtitle" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;">Reqd. Quql.</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="jqual" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;">Reqd.Skills</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="jskills" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;">Location</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="jlocation" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;">Open From</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="jofrom" runat="server"  TextMode="SingleLine" CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      &nbsp; (Ex:MM/DD/YYYY)
      <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="jofrom">
          </cc1:CalendarExtender>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
     <tr>
      <td class="data" style="height: 19px; width: 132px;">Open Until</td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;">
      <asp:TextBox ID="joto" runat="server"  CssClass="lable4" Width="238px" Height="19px"></asp:TextBox>
      &nbsp; (Ex:MM/DD/YYYY)
      <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="joto">
      </cc1:CalendarExtender>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="2" align="center"></td>
    </tr>
    
    
    
    
    <tr>
      <td style="height: 19px; width: 132px;" class="lable">Job Desc.</td>
      <td style="height: 19px; width: 286px;" class="lable5">
      <asp:TextBox ID="jdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black" ></asp:TextBox>
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
                        Height="19px" Text=" Update" Width="100px" OnClick="btnsubmit_Click" /></td>
    </tr>
  </table>
    </td></tr></table>
    </div>
    </form>
</body>
</html>
