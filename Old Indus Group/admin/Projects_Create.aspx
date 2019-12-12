<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Projects_Create.aspx.cs" Inherits="Projects_Create" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Projects_Create</title>
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
<script src="includes/date-picker.js" type="text/javascript"></script>
     <style type="text/css">
         
         .stylein
         {
            
             font-size: 13px;
             font-weight: normal;
             font-family: Geneva, Arial, Helvetica, sans-serif;
             height: 15px;
             text-align:right;
             padding-right:100px;
             width:50%;
             vertical-align: baseline;
            
         }
     
    </style>
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
   <script type="text/javascript">
function allowonlynumbers() 
{
if(event.keyCode >= 48 && event.keyCode <= 57) 
{
return true; 
}
else
{
alert('Only numbers can be entered.');return false; 
} 
}

</script> 
</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <center>
    <%--<asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>--%>
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>

    <div>
   <table width="998px"> 
   <tr width="998px">
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
      
      
      <table border="0" width="998px" align="center">
    <tr style="width:998px;">
    <td>
     <table cellspacing="0" cellpadding="0" width="998px" align="center">
     <tr>
     <td style="color:Blue;font-size:large" class="header" align="center">
    Project Information
     </td>
     </tr>
     </table>
     
     <br /><br />
     
     <table cellpadding="0" cellspacing="0" align="center" style="width:998px">
     <tr>
     <td class="stylein"><span class="star">*</span>Project Name<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txtprojname" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
     
     <asp:RequiredFieldValidator ID="reqf1" runat="server" ValidationGroup="proj" ControlToValidate="txtprojname" ErrorMessage="*"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
    
     </tr>
     
     <tr>
     <td class="stylein"><span class="star">*</span>Project Owner<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txtprojowner" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
     <asp:RequiredFieldValidator ID="reqf2" runat="server" ValidationGroup="proj" ControlToValidate="txtprojowner" ErrorMessage="*"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     
     </tr>
     
      <tr>
      <td class="stylein"><span class="star">*</span>Company Type<br /><br /></td>
      <td align="left">
      <asp:DropDownList ID="ddlctype" runat="server" CssClass="LABEL1" width="208px" AutoPostBack="true" OnSelectedIndexChanged="ddlctype_SelectedIndexChanged">
      <asp:ListItem Selected="True">----Select----</asp:ListItem>
      <asp:ListItem Value="1">Client</asp:ListItem>
      <asp:ListItem Value="2">Vendor</asp:ListItem>
      <asp:ListItem Value="3">Company</asp:ListItem>
      <asp:ListItem Value="4">Supplier</asp:ListItem>
      <asp:ListItem Value="5">Government</asp:ListItem>
      <asp:ListItem Value="6">Internal</asp:ListItem>
      <asp:ListItem Value="7">Not Applicable</asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator ID="reqf3" runat="server" ValidationGroup="proj" ControlToValidate="ddlctype" InitialValue="----Select----" ErrorMessage="*"></asp:RequiredFieldValidator>
      <br /><br />
      </td>
     
      </tr>
      
       <tr>
     <td class="stylein"><span class="star">*</span>Company Name<br /><br /></td>
     <td align="left">
     <asp:UpdatePanel ID="update1" runat="server">
      <ContentTemplate>
      <asp:DropDownList ID="ddlcompname" runat="server" Width="208px" CssClass="LABEL1">
      </asp:DropDownList>
      </ContentTemplate>
      <Triggers>
      <asp:AsyncPostBackTrigger ControlID="ddlctype" EventName="SelectedIndexChanged" />
      </Triggers>
      </asp:UpdatePanel>
      <asp:RequiredFieldValidator ID="reqf4" runat="server" ValidationGroup="proj" ControlToValidate="ddlcompname" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br />
      </td>
      
     </tr>
     
     <tr>
     <td class="stylein">Internal Division<br /><br /></td>
     <td align="left">
     <asp:DropDownList ID="ddlintdiv" runat="server" CssClass="LABEL1" Width="208px">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem>abc</asp:ListItem>
     <asp:ListItem>def</asp:ListItem>
     </asp:DropDownList>
     <br /><br />
     </td>
     
     </tr>
     
      <tr>
     <td class="stylein"><span class="star">*</span>Project Type<br /><br /></td>
     <td align="left">
     <asp:DropDownList ID="ddlprojtype" runat="server" Width="208px" CssClass="LABEL1">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Unknown</asp:ListItem>
     <asp:ListItem Value="2">Operative</asp:ListItem>
     <asp:ListItem Value="3">Admin</asp:ListItem>
     </asp:DropDownList>
     <asp:RequiredFieldValidator ID="reqf5" runat="server" ValidationGroup="proj" ControlToValidate="ddlprojtype" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
    
     </tr>
     
      <tr>
     <td class="stylein"><span class="star">*</span>Priority<br /><br /></td>
     <td align="left">
     <asp:DropDownList ID="ddlpriority" runat="server" Width="208px" CssClass="LABEL1">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Low</asp:ListItem>
     <asp:ListItem Value="2">Normal</asp:ListItem>
     <asp:ListItem Value="3">High</asp:ListItem>
     </asp:DropDownList>
     <asp:RequiredFieldValidator ID="reqf6" runat="server" ValidationGroup="proj" ControlToValidate="ddlpriority" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
    <br /><br />
     </td>
     
     </tr>
     
     <tr>
     <td class="stylein"><span class="star">*</span>Status<br /><br /></td>
     <td align="left" >
     <asp:DropDownList ID="ddlstatus" runat="server" Width="208px" CssClass="LABEL1">
     <asp:ListItem Selected="True" Value="0">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Not Defined</asp:ListItem>
     <asp:ListItem Value="2">Proposed</asp:ListItem>
     <asp:ListItem Value="3">In Planning</asp:ListItem>
     <asp:ListItem Value="4">In Progress</asp:ListItem>
     <asp:ListItem Value="5">On Hold</asp:ListItem>
     <asp:ListItem Value="6">Complete</asp:ListItem>
     <asp:ListItem Value="7">Template</asp:ListItem>
     <asp:ListItem Value="8">Archived</asp:ListItem>
     </asp:DropDownList>
     <asp:RequiredFieldValidator ID="reqf7" runat="server" ControlToValidate="ddlstatus" ErrorMessage="*" ValidationGroup="proj" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
    
     </tr>
     
      <tr>
     <td class="stylein"><span class="star">*</span>Short Name<br /><br /></td>
     <td align="left" >
     <asp:TextBox ID="txtshname" runat="server" CssClass="LABEL1" Width="208px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="reqf8" runat="server" ControlToValidate="txtshname" ErrorMessage="*" ValidationGroup="proj"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     
     </tr>
     
     <tr>
     <td class="stylein"><span class="star">*</span>Start Date<br /><br /> </td>
     <td align="left" >
     <asp:TextBox ID="txtstartdt" runat="server" Width="173px" CssClass="LABEL1"></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtstartdt" Format="MM-dd-yyyy"></cc1:CalendarExtender>

     <%--<img id="imgcal" src="images/calendar.gif" onclick="show_calendar('form1.txtstartdt');" runat="server" />--%>

     <asp:RequiredFieldValidator ID="reqf9" runat="server" ControlToValidate="txtstartdt" ErrorMessage="*" ValidationGroup="proj"></asp:RequiredFieldValidator>
     <br /><br />
     </td>
     
     </tr>
     
     <tr>
     <td class="stylein">Target Finish Date<br /><br /></td>
     <td align="left" >
     <asp:TextBox ID="txtenddt" runat="server" Width="173px" CssClass="LABEL1"></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtenddt" Format="MM-dd-yyyy"></cc1:CalendarExtender>

     <%--<img id="img1" src="images/calendar.gif" onclick="show_calendar('form1.txtenddt');" runat="server" />--%>
     <br /><br />
     </td>
     
     </tr>
     
     <tr>
     <td class="stylein">Actual Budget($)<br /><br /></td>
     <td align="left" >
     <asp:TextBox ID="txtacbudget" runat="server" Width="208px" CssClass="LABEL1" onkeypress="return allowonlynumbers();"></asp:TextBox>
     <br /><br />
     </td>
     </tr>
     
     <tr>
     <td class="stylein">Target Budget($)<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txtbudget" runat="server" Width="208px" CssClass="LABEL1" onkeypress="return allowonlynumbers();"></asp:TextBox>
     <br /><br />
     </td>
     </tr>
     
     <tr>
     <td class="stylein">&nbsp;Actual URL<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txturl" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
     <asp:RegularExpressionValidator ID="reg1" runat="server" ControlToValidate="txturl" ErrorMessage="Enter Valid Web URL http://" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
     <br /><br />
     </td>
     
     </tr>
     
     
     <tr>
     <td class="stylein">Staging URL<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txtsturl" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txturl" ErrorMessage="Enter Valid Web URL http://" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
     <br /><br />
     </td>
     
     </tr>
     
     <tr>
     <td class="stylein">Project Description<br /><br /></td>
     <td align="left">
     <asp:TextBox ID="txtdesc" CssClass="LABEL1" TextMode="MultiLine" Rows="7" MaxLength="100" runat="server" Width="208px">
     </asp:TextBox>
     <br /><br />
     </td>
     </tr>
     
   </table>
     
      <table style="width: 686px" align="center">
    <tr>
    <td align="center">
    <asp:UpdatePanel ID="update2" runat="server">
    <ContentTemplate>
    <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" OnClick="btnsubmit_Click" CssClass="wr_login_title" Width="79px" ValidationGroup="proj" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Back" CssClass="wr_login_title" 
            Width="79px" onclick="Button1_Click" />
            </ContentTemplate>
            </asp:UpdatePanel>
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


