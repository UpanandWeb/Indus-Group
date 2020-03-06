<%@ Page Title="Support-Image" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-SupportImageEdit.aspx.cs" Inherits="admin_Admin_SupportImageEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div class="cent_content" style="margin-top: -56px;">
        <h1>Support</h1>
    <table width="80%"  runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td align="right">
                                <asp:Label ID="Label8" runat="server" Text="Category :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" Font-Size="20px">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Current Need Images</asp:ListItem>
                                    <asp:ListItem Value="2">Support page Side Image</asp:ListItem>
                                    <asp:ListItem Value="3">Nutrition food Side Image</asp:ListItem>
                                    <asp:ListItem Value="4">Monthly Need Side Image</asp:ListItem>
                                    <asp:ListItem Value="5">Current Side Image</asp:ListItem>
                                    <asp:ListItem Value="6">Image for Veg Meal</asp:ListItem>
                                    <asp:ListItem Value="7">Image for Non Veg Meal</asp:ListItem>

                                </asp:DropDownList>
                               <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Add category" ValidationGroup="val" ForeColor="Red">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label7" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtsup" runat="server" Width="200px" Font-Size="22px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsup" ErrorMessage="Add Title" ValidationGroup="val" ForeColor="Red">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />

                            </td>
                        </tr>

                        <tr>
                            <td align="right">
                                <asp:Label ID="Label9" runat="server" Text="Update Image :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="fd1" runat="server" />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fd1" ErrorMessage="Add Image" ValidationGroup="val" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="Button1" runat="server" Text="Update" BackColor="#0b2e82" ForeColor="White" Width="100px" ValidationGroup="val" Font-Size="20px" Height="40px" OnClick="Button1_Click" />
                                <asp:ValidationSummary ID="vl" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />

                                &nbsp;&nbsp;&nbsp;

                                 <asp:Button ID="Button2" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click"  />
                            </td>
                        </tr>
                    </table>

           </div>
</asp:Content>

