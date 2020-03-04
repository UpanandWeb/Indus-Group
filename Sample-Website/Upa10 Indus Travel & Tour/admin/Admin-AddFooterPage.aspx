<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-AddFooterPage.aspx.cs" Inherits="admin_ADmin_AddFooterPage" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%" align="center">
        <tr>
            <td align="center"  width="100%"  colspan="2">
                <h2>Add Footer Page Data</h2>

                <br />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table align="center">
                    <tr>
                         <td width="50%" align="right">
                <asp:Label ID="Label3" runat="server" Text="Select Page :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddpage" runat="server" Font-Size="24px" Width="302px" OnSelectedIndexChanged="ddpage_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="1">Advertise</asp:ListItem>
                    <asp:ListItem Value="2">Airlines Numbers</asp:ListItem>
                    <asp:ListItem Value="3">Currency</asp:ListItem>
                    <asp:ListItem Value="4">FAQ</asp:ListItem>
                    <asp:ListItem Value="5">Privacy Policy</asp:ListItem>
                    <asp:ListItem Value="6">Route Map</asp:ListItem>
                    <asp:ListItem Value="7">Site Map </asp:ListItem>
                    <asp:ListItem Value="8">Terms & Conditions  </asp:ListItem>
                    <asp:ListItem Value="9">Time Zones</asp:ListItem>
                    <asp:ListItem Value="10">Travel Insurance  </asp:ListItem>
                    <asp:ListItem Value="11">Weather</asp:ListItem>
                    <asp:ListItem Value="12">Weight Conversion</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddpage" InitialValue="0" ValidationGroup="val1" ErrorMessage="Select Page" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr id="tr1" runat="server">
                        <td width="50%" align="right">
                <asp:Label ID="Label2" runat="server" Text="Add airline name :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>

                        <td>
                               <asp:TextBox ID="txttitle" runat="server" Font-Size="24px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txttitle" ValidationGroup="val1" ErrorMessage="Add Airline" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr id="tr2" runat="server">
                        <td width="50%" align="right">
                <asp:Label ID="Label5" runat="server" Text="Add airline Number :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>

                        <td>
                               <asp:TextBox ID="TextBox1" runat="server" Font-Size="24px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="val1" ErrorMessage="Add Airlinenumber" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>

        <tr>
            <td>
                <br />
            </td>
        </tr>
       <%-- <tr>
            <td width="50%" align="right">
                <asp:Label ID="Label6" runat="server" Text="Title :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttitle" runat="server" Font-Size="24px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txttitle" ValidationGroup="val1" ErrorMessage="Add Title" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>--%>

        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr id="tr3" runat="server">
            <td align="right">
                <asp:Label ID="Label4" runat="server" Text="Description :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtdis" runat="server" Font-Size="24px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdis" ValidationGroup="val1" ErrorMessage="Add Description" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="Upload Image :" ForeColor="Blue" Font-Size="22px"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button2" runat="server" Text="Submit" BackColor="#0b2e82" ValidationGroup="val1" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="val1" ShowMessageBox="true" ShowSummary="false" runat="server" />
            </td>
                    </tr>
                </table>
            </td>

           
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

