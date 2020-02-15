<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Events.aspx.cs" Inherits="Admin_Admin_Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table align="center" width="90%">
        <tr>
            <td>
                <table align="center" width="90%">
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr><td><br /><br /></td></tr>

                    <tr>
                        <td align="center" colspan="7">
                            <h2> <asp:Label ID="lbltit" runat="server"></asp:Label> </h2>
                        </td>
                    </tr>
                    <tr><td><br /><br /></td></tr>

                    <tr>
                        <td height="20px"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            <asp:Label ID="lbltype" runat="server" Text="Select Type" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="5%" align="center">
                            <b>:</b>
                        </td>
                        <td width="25%" align="left">
                            <asp:DropDownList ID="ddtype" runat="server" Font-Size="16px" Width="242px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="ddtype_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <%--<asp:ListItem>Work</asp:ListItem>--%>
                                <asp:ListItem>Events</asp:ListItem>
                                <asp:ListItem>Gallery</asp:ListItem>
                                <%--<asp:ListItem>News</asp:ListItem>--%>
                            </asp:DropDownList>
                        </td>
                          <td width="5%" align="center">
                            <b> Or         </b>
                        </td>
                        <td width="20%" align="right">
                            <asp:Label ID="Label1" runat="server" Text=" Search News By ID" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="5%" align="center">
                            <b>:</b>
                        </td>
                        <td width="25%" align="left">
                            <asp:TextBox ID="txtid" runat="server" Width="100px"></asp:TextBox>
                            <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click"/>
                        </td>
                    </tr>

                    <tr><td><br /><br /></td></tr>
                   
                      <tr>
                                    <td align="right" width="40%" colspan="7">
                                        <asp:LinkButton ID="lnkcreate" Text="Back" runat="server" OnClick="lnkcreate_Click" Font-Size="18px"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" width="100%" colspan="7">
                                        <asp:GridView ID="newsgrid" runat="server" Width="86%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px"
                                             CellPadding="3" Font-Bold="False" Font-Italic="False"
                                            DataKeyNames="gid" Font-Overline="False" Font-Size="11pt" Font-Strikeout="False" Font-Underline="False" BackColor="White"
                                             AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="30"
                                            PagerStyle-BackColor="White" >
                                            <Columns>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="ID" HeaderStyle-Width="10%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempidsss" ForeColor="Gray" Text='<%# Bind("gid") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="News Type" HeaderStyle-Width="10%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempidasaSA" ForeColor="Gray" Text='<%# Bind("Post_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Title" HeaderStyle-Width="10%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempid" ForeColor="Gray" Text='<%# Bind("Title") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Main Image" HeaderStyle-Width="20%" ItemStyle-Width="4%">
                                                    <ItemTemplate>
                                                        <asp:image ID="lblout1" ForeColor="Gray" ImageUrl='<%# Bind("Main_Image", "~/design/soroptimist/admin/UploadImages/{0}") %>' runat="server" CssClass="data" Width="200px" Height="200px"></asp:image>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted By" HeaderStyle-Width="9%" ItemStyle-Width="9%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("Posted_By") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted Date" HeaderStyle-Width="9%" ItemStyle-Width="7%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("Posted_Date") %>' runat="server" CssClass="data"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                               
                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgbtnedit1_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png"  OnClick="imgbtndel_Click" OnClientClick="return confirm('Are you sure to delete this record?');" />
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
                    </table>
                </td>
            </tr>
         </table>
</asp:Content>

