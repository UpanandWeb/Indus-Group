<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Student-Info.aspx.cs" Inherits="admin_Student_Info" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br /><br /><br /><br />
    <table width="100%" align="center">
        <tr>
            <td>
                <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                    <tr>
                        <td align='center' bgcolor='white' width='70%'><font color='#003399' size='6pt'><b><u> Student List</u></b></font></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td align="right"><a href="Admin-Student-Register.aspx"  style="font-size:18px;"><b>Add New Student</b></a></td>
        </tr>

        <tr>
            <td height="30px"></td>
        </tr>

        <tr id="trcurr2" runat="server">
            <td id="tdcontent1" runat="server" align="left" valign="top" class="lable">
                <table>
                    <tr>
                        <td width="5px">&nbsp;
                        </td>
                        <td width="100%" align="center">
                            <asp:GridView ID="MyGrid" runat="server" Width="100%" DataKeyNames="userid"
                                AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                                Font-Underline="False"
                                AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="25"
                                PagerStyle-BackColor="White" OnRowDeleting="MyGrid_RowDeleting">
                                <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"
                                    BorderStyle="Solid" BorderWidth="1px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="14px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" />
                                        <HeaderStyle Width="5%" />
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="14px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "middlename")%>
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="14px" ForeColor="Gray" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%#  DataBinder.Eval(Container.DataItem, "emailid")%>&nbsp;                    
                          
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date Of Joining" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="13%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="14px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"joindate")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="14px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkactivate" runat="server" Text="Active" ForeColor="Green" CommandArgument='<%# Eval("userid") %>'
                                        OnCommand="lnkactivate_Command"   CommandName="active"></asp:LinkButton>
                                            &nbsp; 
                                   <br />
                                        </ItemTemplate>
                                        <ItemStyle Width="8%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="14px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnview" Width='20' Height='20' runat="server" ImageUrl="images/preview.png"  CommandArgument='<%# Eval("userid") %>'
                                        OnCommand="imgbtnview_Command"   CommandName="view"/>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="14px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnprint" Width='20' Height='20' runat="server" ImageUrl="images/preview.png"        />
                                        </ItemTemplate>
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="14px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.gif"   CommandArgument='<%# Eval("userid") %>'
                                        OnCommand="imgbtndel_Command"   CommandName="delete"  />
                                            <br />
                                        </ItemTemplate>
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Report" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="14px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkreport" runat="server" Text="Report" ForeColor="Green" CommandArgument='<%# Eval("userid") %>'></asp:LinkButton>
                                            &nbsp; 
                                   <br />
                                        </ItemTemplate>
                                        <ItemStyle Width="8%"></ItemStyle>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                    Font-Strikeout="False" Font-Underline="False" />
                                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                    Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                    Font-Underline="False" Height="15px" Wrap="True" />
                                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                    ForeColor="#00277a" Height="30px" />
                            </asp:GridView>
                        </td>
                        <td width="4px">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td align="center">
                <asp:Label ID="lblerror" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
        </tr>
        <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
    </table>
</asp:Content>

