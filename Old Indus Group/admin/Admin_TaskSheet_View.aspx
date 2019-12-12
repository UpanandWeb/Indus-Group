<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_TaskSheet_View.aspx.cs" Inherits="Admin_TaskSheet_View" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TaskSheetView</title>
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
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("TimeSheet Details has been saved Successfully");
}
function alertdelete()
{
alert("TimeSheet Details has been deleted Successfully");
}

function alertsubmit()
{
alert("TimeSheet Details has been saved Successfully");
}


    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
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
          &nbsp;</td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
       <table style="width: 802px">
                <tr>
                    <td class="data" align="center" valign="top">
                        Task Sheet View&nbsp;<table id="tb1" allign="center" runat="server">
                            <tr>
                                <td class="lable">
                                    EmpId
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="empid" runat="server" CssClass="lable" Width="94px" 
                                        BorderWidth="1"></asp:TextBox>
                                </td>
                                
                                
                             </tr>
                            
                            <tr>
                                <td class="lable">
                                    Consultant Name
                                    
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="txtcname" ReadOnly="true" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Client Name
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:TextBox ID="clname"  ReadOnly="true" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                 
                                </td>
                                <td>
                                   </td>
                                <td class="lable">
                                    
                                    
                                </td>
                            </tr>
                        </table>
                        <table id="tb2" runat="server">
                        
                        <tr>
                        <td colspan="3" class="lable">
                            <asp:RadioButtonList ID="vtype" runat="server" RepeatDirection="Horizontal" 
                                CssClass="lable" onselectedindexchanged="vtype_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="Monthly" Selected="True">Monthly</asp:ListItem>
                            <asp:ListItem Value="Fortnightly">Fortnightly</asp:ListItem>
                            <asp:ListItem Value="Biweekly">Biweekly</asp:ListItem>
                            <asp:ListItem Value="Weekly">Weekly</asp:ListItem>
                            </asp:RadioButtonList>
                        
                        </td>
                        </tr>
                        
                        
                          <%--  <tr>
                                <td class="lable">
                                    Monthly
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                    <asp:CheckBox ID="Monthly" runat="server" CssClass="lable"/>
                                </td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td class="lable">
                                    Fortnightly
                                    
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="Fortnightly" runat="server" CssClass="lable" />
                                </td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td class="lable">
                                    Biweekly
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="Biweekly" runat="server" CssClass="lable" />
                                </td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td>
                                    &nbsp;&nbsp;</td>
                                <td class="lable">
                                    Weekly
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="Weekly" runat="server" CssClass="lable" />
                                </td>
                            </tr>--%>
                        </table>


                        &nbsp;
                        <table id="for3" runat="server" visible="false">
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
                       </table>
                       

                       &nbsp;
                       <table id="biw" runat="server" visible="false">
                            <tr>
                                <td class="lable">
                                    From Date
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                
                                 <input type="text" id="fdate" readonly value="" runat="server" style="width: 172px; height: 20px" class="lable9" />
      
         <a href="javascript:show_calendar('regForm.fdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
           &nbsp;&nbsp;&nbsp;&nbsp; <img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
         
                                       
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fdate"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                                <td class="lable">
                                    To Date
                                </td>
                                <td>
                                    : &nbsp;&nbsp;</td>
                                <td class="lable">
                                
                                 <input type="text" id="todate" readonly value="" runat="server" style="width: 172px; height: 20px" class="lable9" />
      
         <a href="javascript:show_calendar('regForm.todate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
           &nbsp;&nbsp;&nbsp;&nbsp; <img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
         
                                       
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="todate"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            
                       </table>
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                           <table>             
                                        
                            <tr>
                            <td class="lable" colspan="3" align="center">
                                <asp:Button ID="btnsave" runat="server" Text="Submit" onclick="btnsave_Click" />
                            </td>
                            </tr>
                            
                            <tr height="15">
                            <td></td>
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