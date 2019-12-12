<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departments_Create.aspx.cs" Inherits="Departments_Create" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - DepartmentsCreate</title>
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
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
    <style type="text/css">
        .style2
        {
            color: #174eb4;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            vertical-align: baseline;
            width: 400px;
            
            padding-left: 10px;
            background-color: #ffffff;
        }
        .style3
        {
            width: 300px;
        }
    </style>
</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <center>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div>
   <table width="998"> 
   <tr width="998">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
       <tr>
           <td>
           </td>
       </tr>
       
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog">
        </td>
       </tr>
       
       
       <tr>
       <td>
       
        <table border="1" width="998px">
    <tr>
    <td align="center">
     <table cellspacing="0" cellpadding="0" width="998px" align="center">
     <tr>
     <td style="color:Blue; font-size:medium;" class="header">
    
    Departments
     </td>
     </tr>
     </table>
     
     <br />
     
     <table cellpadding="0" cellspacing="0" align="center" style="width: 998px">
     
     <tr>
     <td class="style2" align="right"><span class="star">*</span>Company Type<br /><br /></td>
     <td class="style3">
     <asp:DropDownList ID="ddlctype" runat="server" CssClass="LABEL1" Width="145px" 
             onselectedindexchanged="ddlctype_SelectedIndexChanged1" AutoPostBack="true">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
      <asp:ListItem Value="1">Client</asp:ListItem>
      <asp:ListItem Value="2">Vendor</asp:ListItem>
      <asp:ListItem Value="3">Company</asp:ListItem>
      <asp:ListItem Value="4">Supplier</asp:ListItem>
      <asp:ListItem Value="5">Government</asp:ListItem>
      <asp:ListItem Value="6">Internal</asp:ListItem>
      <asp:ListItem Value="7">Not Applicable</asp:ListItem>
     </asp:DropDownList>
     <asp:RequiredFieldValidator ID="reqf4" runat="server" ControlToValidate="ddlctype" ErrorMessage="*" ValidationGroup="Dept" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     <td>
     
     <br />
     </td>
     </tr>
     
      
     <tr>
     <td class="style2" align="right"><span class="star">*</span>Company Name<br /></td>
     <td class="style3">
     <asp:UpdatePanel ID="update1" runat="server">
     <ContentTemplate>
     <asp:DropDownList ID="ddlcompname" runat="server" CssClass="LABEL1" Width="145px"></asp:DropDownList>
     <asp:RequiredFieldValidator ID="reqf1" runat="server" ControlToValidate="ddlcompname" ErrorMessage="*" ValidationGroup="Dept" InitialValue="----Select----"></asp:RequiredFieldValidator>
     </ContentTemplate>
     <Triggers>
     <asp:AsyncPostBackTrigger ControlID="ddlctype" EventName="SelectedIndexChanged" />
     </Triggers>
     </asp:UpdatePanel>
     
     <br />
     </td>
     <td>
     
     <br />
     </td>
     </tr>
     
     
     <tr>
     <td class="style2" align="right"><span class="star">*</span>Department Code<br /><br /></td>
     <td class="style3">
     <asp:TextBox ID="txtdeptid" runat="server" CssClass="LABEL1" Width="142px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="reqf2" runat="server" ControlToValidate="txtdeptid" ErrorMessage="*" ValidationGroup="Dept"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     <td>
     
    <br />
     </td>
     </tr>
    
     <tr>
     <td class="style2" align="right"><span class="star">*</span>Department Name<br /><br /></td>
     <td class="style3">
     <asp:TextBox ID="txtdeptname" runat="server" CssClass="LABEL1" Width="142px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="reqf3" runat="server" ControlToValidate="txtdeptname" ErrorMessage="*" ValidationGroup="Dept"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     <td>
     
     <br />
     </td>
     </tr>
     </table>
     <br />
     <table cellspacing="0" cellpadding="0" width="100%" align="center">
     <tr>
     <td align="center">
     <asp:Button ID="btnsubmit" runat="server" CssClass="wr_login_title" Text="Submit" Width="131px" onclick="btnsubmit_Click"  ValidationGroup="Dept" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="Button1" runat="server" CssClass="wr_login_title" Text="Back" Width="131px" onclick="Button1_Click"/>
     </td>
     </tr>
     </table>
       </td>
       </tr>
    </table>
    </td>
    </tr>
    </table>
      </div>
     </center>
 </form>
</body>
</html>

