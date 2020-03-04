<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-holidaypackages.aspx.cs" Inherits="admin_Admin_specialoffers" %>

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

    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
            <script type="text/javascript">
                function SessionExpireAlert(timeout) {
                    var seconds = timeout / 1000;
                    document.getElementsByName("secondsIdle").innerHTML = seconds;
                    document.getElementsByName("seconds").innerHTML = seconds;
                    setInterval(function () {
                        seconds--;
                        document.getElementById("seconds").innerHTML = seconds;
                        document.getElementById("secondsIdle").innerHTML = seconds;
                    }, 1000);
                    setTimeout(function () {
                        //Show Popup before 20 seconds of timeout.
                        $find("mpeTimeout").show();
                    }, timeout + 1 * 1000);
                    setTimeout(function () {
                        window.location = "Default.aspx";
                    }, timeout);
                };
                function ResetSession() {
                    //Redirect to refresh Session.
                    window.location = window.location.href;
                }
            </script>    
           
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="80%">
        <h2 align="center" id="td1" runat="server" style="color:#096aac">Holiday Package Details</h2>
      <tr id="rdsec" runat="server">
                    <td align="right">
                        <asp:Button ID="Button3" runat="server" Text="Post" Height="40px"  Font-Size="24px" Width="70px" OnClick="Button3_Click"/>         
                    </td>
                </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
            <tr>
                    <td id="fr23" width="100%" runat="server" align="center" style="box-shadow: 5px 10px 8px #888888; border: 1px solid; padding: 2px; background-color: #E8F8F5;">
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" OnRowCommand="gv_RowCommand" OnRowDeleting="gv_RowDeleting"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="id" Width="100%" AllowPaging="True" ForeColor="#333333" >
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" />
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
                                                <asp:Label ID="lblid" runat="server" Text= '<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
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
                                    <asp:Label ID="lblcate1" runat="server" Text='<%#Eval("place") %>' Font-Size="20px"></asp:Label>
                                   <%-- <asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
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
                               <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbldatest" runat="server" Text="Status" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <%--    <asp:Label ID="lbldate1st1" runat="server" Text=c Font-Size="20px"></asp:Label>--%>
                                    <asp:LinkButton ID="lnkmore" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandName="status"   CommandArgument='<%# Eval("id") %>' 
                                                               ></asp:LinkButton>
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
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandName="edit" CommandArgument='<%# Eval("id") %>' 
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
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("id") %>' CommandName="delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" ></asp:ImageButton>
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
            <td id="frimg" runat="server" width="50%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                <table >
                  

                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server" Font-Size="20px" AppendDataBoundItems="true" AutoPostBack="true" Width="250px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="2">Domestic Tours</asp:ListItem>
                                <asp:ListItem Value="3">International Tours</asp:ListItem>
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
                            <asp:Label ID="lblpkg" runat="server" Text="Package Type :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlpackage" runat="server" Font-Size="20px" AppendDataBoundItems="true" AutoPostBack="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Honeymoon Package</asp:ListItem>
                                <asp:ListItem Value="2">Family Package</asp:ListItem>
                                <asp:ListItem Value="3">Tourist Package</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList3" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr id="tr1" runat="server">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Sub-Category :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <%--<asp:ListItem Value="1">Kulumanali</asp:ListItem>
                                <asp:ListItem Value="2">Agra</asp:ListItem>
                                <asp:ListItem Value="3">Kerala</asp:ListItem>
                                <asp:ListItem Value="4">Gujarath</asp:ListItem>
                                <asp:ListItem Value="5">Ooty</asp:ListItem>
                                <asp:ListItem Value="6"> Goa</asp:ListItem>
                                <asp:ListItem Value="7">Singapore</asp:ListItem>
                                <asp:ListItem Value="8">Australia</asp:ListItem>
                                <asp:ListItem Value="9">Thailand</asp:ListItem>
                                <asp:ListItem Value="10">Dubai</asp:ListItem>
                                <asp:ListItem Value="11">Malaysia</asp:ListItem>
                                <asp:ListItem Value="12">Russia</asp:ListItem>--%>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Sub Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                     <tr id="subtitle" runat="server">
                       
                            <td>
                            <asp:Label ID="Label5" runat="server" Text="Sub-Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">8 Nights 9 Days Trip</asp:ListItem>
                                <asp:ListItem Value="2">2 Nights 3 Days Trip</asp:ListItem>
                                <asp:ListItem Value="3">6 Nights 7 Days Trip</asp:ListItem>
                          
                                <asp:ListItem Value="5">4 Nights 5 Days Trip</asp:ListItem>
                                <asp:ListItem Value="6">9 Nights 10 Days Trip</asp:ListItem>
                                <asp:ListItem Value="7">4 Nights 5 Days Trip</asp:ListItem>
                         
                              <%--  <asp:ListItem Value="9">Thailand</asp:ListItem>
                                <asp:ListItem Value="10">Dubai</asp:ListItem>
                                <asp:ListItem Value="11">Malaysia</asp:ListItem>
                                <asp:ListItem Value="12">Russia</asp:ListItem>--%>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList4" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Sub Title" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>

                       
                    </tr>

                    <tr>
                        <td>
                           <br />
                        </td>
                    </tr>
                 
                     <tr id="pkg" runat="server" >
                        <td>
                       
                            <asp:Label ID="Label6" runat="server" Text="Package Charges :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Font-Size="24px" Width="500px" Height="200px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2"  ValidationGroup="val" ErrorMessage="Add Tariff" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />

                        </td>
                    </tr>

                    <tr id="tr2" runat="server">
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Upload Image :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="fd1" runat="server" />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fd1"  ValidationGroup="val" ErrorMessage="Add Image" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
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
                    <tr id="tr3" runat="server">
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Content :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt4" runat="server" TextMode="MultiLine" Font-Size="24px" Width="500px" Height="300px"></asp:TextBox>

                            <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fd1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Image" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
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

                       <asp:Button ID="btncancel" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btncancel_Click"   />


                            <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                        </td>
                    </tr>
                       </table>
                </td>
            </tr>
                        </table>
    <br />
    <br />
    <br />
    <br />
</asp:Content>

