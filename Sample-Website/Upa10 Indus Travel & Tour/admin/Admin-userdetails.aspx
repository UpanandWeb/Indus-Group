<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-userdetails.aspx.cs" Inherits="admin_Admin_userdetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- <script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
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

    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

     <table width="80%" align="center" style="border: 1px solid; padding:2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">

            <tr>
            <td align="center" colspan="2">
                   <h2>Add  User Details</h2>
            </td>
        </tr>
                      <tr>
                          <td style="padding-left:10px;">
                              <asp:Panel ID="pnledit1" runat="server">
                                 <table>
                                      <br />
                                      <tr>
                                           <td colspan="3" style="padding-left:160px;" >
                                                <table width="100%">
                                                    <tr>
                        <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblfirstname"  runat="server" Text="First Name" Font-Size="24px"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                        
                        </td>
                     <td align="left" width="210px">
                      <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Please Enter Your Firstname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                     
                     </td>
                     <td align="right" width="210px"> 
                     <asp:Label ID="lbllname"  runat="server" Text="Last Name" Font-Size="24px"></asp:Label>
                     </td>
                     <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px">
                      <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredLname" runat="server" ControlToValidate="txtlname" ErrorMessage="Please Enter Your Lastname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>

                      </td>
                      </tr>

                       <tr>
                       <td align="right" width="210px">
                         <asp:Label ID="lbldesignation"  runat="server" Text="Designation" Font-Size="24px"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                         <td align="left" width="210px">
                      <asp:DropDownList ID="ddldesig" runat="server" Width="170px">
                     <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Web Admin</asp:ListItem>
                    <asp:ListItem>Developer</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="requireddesignation" runat="server" ControlToValidate="ddldesig" ErrorMessage="Please Enter Your designation" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>

                     </td>

                      <td align="right" width="210px">
                         <asp:Label ID="lblEmail"  runat="server" Text="Email Id" Font-Size="24px"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                       <td align="left" width="210px">
                      <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Enter Your EamilId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>

                                                    <tr>
                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblloginid"  runat="server" Text="LoginId" Font-Size="22px"></asp:Label>
                         </td> 
                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px" >
                      <asp:TextBox ID="txtloginid" runat="server" OnTextChanged="txtedloginid_TextChanged" AutoPostBack="true"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredUserId" runat="server" ControlToValidate="txtloginid" ErrorMessage="Please Enter Your UserId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      
                     
                      </td>
                       <td align="right" width="210px">
                         <asp:Label ID="lblpassword"  runat="server" Text="Password" Font-Size="24px"></asp:Label>
                       </td>
                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px">
                      <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredpwd" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Enter  Password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                      </tr>

                                                    <tr>
                            <td colspan="5">
                                <br /> <asp:Label ID="lblstatus" runat="server"></asp:Label>
                            </td>
                        </tr>

                                                    <tr>

                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblcnfpwd"  runat="server" Text="ConfirmPassword" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtcnfpwd" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredcnfpwd" runat="server" ControlToValidate="txtcnfpwd" ErrorMessage="Please Enter confirm password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="comaparepasswd" runat="server" ControlToValidate="txtcnfpwd" ControlToCompare="txtpassword" ErrorMessage="Invalid Password" ValidationGroup="userform" ForeColor="red">*</asp:CompareValidator>
                         </td>

                         <td align="right" width="210px">
                         <asp:Label ID="lbladdress"  runat="server" Text="Address" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Requiredaddress1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Please Enter your Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                      </tr>

                      <tr>
                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lbladdress1"  runat="server" Text="Address2" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtaddress1" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredAddress2" runat="server" ControlToValidate="txtaddress1" ErrorMessage="Please Enter your Second Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                         <td align="right" width="210px">
                         <asp:Label ID="lblmobile"  runat="server" Text="Mobile" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredMobile" runat="server" ControlToValidate="txtmobile" ErrorMessage="Please Enter your Mobile Number" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "txtmobile" 
                   ID="Regularmobile" ValidationExpression = "^[\s\S]{10,}$" runat="server" 
                   ErrorMessage="Minimum 10 digits required for Mobile." ValidationGroup="userform" ForeColor="red">*</asp:RegularExpressionValidator>
                        </td>

                      </tr>

                      <tr>

                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblcontact"  runat="server" Text="Contact" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredContact" runat="server" ControlToValidate="txtcontact" ErrorMessage="Please Enter your contact number" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "txtcontact" 
                         ID="RegularExpcontact" ValidationExpression = "^[\s\S]{10,}$" runat="server" 
                         ErrorMessage="Minimum 10 digits required for contacts." ValidationGroup="userform" ForeColor="red">*</asp:RegularExpressionValidator>
                        </td>
                          <td align="right" width="210px">
                         <asp:Label ID="Label1"  runat="server" Text="Country" Font-Size="24px"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcountry" ErrorMessage="Please Enter your Country Name" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>

                      <td width="210px"></td>
                      <td width="40px"></td>
                      <td width="210px"></td>

                      </tr>
                                               </table>
                                           </td>
                                     </tr>

                                     <tr>
                                        <td height="20px" colspan="3"></td>
                                     </tr>
                                     </table>
                                       </asp:Panel>
                               <div align="center">
                                             <asp:Button ID="Button2" runat="server" Text="Submit" onclick="btnsave_Click" ValidationGroup="userform" Font-Size="22px" />
                                             <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click1"  Font-Size="22px" Visible="false" />

                                   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="userform"/>
                                                  <asp:Button ID="Button3" runat="server" Text="Cancel" OnClick="Button1_Click" Font-Size="22px"/>

                                               </div>
                              <br />
                         </td>
                         
                      </tr>
                  </table>
    <br />
    <br />
    <br />
   
</asp:Content>