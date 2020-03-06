<%@ Page Title="Admin-Panel" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-HomecontentEdit.aspx.cs" Inherits="admin_Admin_HomecontentEdit" %>

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
        
    <div class="cent_content" style="margin-top:-56px;" >
      <h1>Home Contents Edit</h1>
    <table width="70%" align="center">
          <tr><td align="right"><asp:Button ID="post" runat="server" Text="Back" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="30px" OnClick="post_Click"  /></td></tr>


 <tr>
            <td id="fr" runat="server" align="center" colspan="2" style="border: 1px solid;
    padding: 2px;
    box-shadow: 5px 10px 8px #888888;background-color: #E8F8F5 ;">

             
                        <table width="700px" align="center" >
                    <tr><td><br /></td></tr>
                    <tr>
                        <td align="left" width="20%"><asp:Label ID="lb" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label></td><td><asp:TextBox ID="txt1" runat="server" Font-Size="22px"  Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txt1" ErrorMessage="Add Title" ValidationGroup="val" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                                                                                         </td></tr>
                    <tr><td><br /></td></tr>

     <tr>
                     
                    <td><asp:Label ID="lb2" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td><asp:DropDownList ID="ddl" runat="server" Height="30px" Font-Size="22px"  Width="250px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                              <asp:ListItem Value="1">Bottom</asp:ListItem>
                             <asp:ListItem Value="2">Top</asp:ListItem>
                                                                                                     </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req3" runat="server" ValidationGroup="val" ControlToValidate="ddl" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                                                                </td></tr>

                    <tr><td>
                        <br />
                        </td></tr>


                         <tr id="sc" runat="server">
                     
                    <td><asp:Label ID="Label1" runat="server" Text="Sub-Category:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td><asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" Height="30px"  Width="250px" Font-Size="22px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                              <asp:ListItem Value="1">Child Protection</asp:ListItem>
                             <asp:ListItem Value="2">Adoption Child</asp:ListItem>
                         <asp:ListItem Value="3">Charity Actions</asp:ListItem>
                           <asp:ListItem Value="4">Support</asp:ListItem>
                        <asp:ListItem Value="5">How You Can Support Us</asp:ListItem>
                                                                                                     </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="DropDownList1"  ValidationGroup="val" ErrorMessage="Add Sub Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                                                                                                       </td></tr>
                      <tr><td>
                        <br />
                        </td></tr>


                            <tr id="im" runat="server">
                                                 <td><asp:Label ID="Label2" runat="server" Text="Image:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td>
                                                     
                                                    <asp:FileUpload ID="fd1" runat="server" /></td>
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
                     <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"  Width="500px" Height="300px" Font-Size="24px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ValidationGroup="ad" ErrorMessage="please add description" ForeColor="Red" ></asp:RequiredFieldValidator><br />
                </td>
             </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                    <tr><td align="center" colspan="2"><asp:Button ID="btnsub" runat="server" Text="Submit"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="btnsub_Click" ValidationGroup="val" />

                        <asp:Button ID="Button1" runat="server" Text="Cancel"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click"  />
                        <asp:ValidationSummary ID="vl" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
                        </td></tr>
                </table>
            
                
            </td>
        </tr>
            </table>
        </div>
</asp:Content>

