<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Resumes.aspx.cs" Inherits="admin_Admin_Resumes" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - Resumes</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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

<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
        <div>
            <table width="80%" align="center">
                <tr width="100%">
                    <td valign="top" width='100%' class="lblog">
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td id="crtopt" runat="server" align="right" class="lblog"></td>
                </tr>
                <tr>
                    <td>
                        <table width="1500px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="25" align="center" colspan="2"></td>
                            </tr>
                            <tr>
                                <td height="25" width="100%" align="center">
                                    <h3 style="color: #003399; font-size: 24px;">Current Resumes</h3>
                                    <br />
                                </td>
                            </tr>
                             <tr>
                                <td align="right" valign="bottom" style="font-family: Verdana; font-size: 20px;font-weight:bold;"><a href="Admin-NewResume.aspx">Post New Resume</a></td>
                            </tr>
                            <tr><td height="5px"></td></tr>
                            <tr>
                                <td align="center" valign="top" width="1500px" class="lable" colspan="3">
                                    <div>

                                        <asp:GridView ID="MyGrid" runat="server" Width="1500px" DataKeyNames="rid"
                                            AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                            BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                                            Font-Underline="False" BackColor="White" OnRowDataBound="MyGrid_RowDataBound"
                                            PagerStyle-BackColor="White" 
                                            OnPageIndexChanging="MyGrid_PageIndexChanging"
                                            AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric"><%--OnRowDataBound="MyGrid_RowDataBound"--%>

                                            <Columns>
                                                <asp:TemplateField HeaderText="Consultant Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="200px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbl1" runat="server" Text='<%# Eval("ConsultName") %>' Font-Size="18px" Width="200px" CommandName="ss" CommandArgument='<%# Eval("rid") %>' OnCommand="lbl1_Command"></asp:LinkButton>
                                                        <span class="glyphicon glyphicon-pencil" style="vertical-align: top;"></span>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mobile Number" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333" runat="server" Text='<%# Eval("Mobile") %>' Font-Size="18px" Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Email ID" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <%#  DataBinder.Eval(Container.DataItem, "Emailid")%>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Location" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("Location") %>' Font-Size="18px" Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Open to" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl33ss3m" runat="server" Text='<%# Eval("Opento") %>' Font-Size="18px" Width="120px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Recruiter" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl333mss" runat="server" Text='<%# Eval("RecName") %>' Font-Size="18px" Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Resume" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="200px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbl33ss3mss" runat="server" Text='<%# Eval("Resumename") %>' Font-Size="18px" Width="200px"
                                                            OnCommand="lnkDownload" CommandArgument='<%# Eval("rid")%>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="200px" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl33ss3msss" runat="server" Text='<%# Eval("Remarks") %>' Font-Size="18px" Width="200px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="18px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkactivate" runat="server" ForeColor="Green" CommandArgument='<%# Eval("rid") %>' OnCommand="lnkactivate" Width="100px"></asp:LinkButton>
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
        </div>
    </form>
</body>
</html>
