<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Clients.aspx.cs" Inherits="admin_Emp_Clients" %>

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
        <cc3:topmenu ID  ="top1" runat="server"></cc3:topmenu>
        <br />
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>

            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                              <tr>
                    <td id="Td1" runat="server" align="center" style="height: 30px" class="style24" width="90%">
                        <asp:Label ID="lblseminnartitle" runat="server" ForeColor="#00277a" Text="Clients List" Font-Bold="true" Font-Size="22px"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px; padding-right: 100px;" align="right">
                        <table style="width: 99px">
                            <tr >
                                <td>
                                    <asp:LinkButton ID="imgnew" runat="server" Text="New Client" AlternateText="New"  OnClick="imgnew_Click1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="Errmsg" align="right" class="lblog" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                            <asp:GridView ID="GridView1" runat="server" Width="90%"
                                AutoGenerateColumns="False" BorderColor="#E0E0E2" BorderStyle="None"
                                BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                                Font-Underline="False" BackColor="White"
                                AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="10"
                                PagerStyle-BackColor="White" DataKeyNames="cid"
                                OnPageIndexChanging="GridView1_PageIndexChanging">
                                <Columns>

                                    <asp:TemplateField ItemStyle-ForeColor="Gray" HeaderText="" ItemStyle-BorderColor="#CCCCCC">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle ForeColor="Gray" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Company">
                                        <ItemTemplate>
                                            <asp:Label ID="lbcompany" runat="server" Text='<%# Bind("companyname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" BorderColor="#CCCCCC" />

                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Supervisor Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("contactname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfiler" runat="server" Text='<%#Bind("filersname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="E-mail">
                                        <ItemTemplate>
                                            <asp:Label ID="lblema" runat="server" Text='<%#Bind("email") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Font-Italic="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Website">
                                        <ItemTemplate>
                                            <a href='<%#Eval("URL") %>' target="_blank" style="color: Gray">
                                                <asp:Label ID="lblurl" runat="server" Text='<%#Bind("URL") %>' ForeColor="Gray"></asp:Label></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Tax ID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("emptaxid") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("telephone") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Work">
                                        <ItemTemplate>
                                            <asp:Label ID="lblwork" runat="server" Text='<%#Bind("work_phone") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" runat="server" Text='<%# Bind("address1") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle  HorizontalAlign="Center" />
                                <RowStyle  HorizontalAlign="Center" />

                            </asp:GridView>
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
