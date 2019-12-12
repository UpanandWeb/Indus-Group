<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_TS_Emp_Add.aspx.cs" Inherits="Admin_TS_Emp_Add" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TS_Emp_Add</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Employee Details has been edited Successfully");
}
function alertdelete()
{
alert("Employee Details has been deleted Successfully");
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
    
    <tr height="15"> 
    <td>&nbsp; </td>
    </tr>
    
   <%-- <tr>
    <td align="center">
   <uc2:TimeSheetMenu ID="Topmenu2" runat="server" />
    
    </td>
    </tr>--%>
    
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
       <table style="width: 802px">
                <tr>
                    <td class="data" align="center" valign="top">
                        &nbsp;<table id="tb1" allign="center" runat="server">
                            <tr height="50">
                                <td colspan="3" align="center" style="font-weight: bold; font-size: 10pt">
                                    Employer &amp; Project Details of Employee</td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    EmpId
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="empid" runat="server" CssClass="lable" Width="74px" ReadOnly="true" BorderWidth="1"></asp:TextBox>
                                </td>
                                
                                
                             </tr>
                            
                            <tr>
                                <td class="lable">
                                    Employee Name
                                    
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="txtcname" ReadOnly="true" runat="server" Width="209px" CssClass="lable" BorderWidth="1"> </asp:TextBox>
                                    
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="lable">
                                    Consultant Name
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="cname" runat="server" Width="209px" CssClass="lable" BorderWidth="1">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="cname" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="lable">
                                    Client Name
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="clname" runat="server" Width="209px" CssClass="lable" BorderWidth="1">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="clname" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                                <td class="lable">
                                    Department
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="dname" runat="server" Width="209px" CssClass="lable" BorderWidth="1">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="dname" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Supervisor
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="sname" runat="server" BorderWidth="1" Width="209px" CssClass="lable">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="sname" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            
                             
                            <tr>
                                <td class="lable">
                                    Project
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="txtproj" runat="server" BorderWidth="1" Width="209px" CssClass="lable">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        ControlToValidate="txtproj" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="lable">
                                    Project Time Period
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="ptime" runat="server" BorderWidth="1" Width="209px" CssClass="lable">
                                    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="ptime" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                            <td class="lable" colspan="3" align="center">
                                <asp:Button ID="btnsave" runat="server" Text="Submit" onclick="btnsave_Click" />
                            </td>
                            </tr>
                            
                        </table>
                        
                       
                    </td>
                </tr>
            </table>
      
      
      
      </td>
    </tr>
    
    
  
    </table>
    
    
    </form>
</body>
</html>