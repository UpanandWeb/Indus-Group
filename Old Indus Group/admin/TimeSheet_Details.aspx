<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeSheet_Details.aspx.cs" Inherits="TimeSheet_Details" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TimeSheet_Details</title>
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
alert("Employee Details has been edited Successfully");
}
function alertdelete()
{
alert("Employee Details has been deleted Successfully");
}
    </script>


    <script type="text/javascript">
        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete employee record ' + username + ' Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
</script>
    
    <style>
     #empdata td
        {
        	border:0.1px solid #CCCCCC;
        }
        #empdata th
        {
        	border-right:0.1px solid #CCCCCC;
        }
    </style>
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <center>
 <table width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
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
     <tr><td  align="right" ><a href="Admin_timesheet.aspx" style="font-size:medium; color:#00277a; padding-right:20px;">Back</a></td></tr>
    
     <tr>
    <td height="30px">&nbsp;</td>
    </tr>
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable" style="color:Red;font-size:15px"> 
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
       <asp:GridView ID="empdata" runat="server" Width="100%"
                                        AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" DataKeyNames="id" OnPageIndexChanging="empdate_pageChanging">
                                                    <Columns>
                                                              
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Consultant Name">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txtscr"  ForeColor="Gray" Text='<%# Bind("consname") %>' CssClass="data" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Client Name">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txtdesc" ForeColor="Gray" Text='<%# Bind("clientname") %>' runat="server" CssClass="data"></asp:Label>                                                    
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Time Period">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txtlink" ForeColor="Gray" Text='<%# Bind("timeperiod") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="FromDate">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txtdate" ForeColor="Gray" Text='<%# Bind("fromdate") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="ToDate">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txttodate" ForeColor="Gray" Text='<%# Bind("todate") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total WorkHrs">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txthrs" ForeColor="Gray" Text='<%# Bind("workhrs") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total OT">
                                                    <ItemTemplate>
                                                    <asp:Label ID="txtot" ForeColor="Gray" Text='<%# Bind("overtime") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"   HorizontalAlign="Center" />
                                                    </asp:TemplateField> 
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Veiw">
                                                    <ItemTemplate>
                                                    <asp:HyperLink ID="btnview" ForeColor="Gray" NavigateUrl='<%# ViewUrl ((int) Eval("userid"),(int) Eval("ID")) %>' Text="View" CssClass="data" runat="server"></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"    HorizontalAlign="Center"/>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit">
                                                    <ItemTemplate>
                                                    <asp:HyperLink ID="btnedit" ForeColor="Gray" NavigateUrl='<%# EditUrl ((int) Eval("userid"),(int) Eval("ID")) %>' Text="Edit" CssClass="data" runat="server"></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"    HorizontalAlign="Center"/>
                                                    </asp:TemplateField>   
                                                      
                                                      <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Send Mail">
                                                    <ItemTemplate>
                                                    <asp:LinkButton ID="lnkmail" ForeColor="Gray" runat="server" Text="Email" OnCommand="sendemail"></asp:LinkButton>
                                                    <%--<asp:HyperLink ID="btnedit" NavigateUrl='<%# EmailUrl ( (int) Eval("id") ) %>' Text="Email" CssClass="data" runat="server"></asp:HyperLink>--%>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="datahead"  HorizontalAlign="Center"/>
                                                    </asp:TemplateField>   
                                                      
                                                    
                                                  <%--  <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                    <asp:HyperLink ID="btndelete" NavigateUrl='<%# DeleteUrl ( (int) Eval("id") ) %>' Text="Delete" CssClass="data" runat="server"></asp:HyperLink>
                                                    <asp:LinkButton ID="lnkdelete" Text="Delete" CssClass="data" runat="server" OnClick="lnkdelrecord"></asp:LinkButton>                                                 
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <HeaderStyle CssClass="datahead" Width="50"   HorizontalAlign="Left"/>
                                                    </asp:TemplateField>   --%>
                                                    </Columns>
                                                    <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="Red" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
                    ForeColor="#00277a" Height="30px" />
                                                    </asp:GridView>     
      
      
      </td>
    </tr>
    <tr>
<td>&nbsp;</td></tr>
    <tr>
    <td>
    <asp:Label ID="lblmsg" ForeColor="Red" runat="server"></asp:Label>
    </td>
    </tr>
  
    </table>
    </center>
    
    </form>
</body>
</html>