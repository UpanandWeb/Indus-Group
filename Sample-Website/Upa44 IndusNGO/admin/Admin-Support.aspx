<%@ Page Title="Admin-Support" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Support.aspx.cs" Inherits="admin_Admin_Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


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
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="js/jquery.MultiFile.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="cent_content" style="margin-top: -56px;">
        <h1>Support</h1>

        <table align="center" width="70%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td align="right">
                    <asp:Button ID="post" runat="server" Text="Post" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="38px" OnClick="post_Click" /></td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr id="rad2" runat="server">
                <td>
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="View Content" Checked="true" Font-Bold="true" Font-Size="24px" GroupName="new" AutoPostBack="true" OnCheckedChanged="RadioButton3_CheckedChanged" />
                    &nbsp;&nbsp;

                    <asp:RadioButton ID="RadioButton4" runat="server" Text="View Side Menu" GroupName="new" Font-Bold="true" Font-Size="24px" AutoPostBack="true" OnCheckedChanged="RadioButton4_CheckedChanged" />

                    &nbsp;&nbsp;

                                        <asp:RadioButton ID="RadioButton5" runat="server" Text="View Images" GroupName="new" Font-Bold="true" Font-Size="24px" AutoPostBack="true" OnCheckedChanged="RadioButton5_CheckedChanged" />

                    <asp:RadioButton ID="RadioButton6" runat="server" Text="View Special Food Menu" Visible="false" GroupName="new" Font-Bold="true" Font-Size="24px" AutoPostBack="true" OnCheckedChanged="RadioButton6_CheckedChanged" />
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                </td>
            </tr>


            <tr>
                <td id="fr23" width="100%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="sup_id" Width="100%" AllowPaging="True" ForeColor="#333333" OnRowDataBound="gv_RowDataBound" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDeleting="gv_RowDeleting">
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblarea" runat="server" Text="Sl.No" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblid" runat="server" Text='<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbltitle" runat="server" Text="Title" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltitle1" runat="server" Text='<%#Eval("title") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblcate" runat="server" Text="Category" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblcate1" runat="server" Text='<%#Eval("menu_name") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblcontent" runat="server" Text="Content" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblcontent1" runat="server" Text='<%# (Eval("content").ToString().Length > 50) ? (Eval("content").ToString().Substring(0, 50) + "...") : Eval("content")%>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbldate" runat="server" Text="Date" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbldate1" runat="server" Text='<%#Eval("posteddate") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField ControlStyle-Width="90px" HeaderStyle-Width="90px" FooterStyle-Width="90px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbst" runat="server" Text="Status" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%-- <asp:Label ID="lbst1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px"></asp:Label>--%>
                                    <asp:LinkButton ID="lnkmore" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%# Eval("sup_id") %>'
                                        CommandName="commandview1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbledit" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &nbsp;    &nbsp;  
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandArgument='<%# Eval("sup_id") %>' CommandName="edit"
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbdel" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("sup_id") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" CommandName="delete"></asp:ImageButton>
                                </ItemTemplate>
                                <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                            </asp:TemplateField>
                        </Columns>

                        <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                    </asp:GridView>
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td id="Td1" width="100%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="sid" Width="100%" AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" OnRowDeleting="GridView2_RowDeleting">
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbsid" runat="server" Text="Sl.No" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbsid1" runat="server" Text='<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbmenu" runat="server" Text="Name" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbmenu1" runat="server" Text='<%#Eval("menu_name") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbpage" runat="server" Text="Page Name" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbpage1" runat="server" Text='<%#Eval("page_name") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>






                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbst1" runat="server" Text="Status" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%-- <asp:Label ID="lbst1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px"></asp:Label>--%>
                                    <asp:LinkButton ID="lnkmore1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%# Eval("sid") %>'
                                        CommandName="commandview1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbledit1" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &nbsp;    &nbsp;  
                                    <asp:ImageButton ID="lnkview1" runat="server" ImageUrl="images/Edit.gif" CommandArgument='<%# Eval("sid") %>' CommandName="edit"
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbdel1" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkdelete1" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("sid") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" CommandName="delete"></asp:ImageButton>
                                </ItemTemplate>
                                <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                            </asp:TemplateField>
                        </Columns>

                        <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                    </asp:GridView>
                </td>
            </tr>


            <tr>
                <td id="Td2" width="100%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="iim" Width="100%" AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="GridView3_PageIndexChanging" OnRowCommand="GridView3_RowCommand" OnRowDeleting="GridView3_RowDeleting">
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbsid" runat="server" Text="Sl.No" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbiim" runat="server" Text='<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimgtitle" runat="server" Text="Title" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbimgtitle1" runat="server" Text='<%#Eval("title") %>' Font-Size="20px"></asp:Label>
                                    <%-- <asp:LinkButton ID="lnkmore1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%# Eval("sid") %>'
                                        CommandName="commandview1"></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimg" runat="server" Text="Name" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbimg1" runat="server" Text='<%#Eval("imagename") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimgcat" runat="server" Text="Category" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblbimgcat1page1" runat="server" Text='<%#Eval("category") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>






                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimgdate" runat="server" Text="Date" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbimdgate1" runat="server" Text='<%#Eval("posteddate") %>' Font-Size="20px"></asp:Label>
                                    <%-- <asp:LinkButton ID="lnkmore1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%# Eval("sid") %>'
                                        CommandName="commandview1"></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbledit1" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &nbsp;    &nbsp;  
                                    <asp:ImageButton ID="lnkview1" runat="server" ImageUrl="images/Edit.gif" CommandArgument='<%# Eval("iim") %>' CommandName="edit"
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbdel1" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkdelete1" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("iim") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" CommandName="delete"></asp:ImageButton>
                                </ItemTemplate>
                                <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                            </asp:TemplateField>
                        </Columns>

                        <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                    </asp:GridView>
                </td>
            </tr>


            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td id="Td3" width="100%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="mid" Width="100%" AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="GridView4_PageIndexChanging" OnRowCommand="GridView4_RowCommand" OnRowDeleting="GridView4_RowDeleting">
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbsid" runat="server" Text="Sl.No" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbiim" runat="server" Text='<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimgtitle" runat="server" Text="Title" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbimgtitle1" runat="server" Text='<%#Eval("item_name") %>' Font-Size="20px"></asp:Label>
                                    <%-- <asp:LinkButton ID="lnkmore1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%# Eval("sid") %>'
                                        CommandName="commandview1"></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimg" runat="server" Text="Meal Type" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbimg1" runat="server" Text='<%#Eval("mealtype") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbimgcat" runat="server" Text="Category" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblbimgcat1page1" runat="server" Text='<%#Eval("menu_name") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>






                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbledit1" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &nbsp;    &nbsp;  
                                    <asp:ImageButton ID="lnkview1" runat="server" ImageUrl="images/Edit.gif" CommandArgument='<%# Eval("mid") %>' CommandName="edit"
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>




                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="20px" FooterStyle-Width="20px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbdel1" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkdelete1" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("mid") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" CommandName="delete"></asp:ImageButton>
                                </ItemTemplate>
                                <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                            </asp:TemplateField>
                        </Columns>

                        <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                    </asp:GridView>
                </td>
            </tr>


            <tr>
                <td>
                    <br />
                </td>
            </tr>

            <tr>
                <td id="rd" runat="server">
                    <asp:RadioButton ID="rad1" runat="server" Text="Add Content" Checked="true" OnCheckedChanged="rad1_CheckedChanged" Font-Bold="true" Font-Size="24px" GroupName="new" AutoPostBack="true" />
                    &nbsp;&nbsp;

                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Add Side Menu" GroupName="new" Font-Bold="true" Font-Size="24px" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" />

                    &nbsp;&nbsp;

                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Add Image In Support Pages" GroupName="new" Font-Bold="true" Font-Size="24px" AutoPostBack="true" OnCheckedChanged="RadioButton2_CheckedChanged" />

                </td>
            </tr>

            <tr>
                <td id="frimg" runat="server" width="50%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <table>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Category :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server" Font-Size="20px" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Current Need Images</asp:ListItem>
                                    <asp:ListItem Value="2">Support page Side Image</asp:ListItem>
                                    <asp:ListItem Value="3">Nutrition food Side Image</asp:ListItem>
                                    <asp:ListItem Value="4">Monthly Need Side Image</asp:ListItem>
                                    <asp:ListItem Value="5">Current Side Image</asp:ListItem>
                                    <asp:ListItem Value="6">Image for Veg Meal</asp:ListItem>
                                    <asp:ListItem Value="7">Image for Non Veg Meal</asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="DropDownList3" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtsup" runat="server" Width="200px" Font-Size="22px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsup" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Title" ForeColor="Red">*</asp:RequiredFieldValidator>

                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />

                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Upload Image :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="fd1" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fd1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Image" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                                    runat="server" ControlToValidate="fd1"
                                    ErrorMessage=".jpg,.jpeg,png  formats are allowed." ForeColor="Red"
                                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$"
                                    ValidationGroup="val" SetFocusOnError="true"></asp:RegularExpressionValidator>



                            </td>
                        </tr>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#0b2e82" ValidationGroup="val" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click" />
								
								  <asp:Button ID="btnsup" runat="server" Text="Cancel" BackColor="#0b2e82"  ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsup_Click" />


                                <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                            </td>
                        </tr>
                    </table>

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

                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Font-Size="20px" Width="357px" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rk1" runat="server" ControlToValidate="DropDownList1" InitialValue="Select" ErrorMessage="Add Category" ValidationGroup="val1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" width="26%">
                                <asp:Label ID="lb" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label></td>
                            <td align="left">
                                <asp:DropDownList ID="txt1" runat="server" Font-Size="20px" Width="250px" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Importance of Education</asp:ListItem>
                                    <asp:ListItem Value="2">Need for Better Nutrition</asp:ListItem>
                                    <asp:ListItem Value="3">Monthly Expenses</asp:ListItem>
                                    <asp:ListItem Value="4">   Current Needs</asp:ListItem>
                                    <asp:ListItem Value="5">   Vegetarian Special Meal</asp:ListItem>
                                    <asp:ListItem Value="6">   Non-Vegetarian Feast Meals</asp:ListItem>

                                </asp:DropDownList>
                                <%--     <asp:TextBox ID="txt1" runat="server" Font-Size="20px" Width="250px"></asp:TextBox>--%>

                                <asp:RequiredFieldValidator ID="rk" runat="server" ControlToValidate="txt1" InitialValue="0" ValidationGroup="val1" ForeColor="Red" ErrorMessage="Add Title">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>



                        <tr id="ml" runat="server">
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Meal Type:" ForeColor="Blue" Font-Size="24px"></asp:Label></td>

                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Font-Size="20px" Width="257px" AppendDataBoundItems="true">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem Value="1">Veg Meal</asp:ListItem>
                                    <asp:ListItem Value="2">Non Veg Meal</asp:ListItem>

                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2" InitialValue="0" ErrorMessage="Add Meal Type" ValidationGroup="val1" ForeColor="Red">*</asp:RequiredFieldValidator>

                            </td>
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
                                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Item" DataField="item" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="20px" />
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
                            <td valign="top">
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
                                <asp:Button ID="btnsub" runat="server" Text="Submit" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsub_Click" ValidationGroup="val1" />
								 <asp:Button ID="btncancel" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Cancelsub_Click"  />

                                <asp:ValidationSummary ID="vl1" runat="server" ValidationGroup="val1" ShowMessageBox="true" ShowSummary="false" />
                            </td>
                        </tr>
                    </table>



                </td>
            </tr>


            <tr>

                <td id="mn" align="center" width="50%" runat="server" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <table width="100%" align="center">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label3" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" Font-Size="20px" Width="250px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rk4" runat="server" ErrorMessage="Add Title" ValidationGroup="val3" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="TextBox3" runat="server" Font-Size="20px" Width="250px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Add Page" ValidationGroup="val3" ControlToValidate="TextBox3" ForeColor="Red">*</asp:RequiredFieldValidator>

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
                                <asp:Button ID="btn3" runat="server" Text="SUBMIT" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" ValidationGroup="val3" Height="40px" OnClick="btn3_Click" />
								
								   <asp:Button ID="btn31" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px"  Height="40px" OnClick="Cancel31_Click" />


                                <asp:ValidationSummary ID="vl3" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val3" />


                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

