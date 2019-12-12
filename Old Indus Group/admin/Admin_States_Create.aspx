<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_States_Create.aspx.cs" Inherits="Admin_States_Create" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - States_Create</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("State Details has been edited Successfully");
}
function alertdelete()
{
alert("State Details has been deleted Successfully");
}
function alertsubmit()
{
alert("State Details has been saved Successfully");
}
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
    <form id="form1" runat="server">
   <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
   
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                            <td width="100%" colspan="2">
                                             <table align='center' width='50%' border='1' valign='top' cellspacing='0' cellpadding='0'>

        <tr>
        
         <td align='center' style="width: 100%"><font color='#003399' size='3pt'><b>Add State Names</b></font></td> </tr>
</table> 
</td>
                                            </tr>
                                         
                                         
                                            <tr>
    
      <td colspan='2' style="width: 201px; height: 20px" class="lable" align="center" valign="middle">
         
          <asp:Label ID="lblerror" runat="server" Height="10px" Width="246px" Font-Bold="True" Font-Size="Small" ForeColor="#C00000"></asp:Label><br />
          </td>
          </tr>
    <tr>
       <td style="width: 202px; height: 33px;" class="lable" align="right" valign="middle">
           &nbsp;State &nbsp;Name 
      </td>
       <td style="width: 451px; height: 33px;">
       <asp:TextBox ID="emailid" runat="server" CssClass="lable" Width="281px" BorderColor="Gray" BorderWidth="1"  ></asp:TextBox>
          
          
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailid"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="2px"></asp:RequiredFieldValidator></td>
      
          
    </tr>
    
    <tr>
    
    <td style="width: 202px; height: 33px;" class="lable" align="right" valign="middle">
           Country &nbsp;Name 
      </td>
       <td style="width: 451px; height: 33px;">
       <asp:DropDownList ID="country" runat="server" CssClass="lable" Width="281px">
       <asp:ListItem Value="0" Selected="True">Select Country</asp:ListItem>
       </asp:DropDownList>
       
          
          
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="country"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="2px" InitialValue="Select Country"></asp:RequiredFieldValidator></td>
      
    </tr>
    
    
         
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div align="left">
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<asp:Button ID="btnsubmit" runat="server" CssClass="labled" Height="22px"
                  Text="Submit" Width="49px" OnClick="btnsubmit_Click" />
              &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;
              <asp:Button ID="reset" runat="server" CssClass="labled" Height="22px" Text="Cancel" /></div></td>
    </tr>
                                        
                                        </table>
      
      
      
      
      </td>
    </tr>
    
    </table>
    
    
    </form>
</body>
</html>