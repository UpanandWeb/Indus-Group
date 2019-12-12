<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Departments" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Departments</title>
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
               
         .style3
         {
             color: #174eb4;
             background-color: #ffffff;
             font-size: 12px;
             font-weight: normal;
             font-family: Geneva, Arial, Helvetica, sans-serif;
             height: 35px;
             padding-left: 10px;
             
             vertical-align: baseline;
             width: 138px;
         }
   
           .style4
           {
               color: #174eb4;
               font-size: 13px;
               font-weight: normal;
               font-family: Geneva, Arial, Helvetica, sans-serif;
               height: 35px;
               vertical-align: baseline;
               width: 578px;
              text-align:right;
               
               padding-right:10px;
               background-color: #ffffff;
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
       <link href="includes/styles.css" rel="stylesheet" type="text/css" />
    
<script language="javascript" type="text/javascript" >
function Sample()
{
var n = document.getElementById("gvedit").rows.length;
var i; 
var j=0; 
for(i=2;i<n;i++)
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
    <script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
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
 
</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
    
    <div><center>
   <table width="998px"> 
   <tr width="998px">
        <td valign="top" class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
       <tr>
           <td>&nbsp;
           </td>
       </tr>
       <tr>
           <td>&nbsp;
           </td>
       </tr>
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog">
        </td>
       </tr>
       
       
       <tr>
       <td align="right" style="padding-right:40px">      
       
       <table style="width: 99px">
      
      <tr id="trbuttons" runat="server">
      <td>
      <asp:ImageButton ID="imgnew" runat="server" ToolTip="New" AlternateText="New" Height="20px" ImageUrl="images/new.jpg"
              Width="17px" onclick="imgnew_Click"  />
      </td>
      <td>
      <asp:ImageButton ID="imgedit" runat="server" ToolTip="Edit" 
              OnClientClick="return selectOne(this.form)" AlternateText="Edit" 
              Height="20px" ImageUrl="images/edit.jpg"
              Width="17px" onclick="imgedit_Click"  />
      </td>
      <td>
      <asp:ImageButton ID="imgdelete" runat="server" ToolTip="Delete" 
              OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete" 
              Height="20px" ImageUrl="~/images/1371_normalDelete_20_n_g.gif"
              Width="17px" onclick="imgdelete_Click"  />
      </td>
      <td>
      <asp:ImageButton ID="imgview" runat="server" ToolTip="View"
              OnClientClick="return selectOne(this.form)" AlternateText="View" 
              ImageUrl="images/view.jpg" Height="20px" Width="21px" 
              onclick="imgview_Click"/>
      </td>
      </tr>
      </table>
      
     <center>
    <table align="left" cellpadding="0" cellspacing="0" >
     
     <tr>
     <td>
     <asp:Panel ID="pnlgrid" runat="server" Width="773px">
     <table>
     <tr>
     <td style="padding-left:30px;">
     <asp:GridView  ID="gvedit" runat="server" 
             AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
             DataKeyNames="ID"  Width="925px" 
             onpageindexchanging="gvedit_PageIndexChanging">
     
      <Columns>
      <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" >
      <ItemTemplate>
      <asp:CheckBox ID="chkselect"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  runat="server" onclick="Sample();" />
      </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="DeptCode"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Department Code" />
      <asp:BoundField DataField="DeptName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Department Name" />
      <asp:BoundField DataField="CompanyType"   ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="CompanyType" />
      <asp:BoundField DataField="CompanyName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="CompanyName" />
     </Columns>
     <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt"  HorizontalAlign="Center"
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Size="Small" Font-Bold="True" 
                    ForeColor="#00277a" Height="30px" />
     </asp:GridView>
     </td>
     </tr>
     </table>
     </asp:Panel>
     </td>
     </tr>
     
      <tr>
      <td>
      <asp:Panel ID="pnlproject" runat="server">
      <table cellspacing="0" cellpadding="0" width="100%" align="center">
     <tr>
     <td style="color:Blue; font-size:medium; " class="header" align="center"><br /><br /> Department Information
     <br /><br /></td>
     </tr>
     </table>
     
     <br />
     
     <table cellpadding="0" cellspacing="0" align="center" style="width: 46%">
     
     <tr>
     <td class="style4"><span class="star">*</span>Company Type :</td>
     <td class="style3">
     <asp:DropDownList ID="ddlctype" runat="server" CssClass="LABEL1" Width="145px" 
            AutoPostBack="true" onselectedindexchanged="ddlctype_SelectedIndexChanged">
     <asp:ListItem Selected="True">----Select----</asp:ListItem>
      <asp:ListItem Value="1">Client</asp:ListItem>
      <asp:ListItem Value="2">Vendor</asp:ListItem>
      <asp:ListItem Value="3">Company</asp:ListItem>
      <asp:ListItem Value="4">Supplier</asp:ListItem>
      <asp:ListItem Value="5">Government</asp:ListItem>
      <asp:ListItem Value="6">Internal</asp:ListItem>
      <asp:ListItem Value="7">Not Applicable</asp:ListItem>
     </asp:DropDownList>
     </td>
     <td>
     <asp:RequiredFieldValidator ID="reqf4" runat="server" ControlToValidate="ddlctype" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
      
     <tr>
     <td class="style4"><span class="star">*</span>Company Name :</td>
     <td class="style3">
     <asp:UpdatePanel ID="update1" runat="server">
     <ContentTemplate>
     <asp:DropDownList ID="ddlcompname" runat="server" CssClass="LABEL1" Width="145px"></asp:DropDownList>
     </ContentTemplate>
     <Triggers>
     <asp:AsyncPostBackTrigger ControlID="ddlctype" EventName="SelectedIndexChanged" />
     </Triggers>
     </asp:UpdatePanel>
     </td>
     <td>
     <asp:RequiredFieldValidator ID="reqf1" runat="server" ControlToValidate="ddlcompname" ErrorMessage="*" InitialValue="----Select----"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
     
     <tr>
     <td class="style4"><span class="star">*</span>Department Code :</td>
     <td class="style3">
     <asp:TextBox ID="txtdeptid" runat="server" CssClass="LABEL1" Width="142px"></asp:TextBox>
     </td>
     <td>
     <asp:RequiredFieldValidator ID="reqf2" runat="server" ControlToValidate="txtdeptid" ErrorMessage="*"></asp:RequiredFieldValidator>
     </td>
     </tr>
    
     <tr>
     <td class="style4"><span class="star">*</span>Department Name :</td>
     <td class="style3">
     <asp:TextBox ID="txtdeptname" runat="server" CssClass="LABEL1" Width="142px"></asp:TextBox>
     </td>
     <td>
     <asp:RequiredFieldValidator ID="reqf3" runat="server" ControlToValidate="txtdeptname" ErrorMessage="*"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
     
     </table>
     
     
     
      <table style="width: 697px;" align="center">
    <tr>
    <td align="center">
      
    <asp:Button ID="btnupdate" runat="server" Text="UPDATE"  CssClass="wr_login_title" 
            onclick="btnupdate_Click"  />
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

</table></center>
      </div>
     
 </form>
</body>
</html>
