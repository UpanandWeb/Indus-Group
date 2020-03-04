<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-PostJob.aspx.cs" Inherits="Admin_PostJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <br />

    <table align="center"  style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;" >

        <tr>
            <td align="center" colspan="2">
                   <h2>Add  Job</h2>
            </td>
        </tr>
            

                  <%--  <tr id="dl" runat="server">
                        <td align="center" colspan="2">
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="Add Contents" Checked="true" AutoPostBack="true" Font-Size="20px" ValidationGroup="vw" OnCheckedChanged="RadioButton1_CheckedChanged" />
                            &nbsp;&nbsp;
                            <asp:RadioButton ID="RadioButton2" runat="server" Font-Size="20px" Text="Add Tour City" ValidationGroup="vw" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true" /></td>
                    </tr>--%>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Designation :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                           <asp:TextBox ID="txt1" runat="server" Width="200px"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1"  ValidationGroup="val" ErrorMessage="Add Designation" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr id="tr1" runat="server">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Experience :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Fresher</asp:ListItem>
                                <asp:ListItem Value="2">0-1</asp:ListItem>
                                <asp:ListItem Value="3">1-2</asp:ListItem>
                                <asp:ListItem Value="4">1-3</asp:ListItem>
                                <asp:ListItem Value="5">1-4</asp:ListItem>
                                <asp:ListItem Value="6"> 1-5</asp:ListItem>
                              
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Experience" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                     <tr id="subtitle" runat="server">
                       
                            <td>
                            <asp:Label ID="Label5" runat="server" Text="Job Type :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Contractual</asp:ListItem>
                                <asp:ListItem Value="2">Permanent</asp:ListItem>
                              
                              <%--  <asp:ListItem Value="9">Thailand</asp:ListItem>
                                <asp:ListItem Value="10">Dubai</asp:ListItem>
                                <asp:ListItem Value="11">Malaysia</asp:ListItem>
                                <asp:ListItem Value="12">Russia</asp:ListItem>--%>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList4" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Job Type" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>

                       
                    </tr>

                    <tr>
                        <td>
                           <br />
                        </td>
                    </tr>
                 
                     <tr id="pkg" runat="server" >
                        <td>
                       
                            <asp:Label ID="Label6" runat="server" Text="Job Description :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Font-Size="24px" Width="500px" Height="200px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2"  ValidationGroup="val" ErrorMessage="Add Description" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />

                        </td>
                    </tr>

                     <tr id="Tr2" runat="server">
                       
                            <td>
                            <asp:Label ID="Label2" runat="server" Text="Location :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Hyderabad</asp:ListItem>
                                <asp:ListItem Value="2">Vijaywada</asp:ListItem>
                              
                              <%--  <asp:ListItem Value="9">Thailand</asp:ListItem>
                                <asp:ListItem Value="10">Dubai</asp:ListItem>
                                <asp:ListItem Value="11">Malaysia</asp:ListItem>
                                <asp:ListItem Value="12">Russia</asp:ListItem>--%>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Location" ForeColor="Red">*</asp:RequiredFieldValidator>

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

                               <asp:Button ID="Button2" runat="server" Text="Update" BackColor="#0b2e82" ValidationGroup="val" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" Visible="false" OnClick="Button2_Click"  />

                            <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                        </td>
                    </tr>
                       </table>
    <br />
    <br />
    <br />
   
</asp:Content>

