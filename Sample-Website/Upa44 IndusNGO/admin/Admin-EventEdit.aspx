<%@ Page Title="Admin-Events" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-EventEdit.aspx.cs" Inherits="admin_Admin_EventEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


     <script>
         function ValidateDropDown() {
             var cmbID = "<%=DropDownList1.ClientID %>";
    if (document.getElementById(cmbID).selectedIndex == 0) {
        alert("Please select a Value");
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


    <div class="cent_content" style="margin-top: -56px;">
        <h1>Events Edit</h1>

        <table align="center" width="70%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr>
                <td align="right">
       </td>
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
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" AppendDataBoundItems="true" Font-Size="20px" Width="150px" 
                                    >

                           <asp:ListItem Value="0">Select</asp:ListItem>
                                       <asp:ListItem Value="1">Special</asp:ListItem>
                             <asp:ListItem Value="2">Occasional</asp:ListItem>
                        <asp:ListItem Value="3">Festival</asp:ListItem>
                                    <asp:ListItem Value="4">Outing</asp:ListItem>
                                               <asp:ListItem Value="5">Upcoming</asp:ListItem>
                                </asp:DropDownList>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="val" ControlToValidate="DropDownList1" ErrorMessage="Please add Category" ForeColor="Red" InitialValue="0">*</asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ValidationGroup="val" ErrorMessage="please add description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnsub" runat="server" Text="Update" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" ValidationGroup="val" Height="40px" OnClick="btnsub_Click"  />

     <asp:Button ID="btnsub1" runat="server" Text="Cancel" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px"  Height="40px" OnClick="btnsub1_Click"  />
                                <asp:ValidationSummary ID="vl" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                            </td>
                        </tr>
                    </table>
                    

                    
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

