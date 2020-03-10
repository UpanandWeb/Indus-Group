<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Performance-Review.aspx.cs" Inherits="Emp_Performance_Review" %>


<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
    </style>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .headings2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 15px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 15px;
        }

        .headings3 {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
        }

        .style2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 18%;
        }

        .style3 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 19%;
        }

        .style4 {
            height: 20px;
        }

        .style5 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 5px;
        }
        .mesure {
            padding-bottom: 5px;
            padding-top: 5px;
        }

        th {
            text-align: center !important;
        }
    </style>

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
                 window.location = "Login.aspx";
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
        <%--<cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>--%>
        <header id="header">
            <div class="container-fluide header-inner-wrap">
                <head:Header ID="Header1" runat="server"  />
            </div>
        </header>
        <br />
        <br />
        <section class="about text-left" id="about">
            <div class="container">
                <div class="row">
                    <br />
                    <br />
                    <br />
                    <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
                    </div>
                <br />
                <br />
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>
                <table width="100%" align="center">
                        <tr>
                 <td align="center">
                     <asp:Label ID="lblTitle" runat="server" Text="Employee Performance Review" Font-Size="24px"></asp:Label>
                 </td>
             </tr>
                         <tr><td height="20px"></td></tr>

             <tr>
                 <td align="center" width="100%" align="center">
                     <table width="80%" align="center">
                         <tr class="mesure">
                             <td>
                                 <asp:Label ID="lblname" runat="server" Text="Employee Name" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtname" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtname"
                                       ErrorMessage="Provide a Employee Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                         <tr class="mesure">
                             <td>
                                 <asp:Label ID="lbljoin" runat="server" Text="Joining Date" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtcal" runat="server" Width="250px"></asp:TextBox>
                                 <cc1:CalendarExtender ID="calender" runat="server" TargetControlID="txtcal"></cc1:CalendarExtender>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtcal"
                    ErrorMessage="Provide a Joining Date" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                              <tr class="mesure">
                             <td>
                                 <asp:Label ID="lbldisg" runat="server" Text="Designation " Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                          <tr class="mesure">
                             <td>
                                 <asp:Label ID="lblemail" runat="server" Text="Email ID" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtemail" runat="server" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtemail" 
                ErrorMessage="Provide a valid email address" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Enter valid email address" Display="dynamic" ValidationExpression=".*@.*\..*" ValidationGroup="RegForm">*</asp:RegularExpressionValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure">
                             <td>
                                 <asp:Label ID="lblmobile" runat="server" Text="Mobile Number" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtmobile" runat="server" Width="250px" onkeypress="return onlyNos(event,this);" MaxLength="10"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="txtmobile"
                    ErrorMessage="Provide a Phone number" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"
                    ErrorMessage="Enter Max 10 digits number" Display="dynamic" ValidationExpression="^[0-9]{10}$" ValidationGroup="RegForm">*</asp:RegularExpressionValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                         <tr class="mesure">
                             <td>
                                 <asp:Label ID="lbladd" runat="server" Text="Communication Address" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtaddress" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator30" runat="server" ControlToValidate="txtaddress"
                    ErrorMessage="Provide a Phone number" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure">
                             <td>
                                 <asp:Label ID="lblp1" runat="server" Text="Project 1" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp1" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtp1" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure">
                             <td>
                                 <asp:Label ID="lbl1dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                            <tr class="mesure">
                             <td>
                                 <asp:Label ID="lblp1dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp1dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="txtp1dis" 
                    ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                              <td valign="bottom">
                                    <asp:LinkButton ID="lnkmore1" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore1_Click"></asp:LinkButton>
                              </td>
                         </tr>

                         <tr><td height="10px"></td></tr>

                            <tr class="mesure" runat="server" id="p2" visible="false">
                             <td>
                                 <asp:Label ID="lblp2" runat="server" Text="Project 2" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp2" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="txtp2" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p21" visible="false">
                             <td>
                                 <asp:Label ID="lbl2dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                            <tr class="mesure" runat="server" id="p22" visible="false">
                             <td>
                                 <asp:Label ID="lbl2dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txt2dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="txt2dis" 
                    ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                              <td valign="bottom">
                                    <asp:LinkButton ID="lnkmore2" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore2_Click" ></asp:LinkButton>
                              </td>
                                <td valign="bottom">
                                    <asp:LinkButton ID="lnkcancel1" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel1_Click" ></asp:LinkButton>
                                </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                           <tr class="mesure" runat="server" id="p3" visible="false">
                             <td>
                                 <asp:Label ID="lblp3" runat="server" Text="Project 3" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp3" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator14" runat="server" ControlToValidate="txtp3" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p31" visible="false">
                             <td>
                                 <asp:Label ID="lblp3dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                            <tr class="mesure" runat="server" id="p32" visible="false">
                             <td>
                                 <asp:Label ID="lbl3dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txt3dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator17" runat="server" ControlToValidate="txt3dis" 
                    ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                              <td valign="bottom">
                                    <asp:LinkButton ID="lnkmore3" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore3_Click" ></asp:LinkButton>
                              </td>
                                <td valign="bottom">
                                    <asp:LinkButton ID="lnkcancel2" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel2_Click" ></asp:LinkButton>
                                </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p4" visible="false">
                             <td>
                                 <asp:Label ID="lblp4" runat="server" Text="Project 4" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp4" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator18" runat="server" ControlToValidate="txtp4" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p41" visible="false">
                             <td>
                                 <asp:Label ID="lbl4dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
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

                            <tr class="mesure" runat="server" id="p42" visible="false">
                             <td>
                                 <asp:Label ID="lbl4dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txt4dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator21" runat="server" ControlToValidate="txt4dis" 
                    ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                              <td valign="bottom">
                                    <asp:LinkButton ID="lnkmore4" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore4_Click"></asp:LinkButton>
                              </td>
                                <td valign="bottom">
                                    <asp:LinkButton ID="lnkcancel3" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel3_Click"></asp:LinkButton>
                                </td>
                         </tr>
                         <tr><td height="10px"></td></tr>


                           <tr class="mesure" runat="server" id="p5" visible="false">
                             <td>
                                 <asp:Label ID="lblp5" runat="server" Text="Project 5" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp5" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator22" runat="server" ControlToValidate="txtp5" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p51" visible="false">
                             <td>
                                 <asp:Label ID="lbl5dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                            <tr class="mesure" runat="server" id="p52" visible="false">
                             <td>
                                 <asp:Label ID="lbl5dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txt5dis" runat="server" Width="250px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator25" runat="server" ControlToValidate="txt5dis" 
                    ErrorMessage="Provide a Project Discription" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                              <td valign="bottom">
                                    <asp:LinkButton ID="lnkmore5" runat="server" Text="Add More" Font-Size="16px" OnClick="lnkmore5_Click" ></asp:LinkButton>
                              </td>
                                <td valign="bottom">
                                    <asp:LinkButton ID="lnkcancel4" runat="server" Text="Cancel" Font-Size="16px" OnClick="lnkcancel4_Click" ></asp:LinkButton>
                                </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                         <tr class="mesure" runat="server" id="p6" visible="false">
                             <td>
                                 <asp:Label ID="lblp6" runat="server" Text="Project 6" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtp6" runat="server" Width="250px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Requiredfieldvalidator26" runat="server" ControlToValidate="txtp6" 
                    ErrorMessage="Provide a Project Name" ValidationGroup="RegForm">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr><td height="10px"></td></tr>

                          <tr class="mesure" runat="server" id="p61" visible="false">
                             <td>
                                 <asp:Label ID="lbl6dur" runat="server" Text="Project Duration" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                            <tr class="mesure" runat="server" id="p62" visible="false">
                             <td>
                                 <asp:Label ID="lbl6dis" runat="server" Text="Project Discription" Font-Size="17px"></asp:Label>
                             </td>
                             <td>
                                 <b>:</b>
                             </td>
                             <td>
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

                                 <asp:button ID="btnsubmit" runat="server" Text="Submit" Font-Size="16px"  ValidationGroup="RegForm" OnClick="btnsubmit_Click"/>
                                  <asp:button ID="btncancel2" runat="server" Text="Cancel" Font-Size="16px" OnClick="btncancel2_Click" />
                             </td>
                         </tr>
                     </table>
                 </td>
             </tr>
                </table>
                <br />
                <br />
                </div>
        </section>
    </form>
</body>
</html>
