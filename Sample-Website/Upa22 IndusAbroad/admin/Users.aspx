<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />   <br />   <br />
    <table align="center" width="100%">
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="Users List" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green"> </asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:LinkButton ID="Label2" runat="server" Text="Create User" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="18px" ForeColor="Green" OnClick="Label2_Click"> </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td align="center" style="padding-left: 10px;line-height:30px">
                <asp:GridView ID="GalleryDatalist" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="uid" Width="90%" HorizontalAlign="Center"   OnRowEditing="GalleryDatalist_RowEditing" OnRowDeleting="GalleryDatalist_RowDeleting"
                    AllowPaging="true" PageSize="15">
                    <%--OnRowDataBound="Grid_rowdatabound" OnRowDeleting="GalleryDatalist_RowDeleting" OnRowCommand="GalleryDatalist_RowCommand"--%>

                    <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" />

                    <PagerStyle HorizontalAlign="center" />

                    <Columns>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblactorname" runat="server" Text='<%# Eval("FName")+ " &nbsp;" + Eval("Lname") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblimgname" runat="server" Text='<%# Eval("EmailId") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone No." HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcid" runat="server" Text='<%# Eval("phno") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Role" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcomm" runat="server" Text='<%# Eval("Designation") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lblcomm1" runat="server" Text='<%# Eval("stat") %>' CssClass="gridstyles"  CommandArgument='<%# Eval("uid") %>'
                                        OnCommand="lnkactivate_Command"   CommandName="active"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="lnkView" Text="View" runat="server" CommandArgument='<%# Eval("uid") %>'
                                        OnCommand="imgbtnview_Command"   CommandName="view" 
                                    ImageUrl="~/Admin/images/search.png" />
                            </ItemTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate> 
                                <asp:ImageButton ID="lnkView1" Text="Edit" runat="server" CommandName="edit"  CommandArgument='<%# Eval("uid") %>'
                                        OnCommand="imgbtnview_Command1"   
                                    ImageUrl="~/Admin/images/edit.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtn1" runat="server" ImageUrl="~/Admin/images/delete.gif" CommandArgument='<%#Eval("uid") %>'  OnCommand="imgbtn1_Command" 
                                    CommandName="Delete" OnClientClick="return confirm('Are you sure Delete this Record?')" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

