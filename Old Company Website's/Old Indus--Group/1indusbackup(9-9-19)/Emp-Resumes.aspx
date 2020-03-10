<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Resumes.aspx.cs" Inherits="Emp_Resumes" %>

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
                                <td height="25" width="100%" align="center">
                                    <h3 style="color: #003399; font-size: 28px;">Current Resumes</h3>
                                    <br />
                                </td>
                            </tr>
                             <tr>
                                <td align="right" valign="bottom" style="font-family: Verdana; font-size: 24px;font-weight:bold;"><%--<a href="Emp-NewResume.aspx">
                                    <span style="font-size:18px;">Post New Resume</span></a>--%>
                                    <asp:LinkButton ID="lnkpost" runat="server" Text="Post New Resume" OnClick="lnkpost_Click" Font-Size="18px"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr><td height="10px"></td></tr>
                            <tr>
                                <td align="center" valign="top" width="100%" class="lable" colspan="3">
                                    <div>
                                        <asp:GridView ID="MyGrid" runat="server" Width="100%" DataKeyNames="rid"
                                            AutoGenerateColumns="False" BorderColor="#CCCCCC"     BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"  Font-Underline="False" BackColor="White" OnRowDataBound="MyGrid_RowDataBound"
                                            PagerStyle-BackColor="White" OnPageIndexChanging="MyGrid_PageIndexChanging" AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric"><%--OnRowDataBound="MyGrid_RowDataBound"--%>
                                            <Columns>
                                                     <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="40px" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                    <%#Container.DataItemIndex + 1%>
                                                </ItemTemplate>
                                                <ItemStyle Width="4%" />
                                                <HeaderStyle Width="4%" />
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Consultant Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbl1" runat="server" Text='<%# Eval("ConsultName") %>' Font-Size="16px" Width="180px" CommandName="ss" CommandArgument='<%# Eval("rid") %>' OnCommand="lbl1_Command"></asp:LinkButton>
                                                        <%--<span class="glyphicon glyphicon-pencil" style="vertical-align: top;"></span>--%>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mobile Number" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333" runat="server" Text='<%# Eval("Mobile") %>' Font-Size="16px" Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Email ID" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="16px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <%#  DataBinder.Eval(Container.DataItem, "Emailid")%>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Location" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("Location") %>' Font-Size="16px" Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Open to" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl33ss3m" runat="server" Text='<%# Eval("Opento") %>' Font-Size="16px" Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Recruiter" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333mss" runat="server" Text='<%# Eval("RecName") %>' Font-Size="16px" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Resume" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="16px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="20%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbl33ss3mss" runat="server" Text='<%# Eval("Resumename") %>' Font-Size="16px" Width="400px"
                                                            OnCommand="lnkDownload" CommandArgument='<%# Eval("rid")%>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="16%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl33ss3msss" runat="server" Text='<%# Eval("Remarks") %>' Font-Size="18px" Width="160px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" >
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="18px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkactivate" runat="server" ForeColor="Green" CommandArgument='<%# Eval("rid") %>' OnCommand="lnkactivate" Width="80px"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%"></ItemStyle>
                                                </asp:TemplateField>

                                              <%--  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtndela" Width='35' Height='35' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%"></ItemStyle>
                                                </asp:TemplateField>--%>

                                            </Columns>
                                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                            <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                                Font-Strikeout="False" Font-Underline="False" />
                                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Left"
                                                Font-Bold="True" Font-Italic="True" Font-Size="30px"
                                                Font-Underline="False" Height="35px" Wrap="True" CssClass="GVPager" />
                                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                                ForeColor="#00277a" Height="30px" />
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </table>
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
