<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-University.aspx.cs" Inherits="admin_Admin_University" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .bor {
            border: 1px solid gray;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <br />
        <br />

    <table align="center" width="100%">
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="Universities List" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green"> </asp:Label>
            </td>
        </tr>
        <tr><td><br /></td></tr>
      
        

            <tr>
            <td align="right">
                <asp:LinkButton ID="Label2" runat="server" Text="Add University" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="18px" ForeColor="Green" OnClick="Label2_Click1"> </asp:LinkButton>
            </td>
        </tr>
        <tr><td><br /></td></tr>

        <tr><td align="center" width="100%">
            <asp:Label ID="lbl" runat="server" Text="Select Country :" Height="30px" Font-Size="18px" Width="200px"></asp:Label>
            <asp:DropDownList ID="ddc" runat="server" Height="30px" Font-Size="18px" Width="200px">
                <asp:ListItem>Select Country</asp:ListItem>
                <asp:ListItem>USA</asp:ListItem>
                <asp:ListItem>CANADA</asp:ListItem>
                <asp:ListItem>AUSTRALIA</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>

            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="iidd" runat="server" ControlToValidate="ddc" InitialValue="Select Country" ForeColor="Red" ErrorMessage="Select Country" ValidationGroup="get"></asp:RequiredFieldValidator>
            <asp:Button ID="btnsubmit" runat="server" Text="Get Data" Height="30px" Font-Size="18px" Width="100px" OnClick="btnsubmit_Click" ValidationGroup="get" />
            </td></tr>

        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td align="center" style="padding-left: 10px;line-height:30px">
                <asp:GridView ID="GalleryDatalist" runat="server" AutoGenerateColumns="false"
                    DataKeyNames="uid" Width="90%" HorizontalAlign="Center"   OnRowEditing="GalleryDatalist_RowEditing" OnRowDeleting="GalleryDatalist_RowDeleting"
                    AllowPaging="true" PageSize="15"  OnPageIndexChanging="GalleryDatalist_PageIndexChanging">

                    <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" />

                    <PagerStyle HorizontalAlign="center" />

                    <Columns>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblactorname" runat="server" Text='<%# Eval("uname") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblimgname" runat="server" Text='<%# Eval("city") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="State" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcid" runat="server" Text='<%# Eval("state") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="World Rank" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcomm" runat="server" Text='<%# Eval("worldrank") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Country Rank" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcommaa" runat="server" Text='<%# Eval("countryrank") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="URL" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lblcommaaa" runat="server" Text='<%# Eval("Website") %>' CssClass="gridstyles" > </asp:LinkButton>--%>
                                 <asp:HyperLink ID="lbl1" runat="server"  Text='<%# Eval("Website") %>' 
                                                NavigateUrl='<%# Eval("Website") %>'   target="_blank"  ></asp:HyperLink>
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


