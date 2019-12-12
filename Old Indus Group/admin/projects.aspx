<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projects.aspx.cs" Inherits="projects" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Projects</title>
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
   <script src="includes/date-picker.js" type="text/javascript"></script>
       <style type="text/css">
               
         .style2
         {
             width: 50%;
             text-align:left;
         }
         .style3
         {
         	text-align:right;
             color: #174eb4;
             background-color: #ffffff;
             font-size: 13px;
             font-weight: normal;
             font-family: Geneva, Arial, Helvetica, sans-serif;
             height: 25px;          
            padding-right:70px;             
            
         }
         #gvedit td
        {
        	border:0.1px solid #CCCCCC;
        }
        #gvedit th
        {
        	border-right:0.1px solid #CCCCCC;
        }
   
    </style>
   
<script language="javascript" type="text/javascript" >
function Sample()
{
var n = document.getElementById("gvedit").rows.length;
var i; 
var j=0; 
for(i=2;i<=n;i++)
{
if(i<10)
{
if(document.getElementById("gvedit_ctl0"+i+"_chkselect").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvedit_ctl0"+i+"_chkselect").checked=false;
}
else
{
j++;
}
}
}
else
{
if(document.getElementById("gvedit_ctl"+i+"_chkselect").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvedit_ctl0"+i+"_chkselect").checked=false;
}
else
{
j++;
}
}
}
}
}
</script>

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

<script type="text/javascript" language="javascript">
    function confirmMessageDelete(frm)
    {
        for(i = 0; i < frm.length; i++)
        {
            if(frm.elements[i].checked)
            {
                return confirm("Are you sure you want to delete the selected record?");
                return true;
            }            
        }        
      alert('select atleast one Checkbox for Delete!');
      return false;
    }
    </script>
    
<script type="text/javascript" language="javascript">
    function selectOne(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked) 
       {
         return true;
       }
     }
    alert('select atleast one Checkbox for Edit!');
      return false;
    }
    </script>
 <script type="text/javascript" language="javascript">
    function selectOneView(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked)
       {
         return true;
       }
     }
    alert('select atleast one Checkbox for View!');
      return false;
    }
    </script>
    <script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>

