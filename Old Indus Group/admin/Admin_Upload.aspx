<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Upload.aspx.cs" Inherits="Admin_Upload" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Upload</title>
    
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
alert("Curriculum has been uploaded Successfully");
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
     <td align="center" valign="top" width="100%" class="lable">
    
    <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
    
    <td colspan='2' align="center" valign="bottom" style="height: 73px">
          
      <font size='4pt' color="#660000"><b>Upload Curriculum</b></font></td>
          </tr>
          <tr>
          
                <td colspan='2' style="width: 201px; height: 20px" class="lable" align="center" valign="middle">
                <br />
                  <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="lblerror" runat="server" Height="17px" Width="246px" Font-Bold="True" Font-Size="Small" ForeColor="#C00000"></asp:Label>
          
          <br />
          </td>
          </tr>
          <tr>
           <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">
          Course Name *</td>
      <td style="width: 451px; height: 43px;" valign="bottom">
       
       <asp:DropDownList ID="course" runat="server" AppendDataBoundItems="True" CssClass="lable" Width="268px">
                    <asp:ListItem Selected="True">Select One</asp:ListItem>
                    <asp:ListItem Value="I-9.pdf">I-9.pdf</asp:ListItem>
                    <asp:ListItem Value="W-4.pdf">W-4.pdf</asp:ListItem>
                    </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="course"
               ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px" InitialValue="Select One"></asp:RequiredFieldValidator></td>
                        
    </tr>
            
    <tr>
      <td style="width: 201px; height: 20px" valign="bottom" class="lable" align="left">
       Upload Form *</td>
      <td style="width: 451px; height: 20px;">
          <asp:FileUpload ID="curr" runat="server" CssClass="lable" Width="267px" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="curr"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
              <asp:Button ID="btnsubmit" runat="server" CssClass="labled" Height="22px"
                  Text="Submit" Width="49px" OnClick="btnsubmit_Click" />&nbsp; &nbsp;<asp:Button ID="reset" runat="server" CssClass="labled" Height="22px" Text="Cancel" /></div></td>
    </tr>
  </table>
    
    </td>
    
    
    </tr>
    
    
    
  
    </table>
    
    
    </form>
</body>
</html>
