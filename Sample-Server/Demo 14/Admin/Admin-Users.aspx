<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Users.aspx.cs" Inherits="Admin_Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                    <tr>
                        <td height="30px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                              <table width="80%" align="center">
                                <tr>
                                    <td align="center" colspan="2" width="100%">
                                        <font color='#003399' size='6pt'><b>Users Details</b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="15px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" width="40%">
                                        <asp:LinkButton ID="lnkcreate" Text="Create New User" runat="server" OnClick="lnkcreate_Click" Font-Size="18px"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" width="100%" colspan="2">
                                        <asp:GridView ID="usergrid" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px"
                                             CellPadding="3" Font-Bold="False" Font-Italic="False"
                                            DataKeyNames="uid" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" Font-Underline="False" BackColor="White"
                                             AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="30"
                                            PagerStyle-BackColor="White">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("uid") %>' />
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
                                                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="User Name" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("username") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Password" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempid" ForeColor="Gray" Text='<%# Bind("password") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name" HeaderStyle-Width="9%" ItemStyle-Width="9%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("ufname") %>' runat="server"></asp:Label>
                                                        <asp:Label ID="Label1" ForeColor="Gray" Text='<%# Bind("ulname") %>' runat="server"></asp:Label>

                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Designation" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("udesignation") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Mobile" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("Mobile") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Email" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("Email") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                              <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkstatus" Width='20' Height='20' runat="server" Text='<%# Bind("status1") %>' OnClick="lnkstatus_Click" />
                                                        <%--<asp:LinkButton ID="lnkstatus" Width='20' Height='20' runat="server" Text='<%# Bind("status1") %>'  />--%>

                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgbtnedit1_Click" />
                                                        <%--<asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" />--%>

                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png"  OnClick="imgbtndel_Click" />
                                                        <%--<asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png"   />--%>

                                                        <br />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%"></ItemStyle>
                                                </asp:TemplateField>

                                            </Columns>
                                            <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                                            <RowStyle CssClass="datagrid-2" Font-Size="9pt" HorizontalAlign="Center"
                                                Font-Strikeout="False" Font-Underline="False" />
                                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                                Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                                Font-Underline="False" Height="20px" Wrap="True" />
                                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                            <HeaderStyle BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue"
                                                ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                  <tr><td><br /></td></tr>
                                   <tr>
                                    <td align="center" colspan="2" width="100%" runat="server" visible="false" id="inactive">
                                        <font color='#003399' size='6pt'><b>Deleted Users Details</b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="15px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" width="100%" colspan="2">
                                        <asp:GridView ID="Deleteusers" runat="server" Width="86%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px"
                                             CellPadding="3" Font-Bold="False" Font-Italic="False"
                                            DataKeyNames="uid" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" Font-Underline="False" BackColor="White"
                                             AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="50"
                                            PagerStyle-BackColor="White">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("uid") %>' />
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
                                                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="User Name" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("username") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Password" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempid" ForeColor="Gray" Text='<%# Bind("password") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name" HeaderStyle-Width="9%" ItemStyle-Width="9%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("ufname") %>' runat="server"></asp:Label>
                                                        <asp:Label ID="Label1" ForeColor="Gray" Text='<%# Bind("ulname") %>' runat="server"></asp:Label>

                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Designation" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("udesignation") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Mobile" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("Mobile") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Email" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("Email") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                              <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <%--<asp:LinkButton ID="lnkstatus1" Width='20' Height='20' runat="server" Text='<%# Bind("status1") %>' OnClick="lnkstatus_Click1" />--%>
                                                        <asp:LinkButton ID="lnkstatus1" Width='20' Height='20' runat="server" Text='<%# Bind("status1") %>'  />

                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                                            <RowStyle CssClass="datagrid-2" Font-Size="9pt" HorizontalAlign="Center"
                                                Font-Strikeout="False" Font-Underline="False" />
                                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                                Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                                Font-Underline="False" Height="20px" Wrap="True" />
                                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                            <HeaderStyle BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue"
                                                ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
</asp:Content>

