<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Enquiry.aspx.cs" Inherits="admin_Admin_Enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="container_add">

          <br />
          <table>
              <tr>
                  <td align="center">
     <asp:Label ID="Label1" runat="server" Text="Enquiry Data" CssClass="lblheading" 
      Font-Underline="true" Font-Bold="true" Font-Size="25px" ForeColor="Green" > </asp:Label>
   </td>
              </tr>
              <tr>
                  <td></td>
              </tr>
              <tr>
                  <td align="center" style="padding-left:10px;">
                      <asp:GridView ID="GalleryDatalist"  runat="server" AutoGenerateColumns="false" 
                 DataKeyNames="id" Width="950px" HorizontalAlign="Center"
            AllowPaging="true" PageSize="15"  
                 OnRowDataBound="Grid_rowdatabound" OnRowDeleting="GalleryDatalist_RowDeleting">

          <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"  
BorderStyle="Solid" BorderWidth="1px" />

      <PagerStyle HorizontalAlign="center" />

                <Columns>
                 <asp:TemplateField HeaderText="Id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                   <asp:Label ID="lblgid" runat="server" Text='<%# Eval("id") %>' ></asp:Label>
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
		 <asp:ImageButton ID="lnkView" Text="View"   runat="server" 
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
		<asp:ImageButton ID="lnkreply"   runat="server" 
                        ImageUrl="~/Admin/images/reply.png" />
	</ItemTemplate>
	</asp:TemplateField>

    <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
         <ItemStyle HorizontalAlign="Center" />
               <ItemTemplate>
                    <asp:ImageButton ID="imgbtn1" runat="server" ImageUrl="~/Admin/images/delete.gif" CommandArgument='<%#Eval("id") %>' 
                    CommandName="Delete" OnClientClick="return confirm('Are you sure Delete this Record?')" />
                   
                   </ItemTemplate>

                      </asp:TemplateField>

                </Columns>   
          
          </asp:GridView>
                  </td>
              </tr>
          </table>
    

          </section>
</asp:Content>

