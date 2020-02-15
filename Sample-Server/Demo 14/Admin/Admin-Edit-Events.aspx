<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Edit-Events.aspx.cs" Inherits="Admin_Admin_Edit_Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <table align="center" width="90%">
        <tr>
            <td>
                <table align="center" width="90%">
                    <tr>
                        <td height="8px"></td>
                    </tr>

                    <tr>
                        <td align="center" colspan="3">
                            <h2>Update  Post</h2>
                        </td>
                    </tr>
                    <tr>
                        <td height="20px"></td>
                    </tr>
        <%--            <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="lbltype" runat="server" Text="Select Type" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:DropDownList ID="ddtype" runat="server" Font-Size="16px" Width="242px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="ddtype_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Events</asp:ListItem>
                                <asp:ListItem>Gallery</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="lbltitle" runat="server" Text="Title" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txttitle" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
             <%--       <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr runat="server" id="des">
                        <td width="45%" align="right">
                            <asp:Label ID="lbldis" runat="server" Text="Description" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txtdis" runat="server" Font-Size="16px" Width="240px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                        </td>
                    </tr>--%>
                     <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="Label2" runat="server" Text="Keywords" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txtkeywords" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="Label4" runat="server" Text="Uploded Main image" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:Image ID="imgmain" runat="server" Font-Size="16px" Width="200px" Height="200px" ></asp:Image>
                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" width="90%" align="center">
                            <table width="90%" align="center">
                                <tr>
                                    <td width="45%" align="right">
                                        <asp:Label ID="Label1" runat="server" Text="If you want change Main Image" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="10%" align="center">
                                        <b>:</b>
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:FileUpload ID="mainupload" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:FileUpload>
                                        <%-- <asp:Button ID="Btnmainupload" runat="server" Font-Size="16px" Height="30px" Width="40px" Text="Upload" />--%>
                                    </td>
                                    <td width="15%" align="left">
                                        <asp:Button ID="Btnmainupload1" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Change" OnClick="Btnmainupload1_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8px"></td>
                                </tr>

                                <tr >
                                    <td width="45%" align="right"></td>
                                    <td width="10%" align="center">
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:Label ID="lblmain" runat="server" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="15%" align="left"></td>
                                </tr>
                                <tr>
                                    <td height="8px"></td>
                                </tr>
                                 <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="Label5" runat="server" Text="Uploded other images" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                             <asp:DataList ID="GridView1" Width="100%" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="16px"
                    ForeColor="#333333" GridLines="None"  HorizontalAlign="Center" RepeatColumns="4"  >
        <%--                <asp:ImageField HeaderStyle-Width="170px" HeaderText="Images" DataImageUrlField="Sub_Image" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%" />
                        <asp:ButtonField HeaderText="Delete" ButtonType="Link" Text="Delete" CommandName="Delete" ItemStyle-HorizontalAlign="Center" />--%>
                        
                                                    <ItemTemplate>
                                                        <asp:image ID="lblout1" ForeColor="Gray" ImageUrl='<%# Bind("Sub_Image", "~/design/soroptimist/admin/UploadImages/{0}") %>' runat="server" CssClass="data" Width="100px" Height="100px" ></asp:image>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />

                </asp:DataList>
                        </td>
                    </tr>
                                 <tr>
                                    <td height="8px"></td>
                                </tr>
                                <tr >
                                    <td width="45%" align="right">
                                        <asp:Label ID="Label3" runat="server" Text="if you want change  Other Images" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="10%" align="center">
                                        <b>:</b>
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:FileUpload ID="otherupload" runat="server" Font-Size="16px" Width="240px" Height="30px" AllowMultiple="true" ></asp:FileUpload>
                                    </td>
                                    <td width="15%" align="left"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
        
                    <tr>
                        <td height="20px"></td>
                    </tr>
                    <tr>
                        <td  align="center" colspan="3">
                            <asp:Button ID="btnsave" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Update" OnClick="btnsave_Click" />
                             <%--<asp:Button ID="Btnmainupload" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Submit" OnClick="Btnmainupload_Click" Visible="false" />--%>
                            <asp:Button ID="btncancel" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Cancel"  OnClick="btncancel_Click"/>

                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

