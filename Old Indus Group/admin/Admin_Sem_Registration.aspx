<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Sem_Registration.aspx.cs" Inherits="admin_Admin_Sem_Registration" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : - Admin Control Panel - Seminars</title>
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

function alertdelete()
{
    alert("Candidate Details has been deleted Successfully");
}

    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }  
</script>

  <style type="text/css">		
	
      #GridView1 td
        {
        	border:0.1px solid #CCCCCC;
        }
        #GridView1 th
        {
        	border:1px solid #CCCCCC;
        }
	</style>
<link rel="stylesheet" href="Styles/stylesheet.css" />

</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager><center>
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
             <table width="998px">
                <tr>
                    <td>                                    
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>
            </table>       
        </td>
    </tr>   
       <tr>
           <td style="height:30px">
           </td>
       </tr>     
       <tr>
           <td  align="right">
           <a href="Admin_Seminar.aspx" style="padding-right:15px; color:#00277a; font-size:9pt "><< Back</a>
           </td>
       </tr>
       <tr><td>&nbsp;</td></tr>
         <tr>
         <td id="Td1" runat="server" align="center" style="height:30px"  class="style24" width=" 90%"> 
         
         <asp:Label ID="lblseminnartitle" runat="server" Text="Candiates List" ForeColor="#00277a" Font-Bold="true" Font-Size="Large"></asp:Label>
             <br />
           </td>
       </tr>
      
     <tr>
    <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
    </tr>
    <tr><td align="right" valign="bottom" style="font-size:8pt; color:#00277a">* To send mail, Please click on e-mail address</td></tr>
    
   <tr>
   <td align="center">
   <asp:GridView ID="GridView1" runat="server" Width="100%" 
    AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
           onpageindexchanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="E-mail"   >                
                <ItemTemplate>
                <a href='mailto:<%#Eval("email") %>' style="color:Maroon; " ><%#Eval("email") %></a>           
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />               
                 <HeaderStyle   HorizontalAlign="Center" />                 
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Name" >                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center"/>
                 <HeaderStyle Width="10%"  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Contact" >                
                <ItemTemplate>
                    <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("mobile") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Course" >                
                <ItemTemplate>
                    <asp:Label ID="lblcourse" runat="server" Text='<%# Bind("course") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Address" >                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("address") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>            
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="12%" HorizontalAlign="Center" />
            </asp:TemplateField>            
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="City" >  
                <ItemTemplate>
                        <asp:Label ID="lblcity" runat="server" Text='<%# Bind("city") %>' ForeColor="Gray"></asp:Label>
            </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="8%" HorizontalAlign="Center" />
              </asp:TemplateField>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="State" >  
                <ItemTemplate>
                        <asp:Label ID="lblstate" runat="server" Text='<%# Bind("state") %>' ForeColor="Gray"></asp:Label>
            </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  HorizontalAlign="Center" />
              </asp:TemplateField>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Zip" >  
                <ItemTemplate>
                        <asp:Label ID="lblzip" runat="server" Text='<%# Bind("zipcode") %>' ForeColor="Gray"></asp:Label>
            </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  HorizontalAlign="Center" />
              </asp:TemplateField>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Country" >  
                <ItemTemplate>
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("country") %>' ForeColor="Gray"></asp:Label>
            </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="8%" />
              </asp:TemplateField>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Comment" >  
                <ItemTemplate>
                        <asp:Label ID="lblComment" runat="server" Text='<%# Bind("comments") %>' ForeColor="Gray"></asp:Label>
            </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
               
              </asp:TemplateField>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" >  
                 <ItemTemplate>            
                        <asp:LinkButton ID="lnkdeletetemp" runat="server" CommandArgument='<%#Eval("sid") %>' OnCommand="FormatUrlDl" ForeColor="Gray" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />                
                </asp:TemplateField>  
        </Columns>   
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt"  HorizontalAlign="Center" 
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
      <input id="btnDummy2" runat="server" type="button" style="display: none;" />
   <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btncancel" TargetControlID="btnDummy2" PopupControlID="pnldelsms" DropShadow="false"
      PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground" OkControlID="Button1">
      </cc1:ModalPopupExtender>
 <asp:Panel ID="pnldelsms" runat="server" Width="400px" Height="150px">
<fieldset style="width:402px">
<asp:Panel ID="pnldelete" runat="server" >
</asp:Panel>
 <table align="center"  border="0" cellpadding="0" cellspacing="0" style="background-color:#fff; height:150px">
   
   <tr>
       <td align="center" class="headertext" style="background:#CCCCCC">Delete the Record</td>
        <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="X" ForeColor="white" 
                            BorderStyle="None" BackColor="Gray"/>
                    
                    </td>   
     </tr> 
         
         <tr>         
        <td align="center" width="100%">
         <table width="100%" border="0">        
        <tr>         
          <td>
              Are You Sure want to Delete the Candidate.<br />
        </td>
        </tr>      
          <tr>
          <td align="right">&nbsp;</td>
        </tr>
        <tr>        
          <td align="center">
                  <asp:Button ID="imgbtnsmsdelete" runat="server" Text="Confirm" OnClick="imgbtnsmsdelete_Click"
                 /> &nbsp; <asp:Button ID="btncancel" runat="server" Text="Cancel" />  </td>
        </tr>
        <tr>
          <td>   
          <asp:Label ID="lbldid" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="lblAcess" runat="server" Visible="false" /> 
          </td>
          </tr>
      
      </table>
        </td>
         </tr>
</table>
</fieldset>
</asp:Panel></center>
    
    </form>
</body>
</html>
