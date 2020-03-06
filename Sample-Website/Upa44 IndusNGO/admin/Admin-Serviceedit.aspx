<%@ Page Title="Admin-Panel" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Serviceedit.aspx.cs" Inherits="admin_Admin_Serviceedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="cent_content" style="margin-top: -56px;">
        <h1>Service Edit</h1>

        <table align="center" width="70%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td align="right">
                    <asp:Button ID="post" runat="server" Text="Back" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="38px" OnClick="post_Click"  /></td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>

            <tr>
                <td id="fr" width="50%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">

                   
                            <table width="100%" align="center">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" width="26%">
                                <asp:Label ID="lb" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txt1" runat="server" Font-Size="20px" required Width="250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>

                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Font-Size="20px" Width="150px" 
                                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="true">

                                    <%-- <asp:ListItem Value="0">Select</asp:ListItem>--%>
                                    <%--     <asp:ListItem Value="1">Clothing</asp:ListItem>
                             <asp:ListItem Value="2">Education</asp:ListItem>
                        <asp:ListItem Value="3">Food</asp:ListItem>--%>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>

                            <td>
                                <asp:Label ID="lb2" runat="server" Text="Sub-Category:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddl" runat="server" Height="30px" Font-Size="20px"  Width="200px">
                                    <asp:ListItem Value="0">Select</asp:ListItem>

                                </asp:DropDownList></td>
                        </tr>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Image:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" /></td>

                        </tr>



                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr id="txt12" runat="server">
                            <td valign="top">
                                <asp:Label ID="lbldis" runat="server" Text="Content :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>

                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500px" Height="300px" Font-Size="22px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ValidationGroup="ad" ErrorMessage="please add description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td valign="center" colspan="2">
                                <asp:Label ID="Label3" runat="server" Text="Updated Successfully" Visible="false" ForeColor="Green" Font-Size="18px"></asp:Label>
                                  
                                <br />
                            </td>
                        </tr>
                                <tr>
                                    <td><br /></td>
                                </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnsub" runat="server" Text="Submit" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsub_Click"  />
                            </td>
                        </tr>
                    </table>
                     
                    
                </td>
            </tr>
        </table>
    </div>



</asp:Content>

