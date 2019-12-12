<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Principles.aspx.cs" Inherits="admin_Admin_Principles" MaintainScrollPositionOnPostback="true" ValidateRequest="false" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Indus Group : : Admin Control Panel : :</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

 <%--   <script type="text/javascript">

        $('#example2 .txtHtml').sundayMorningReset();
        $('#example2 .txtHtml').sundayMorningBubble({
            source: 'en',
            destination: 'fr'
        });
    </script>--%>

    <style type="text/css" >

.fontface 
{
font-family: AkrutiDevYoginiUnicode;
font-style: italic;
font-weight: normal;
src: url(AKRUTID0.eot); 
}

</style>
    <script type="text/javascript">

        function CompareDate(sender, args) {

            var fromdate = sender._selectedDate;
            var dd = fromdate.getDate();
            var mm = fromdate.getMonth() + 1; //January is 0!
            var yyyy = fromdate.getFullYear();
            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }

            var fromdate1 = new Date();
            fromdate1 = dd + '/' + mm + '/' + yyyy;

            //            //alert(fromdate1);

            var todate = new Date();
            var dd1 = todate.getDate();
            var mm1 = todate.getMonth() + 1; //January is 0!
            var yyyy1 = todate.getFullYear();
            if (dd1 < 10) {
                dd1 = '0' + dd1;
            }
            if (mm1 < 10) {
                mm1 = '0' + mm1;
            }
            var todate1 = new Date();
            todate1 = dd1 + '/' + mm1 + '/' + yyyy1;
            //alert(todate1);
            var oneDay = 24 * 60 * 60 * 1000;

            if ((fromdate1 != "") && (todate1 != "")) {

                //                var fdt1 = fromdate1.g;
                //                var tdt1 = todate1.getTime();

                if (fromdate1 < todate1) {
                    alert("You cannot schedule a day earlier than today!");
                    sender._selectedDate = new Date();
                    // set the date back to the current date
                    sender._textbox.set_Value(sender._selectedDate.format(sender._format));
                }

            }
        }




        function checkDate(sender, args) {

            if (sender._selectedDate < new Date()) {
                var date1 = sender._selectedDate.format(sender._format);

                var d = new Date(sender._format);
                alert(date1);
                alert(d);
                alert(sender._selectedDate);

                //            alert("You cannot select a day earlier than today!");
                alert("You can schedule  a day earlier than today!");

                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }

        }

        function SetHiddenVariable() {
            var d = new Date();
            var year = d.getFullYear();
            var month = d.getMonth() + 1;
            var date = d.getDate();
            var hours = d.getHours();
            var minutes = d.getMinutes();
            var seconds = d.getSeconds();
            var tt = d.format("tt");
            // var dt=d.toTimeString("hh:mm:ss tt");

            //var div=document.getElementById("div1"); 
            //              if (month.length ==1) {
            //                  month = '0' + month;
            //                  alert(month);
            //              }
            var hid1 = month + "/" + date + "/" + year + " " + hours + ":" + minutes + ":" + seconds;
            //var hid1=date + "/" + month + "/" + year + " " + dt;
            document.getElementById("<%# inpHide.ClientID %>").value = hid1;
         }
         FTB_FreeTextBox.prototype.CancelEvent = function (ev) {
             try {
                 ev.preventDefault();
                 ev.stopPropagation();
             }
             catch (e) {
                 if (FTB_Browser.isIE) {
                     ev.cancelBubble = true;
                     ev.returnValue = false;
                 }
             }
         };

    </script>

    <script type="text/javascript" src="tinymce3.5/jscripts/tiny_mce/tiny_mce.js"></script>

    <script type="text/javascript">
        tinyMCE.init({
            // General options

            //   content_css : "style.css",


            mode: "textareas",
            theme: "advanced",
            plugins: "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

            // Theme options
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,
            //relative_urls: true,
            relative_urls: false,
            remove_script_host: false,
            //  document_base_url : "http://indusemail.com/",

            // Skin options
            skin: "o2k7",
            skin_variant: "silver",

            // Example content CSS (should be your site CSS)
            //   content_css: "css/example.css,Emails/tinymce3.5/examples/lists/style.css",
            content_css: "css/example.css,tinymce3.5/examples/lists/style.css",



            // Drop lists for link/image/media/template dialogs
            //        template_external_list_url: "js/template_list.js",
            //        external_link_list_url: "js/link_list.js",
            //        external_image_list_url: "js/image_list.js",
            //        media_external_list_url: "js/media_list.js",


            template_external_list_url: "tinymce3.5/examples/lists/template_list.js",
            external_link_list_url: "tinymce3.5/examples/lists/link_list.js",
            external_image_list_url: "tinymce3.5/examples/lists/image_list.js",
            media_external_list_url: "tinymce3.5/examples/lists/media_list.js",

            // Replace values for the template plugin
            //        template_replace_values: {
            //            username: "Some User",
            //            staffid: "991234"
            //        }
        });
    </script>
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
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="tl" runat="server"></cc1:ToolkitScriptManager>
        <input id="inpHide" type="hidden" runat="server" />
        
        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
            <tr>
                <td valign="top" width="100%" class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td height="30px">
                    <hr />
                </td>
            </tr>

            <tr>
                <td align="center" width="80%">
                    <table align="center" width="80%">
                        <tr>
                            <td align="center" colspan="2">
                                <h3>Mandatory Principles</h3>
                            </td>
                        </tr>

                        <%-- <tr id="savefile" runat="server" visible="false">
                        <td colspan="2">
                            <table width="100%" style="font-size:14px;">
                             <tr>
                                 <td align ="right" style="padding-right:40px; width:30%; font-weight:bold; color:green;">
                                     Enter Saved File Name :
                                 </td>
                                 <td  align="left" Width="50%" >
                                      <asp:TextBox ID="txtsavefilename" runat="server"  Height="25px" Width="40%"  ></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="send1" ErrorMessage="Enter File Name"
                                         ForeColor="Red" ControlToValidate="txtsavefilename"></asp:RequiredFieldValidator>
                      
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="send1" 
                                       Font-Size="13px"  Height="26px" Width="70px" OnClick="Button1_Click" />
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btncancel" runat="server" Text="Cancel"  OnClick="btncancel_Click"
                                       Font-Size="13px"  Height="26px" Width="70px"/>
                                 </td>
                             </tr>
                         </table>
                        </td>
                    </tr> --%>

                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table width="100%" style="font-size: 14px;">
                                    <tr>
                                        <td align="right" style="padding-right: 40px; width: 30%; font-weight: bold;">Saved Files :
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:DropDownList ID="ddsaved" runat="server" Font-Size="13px" Height="26px" Width="250px"
                                                AutoPostBack="True" OnSelectedIndexChanged="ddsaved_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            &nbsp;&nbsp;&nbsp; 
                                            <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click"
                                                Font-Size="13px" Height="26px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <table width="100%" style="font-size: 14px;">
                                    <tr>
                                        <td align="right" style="padding-right: 40px; width: 30%; font-weight: bold;">Attach Your File :
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:FileUpload ID="TemplateUpload" runat="server"  /><%--&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfilename" runat="server" Visible="false"></asp:Label>&nbsp;&nbsp;--%>
                                            <%--<asp:ImageButton ID="addTemplate" runat="server" ImageUrl="images/Add Template.png" onclick="addTemplate_Click"  AlternateText="Add Template" ToolTip="Add Template"/>--%>&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="addTemplate" runat="server" Text="Add File" OnClick="addTemplate_Click"
                                                Font-Size="13px" Height="26px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <table width="100%" style="font-size: 14px;">
                                    <tr>
                                        <td align="right" style="padding-right: 40px; width: 30%; font-weight: bold;">Select Template :
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:DropDownList ID="Ddltemplate" runat="server" Font-Size="13px" Height="26px" Width="250px"
                                                AutoPostBack="True" OnSelectedIndexChanged="Ddltemplate_SelectedIndexChanged">
                                            </asp:DropDownList>

                                             &nbsp;&nbsp;&nbsp; 
                                            <asp:Button ID="btntemlatedel" runat="server" Text="Delete" OnClick="btntemlatedel_Click"
                                                Font-Size="13px" Height="26px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <table width="100%" style="font-size: 14px;">
                                    <tr>
                                        <td align="right" style="padding-right: 40px; width: 30%; font-weight: bold;">Enter Emails :
                                        </td>
                                        <td align="left" width="50%">
                                            <asp:TextBox ID="txtemails" runat="server" Width="350px" Height="30px" placeholder="Email separate with ,"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ttt" runat="server" ValidationGroup="send" ErrorMessage="Enter Email Id"
                                                ForeColor="Red" ControlToValidate="txtemails"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="20px"></td>
                        </tr>

                        <tr>
                            <td>
                                <table width="100%" style="font-size: 14px;">
                                    <tr>
                                        <td width="80%" align="center">
                                            <asp:TextBox ID="txtHtml" runat="server" TextMode="MultiLine" Height="550px" Width="80%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="send" ErrorMessage="Enter Description"
                                                ForeColor="Red" ControlToValidate="txtHtml"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <asp:Button ID="btnpreview" runat="server" Text="Preview"
                                    OnClick="btnpreview_Click" Width="80px" Height="28px" AlternateText="Preview" ToolTip="Preview" />

                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click1" Width="80px" Height="28px"
                                    AlternateText="Save" ToolTip="Save"></asp:Button>

                                <asp:Button ID="btnsubmit" runat="server" Text="Send" OnClick="btnsubmit_Click" Width="80px" Height="28px"
                                    AlternateText="Send" ToolTip="Send" ValidationGroup="send"></asp:Button>


                                <asp:Button ID="Button2" runat="server" Text="Send Later" OnClick="btnshedule_Click" Width="80px" Height="28px"
                                    AlternateText="Send Later" ToolTip="Send Later" ValidationGroup="send"></asp:Button>
                                <asp:Label ID="labschdate" runat="server" Font-Size="14px" Font-Bold="true" Font-Names="Arial" Text="" Visible="false"></asp:Label>

                            </td>
                        </tr>

                        <tr id="savefile" runat="server" visible="false">
                        <td colspan="2">
                            <table width="100%" style="font-size:14px;">
                             <tr>
                                 <td align ="right" style="padding-right:40px; width:30%; font-weight:bold; color:green;">
                                     Enter Saved File Name :
                                 </td>
                                 <td  align="left" Width="50%" >
                                      <asp:TextBox ID="txtsavefilename" runat="server"  Height="25px" Width="40%"  ></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="send1" ErrorMessage="Enter File Name"
                                         ForeColor="Red" ControlToValidate="txtsavefilename"></asp:RequiredFieldValidator>
                      
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="send1" 
                                       Font-Size="13px"  Height="26px" Width="70px" OnClick="Button1_Click" />
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btncancel" runat="server" Text="Cancel"  OnClick="btncancel_Click"
                                       Font-Size="13px"  Height="26px" Width="70px"/>
                                 </td>
                             </tr>
                         </table>
                        </td>
                    </tr> 

                        <tr id="tr2" runat="server">
                            <td colspan="2" id="tdpanelPreview" runat="server" align="center">
                                <asp:Button ID="Btnshow2" runat="server" Text="showpreview" Display="False" />

                                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Btnshow2" Y="40"
                                    PopupControlID="previewpanel" BackgroundCssClass="modalBackground" DropShadow="false">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="previewpanel" runat="server" Width="100%" Visible="false">

                                    <table bgcolor="gray" align="center" width="100%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label1" runat="server" Text="Preview of your Template" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>

                                            </td>
                                            <td align="right">
                                                <asp:ImageButton ID="ImageButton5" ImageUrl="images/clse.png" runat="server" OnClick="Btnclose_Click" AlternateText="Close" ToolTip="Close" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <iframe id="Iframe2" height="500" width="900px" runat="server" visible="false"></iframe>
                                                <br />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" align="center" width="95%">
                                                <table width="95%">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="FreeTextBox1" runat="server" TextMode="MultiLine" Width="100%" ReadOnly="true" Enabled="false"
                                                                Height="570px"></asp:TextBox>
                                                            <br />
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>

                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>


                        <tr>
                            <td colspan="2" align="center">
                                <br />
                                <br />

                                <asp:LinkButton ID="lnkResume" runat="server" OnClick="lnkResume_Click">
                               <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                Saved Files
                                </asp:LinkButton>
                            </td>
                        </tr>

                        <tr id="savefiles" runat="server" visible="false">
                            <td colspan="2" align="center">
                                <asp:DataList ID="dlSubFolderFiles" runat="server" Width="80%" RepeatColumns="2"
                                    AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <table width="100%" border="0" class="labled">
                                            <tr>
                                                <td align="left">
                                                    <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("sId") %>' OnCommand="lnkBtnDownload_Command"
                                                        Font-Size="16px" CommandName="save" ForeColor="Black">
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("filename")%>'></asp:Label>
                                                    </asp:LinkButton>
                                                    &nbsp;&nbsp;                                           
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <%--<asp:Button ID="btnshowsch" runat="server" Text="schoeschedule" Display="False" />--%>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Button2"
                                    PopupControlID="pnllist" BackgroundCssClass="modalBackground" DropShadow="false">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="pnllist" runat="server" BackColor="Gray" Height="370px" Width="780px" Visible="false" Style="padding-top: 20px;">
                                    <table bgcolor="White" align="center" width="740px" style="height: 330px;" valign="middle">
                                        <tr>
                                            <td align="center" colspan="2" align="center">
                                                <asp:Label ID="Label2" runat="server" Text="Schedule your Email Time" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 42%; padding-right: 10px;" align="right">Select Date :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtschduleemail" runat="server" Text="Select Date" ToolTip="Select Date"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupPosition="BottomLeft"
                                                    TargetControlID="txtschduleemail" OnClientDateSelectionChanged="CompareDate">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="rfvtxtschduleemail" runat="server" ErrorMessage="Please select date for schedule email"
                                                    InitialValue="Select Date" ControlToValidate="txtschduleemail" Display="Dynamic" ValidationGroup="vgsch">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvtxtSchedule" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtschduleemail"
                                                    ErrorMessage="Date format in (MM/dd/yyyy)" ValidationGroup="vgsch"></asp:CompareValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding-right: 10px;" align="right">Select Time :
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlHours" ToolTip="Hours">
                                                </asp:DropDownList>
                                                :  
                                             <asp:DropDownList runat="server" ID="ddlMins" ToolTip="Minutes">
                                             </asp:DropDownList>
                                                &nbsp;<asp:Label ID="Label3" runat="server" Text="HH:mm(24 Hours format)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 10px;" align="right">Select Time zone :
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddltimezone">
                                                    <asp:ListItem Text="Select a TimeZone" />
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select Time Zone"
                                                    InitialValue="Select a TimeZone" ControlToValidate="ddltimezone" Display="Dynamic" ValidationGroup="vgsch">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Button ID="imgscheduleok" runat="server" ValidationGroup="vgsch" Text="Schedule"
                                                    OnClick="imgscheduleok_Click" Width="67px" Height="23px" AlternateText="Schedule" ToolTip="Schedule" />
                                                &nbsp;&nbsp;
                            <asp:Button ID="imgcancel" runat="server" Text="Cancel"
                                Width="57px" Height="23px" AlternateText="Cancel"
                                OnClick="imgcancel_Click" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>

                        <%--  <tr >
                        <td colspan="2">
                        <asp:Button ID="btnshowsch" runat="server" Text="schoeschedule" Display="False" />
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" 
                             PopupControlID="Panel1"       BackgroundCssClass="modalBackground"  DropShadow="false"></cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" BackColor="Gray" Height="370px" Width="780px" Visible="false" style="padding-top:20px;" >
                                  <table bgcolor="White" align="center" width="740px" style="height: 330px;" valign="middle" >
                            <tr>
                            <td align="center" colspan="2"  align="center" >
                                <asp:Label ID="Label4" runat="server" Text="Schedule your Email Time" Font-Size="Medium" ForeColor="#006699" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Overline="False"></asp:Label>
    
                            </td>
                            </tr>
                            <tr>
                                 <td align ="right" style="padding-right:40px; width:30%; font-weight:bold; color:green;">
                                     Enter Saved File Name :
                                 </td>
                                 <td  align="left" Width="50%" >
                                      <asp:TextBox ID="txtsavefilename" runat="server"  Height="25px" Width="40%"  ></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="send1" ErrorMessage="Enter File Name"
                                         ForeColor="Red" ControlToValidate="txtsavefilename"></asp:RequiredFieldValidator>
                      
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="send1" 
                                       Font-Size="13px"  Height="26px" Width="70px" OnClick="Button1_Click" />
                                   &nbsp;&nbsp;&nbsp; <asp:Button ID="btncancel" runat="server" Text="Cancel"  OnClick="btncancel_Click"
                                       Font-Size="13px"  Height="26px" Width="70px"/>
                                 </td>
                             </tr>
                            </table>     
                            </asp:Panel>
                        </td>
                   </tr>--%>



<%--                                 <asp:DataList ID="DataList1" runat="server" Width="80%" RepeatColumns="2"
                                    AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <table width="100%" border="0" class="labled">
                                            <tr>
                                                <td align="left">
                                             
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>' CssClass="fontface"></asp:Label>
                                                    &nbsp;&nbsp;                                           
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>--%>
                    </table>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
