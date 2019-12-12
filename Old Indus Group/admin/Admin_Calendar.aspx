<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Calendar.aspx.cs" Inherits="admin_Admin_Calendar" %>

<%@ Register Assembly="DataCalendar" Namespace="DataControls" TagPrefix="cc2" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar </title>
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
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>
            a       {text-decoration: none;}
            a:hover {text-decoration: underline;}
            .bor{border:none;}
            .bor1
            {
            	border-bottom: 1px dotted Gray;
            }
            .disp a
            {
            	display:none;
            }
            .weekend
            {
            	color:Red;            	
            	 border-right: 1px solid #174eb4;
            	  border-bottom: 1px solid #174eb4;    
            }        
            .pnlscroll
            {
            	overflow:scroll;
            }    
            .modalBackground 
{   
    background-color:#EBEBEB;
    filter:alpha(opacity=70);
    opacity:0.7;
}
        </style>    
        <script type="text/javascript">
        function checking()
        {
        if(document.getElementById('chkDont').checked==false)
        {
        alert('select checkbox');
        return false;
        }
        else
        return true;
        }
        </script>   
</head>

<body>
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
    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;">Calendar</td>                     
                </tr>
                <tr>
                <td>&nbsp;</td>
                </tr>               
                <tr>
                <td align="center">                
                <table width="998px" style="color:#174eb4;"  >
                <tr>
                <td width="5px"></td>
                <td  valign="top" align="left"> <div id="allDiv" runat="server" style="font-size:9pt; width:990px; padding-right:5px; text-align:right; "> View All Remainders  : 
                <asp:LinkButton ID="lnkView" runat="server" ForeColor="Green" Text="Click Here" OnClick="lnkView_Click"></asp:LinkButton></div>
                    <cc2:DataCalendar ID="DataCalendar1" runat="server" Width="990" Height="400" WeekendDayStyle-CssClass="weekend" 
                     OnDayRender="Calendar1_DayRender" TitleStyle-BackColor="AliceBlue" DataMember="Rem_date"
                     OtherMonthDayStyle-CssClass="disp" >                    
                    <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Size="9" />
                    <OtherMonthDayStyle BackColor="#F0F0F0" ForeColor="Gray" />                    
                    <ItemTemplate>                    
                     <%--<img align='absmiddle' border='0' src="images/info.gif" />--%>  
                     <div style="vertical-align:middle; text-align:center; width:100%; " >
                     <a href='Admin_Remainders.aspx?date=<%# Container.DataItem["Rem_date"] %>' style="color:Green">
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
     </center>
     <asp:Label ID="lblpops" runat="server" />
     <cc1:ModalPopupExtender ID="mdpop" runat="server" TargetControlID="lblpops" PopupControlID="pnlSnozee"
       BackgroundCssClass="modalBackground" CancelControlID="lclose" ></cc1:ModalPopupExtender>
     <asp:Panel ID="pnlSnozee" runat="server" BackColor="White" >
     <table width="800" runat="server" border="1" >
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
    </form>
</body>
</html>
