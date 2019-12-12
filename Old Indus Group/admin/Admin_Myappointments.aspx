<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Myappointments.aspx.cs" Inherits="admin_Admin_Myappointments" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style>
    .modalBackground 
{
   
    background-color:#EBEBEB;
    filter:alpha(opacity=70);
    opacity:0.7;
}
    #Gridview1
      {
      	border:1px solid Gray;
	padding:2px;
      }
   .GridviewScrollHeader TH, .GridviewScrollHeader TD 
{ 
	color: #00277a;
    padding: 5px; 
    font-weight: bold;   
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: #EFEFEF; 
    text-align: center; 
   
} 
.GridviewScrollItem TD 
{ 
    padding: 5px;     
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: White; 
} 
.GridviewScrollPager  
{ 
    border-top: 1px solid #AAAAAA; 
    background-color: #FFFFFF; 
} 
.GridviewScrollPager TD 
{ 
	    padding-top: 3px; 
    font-size: 14px; 
    padding-left: 5px; 
    padding-right: 5px; 
} 
.GridviewScrollPager A 
{ 
    color: #00277a; 
}
.GridviewScrollPager SPAN
{
    font-size: 16px;
    font-weight: bold;
}
    </style>
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
<link href="Styles/style.css" rel="stylesheet" type="text/css" />

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
<body id="body1" runat="server" topmargin="0" leftmargin="0" rightmargin="0" style="background-color:white">
    <form id="form1" runat="server">
    <div>
    <center>
<table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr>
    <td>&nbsp;
    </td>
    </tr>
    <tr height="19">
                    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;">My Appointments</td>
                     
                </tr>
                <tr>
                <td>&nbsp;</td>
                </tr>
               
                <tr>
                <td>
                <table width="998px" style="color:#174eb4"  >
                <tr>
                <td width="5px"></td>
                <td width="220px" valign="top" align="left">
                <asp:Calendar ID="cal1" runat="server" Caption="Select Date" Width="200px" BorderWidth="1"
                 OnDayRender="Calendar1_DayRender" OnSelectionChanged="cal1_click"></asp:Calendar>                           
                </td>
                <td width="1px" style="background-color:Gray"></td>
                <td align="left" valign="top" style="padding-left:5px">
                &emsp;
                <span style="font-size:9pt">Welcome</span> &emsp;
                <asp:Label ID="lblUser" runat="server" Font-Bold="true" ForeColor="#174eb4" />                
                <asp:GridView ID="Gridview1" runat="server"  AllowPaging="true"
                 Width="720px" DataKeyNames="app_id"  AutoGenerateColumns="false" PageSize="6" PagerStyle-Mode="NumericPages"
                  onpageindexchanging="GridView1_PageIndexChanging" >
                <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right" /> 
                <Columns>
                <asp:TemplateField HeaderText="Date">
                <HeaderStyle Width="100px" />                
                <ItemTemplate>
                 <asp:Label ID="lblDate" runat="server" Text='<%#Eval("app_date") %>'  />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time (EST)">
                <ItemTemplate >
                <asp:Label ID="lblEst" runat="server" Text='<%#Eval("ti_est") %>'  />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Appointment">                
                <ItemStyle Width="500px" />
                <ItemStyle HorizontalAlign="Left" />
                <ItemTemplate>                 
                         <asp:Label ID="txtAppoint" runat="server"  Text='<%#Eval("app_titile") %>' />  <br />
                              <asp:Label ID="lblComments" runat="server" Text='<%#Eval("app_descr") %>' />
                </ItemTemplate>
                </asp:TemplateField>  
                           
                </Columns>
                </asp:GridView>
                </td>
                </tr>
                
                </table>
                </td>
                </tr>
                
    </table> 
    <asp:ScriptManager ID="scrst" runat="server"></asp:ScriptManager>
     
     </center>
    </div>
    </form>
</body>
</html>