</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <center>
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
   <table width="998px"> 
   <tr style="width:998px;" >
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
      <center>
      <table width="99px">
      
      <tr id="trbuttons" runat="server">
      <td>
      <asp:ImageButton ID="imgnew" runat="server" ToolTip="New" AlternateText="New" Height="20px" ImageUrl="images/new.jpg"
              Width="17px" onclick="imgnew_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgedit" ToolTip="Edit" runat="server" 
              OnClientClick="return selectOne(this.form)" AlternateText="Edit" 
              Height="20px" ImageUrl="images/edit.jpg"
              Width="17px" onclick="imgedit_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgdelete" runat="server" ToolTip="Delete" 
              OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete" 
              Height="20px" ImageUrl="~/images/1371_normalDelete_20_n_g.gif"
              Width="17px" onclick="imgdelete_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgview" runat="server" ToolTip="View" 
              OnClientClick="return selectOneView(this.form)" AlternateText="View" 
              ImageUrl="images/view.jpg" Height="20px" Width="21px" 
              onclick="imgview_Click" />
      </td>
      </tr>
      </table>
      
     <table align="center">
    <tr id="trmenu" runat="server">
    <td><asp:Button ID="btnnotdef" runat="server" Text="Not Defined" 
            CssClass="wr_login_title" OnClick="btnnotdef_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnproposed" runat="server" Text="Proposed" 
            CssClass="wr_login_title" onclick="btnproposed_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btninplan" runat="server" Text="In Planning" 
            CssClass="wr_login_title" onclick="btninplan_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btninprogress" runat="server" Text="In Progress" 
            CssClass="wr_login_title" onclick="btninprogress_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnonhold" runat="server" Text="On Hold" 
            CssClass="wr_login_title" onclick="btnonhold_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btncomplete" runat="server" Text="Complete" 
            CssClass="wr_login_title" onclick="btncomplete_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btntemplate" runat="server" Text="Template" 
            CssClass="wr_login_title" onclick="btntemplate_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnarchive" runat="server" Text="Archived" 
            CssClass="wr_login_title" onclick="btnarchive_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btngantt" runat="server" Text="Gantt" 
            CssClass="wr_login_title" onclick="btngantt_Click" />&nbsp;&nbsp;</td>        
    </tr>
    </table>
     
     <table width="998px" cellpadding="0" cellspacing="0" style="height: 209px">
     
     <tr>
     <td align="center">
     <asp:Panel ID="pnlgrid" runat="server" Width="998px">
     <table width="998px" align="center">
     
     <tr>
     <td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcat" runat="server" Font-Size="Large" ForeColor="#00277a"></asp:Label> </td>
     </tr>
     <tr>
     <td>&nbsp;</td>
     </tr>
     <tr>
     <td align="center">
     <asp:GridView  ID="gvedit" runat="server"  
           AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
             DataKeyNames="PID"  Width="965px" 
             onpageindexchanging="gvedit_PageIndexChanging">
     <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />               
      <Columns>
      <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" >
      <ItemTemplate>
      <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
      </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="CompanyName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Company Name" />
      <asp:BoundField DataField="ProjectName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Project Name" />
      <asp:BoundField DataField="ProjectOwner"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Project Owner" />
      <asp:BoundField DataField="ProjectType"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Project Type" />
      <asp:BoundField DataField="Status"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" />
      <asp:BoundField DataField="ShortName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Short Name" />
      <asp:BoundField DataField="ActualURL"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="URL" />
      </Columns>
       <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
                    ForeColor="#00277a" Height="30px" />
     </asp:GridView>
     </td>
     </tr>
     </table>
     </asp:Panel>
     </td>
     </tr>     
     <tr id="trlbl" runat="server">
     <td width="50px" align="center">
     <asp:Label ID="lblerr" runat="server" ForeColor="IndianRed" Font-Size="Larger"></asp:Label>
     </td>
     </tr>     
      <tr>
      <td>
      <asp:Panel ID="pnlproject" runat="server">
      <table cellspacing="0" cellpadding="0" width="998px" align="center">
     <tr>
     <td style="color:Blue; font-size:medium;"  align="center"><br /><br /> 
    Project Information<br /><br />
     </td>
     </tr>
     </table>     
     <br />
     
     <table cellpadding="0" cellspacing="0" align="center" style="width: 998px">
     
     <tr>
     <td class="style3"><span class="star">*</span>Project Name<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtprojname" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
         <asp:RequiredFieldValidator ID="reqf1" runat="server" 
             ControlToValidate="txtprojname" ErrorMessage="*"></asp:RequiredFieldValidator>
     <br /><br /></td>    
     </tr>     
     <tr>
     <td class="style3"><span class="star">*</span>Project Owner<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtprojowner" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
         <asp:RequiredFieldValidator ID="reqf2" runat="server" 
             ControlToValidate="txtprojowner" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br /><br /> </td>
 
     </tr>
     
      <tr>
      <td  class="style3"><span class="star">*</span>Company Type<br /><br /></td>
      <td class="style2">
      <asp:DropDownList ID="ddlctype" runat="server" CssClass="LABEL1" width="213px" 
              onselectedindexchanged="ddlctype_SelectedIndexChanged" AutoPostBack="true">
      <asp:ListItem Selected="True">----Select----</asp:ListItem>
      <asp:ListItem Value="1">Client</asp:ListItem>
      <asp:ListItem Value="2">Vendor</asp:ListItem>
      <asp:ListItem Value="3">Company</asp:ListItem>
      <asp:ListItem Value="4">Supplier</asp:ListItem>
      <asp:ListItem Value="5">Government</asp:ListItem>
      <asp:ListItem Value="6">Internal</asp:ListItem>
      <asp:ListItem Value="7">Not Applicable</asp:ListItem>
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="reqf3" runat="server" 
              ControlToValidate="ddlctype" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
      <br /><br /></td>
      
      </tr>
      
       <tr>
     <td class="style3"><span class="star">*</span>Company Name<br /><br /></td>
     <td class="style2">
      <asp:UpdatePanel ID="update1" runat="server">
      <ContentTemplate>
      <asp:DropDownList ID="ddlcompname" runat="server" Width="213px" CssClass="LABEL1">
      </asp:DropDownList>
          <asp:RequiredFieldValidator ID="reqf4" runat="server" 
              ControlToValidate="ddlcompname" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
      </ContentTemplate>
      <Triggers>
      <asp:AsyncPostBackTrigger ControlID="ddlctype" EventName="SelectedIndexChanged" />
      </Triggers>
      </asp:UpdatePanel>
     <br /></td>
      
     </tr>
     
     <tr>
     <td class="style3">&nbsp;&nbsp;&nbsp; Internal Division<br /><br /></td>
     <td class="style2">
     <asp:DropDownList ID="ddlintdiv" runat="server" CssClass="LABEL1" Width="213px">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem>abc</asp:ListItem>
     <asp:ListItem>def</asp:ListItem>
     </asp:DropDownList>
     <br /><br /></td>
     
     </tr>
     
      <tr>
     <td class="style3"><span class="star">*</span>Project Type<br /><br /></td>
     <td class="style2">
     <asp:DropDownList ID="ddlprojtype" runat="server" Width="213px" CssClass="LABEL1">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Unknown</asp:ListItem>
     <asp:ListItem Value="2">Operative</asp:ListItem>
     <asp:ListItem Value="3">Admin</asp:ListItem>
     </asp:DropDownList>
         <asp:RequiredFieldValidator ID="reqf5" runat="server" 
             ControlToValidate="ddlprojtype" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br /></td>
    
     </tr>
     
      <tr>
     <td class="style3"><span class="star">*</span>Priority<br /><br /></td>
     <td class="style2">
     <asp:DropDownList ID="ddlpriority" runat="server" Width="213px" CssClass="LABEL1">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Low</asp:ListItem>
     <asp:ListItem Value="2">Normal</asp:ListItem>
     <asp:ListItem Value="3">High</asp:ListItem>
     </asp:DropDownList>
         <asp:RequiredFieldValidator ID="reqf6" runat="server" 
             ControlToValidate="ddlpriority" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br /></td>
     
     </tr>
     
     <tr>
     <td class="style3"><span class="star">*</span>Status<br /><br /></td>
     <td class="style2">
     <asp:DropDownList ID="ddlstatus" runat="server" Width="213px" CssClass="LABEL1">
     <asp:ListItem Selected="True" Value="1">----Select----</asp:ListItem>
     <asp:ListItem Value="1">Not Defined</asp:ListItem>
     <asp:ListItem Value="2">Proposed</asp:ListItem>
     <asp:ListItem Value="3">In Planning</asp:ListItem>
     <asp:ListItem Value="4">In Progress</asp:ListItem>
     <asp:ListItem Value="5">On Hold</asp:ListItem>
     <asp:ListItem Value="6">Complete</asp:ListItem>
     <asp:ListItem Value="7">Template</asp:ListItem>
     <asp:ListItem Value="8">Archived</asp:ListItem>
     </asp:DropDownList>
         <asp:RequiredFieldValidator ID="reqf7" runat="server" 
             ControlToValidate="ddlstatus" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     <br /><br /></td>
    
     </tr>
     
      <tr>
     <td class="style3"><span class="star">*</span>Short Name<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtshname" runat="server" CssClass="LABEL1" Width="208px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="reqf8" runat="server" 
             ControlToValidate="txtshname" ErrorMessage="*"></asp:RequiredFieldValidator>
     <br /><br /></td>
     
     </tr>
     
     <tr>
     <td class="style3"><span class="star">*</span>Start Date<br /><br /> </td>
     <td class="style2">
     <asp:TextBox ID="txtstartdt" runat="server" Width="173px" CssClass="LABEL1"></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtstartdt" Format="MM-dd-yyyy"></cc1:CalendarExtender>

     <%--<img id="imgcal" src="images/calendar.gif" onclick="show_calendar('form1.txtstartdt');" runat="server" />--%>

         <asp:RequiredFieldValidator ID="reqf9" runat="server" 
             ControlToValidate="txtstartdt" ErrorMessage="*"></asp:RequiredFieldValidator>
     <br /><br /></td>
     
     </tr>
     
     <tr>
     <td class="style3">Target Finish Date<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtenddt" runat="server" Width="173px" CssClass="LABEL1"></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtenddt" Format="MM-dd-yyyy"></cc1:CalendarExtender>

     <%--<img id="img1" src="images/calendar.gif" onclick="show_calendar('form1.txtenddt');" runat="server" />--%>
     <br /><br /></td>    
     </tr>
     
     <tr>
     <td class="style3">Actual Budget($)<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtacbudget" runat="server" Width="208px" CssClass="LABEL1" onkeypress="return allowonlynumbers();"></asp:TextBox>
     <br /><br /></td>
     </tr>
     
     <tr>
     <td class="style3">Target Budget($)<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtbudget" runat="server" Width="208px" CssClass="LABEL1" onkeypress="return allowonlynumbers();"></asp:TextBox>
     <br /><br /></td>
     </tr>
     
     <tr>
     <td class="style3">Actual URL<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txturl" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
         <asp:RegularExpressionValidator ID="reg1" runat="server" 
             ControlToValidate="txturl" ErrorMessage="Enter Valid Web URL http://" 
             ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
     <br /><br /></td>
    
     </tr>    
     <tr>
     <td class="style3">Staging URL<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtsturl" runat="server" Width="208px" CssClass="LABEL1">
     </asp:TextBox>
         <asp:RegularExpressionValidator ID="reg2" runat="server" 
             ControlToValidate="txturl" ErrorMessage="Enter Valid Web URL http://" 
             ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
     <br /><br /></td>
     
     </tr>
     
     <tr>
     <td class="style3">Project Description<br /><br /></td>
     <td class="style2">
     <asp:TextBox ID="txtdesc" CssClass="LABEL1" TextMode="MultiLine" Rows="7" MaxLength="100" runat="server" Width="208px">
     </asp:TextBox>
     <br /><br /></td>
     </tr>
     
   </table>
     
      <table style="width: 998px" align="center">
    <tr>
    <td align="center"><br /><br />
    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" CssClass="wr_login_title"  />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Back" CssClass="wr_login_title" OnClick="Button1_Click"  />
    </td>
    </tr>
    </table>
      </asp:Panel>
      </td>
      </tr>      
      </table>
      </center>
      <asp:Label ID="lblAcess" runat="server" Visible="false" />
      </td>
      </tr>     
      
      </table>  
      </center>
 </form>
</body>
</html>

