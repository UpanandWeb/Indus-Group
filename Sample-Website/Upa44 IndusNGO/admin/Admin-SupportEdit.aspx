<%@ Page Title="Admin-Support" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-SupportEdit.aspx.cs" Inherits="admin_Admin_SupportEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">

    tinyMCE.init({

        mode: "textareas",

        theme: "advanced",

        plugins: "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",

        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",

        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",

        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",

        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",

        theme_advanced_toolbar_location: "top",

        theme_advanced_toolbar_align: "left",

        theme_advanced_statusbar_location: "bottom",

        theme_advanced_resizing: false,

        template_external_list_url: "js/template_list.js",

        external_link_list_url: "js/link_list.js",

        external_image_list_url: "js/image_list.js",

        media_external_list_url: "js/media_list.js"

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="cent_content" style="margin-top: -56px;">
     <h1>Support Edit</h1>

    <table width="80%"  runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="26%">
                                <asp:Label ID="lb" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txt1" runat="server" Font-Size="20px" Width="250px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>

                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Font-Size="20px" Width="357px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList></td>
                        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>

                        <tr id="ml" runat="server">
                            <td align="right">
                                <asp:Label ID="Label6" runat="server" Text="Meal Type:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>

                            <td align="left">
                                <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Font-Size="20px" Width="257px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem Value="1">Veg Meal</asp:ListItem>
                                    <asp:ListItem Value="2">Non Veg Meal</asp:ListItem>

                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="left">
                                <asp:Label ID="lbitem" runat="server" Text="Item Name" ForeColor="Blue" Font-Size="20px"></asp:Label><asp:TextBox ID="txitme" runat="server" ForeColor="Blue" Font-Size="20px"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="Price/Quantity" ForeColor="Blue" Font-Size="20px"></asp:Label><asp:TextBox ID="TextBox4" runat="server" Font-Size="20px"></asp:TextBox>
                                <asp:Button ID="Add" runat="server" Text="Add Item" OnClick="Add_Click" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:GridView ID="GridView1" Width="600px" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="22px"
                                    ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Item" DataField="item_name" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="20px" />
                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Price" DataField="price" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="20px" />
                                        <%--    <asp:ButtonField HeaderText="Add" ButtonType="Button" Text="add" CommandName="ad" /> --%>
                                        <%--<asp:CommandField ShowDeleteButton="true" />--%>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="20px" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />


                                </asp:GridView>

                                 <asp:GridView ID="GridView2" Width="600px" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="22px"
                                    ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Item" DataField="name" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="20px" />
                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Price" DataField="details" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="20px" />
                                        <%--    <asp:ButtonField HeaderText="Add" ButtonType="Button" Text="add" CommandName="ad" /> --%>
                                        <%--<asp:CommandField ShowDeleteButton="true" />--%>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="20px" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />


                                </asp:GridView>
                            </td>
                        </tr>
                        <tr id="sp" runat="server">
                            <td colspan="2" align="left">
                                <asp:Label ID="Label5" runat="server" Text="Total Price" ForeColor="Blue" Font-Size="20px"></asp:Label><asp:TextBox ID="TextBox5" runat="server" ForeColor="Blue" Font-Size="20px"></asp:TextBox></td>
                        </tr>


                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>





                            <td>
                                <br />
                            </td>
                        </tr>

                        <%--<tr>

                            <td>
                                <asp:Label ID="lb2" runat="server" Text="Sub-Category:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddl" runat="server" Height="30px" Font-Size="20px" required Width="200px">
                                    <asp:ListItem Value="0">Select</asp:ListItem>

                                </asp:DropDownList></td>
                        </tr>--%>


                        <%-- <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Image:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" /></td>

                        </tr>--%>



                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr id="txt12" runat="server">
                            <td valign="top" align="right">
                                <asp:Label ID="lbldis" runat="server" Text="Content :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>

                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500px" Height="300px" Font-Size="22px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ValidationGroup="ad" ErrorMessage="please add description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnsub" runat="server" Text="Update" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsub_Click"  />

                                &nbsp;&nbsp;&nbsp;
                                  <asp:Button ID="Button1" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click"   />
                            </td>
                        </tr>
                    </table>

          </div>
</asp:Content>

