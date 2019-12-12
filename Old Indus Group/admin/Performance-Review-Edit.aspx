<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Performance-Review-Edit.aspx.cs" Inherits="admin_Performance_Review_Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Review</title>
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
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <style type="text/css">
        .mesure {
            line-height: 30px;
        }

        .hrow {
            font-weight: bold;
            color: #C1E97C;
        }

            .hrow td {
                padding-top: 20px;
                width: 140px;
            }
    </style>
    <script type="text/javascript">
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }
    </script>
</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
         <table width="90%" align="center">
             <tr>
                 <td>
                      <uc1:TopMenu ID="Topmenu1" runat="server" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <br /><br />
                 </td>
             </tr>
            <tr>
                <td>
                     <table width="100%" align="center">
                        <tr>
                             <td align="center">
                                 <asp:Label ID="lblTitle" runat="server" Text="Employees Performance" Font-Size="26px"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td>
                                 <br /><br />
                             </td>
                         </tr>
                        <tr>
                            <td align="center" width="100%" >
                                  <table width="100%" align="center">
                                        <tr>
                                             <td align="center" width="100%" align="center">
                                                 <table width="90%" align="center">
                                                     <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblname" runat="server" Text="Employee Name" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtname" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtname"
                                                                   ErrorMessage="Provide a Employee Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                     <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbljoin" runat="server" Text="Joining Date" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtcal" runat="server" Width="250px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="calender" runat="server" TargetControlID="txtcal"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtcal"
                                                ErrorMessage="Provide a Joining Date" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                          <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbldisg" runat="server" Text="Designation " Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:DropDownList ID="dddign" runat="server" Width="253px">
                                                                 <asp:ListItem>Select</asp:ListItem>
                                                                 <asp:ListItem>SEO</asp:ListItem>
                                                                 <asp:ListItem>Content Writer</asp:ListItem>
                                                                 <asp:ListItem>Dotnet Developer</asp:ListItem>
                                                                 <asp:ListItem>Web Designer</asp:ListItem>
                                                                 <asp:ListItem>Tester</asp:ListItem>
                                                                 <asp:ListItem>US It Recruiter</asp:ListItem>
                                                                 <asp:ListItem>US Admin</asp:ListItem>
                                                                 <asp:ListItem>IND Recruiter</asp:ListItem>
                                                                 <asp:ListItem>Accounts</asp:ListItem>
                                                             </asp:DropDownList>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="dddign" InitialValue="Select"
                                                ErrorMessage="Select Designation" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblemail" runat="server" Text="Email ID" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtemail" runat="server" Width="250px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtemail" 
                                                            ErrorMessage="Provide a valid email address" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail"
                                                                ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm">*</asp:RegularExpressionValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblmobile" runat="server" Text="Mobile Number" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtmobile" runat="server" Width="250px" onkeypress="return onlyNos(event,this);" MaxLength="10"></asp:TextBox>
                                                              <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtmobile"
                                                            ErrorMessage="Provide a Phone number" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"
                                                            ErrorMessage="Enter Max 10 digits number" Display="dynamic" ValidationExpression="^[0-9]{10}$" ValidationGroup="RegForm">*</asp:RegularExpressionValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                     <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbladd" runat="server" Text="Communication Address" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtaddress" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator30" runat="server" ControlToValidate="txtaddress"
                                                               ErrorMessage="Provide a Phone number" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp1" runat="server" Text="Project 1" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp1" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtp1" 
                                                               ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr  >
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl1dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                           &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp1f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="txtp1fcal" runat="server" TargetControlID="txtp1f" ></cc1:CalendarExtender>

                                                           &nbsp; To    &nbsp;<asp:TextBox ID="txtp1t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="txtp1tcal" runat="server" TargetControlID="txtp1t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtp1f" 
                                                                 ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="txtp1t" 
                                                               ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr>
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp1dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp1dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtp1dis" 
                                                              ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             &nbsp;&nbsp;&nbsp;
                                                                <asp:LinkButton ID="lnkmore1" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore1_Click"></asp:LinkButton>

                                                         </td>
                                                          <%--<td valign="bottom" align="left" width="5%">--%>
                                                          <%--</td>--%>
                                                     </tr>

                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p2" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp2" runat="server" Text="Project 2" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td>
                                                             <asp:TextBox ID="txtp2" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="txtp2" 
                                                               ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p21" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl2dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                               &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp2f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtp2f" ></cc1:CalendarExtender>

                                                                &nbsp; To    &nbsp;<asp:TextBox ID="txtp2t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtp2t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="txtp2f" 
                                                           ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator11" runat="server" ControlToValidate="txtp2t" 
                                                            ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p22" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl2dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txt2dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="txt2dis" 
                                                                     ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                       <%--  </td>
                                                          <td valign="bottom">--%>
                                                             &nbsp;&nbsp;&nbsp;
                                                                <asp:LinkButton ID="lnkmore2" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore2_Click" ></asp:LinkButton>
                                                         <%-- </td>
                                                            <td valign="bottom">--%>
                                                             &nbsp;&nbsp;&nbsp;
                                                                <asp:LinkButton ID="lnkcancel1" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel1_Click" ></asp:LinkButton>
                                                            </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                       <tr   runat="server" id="p3" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp3" runat="server" Text="Project 3" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp3" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator14" runat="server" ControlToValidate="txtp3" 
                                                                  ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p31" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp3dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                       &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp3f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtp3f" ></cc1:CalendarExtender>

                                                        &nbsp; To    &nbsp;<asp:TextBox ID="txtp3t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtp3t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator15" runat="server" ControlToValidate="txtp3f" 
                                                                     ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator16" runat="server" ControlToValidate="txtp3t" 
                                                                     ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p32" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl3dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txt3dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator17" runat="server" ControlToValidate="txt3dis" 
                                                                      ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                      <%--   </td>
                                                          <td valign="bottom">--%>&nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkmore3" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore3_Click" ></asp:LinkButton>
                                                         <%-- </td>
                                                            <td valign="bottom">--%>&nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkcancel2" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel2_Click" ></asp:LinkButton>
                                                            </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p4" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp4" runat="server" Text="Project 4" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp4" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator18" runat="server" ControlToValidate="txtp4" 
                                                                   ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p41" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl4dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td>
                                                       &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp4f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtp4f" ></cc1:CalendarExtender>

                                                        &nbsp; To    &nbsp;<asp:TextBox ID="txtp4t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtp4t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator19" runat="server" ControlToValidate="txtp4f" 
                                                              ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator20" runat="server" ControlToValidate="txtp4t" 
                                                                 ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p42" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl4dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txt4dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator21" runat="server" ControlToValidate="txt4dis" 
                                                                      ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                        <%-- </td>
                                                          <td valign="bottom">--%>&nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkmore4" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore4_Click"></asp:LinkButton>
                                                          <%--</td>
                                                            <td valign="bottom">--%>&nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkcancel3" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel3_Click"></asp:LinkButton>
                                                            </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>


                                                       <tr   runat="server" id="p5" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp5" runat="server" Text="Project 5" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp5" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator22" runat="server" ControlToValidate="txtp5" 
                                                              ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p51" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl5dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                       &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp5f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtp5f" ></cc1:CalendarExtender>

                                                        &nbsp; To    &nbsp;<asp:TextBox ID="txtp5t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtp5t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator23" runat="server" ControlToValidate="txtp5f" 
                                                               ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator24" runat="server" ControlToValidate="txtp5t" 
                                                                ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p52" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl5dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txt5dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator25" runat="server" ControlToValidate="txt5dis" 
                                                                ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                     <%--    </td>
                                                          <td valign="bottom">--%>&nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkmore5" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore5_Click" ></asp:LinkButton>
                                                       <%--   </td>
                                                            <td valign="bottom">--%> &nbsp; &nbsp; &nbsp;
                                                                <asp:LinkButton ID="lnkcancel4" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel4_Click" ></asp:LinkButton>
                                                            </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                     <tr   runat="server" id="p6" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lblp6" runat="server" Text="Project 6" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txtp6" runat="server" Width="250px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator26" runat="server" ControlToValidate="txtp6" 
                                                                 ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                      <tr   runat="server" id="p61" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl6dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                       &nbsp;  From  &nbsp;  <asp:TextBox ID="txtp6f" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="txtp6f" ></cc1:CalendarExtender>

                                                        &nbsp; To    &nbsp;<asp:TextBox ID="txtp6t" runat="server" Width="80px"></asp:TextBox>
                                                             <cc1:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtp6t"></cc1:CalendarExtender>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator27" runat="server" ControlToValidate="txtp6f" 
                                                               ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator28" runat="server" ControlToValidate="txtp6t" 
                                                                ErrorMessage="Provide a Project Duration" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td height="10px"></td></tr>

                                                        <tr   runat="server" id="p62" visible="false">
                                                         <td align="right" width="40%">
                                                             <asp:Label ID="lbl6dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                                                         </td>
                                                         <td align="center" width="5%">
                                                             <b>:</b>
                                                         </td>
                                                         <td align="left" width="45%">
                                                             <asp:TextBox ID="txt6dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="Requiredfieldvalidator29" runat="server" ControlToValidate="txt6dis" 
                                                                  ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr><td><br /></td></tr>
                                                     <tr>
                                                         <td></td>
                                                         <td>
                                                         </td>
                                                         <td>
                                                             <asp:button ID="btnsubmit" runat="server" Text="Update" Font-Size="16px"  ValidationGroup="RegForm" OnClick="btnsubmit_Click"/>
                                                              <asp:button ID="btncancel2" runat="server" Text="Cancel" Font-Size="16px" OnClick="btncancel2_Click" />
                                                         </td>
                                                     </tr>
                                                 </table>
                                             </td>
                                        </tr>
                                  </table>
                            </td>
                        </tr>
                     </table>
                </td>
           </tr>
         </table>
    </form>
</body>
</html>
