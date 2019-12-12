<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuItems.aspx.cs" Inherits="admin_MenuItems" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
               <center>
    <table width="998px" cellpadding="0" cellspacing="0">
    <tr width="998px">
        <td valign="top" align="center" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    </table>

         <center>
             <ajx:ToolkitScriptManager ID="tls" runat="server"></ajx:ToolkitScriptManager>
                   <table align="center" width="100%">
<tr>
 <td>
<br />
 </td>
</tr>

<tr>
   <td align="center">
     <asp:Label ID="lblbusiness" runat="server" Text="Menu Items" CssClass="lblheading" ></asp:Label>
    </td>
</tr>
<tr>
   <td> 
     <table width="100%">
        <tr>
     
       <td align="right"  width="80%">
        <asp:Button ID="btnpost" runat="server" Text="Create Menu Items" BackColor="#256EA4" 
               ForeColor="white" Font-Bold="true" onclick="btnpost_Click"/>
      </td>
            <td>&nbsp;</td>
       </tr>
     <tr><td><br /></td></tr>
       <tr>
         <td align="center" width="100%" colspan="2">
          <asp:GridView ID="grid1"  runat="server" AutoGenerateColumns="false"  Width="750px" HorizontalAlign="Center"  AllowPaging="true" PageSize="15" 
             >
                 <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"  BorderStyle="Solid" BorderWidth="1px" />
                      <PagerStyle HorizontalAlign="center" />

                <Columns>
           
                  <asp:TemplateField HeaderText="Country" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                  <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                    <asp:Label ID="lblcategory" runat="server" Text='<%# Eval("Country") %>' CssClass="gridstyles"></asp:Label>
                   </ItemTemplate>
                </asp:TemplateField>

             <asp:TemplateField HeaderText="Role" HeaderStyle-HorizontalAlign="Center" >
                   <ItemTemplate>
                   <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("Role") %>' ></asp:Label>
                    </ItemTemplate>
            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                  <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                   
                    <asp:Label ID="lblnewsid" runat="server" Text='<%# Eval("name") %>' CssClass="gridstyles"></asp:Label>
                   </ItemTemplate>
                </asp:TemplateField>

             <%--    <asp:TemplateField HeaderText="view" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                 <ItemStyle HorizontalAlign="Center" />
                   <ItemTemplate>
                   <asp:LinkButton ID="viewlnk" runat="server" Text="View"  CommandArgument='<%#Eval("mid") %>'  OnClick="viewlnk_Click"  >
                     <img src="images/search.png" border="0"  alt="View"/> 
                   </asp:LinkButton>
                  </ItemTemplate>
               </asp:TemplateField>--%>

                     <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                 <ItemStyle HorizontalAlign="Center" />
                   <ItemTemplate>
                   <asp:LinkButton ID="viewlnk" runat="server" Text="Email"  CommandArgument='<%#Eval("name") %>'  OnCommand="emaillnk_Click"  >
                     <img src="images/mail.png" border="0"  alt="Email"/> 
                   </asp:LinkButton>
                  </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
               <ItemStyle HorizontalAlign="Center" />
                   <ItemTemplate>
                    <asp:LinkButton ID="editlnk" runat="server" Text="Edit" CommandArgument='<%#Eval("name") %>' OnCommand="editlnk_Click" >
                     <img src="images/edit.gif" border="0"  alt="Edit"/> 
                   </asp:LinkButton>
                    </ItemTemplate>
               </asp:TemplateField>

                 <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemStyle HorizontalAlign="Center" />
                   <ItemTemplate>
                       <asp:LinkButton ID="imgbtn1" runat="server" Text="Delete" CommandArgument='<%#Eval("name") %>' OnCommand="imgbtn1_Command" 
                           OnClientClick="return confirm('Are you sure Delete this Record?')"  >
                     <img src="images/delete.gif" border="0"  alt="Delete"/> 
                   </asp:LinkButton>
                  <%--  <asp:ImageButton ID="imgbtn1" runat="server" ImageUrl="~/Admin/images/delete.gif"  CommandName="delete" AlternateText="Delete"
                        CommandArgument='<%#Eval("name") %>'    />         --%>             
                    </ItemTemplate>
                   </asp:TemplateField>
                </Columns>   
           </asp:GridView>
        </td>
      </tr>
      </table>
    </td>
  </tr>

</table>
               <input type="button"  style="display: none;" id="btndummy" runat="server" />
                      <ajx:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnledit" DropShadow="false" 
                          BackgroundCssClass="Modalpopup" CancelControlID="btnclose">      </ajx:ModalPopupExtender>
                      <div>    
                        <asp:Panel runat="server" ID="pnledit" Width="1000px" Height="600px" BorderColor="Black"  HorizontalAlign="Center" BackColor="#E6E6E6" >
                        <table width="100%"> 
                            <tr>
                                  <td colspan="2">
                                    <table  align="right" >
                                      <tr>
                                        <td width="100%" align="right" style="padding-right:10px; padding-top:8px;" valign="middle"  >
                                             <asp:Button ID="btnclose" runat="server" Text="X" Font-Size="Larger" Width="30px" Height="30px"/>
                                        </td>
                                     </tr>
                                    </table>
                                </td>
                           </tr>

                           <tr><td><br /></td></tr>

                           
            <tr>
                 <td width="30%" align="right">
                     Country &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left">
                    <asp:DropDownList ID="ddc" runat="server" AutoPostBack="true" Width="200px" Enabled="false">
                       <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>USA</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>UK</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>
              <tr>
                 <td width="30%" align="right">
                     Role &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left">
                    <asp:DropDownList ID="ddrole" runat="server" AutoPostBack="true" Width="200px"  Enabled="false">
                       
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>

            <tr>
                 <td width="30%" align="right">
                     Name  &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left">
                   <asp:TextBox ID="txtname" runat="server" Enabled="false" Width="200px"></asp:TextBox>
                </td>
            </tr>

            <tr><td><br /></td></tr>
              <tr>
                 <td valign="top" width="30%" align="right">
                     Permissions   &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left" id="add1" runat="server" >
                    <asp:DataList ID="dlitems" runat="server" RepeatDirection="Horizontal"  >
                                <ItemTemplate>
                                    <asp:CheckBox ID="lnkitems" Text='<%# Eval("item") %>' runat="server" Checked="true"  Font-Size="18px" ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:DataList>
                </td>
            </tr>

                             <tr><td><br /></td></tr>

                            <tr id="add" runat="server" visible="false">
                 <td valign="top" width="30%" align="right">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal"  >
                                <ItemTemplate>
                                    <asp:CheckBox ID="lnkitems1" Text='<%# Eval("item") %>' runat="server"   Font-Size="18px" ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:DataList>
                </td>
            </tr>

                             <tr><td><br /></td></tr>

            <tr>
                <td >
                    
                </td>
                <td align="left">
                    <asp:Button ID="btnclear" runat="server" Text="Clear" OnClick="btnclear_Click" />
                    <asp:Button ID="btnModify" runat="server" Text="Add" OnClick="btnModify_Click" />
                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" />
                      <asp:Button ID="btncancle" runat="server" Text="Cancel" OnClick="btncancle_Click" />

                </td>
            </tr>
                            </table>
                            </asp:Panel>
                          </div>
         </center>
    </div>
    </form>
</body>
</html>
