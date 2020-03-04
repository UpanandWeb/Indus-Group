<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-VisaEdit.aspx.cs" Inherits="admin_Admin_VisaEdit" %>

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


    <table width="80%" align="center">
        <tr>
            <td align="center">
                <h1>Edit Visa</h1>
            </td>
        </tr>
 <tr id="dl" runat="server" >
            <td  width="50%" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                <table  align="center" >
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
                     <asp:ListItem Value="6">Malaysia</asp:ListItem>
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
                             <asp:Button ID="Button2" runat="server" Text="Update" BackColor="#0b2e82" ValidationGroup="val1" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click"  />&nbsp;&nbsp;
                              <asp:Button ID="Button1" runat="server" Text="Cancel" BackColor="#0b2e82"  ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click"  />
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
                 <br />
                            <br />
    </table>
<br />
    <br />
</asp:Content>

