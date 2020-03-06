<%@ Page Title="Admin-Events" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Events.aspx.cs" Inherits="admin_Admin_Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script>


        $('#FileUpload1').change(
                        function () {
                            var fileExtension = ['jpeg', 'jpg', 'png'];
                            if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                                alert("Only '.jpeg','.jpg','.png' formats are allowed.");
                                return false;
                            }
                        });

    </script>


    <script>
function ValidateDropDown() {
    var cmbID = "<%=DropDownList1.ClientID %>";
    if (document.getElementById(cmbID).selectedIndex == 0) {
        alert("Please select a Category");
        return false;
    }
    return true;
}
    </script>

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

       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="cent_content" style="margin-top: -56px;">
        <h1>Events</h1>

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
            <tr>
                <td  id="fr23" width="100%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True" 
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="eid" Width="100%" AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDeleting="gv_RowDeleting" >
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblarea" runat="server" Text="ID" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("eid") %>' ToolTip="URL" Font-Size="20px"></asp:Label>
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
                                    <asp:Label ID="lblcate1" runat="server" Text='<%#Eval("category") %>' Font-Size="20px"></asp:Label>
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
                                    <asp:Label ID="lblcontent1" runat="server" Text='<%#Eval("content") %>' Font-Size="20px"></asp:Label>
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

                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="30px" FooterStyle-Width="30px">
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
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandArgument='<%# Eval("eid") %>' CommandName="edit"
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="30px" FooterStyle-Width="30px">
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
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("eid") %>'
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
                                <asp:TextBox ID="txt1" runat="server" Font-Size="20px"  Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req" runat="server" ValidationGroup="val" ControlToValidate="txt1" ErrorMessage="Please add title" ForeColor="Red">*</asp:RequiredFieldValidator>


                            </td>
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
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" Height="30px" Font-Size="20px" Width="150px" 
                                    >

                           <asp:ListItem Value="0">Select</asp:ListItem>
                                       <asp:ListItem Value="1">Special</asp:ListItem>
                             <asp:ListItem Value="2">Occasional</asp:ListItem>
                        <asp:ListItem Value="3">Festival</asp:ListItem>
                                    <asp:ListItem Value="4">Outing</asp:ListItem>
                                               <asp:ListItem Value="5">Upcoming</asp:ListItem>
                                </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="val" ControlToValidate="DropDownList1" ErrorMessage="Select Category" InitialValue="0" ForeColor="Red">*</asp:RequiredFieldValidator>


                            </td>
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
                                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7"

                     runat="server" ControlToValidate="FileUpload1"

                     ErrorMessage=".jpg,.jpeg,png  formats are allowed." ForeColor="Red"

                   
                  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$"

                     ValidationGroup="val" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="req2" runat="server" ValidationGroup="val" ErrorMessage="Please select Image" ControlToValidate="FileUpload1" ForeColor="Red">*</asp:RequiredFieldValidator>



                            </td>

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
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"  Width="500px" Height="300px" Font-Size="22px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ValidationGroup="val" ErrorMessage="please add description" ForeColor="Red">*</asp:RequiredFieldValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnsub" runat="server" Text="Submit" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" ValidationGroup="val" Height="40px" OnClick="btnsub_Click"  />
								
								<asp:Button ID="btnsub1" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px"  Height="40px" OnClick="cancel_Click"  />


                                <asp:ValidationSummary ID="vl" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
                            </td>
                        </tr>
                    </table>
                    

                    
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

