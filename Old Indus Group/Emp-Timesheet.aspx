<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Timesheet.aspx.cs" Inherits="Emp_Timesheet" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
        <div>
            <head:Header ID="Header1" runat="server"></head:Header>
        </div>
        <hr />
        <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
        <br />
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>

            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                             <tr>
                    <td align="center" width="100%">
            <table width="80%" align="center">
                <tr>
                    <td id="crtopt" runat="server" align="right" class="lblog"></td>
                </tr>
                <tr>
                    <td>
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="25" width="80%" align="center">
                                    <h3 style="color: #003399; font-size: 28px;">Monthly Timesheet</h3>
                                    <br />
                                </td>
                                <td width="20%" align="center">
                                    <asp:LinkButton ID="lnknew" runat="server" Text="Create New"  OnClick="lnknew_Click"></asp:LinkButton>
                                </td>
                            </tr>
                         
                        </table>
                    </td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td colspan="2" width="100%">
                           <asp:GridView ID="empdata" runat="server" Width="80%" 
      AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="30" 
                   PagerStyle-BackColor="White" 
            onpageindexchanging="empdata_PageIndexChanging" >            
           <Columns>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Emp Id">
                <ItemTemplate>
                    <asp:Label ID="txtscr"  ForeColor="Gray" Text='<%# Bind("empid") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Consultant Name">
                <ItemTemplate>
                    <asp:Label ID="txtdesc" ForeColor="Gray" Text='<%# Bind("consname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Client Name">
                <ItemTemplate>
                    <asp:Label ID="txtlink1" ForeColor="Gray" Text='<%# Bind("clientname") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Time Period">
                <ItemTemplate>
                    <asp:Label ID="txtlink2" ForeColor="Gray" Text='<%# Bind("timeperiod") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
           
            </asp:TemplateField>
            
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Work Hours">
            <ItemTemplate>
            <asp:Label ID="txtlink3" ForeColor="Gray" Text='<%# Bind("workhrs") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
         
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Over Time">
            <ItemTemplate>
            <asp:Label ID="txtlink4" ForeColor="Gray" Text='<%# Bind("overtime") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Post Date">
            <ItemTemplate>
            <asp:Label ID="txtlink5" ForeColor="Gray" Text='<%# Bind("pdate") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>             
          <%--   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="View">
            <ItemTemplate>
            <asp:HyperLink ID="btnedit" ForeColor="Gray" NavigateUrl='<%# EditTimeUrl ( (int) Eval("userid") ) %>' Text="View" CssClass="data" runat="server"></asp:HyperLink>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />        
            </asp:TemplateField> 
               --%>
          
            </Columns>
             <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
              <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
            </asp:GridView>
                    </td>
                </tr>
            </table>

                    </td>
                </tr>

                <tr>
                    <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
                </tr>
                <tr>
                    <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
                </tr>
            </table>
            <br />
        </center>
    </form>
</body>
</html>
