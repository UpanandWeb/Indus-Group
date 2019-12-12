<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_TaskSheet_Create.aspx.cs" Inherits="Admin_TaskSheet_Create" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TaskSheetCreate</title>
    
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="regForm" runat="server">
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
                                <td colspan="3" align="center" style="font-weight: bold; font-size: 20pt">
                                    Task Sheet
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    EmpId
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="empid" runat="server" CssClass="lable" Width="94px" 
                                        BorderWidth="1" ReadOnly="true"></asp:TextBox>
                                </td>
                                
                                
                             </tr>
                            
                            <tr>
                                <td class="lable">
                                    Employee Name
                                    
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="ename" ReadOnly="true" runat="server" Width="209px" CssClass="lable" BorderWidth="1">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Department
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="dname" ReadOnly="true" runat="server" Width="209px" CssClass="lable" BorderWidth="1">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Supervisor
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="sname" ReadOnly="true" runat="server" BorderWidth="1" Width="209px" CssClass="lable">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            
                                                       
                            <tr>
                                <td class="lable">
                                    Project
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="pname" runat="server" BorderWidth="1" Width="209px" CssClass="lable" ReadOnly="true">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="lable">
                                    Task
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="tname" runat="server" BorderWidth="1" Width="209px" CssClass="lable">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        ControlToValidate="tname" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            
                            
                            
                             <tr>
                                <td class="lable">
                                    Date
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                
                                 <input type="text" id="csdate" readonly value="" runat="server" style="width: 172px; height: 20px" class="lable9" />
      
         <a href="javascript:show_calendar('regForm.csdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
           &nbsp;&nbsp;&nbsp;&nbsp; <img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
         
                                       
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="csdate"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            
                            
                            
                            
                            <tr>
                                <td class="lable">
                                    Working Hours
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="whrs" runat="server" CssClass="lable" BorderWidth="1" 
                                        Width="209px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="whrs" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            
                            <tr>
                            <td class="lable" colspan="3" align="center">
                                <asp:Button ID="btnsave" runat="server" Text="Submit" onclick="btnsave_Click" />
                            </td>
                            </tr>
                            
                            
                            <tr height="15">
                            <td colspan="3"></td>
                            </tr>
                            
                             <tr>
                                        
                                <td colspan="3">
                                <asp:GridView ID="TimeGrid" runat="server" 
                                          BorderWidth="1" BorderColor="Gray" Width="100%" 
                                        CssClass="lable" ></asp:GridView>
                        
    
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