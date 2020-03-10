<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Calendar.aspx.cs" Inherits="Emp_Calendar" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="DataCalendar" Namespace="DataControls" TagPrefix="cc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon' />
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>:  : 1indus.com :  : </title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

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
                 window.location = "Login.aspx";
             }, timeout);
         };
         function ResetSession() {
             //Redirect to refresh Session.
             window.location = window.location.href;
         }
            </script> 
</head>
<body>
    <form id="form1" runat="server">
    <div width="90%" align="center" >
    <div>
            <head:Header ID="Header1" runat="server"></head:Header>
        </div>

        <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="90%">
        <td valign="top" width='100%' class="lblog" >
            <cc3:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr>
    <td>&nbsp;
    </td>
    </tr>
    <tr height="19">
    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;font-size:20px;">Calendar</td>                     
                </tr>
                <tr>
                <td>&nbsp;</td>
                </tr>               
                <tr>
                <td align="center">                
                <table width="90%" style="color:#174eb4;"  >
                <tr>
                <td width="5px"></td>
                <td  valign="top" align="left"> <div id="allDiv" runat="server" style="font-size:9pt; width:90%; padding-right:5px; text-align:right; "> View All Remainders  : 
                <asp:LinkButton ID="lnkView" runat="server" ForeColor="Green" Text="Click Here" OnClick="lnkView_Click"></asp:LinkButton></div>
                    <cc2:DataCalendar ID="DataCalendar1" runat="server" Width="990" Height="400" WeekendDayStyle-CssClass="weekend" 
                     OnDayRender="Calendar1_DayRender" TitleStyle-BackColor="AliceBlue" DataMember="Rem_date"
                     OtherMonthDayStyle-CssClass="disp" >                    
                    <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Size="9" />
                    <OtherMonthDayStyle BackColor="#F0F0F0" ForeColor="Gray" />                    
                    <ItemTemplate>                    
                     <%--<img align='absmiddle' border='0' src="images/info.gif" />--%>  
                     <div style="vertical-align:middle; text-align:center; width:100%; " >
                     <a href='Emp-Remainders.aspx?date=<%# Container.DataItem["Rem_date"] %>' style="color:Green">
                        <asp:Label ID="lbltit" runat="server" Text='<%# Container.DataItem["cou"] %>'></asp:Label>
                        <strong> Remainder(s) </strong>
                        </a>                                               
                     </div>                                              
                </ItemTemplate>             
                    </cc2:DataCalendar>                                       
                </td>                
                </tr>                
                </table>
                </td>
                </tr>                
    </table> 
    <cc1:ToolkitScriptManager ID="scrst" runat="server"></cc1:ToolkitScriptManager>     
     <asp:Label ID="lblpops" runat="server" />
     <cc1:ModalPopupExtender ID="mdpop" runat="server" TargetControlID="lblpops" PopupControlID="pnlSnozee"
       BackgroundCssClass="modalBackground" CancelControlID="lclose" ></cc1:ModalPopupExtender>
     <asp:Panel ID="pnlSnozee" runat="server" BackColor="White" >
     <table id="Table1" width="800" runat="server" border="1" >
     <tr bgcolor="gray">
     <td colspan="2" align="right"><span style="cursor:pointer">
     <asp:Label ID="lclose" runat="server" ForeColor="Red" Font-Size="Medium" Text=" X "></asp:Label></span> </td>
     </tr>
     <tr>
     <td align="center" valign="middle" bgcolor="gray">
     <img src="images/alram.gif" width="120" />
     <asp:CheckBox ID="chkDont" runat="server" Font-Size="8pt" Text="Don't show this message agian" /><br />
     <asp:Button ID="btndontok" runat="server" Text=" Ok " OnClientClick="return checking()" OnClick="btndontok_Click" />
     </td>
     <td>
     <asp:Panel ID="pnlRemainders" runat="server" Width="680" Height="400" CssClass="pnlscroll">
     <asp:GridView ID="grdRemaind" runat="server" Width="680" AutoGenerateColumns="false">
     <HeaderStyle HorizontalAlign="Center" />
     <RowStyle HorizontalAlign="Center" />
     <Columns>
     <asp:TemplateField HeaderText="Date">
     <ItemTemplate>
     <%#Eval("Rem_date") %>
     </ItemTemplate>
     </asp:TemplateField>
      <asp:TemplateField HeaderText="Time">
     <ItemTemplate>
     <%#Eval("Rem_time") %>
     </ItemTemplate>
     </asp:TemplateField>
      <asp:TemplateField HeaderText="Remainder">
     <ItemTemplate>
     <%#Eval("Rem_note") %>
     </ItemTemplate>
     </asp:TemplateField>     
     </Columns>
     </asp:GridView>
     </asp:Panel>
     </td>
     </tr>
     </table> 
     </asp:Panel>
    </div>
    <asp:Label ID="lblUse" runat="server" Visible="false" />
    </div>
    </form>
</body>
</html>
