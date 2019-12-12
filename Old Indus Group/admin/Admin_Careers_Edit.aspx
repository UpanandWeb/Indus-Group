<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Careers_Edit.aspx.cs" Inherits="igiit_Admin_Admin_Careers_Edit" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel -Careers_Edit</title>
    <script language="javascript" type="text/javascript">
function alertsubmit()
{
alert("JobPost has been saved Successfully");
}
</script>

 <link rel="stylesheet" href="Styles/stylesheet.css" />   
    <style type="text/css">
        .style24
        {
            height: 20px;
        }
    </style>
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
         <table border="0" class="border" width="998px">
    <tr width="998px">

<td colspan="2"> <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>

</tr>
<tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"  style="color:#00277a; font-weight:bold; font-size:14px;"  align="center"> Edit Job Postings</td>
    </tr>
    <tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
                  <tr>
      <td style="height: 19px; width: 132px;" class="lable" align="right"> <font size="2pt">Select Country </font> <strong>&nbsp;:&nbsp;</strong></td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
      <asp:DropDownList ID="ddcountry" runat="server"  CssClass="lable4" Width="238px" Height="25px" ForeColor="Black"  AutoPostBack="true"
           OnSelectedIndexChanged="ddcountry_SelectedIndexChanged" ></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddcountry" 
      ErrorMessage="Select Country" InitialValue="Select Country" ValidationGroup="aa" >*</asp:RequiredFieldValidator>
      </td>
    </tr>

                <tr>
      <td style="height: 19px; width: 132px;" class="lable" align="right"> <font size="2pt">Select State </font> <strong>&nbsp;:&nbsp;</strong></td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
      <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="lable4" Width="238px" Height="25px" ForeColor="Black"  AutoPostBack="true"
           OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" 
      ErrorMessage="Select State" InitialValue="Select State"   ValidationGroup="aa" >*</asp:RequiredFieldValidator>
      </td>
    </tr>

     <tr>
      <td style="height: 19px; width: 132px;" class="lable" align="right"> <font size="2pt">Select City </font> <strong>&nbsp;:&nbsp;</strong></td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
      <asp:DropDownList ID="ddcity" runat="server"  CssClass="lable4" Width="238px" Height="25px" ForeColor="Black"  ></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddcity" 
      ErrorMessage="Select city" InitialValue="Select City"  ValidationGroup="aa" >*</asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td class="lable" style="height: 19px; width: 132px;" align="right"> <font size="2pt">Job ID </font><strong>&nbsp;:&nbsp;</strong></td>
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjobid" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="25px"></asp:TextBox>
     
      </td>
    </tr>
    <tr>
      <td  style="height: 19px; width: 132px;" align="right" class="lable"> <font size="2pt">Job Name </font><strong>&nbsp;:&nbsp;</strong></td>
        
      <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
      <asp:TextBox ID="txtjname" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="25px"></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="6" align="center"></td>
    </tr>
    <tr>
      <td style="height: 19px; width: 132px;" class="lable" align="right"> <font size="2pt">Job Description</font> <strong>&nbsp;:&nbsp;</strong></td>
      <td style="height: 19px; width: 286px;" class="lable5" align="left">
      <asp:TextBox ID="txtjdesc" runat="server"  TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black"  onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
    </tr>
    <tr>
      <td  colspan="2" height="17" align="center" class="lable5"><asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#000040"
                        Height="30px" Text="Submit" Width="100px" OnClick="btnsubmit_Click"  ValidationGroup="aa"  /></td>
    </tr>
   <%-- <tr>
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
    </tr>--%>
    
  </table>
    </center>
    </form>
</body>
</html>
