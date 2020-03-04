<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-VisaData.aspx.cs" Inherits="Admin_VisaData" %>

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

    <table width="80%" align="center">
        <tr>
            <td colspan="2" align="center">
               <h2>Visa Details</h2>
            </td>
        </tr>
         <tr>
             <td align="right">
                     <asp:Button ID="Button3" runat="server" Text="Post" Height="40px"  Font-Size="24px" Width="70px" OnClick="Button3_Click"  />
             </td>
         </tr>
<tr id="gid" runat="server">
    <td align="center" width="50%">

    
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True" 
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="vid" Width="100%" AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDataBound="gv_RowDataBound" OnRowDeleting="gv_RowDeleting"   >
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
                                                <asp:Label ID="lbltitle" runat="server" Text="Place" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltitle1" runat="server" Text='<%#Eval("placename") %>' Font-Size="20px"></asp:Label>
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
                                    <asp:LinkButton ID="lnkmore" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandName="status"   CommandArgument='<%# Eval("vid") %>' 
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
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandName="edit" CommandArgument='<%# Eval("vid") %>' 
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
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("vid") %>' CommandName="delete"
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
            <td><br /></td>
        </tr>
        <tr id="dl" runat="server" >
            <td  width="50%" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                <table  >
                    <tr>
                        <td >
                <asp:Label ID="lb" runat="server" ForeColor="Blue" Text="Place Name :" Font-Size="22px"></asp:Label>

            </td>
            <td align="left">
                <asp:DropDownList ID="ddl"  runat="server" Font-Size="22px" AppendDataBoundItems="true" Width="300px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="1">USA</asp:ListItem>
                    <asp:ListItem Value="2">Australia</asp:ListItem>
                         <asp:ListItem Value="3">UK</asp:ListItem>
                         <asp:ListItem Value="4">UAE</asp:ListItem>
                     <asp:ListItem Value="5">China</asp:ListItem>
                     <asp:ListItem Value="6">Malyasia</asp:ListItem>
                      <asp:ListItem Value="7">Singapore</asp:ListItem>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl"  ValidationGroup="val1" ErrorMessage="Add Place" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>

                       <tr>
                           <td>
                       
                            <asp:Label ID="Label6" runat="server" Text="Address :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt1" runat="server" TextMode="MultiLine" Font-Size="24px" Width="300px" Height="100px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt1"  ValidationGroup="val1" ErrorMessage="Add Contact Details" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                       </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                       <tr>
                           <td>
                       
                            <asp:Label ID="Label1" runat="server" Text="General Requirement :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt2" runat="server" TextMode="MultiLine" Font-Size="24px" Width="300px" Height="100px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2"  ValidationGroup="val1" ErrorMessage="Add General Requirements" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                       </tr>
                    <tr>
                        <td>
                            <br />

                        </td>
                    </tr>
                    <tr>
                        <td>
                       
                            <asp:Label ID="Label2" runat="server" Text="Business Details :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt3" runat="server" TextMode="MultiLine" Font-Size="24px" Width="300px" Height="100px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt3"  ValidationGroup="val1" ErrorMessage="Add Business Requirements" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                 
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                          <td>
                       
                            <asp:Label ID="Label3" runat="server" Text="Tourist Details :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt4" runat="server" TextMode="MultiLine" Font-Size="24px" Width="300px" Height="100px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt4"  ValidationGroup="val1" ErrorMessage="Add Tourist Requirements" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                             <asp:Button ID="Button2" runat="server" Text="Submit" BackColor="#0b2e82" ValidationGroup="val1" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click"  />
                            <asp:ValidationSummary ID="val" runat="server" ValidationGroup="val1"  ForeColor="White" Width="100px" ShowMessageBox="true" ShowSummary="false" Font-Size="20px" Height="40px" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <br />
                            <br />
                        </td>
                       
                    </tr>

                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />

</asp:Content>

