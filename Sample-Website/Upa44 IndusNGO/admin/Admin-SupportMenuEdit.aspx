<%@ Page Title="Support-Menu" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-SupportMenuEdit.aspx.cs" Inherits="admin_Admin_SupportMenuEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

          <div class="cent_content" style="margin-top: -56px;">
     <h1>Support Edit</h1>




  
                    <table width="80%" align="center" runat="server" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label3" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" Font-Size="20px" required Width="250px"></asp:TextBox>
                            </td>
                            <td align="left"></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>

                            <td align="center">
                                <asp:Label ID="Label4" runat="server" Text="Page Name :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                                <asp:TextBox ID="TextBox3" runat="server" Font-Size="20px" required Width="250px"></asp:TextBox>

                                <td align="left"></td>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btn3" runat="server" Text="Update" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btn3_Click" />

                                &nbsp;&nbsp;&nbsp;

                                <asp:Button ID="Button1" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click"   />
                            </td>
                        </tr>

                    </table>
          </div>
</asp:Content>

