﻿<%@ Page Title="Admin-Panel" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Submenu.aspx.cs" Inherits="admin_Admin_Submenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="cent_content" style="margin-top:-56px;" >
      <h1>Menu And Sub-Menu</h1>
    
    <table align="center" width="70%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        <tr><td align="right"><asp:Button ID="post" runat="server" Text="Post" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="30px" Visible="false" /></td></tr>
        <tr><td><br /></td></tr>
        <tr>
            <td>
             <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                                       EnableModelValidation="True" 
                                       HeaderStyle-HorizontalAlign="Center" CellPadding="4"    
                                      DataKeyNames="id" Width="100%"   AllowPaging="True" ForeColor="#333333"      >
         <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px"   />
                                     <Columns>
                                       <asp:TemplateField ControlStyle-Width="300px"  HeaderStyle-Width="150px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr><td align="center">
                                                 <asp:Label ID="lblarea" runat="server" Text="ID" Font-Size="24px"></asp:Label>
                                          </td></tr></table>       
                                          </HeaderTemplate>
                                           <ItemTemplate> 
                                          <table width="100%" align="center"><tr><td align="center">  
                                                <asp:Label ID="lblnamec" runat="server" Text='<%#Eval("id") %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                          </td></tr></table>   
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                       </asp:TemplateField>

                                          <asp:TemplateField  ControlStyle-Width="150px"  HeaderStyle-Width="150px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Category" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate>
                                         <asp:Label ID="arealbl2" runat="server" Text='<%#Eval("category") %>' Font-Size="20px"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateField>

                                             <asp:TemplateField  ControlStyle-Width="300px"  HeaderStyle-Width="300px" FooterStyle-Width="300px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Description" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                         <asp:Label ID="arealbl311" runat="server" Text='<%#Eval("content") %>' Font-Size="20px"></asp:Label>
                                             <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                              ControlStyle-Width="30px"  HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                                <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>  
                                        <ItemTemplate>
                                        &nbsp;    &nbsp;   <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif"  CommandArgument='<%# Eval("id") %>' 
                                                                AlternateText="Edit"   ></asp:ImageButton>
                                        </ItemTemplate>
                                         <FooterTemplate >
                                           </FooterTemplate>
                                        </asp:TemplateField>

                                    <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                       ControlStyle-Width="30px"  HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>  
                                        <ItemTemplate>
                                  <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif"  CommandArgument='<%# Eval("id") %>' 
                                    OnClientClick="return confirm('Are you sure you want to delete this record?');"   AlternateText="Delete"  CommandName="delete"></asp:ImageButton>
                                        </ItemTemplate>
                                        <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                                        </asp:TemplateField>
                                    </Columns>

                                    <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%> 
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                                    <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                                    <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                                </asp:GridView>
            </td>
        </tr>

        
        <tr><td colspan="2" align="right"><asp:Button ID="Button2" runat="server" Text="Back" Visible="false" Width="100px" Height="30px" Font-Size="20px"  OnClick="Button2_Click" /></td></tr>

        <tr>
            <td id="fr" runat="server" align="center" colspan="2" style="border: 1px solid;
    padding: 2px;
    box-shadow: 5px 10px 8px #888888;background-color: #E8F8F5 ;">

                <table width="700px" align="center" >
                    <tr><td><br /></td></tr>

                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Add Sub Menu For Home Main Menu" Checked="true" GroupName="rad" Font-Size="20px"  AutoPostBack="true" OnCheckedChanged="RadioButton1_CheckedChanged"/> &nbsp;&nbsp;
                     <asp:RadioButton ID="RadioButton2" runat="server" Text="Add Sub Category"  GroupName="rad" Font-Size="20px" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true" />

                      <tr>
                     
                    <td><asp:Label ID="Label1" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td><asp:DropDownList ID="DropDownList1" runat="server" Height="30px" required Width="150px" Font-Size="20px"   AutoPostBack="true">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                             <%-- <asp:ListItem Value="1">Services</asp:ListItem>
                             <asp:ListItem Value="2">About</asp:ListItem>
                           <asp:ListItem Value="3">Beneficiarys</asp:ListItem>
                           <asp:ListItem Value="4">Donations</asp:ListItem>
                        <asp:ListItem Value="5">Gallery</asp:ListItem>
                          <asp:ListItem Value="6">Team</asp:ListItem>--%>
                 
                                                                                                     </asp:DropDownList></td></tr>
                    <tr><td><br /></td></tr>
                    <tr>
                        <td align="left" width="20%"><asp:Label ID="lb" runat="server" Text="Sub-Menu :" ForeColor="Blue" Font-Size="24px"></asp:Label></td><td><asp:TextBox ID="txt1" runat="server"  Width="250px" Font-Size="20px"></asp:TextBox></td></tr>
                    <tr><td><br /></td></tr>

                       
                    <tr><td><br /></td></tr>

     

                    <tr><td>
                        <br />
                        </td></tr>
                      
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                    <tr><td align="center" colspan="2"><asp:Button ID="btnsub" runat="server" Text="Submit"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsub_Click" />


                        <asp:Button ID="Button3" runat="server" Text="Cancel"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button3_Click"  />
                        </td></tr>

                    

                 
                </table>
            </td>
        </tr>
        <tr>
            <td id="fr23" runat="server" align="center" colspan="2" style="border: 1px solid;
    padding: 2px;
    box-shadow: 5px 10px 8px #888888;background-color: #E8F8F5 ;">
                <table width="700px" align="center" >
                    <tr><td><br /></td></tr>

                   

                      <tr>
                     
                    <td><asp:Label ID="Label2" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td><asp:DropDownList ID="DropDownList2" runat="server" Height="30px" required Width="150px" Font-Size="20px"   AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                            <%--  <asp:ListItem Value="1">Services</asp:ListItem>
                             <asp:ListItem Value="2">About</asp:ListItem>
                           <asp:ListItem Value="3">Beneficiarys</asp:ListItem>
                           <asp:ListItem Value="4">Donations</asp:ListItem>
                        <asp:ListItem Value="5">Gallery</asp:ListItem>
                          <asp:ListItem Value="6">Team</asp:ListItem>--%>
                 
                                                                                                     </asp:DropDownList></td></tr>
                    <tr><td><br /></td></tr>
                    <tr>
                        <td align="left" width="20%"><asp:Label ID="Label3" runat="server" Text="Sub-Menu :" ForeColor="Blue" Font-Size="24px"></asp:Label></td><td><asp:DropDownList ID="DropDownList3" runat="server" Height="30px" required Width="150px" Font-Size="20px"   >
                             <asp:ListItem Value="0">Select</asp:ListItem>
                            <%--  <asp:ListItem Value="1">Services</asp:ListItem>
                             <asp:ListItem Value="2">About</asp:ListItem>
                           <asp:ListItem Value="3">Beneficiarys</asp:ListItem>
                           <asp:ListItem Value="4">Donations</asp:ListItem>
                        <asp:ListItem Value="5">Gallery</asp:ListItem>
                          <asp:ListItem Value="6">Team</asp:ListItem>--%>
                 
                                                                                                     </asp:DropDownList></td></tr>
                    <tr><td><br /></td></tr>

                       
                    <tr> <td align="left" width="20%"><asp:Label ID="Label4" runat="server" Text="Sub-Category :" ForeColor="Blue" Font-Size="24px"></asp:Label></td><td><asp:TextBox ID="TextBox1" runat="server"  Width="250px" Font-Size="20px"></asp:TextBox></td></tr>
                    
     

                    <tr><td>
                        <br />
                        </td></tr>
                      
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                    <tr><td align="center" colspan="2"><asp:Button ID="Button1" runat="server" Text="Submit"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click" /> 

                        <asp:Button ID="Button4" runat="server" Text="Cancel"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button4_Click"  />

                        </td></tr>

                    

                 
                </table>
            </td>
        </tr>

    </table>
      </div>
</asp:Content>

