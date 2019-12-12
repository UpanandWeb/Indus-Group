<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Remainders.aspx.cs" Inherits="Emp_Remainders" %>

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
    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;">Remainders</td>                     
    </tr>
     <tr>
    <td>&nbsp;</td>
     </tr>               
      <tr>
     <td align="center">
     <table width="90%"><tr><td>
      <div style="text-align:left; font-size:9pt; color:Green; padding-left:5px;" id="divHint" runat="server">
      Enter text on table row then click <span style="color:Red">Schedule</span> to add remainder
       </div>
       </td>
       <td align="right"> <div style="text-align:right; padding-right:5px; font-size:10pt; color:#174eb4;">
       <a href="Emp-Calendar.aspx"> << Back</a></div></td>
       </tr></table>
      <div style="width:985px; text-align:center; font-size:medium; background-color:AliceBlue; ">
      <span ><asp:Label ID="lblFullDate" runat="server" ForeColor="#174eb4" /></span>
      </div>
      <asp:GridView Width="985" ID="grd1" runat="server" AutoGenerateColumns="false" DataKeyNames="id" GridLines="None" ForeColor="#174eb4"
      OnRowDataBound="grd1_bound" >
     <Columns>
     <asp:TemplateField HeaderText="Time" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle Width="150" />
    <ItemTemplate>
    <asp:Label ID="lblEst" runat="server" Text=<%#Bind("times1") %> />
    </ItemTemplate>
    </asp:TemplateField>
     <%--<asp:BoundField HeaderText="Time" ItemStyle-HorizontalAlign="Center" DataField="times1" ItemStyle-VerticalAlign="Top" />--%>
    <asp:TemplateField >
    <HeaderStyle Width="20" />
    <ItemStyle Width="20px" HorizontalAlign="Center"  VerticalAlign="Top" ForeColor="LightGray" />
    <ItemTemplate>&#9658;</ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Note">
    <ItemStyle  CssClass="bor1" VerticalAlign="Bottom" HorizontalAlign="Left" />
    <ItemTemplate>
    <asp:TextBox ID="txtNote" CssClass="bor" runat="server" Width="750" TextMode="MultiLine" Visible="false" />
    <asp:Label ID="lblNote" runat="server" Width="750" Height="40" Visible="false" Font-Size="9pt"
     Font-Names="Geneva, Arial, Helvetica, sans-serif" ForeColor="Black" BackColor="#f2f2f2" />
    </ItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField>
    <ItemTemplate>
    <asp:LinkButton ID="lnkNote" runat="server" Font-Size="10pt" OnCommand="txt_Changed" Text="Schedule" />
    </ItemTemplate>
     </asp:TemplateField>
     </Columns>
    <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right" /> 
                </asp:GridView>                
                </td>
                </tr>                
    </table> 
   <%-- <asp:Calendar ID="cal1" runat="server" OnSelectionChanged="cal1_Changed"/>
    <cc1:PopupControlExtender ID="pop1" runat="server" TargetControlID="lblFullDate" PopupControlID="cal1" Position="Left" />--%>
    <cc1:ToolkitScriptManager ID="scrst" runat="server" EnableScriptGlobalization="true"></cc1:ToolkitScriptManager> 
    <asp:Label ID="lblmod" runat="server"></asp:Label>
    <asp:Label ID="lbUserName" runat="server" Visible="false"></asp:Label>
    <cc1:ModalPopupExtender ID="mdpop" runat="server" PopupControlID="pnltype" TargetControlID="lblmod"
     CancelControlID="lblClose" BackgroundCssClass="modalBackground">    
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnltype" runat="server" BackColor="Gray"  Width="600" >
    <table id="Table1" width="600" runat="server">
    <tr>
    <td colspan="2" align="right" valign="top">  
    <span style="cursor:pointer; background-color:White; font-size:medium" id="lblClose" runat="server">X</span>  
     <%--<asp:Label ID="lblClose" runat="server" Font-Size="Medium" BackColor="White">X</asp:Label> --%></td>
    </tr>
    <tr bgcolor="white">
    <td align="left" valign="top">Remainder for whom 
    <asp:RadioButtonList ID="rbMlist" runat="server" RepeatDirection="Vertical" RepeatColumns="1" >
    <asp:ListItem Text="Chairman" Value="rr@1indus.com" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Accounts" Value="accounts@1indus.com"></asp:ListItem>
    <asp:ListItem Text="HR" Value="hr@1indus.com"></asp:ListItem>
    </asp:RadioButtonList>
    </td>
    <td align="left" valign="top"> Remainder time  
    <asp:Label ID="lblScheduleTime" runat="server" ForeColor="Red" Text="No Remainder time for selected date" Visible="false" />
    <asp:RadioButtonList ID="rbSch" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Visible="false">
   <%-- <asp:ListItem Value="1" Text="1 Day Before" Selected="True"></asp:ListItem>
    <asp:ListItem Value="2" Text="2 Day Before"></asp:ListItem>
    <asp:ListItem Value="3" Text="3 Day Before"></asp:ListItem>
    <asp:ListItem Value="4" Text="4 Day Before"></asp:ListItem>
    <asp:ListItem Value="5" Text="5 Day Before"></asp:ListItem>--%>
    </asp:RadioButtonList> 
    </td>
    </tr>
    <tr bgcolor="white" >
    <td align="center" colspan="2">
    <asp:Button ID="btnSubmit" runat="server" Text=" Submit " OnClick="btnSubmit_Click" />
    </td>
    </tr>
    </table>
    </asp:Panel>
       </div>
    </form>
</body>
</html>