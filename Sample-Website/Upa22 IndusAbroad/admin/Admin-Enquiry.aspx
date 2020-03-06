<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Enquiry.aspx.cs" Inherits="admin_Admin_Enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .grid {
            line-height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />    <br />
    <table align="center" width="100%">
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="Enquiry Data" CssClass="lblheading"
                    Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green"> </asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td align="center" style="padding-left: 10px;">
                <asp:GridView ID="GalleryDatalist" runat="server" AutoGenerateColumns="false" CssClass="grid"
                    DataKeyNames="id" Width="90%" HorizontalAlign="Center"  
                    AllowPaging="true" PageSize="15"
                  OnRowEditing="GalleryDatalist_RowEditing" OnRowDeleting="GalleryDatalist_RowDeleting1">

                    <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" />

                    <PagerStyle HorizontalAlign="center" />

                    <Columns>
                        <asp:TemplateField HeaderText="Id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblgid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblactorname" runat="server" Text='<%# Eval("Name") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblimgname" runat="server" Text='<%# Eval("Email_Id") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone No." HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcid" runat="server" Text='<%# Eval("Mobile") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Posteddate") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Message" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="15%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lblcomm" runat="server" Text='<%# Eval("comments") %>' CssClass="gridstyles"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="lnkView" Text="View" runat="server" CommandName="view" CommandArgument='<%# Eval("id") %>'  OnCommand="lnkView_Command"
                                    ImageUrl="~/Admin/images/search.png" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--   <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
<ItemStyle HorizontalAlign="Center" />
	<ItemTemplate>
		<asp:ImageButton ID="lnkEdit" Text="Edit"  runat="server" 
                        ImageUrl="~/Admin/images/edit.gif" />
	</ItemTemplate>
	</asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Reply" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="lnkreply" runat="server" CommandName="reply" CommandArgument='<%# Eval("id") %>'  OnCommand="lnkreply_Command"
                                    ImageUrl="~/Admin/images/reply.png" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtn1" runat="server" ImageUrl="~/Admin/images/delete.gif"
                                    CommandName="Delete" CommandArgument='<%# Eval("id") %>'  OnCommand="imgbtn1_Command" OnClientClick="return confirm('Are you sure Delete this Record?')" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </td>
        </tr>

        <tr><td><br /><br /></td></tr>

        <tr>

            <td width="90%" align="center">
                <table id="view" runat="server" width="90%" align="center">
                    <tr>
                        <td align="right">Enter Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txt1name" runat="server"  PlaceHolder="Enter Your Name" ReadOnly="true"  Width="40%" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td height="5px"></td></tr>
                    <tr>
                        <td align="right">Email Id:
                        </td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server"  PlaceHolder="Enter Your Email" ReadOnly="true" Width="40%" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td height="5px"></td></tr>

                    <tr>
                        <td align="right">Mobile Number:
                        </td>
                        <td>
                            <asp:TextBox ID="txtphone" runat="server"  PlaceHolder="Enter Your Phone No" Width="40%" Height="30px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr><td height="5px"></td></tr>

                    <tr>
                        <td align="right">Message :
                        </td>
                        <td>
                            <asp:TextBox ID="txtmsg" runat="server"  PlaceHolder="Message" TextMode="MultiLine" ReadOnly="true" Width="50%" Height="80px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr><td height="15px"></td></tr>

                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="submit-btn" Text="Cancel" OnClick="btnsubmit_Click"  Width="100px" Height="30px"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


</asp:Content>

