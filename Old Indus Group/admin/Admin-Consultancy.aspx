<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Consultancy.aspx.cs" Inherits="admin_Admin_Consultancy" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - TimeSheet</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/CSS3-digital-clock/index.html" />
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
</head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="tt" runat="server"></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" align="center">
                        <tr>
                            <td align="center" colspan="2" width="100%">
                                <font color='#003399' size='6pt'><b>Consultancy Info</b></font>
                            </td>
                        </tr>
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>
                <tr>
                    <td align="center" valign="top" width="100%" class="lable">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtsrchven" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnVendor" runat="server" Text="Search" OnClick="btnVendor_Click" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="create" runat="server" Text="Create New" Font-Bold="true" Font-Underline="false" PostBackUrl="Admin-CreateConsultancy.aspx" Font-Size="22px"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br />
                        <hr />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top" width="90%" class="lable" colspan="3">
                        <div>
                            <asp:GridView ID="GridView1" runat="server" Width="90%" DataKeyNames="cid"
                                AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                                Font-Underline="False" BackColor="White"
                                PagerStyle-BackColor="White" 
                                AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric">

                                <Columns>
                                     <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("cID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="90" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="300px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl1" runat="server" Text='<%# Eval("CName") %>' Font-Size="17px" Width="200px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact Person" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="200px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#  DataBinder.Eval(Container.DataItem, "Firstname")%>&nbsp;&nbsp;
                                            <%#  DataBinder.Eval(Container.DataItem, "Lastname")%>
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Designation" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl3333" runat="server" Text='<%# Eval("Disgnation") %>' Font-Size="17px" Width="60px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%--<%#  DataBinder.Eval(Container.DataItem, "venmail")%>--%>
                                            <asp:Label ID="lbl33331" runat="server" Text='<%# Eval("emailid") %>' Font-Size="17px" Width="320px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("mobile") %>' Font-Size="17px" Width="120px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Visa Status" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl3336666" runat="server" Text='<%# Eval("visa_status") %>' Font-Size="17px" Width="120px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Location" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl33666" runat="server" Text='<%# Eval("current_location") %>' Font-Size="17px" Width="120px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>
                                    
                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="lnkeditrecord" />
                                            </ItemTemplate>
                                            <ItemStyle Width="3%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" OnClientClick="return confirm('Are you sure to delete this record?');"  />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                    Font-Strikeout="False" Font-Underline="False" />
                                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                    Font-Bold="True" Font-Italic="True" Font-Size="X-Large"
                                    Font-Underline="False" />
                                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                    ForeColor="#00277a" Height="30px" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            function changeColor(CheckBoxObj) {
                if (CheckBoxObj.checked == true) {

                    CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                }
                else {
                    CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                }
            }
        </script>
    </form>
</body>
</html>
