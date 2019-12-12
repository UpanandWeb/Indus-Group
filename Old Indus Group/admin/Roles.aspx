<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="Roles" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Indus Group - Admin Control</title>
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
        <style type="text/css">
             #gvroles td
        {
        	border:0.1px solid #CCCCCC;
        }
        #gvroles th
        {
        	border-right:0.1px solid #CCCCCC;
        }
        </style>
         <script type="text/javascript">
             function ConfirmationBox(username) {

                 var result = confirm('Are you sure you want to delete roles Details');
                 if (result) {

                     return true;
                 }
                 else {
                     return false;
                 }
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
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
    <div><center>
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
       
       <table style="width: 100%">
      
      <tr id="trbuttons" runat="server">
      <td align="center" colspan="3">
      <asp:Button ID="btnadd" runat="server" Text="Add New" CssClass="wr_login_title" 
              onclick="btnadd_Click" />
      </td>
      </tr>
      </table>
      
      <table width="100%" border="0">
      
      <tr>
     <td align="left">
     <asp:Panel ID="pnlgrid" runat="server" Width="773px">
     <table >
     <tr>
     <td align="left">
     <asp:GridView ID="gvroles" runat="server"  
             DataKeyNames="ID" Width="950px"
      AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10" 
                   PagerStyle-BackColor="White" 
             onpageindexchanging="gvroles_PageIndexChanging" 
             onrowcancelingedit="gvroles_RowCancelingEdit" 
            
             onrowediting="gvroles_RowEditing"  RowStyle-ForeColor="Gray"
             onrowupdating="gvroles_RowUpdating" EditRowStyle-ForeColor="Gray" onrowdatabound="gvroles_RowDataBound" 
             onselectedindexchanged="gvroles_SelectedIndexChanged" >
           
     <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
                    ForeColor="#00277a" Height="20px" />
                <RowStyle  />
                <HeaderStyle CssClass="label5" />
      <Columns>
      <asp:TemplateField>
      <ItemTemplate>
      <asp:LinkButton ID="lnkdel" runat="server" ForeColor="Gray" Text="Delete" OnClick="lnkdel_Click"></asp:LinkButton>
      </ItemTemplate>
      <ItemStyle Width="60px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Roles">
      <ItemTemplate>
       <%#Eval("Role_Name")%> 
      </ItemTemplate>
      
      <EditItemTemplate>
      <asp:TextBox ID="txtrole" ForeColor="Gray" runat="server"  Text='<%#Eval("Role_Name")%>'></asp:TextBox>
      </EditItemTemplate>
     
      </asp:TemplateField>
      </Columns>
      </asp:GridView>
     
     </td>
     </tr>
      </table>
      </asp:Panel>
      </td>
      </tr>
  
      <tr>
      <td align="center">
      <asp:Panel ID="pnladd" runat="server" GroupingText="Add New Role" Width="850px" >
      <br />
      <table width="100%" align="center">
      <tr>
      <td  align="center"  style="width:40%;"><span class="star">*</span>Role:</td>
      <td align="left"  >
      <asp:TextBox ID="txtrole" runat="server" CssClass="LABEL1" Width="145px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="reqf3" runat="server" ControlToValidate="txtrole" ErrorMessage="*" ValidationGroup="Role"></asp:RequiredFieldValidator>
      </td>
      </tr>
       <tr>
       <td align="center" colspan="2"><br />
       <asp:Button ID="btnsubmit" Text="Add" runat="server" CssClass="wr_login_title" OnClick="btnsubmit_Click" Width="55px" ValidationGroup="Role" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
       <asp:Button ID="Button1" Text="Back" runat="server" CssClass="wr_login_title" Width="55px"  OnClick="Button1_Click" />
       </td>
       </tr>
      </table>
      </asp:Panel>
      </td>
      </tr>
      
       </table>
       <asp:Label ID="lblAcess" runat="server" Visible="false" />
       </center>
      </div>
     
 </form>
</body>
</html>