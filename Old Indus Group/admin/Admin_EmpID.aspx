 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpID.aspx.cs" Inherits="Admin_EmpID" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
   <title>:  : 1indus.com :  : </title>
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
</style>
</head>

<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
           <table width="90%"  align="center">
                         <tr width="100%">
                            <td valign="top" width="100%" >
                                 <uc1:TopMenu ID="Topmenu1" runat="server" />
                            </td>
                         </tr>

                         <tr>
                            <td>
                                 <br />
                             </td>
                         </tr>

                         <tr>
                           <td align="center" width="100%" >
                              <table width="100%">
                                 <tr>
                                     <td class="style1" align="center" style="font-size: 24px">Add New Employee</td>
                                 </tr>
                              </table>
                            </td>
                         </tr>

                         <tr>
                             <td>
                                    <br />
                            </td>
                         </tr>

                         <tr>
                            <td style="height: 15px"></td>
                         </tr>

                         <tr>
                            <td align="center" valign="top" width="80%" >
                                <table width="100%" cellpadding="0" cellspacing="2" align="center">
                                     <tr>
                                         <td>
                                                    <table  width="100%" align="center">
                                                         <tr>
                                                            <td style="height: 15px;" width="13%" class="headings2"></td>
                                                            <td width="2%"></td>
                                                            <td style="height: 15px;" width="17%">
                                                            </td>

                                                            <td style="height: 15px;" width="13%" class="headings2">Employee ID<span style="color: red">*</span></td>
                                                            <td width="2%"></td>
                                                            <td style="height: 15px;" width="17%">
                                                                <asp:TextBox ID="txtemid" runat="server" MaxLength="50" Width="180px"  Enabled="false"></asp:TextBox>
                                                            </td>

                                                            <td style="height: 15px;" width="13%" class="headings2"></td>
                                                            <td width="2%"></td>
                                                            <td style="height: 15px;" width="17%">
                                                            </td>
                                                        </tr>
                                                        <tr><td><br /></td></tr>
                                                         <tr>
                                                            <td style="height: 15px;" width="13%" class="headings2">Email ID<span style="color: red">*</span></td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td style="height: 15px;" width="17%">
                                                                <asp:TextBox ID="txtemail" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtemail" Display="Dynamic"
                                                                    ErrorMessage="Provide Email Id" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            </td>

                                                            <td style="height: 15px;" width="13%" class="headings2">Alternate Email<span style="color: red">*</span></td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td style="height: 15px;" width="17%">
                                                                <asp:TextBox ID="conemail" runat="server" MaxLength="50" Width="180px"  ></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="conemail" Display="Dynamic"
                                                                    ErrorMessage="Provide alternate Email Id" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            </td>

                                                            <td style="height: 15px;" width="13%" class="headings2">Password<span style="color: red">*</span></td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td style="height: 15px;" width="17%">
                                                                <asp:TextBox ID="txtempid" runat="server" MaxLength="10" Width="180px" ></asp:TextBox>
                                                                  <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtempid" Display="Dynamic"
                                                                    ErrorMessage="Provide password" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
 
                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="20px" colspan="4" class="headings3"><b><span style="font-size: 18px">Personal Details</span> </b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">First Name<span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="fname" runat="server" MaxLength="50" Width="180px" TabIndex="1"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator21" runat="server" ControlToValidate="fname" Display="Dynamic"
                                                                    ErrorMessage="Provide First Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="sss" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                    TargetControlID="fname">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Middle Name</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="mname" runat="server" MaxLength="30" Width="180px" TabIndex="2"></asp:TextBox>
                                                            </td>

                                                            <td class="headings2">Last Name<span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="lname" runat="server" MaxLength="30" Width="180px" TabIndex="3"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator22" runat="server" ControlToValidate="lname" Display="Dynamic"
                                                                    ErrorMessage="Provide Last Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                    TargetControlID="lname">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Gender<span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:RadioButton ID="gend1" runat="server" Text="Male" GroupName="a1" Font-Bold="false" Font-Size="14px" TabIndex="4" />
                                                                <asp:RadioButton ID="gend2" runat="server" Text="Female" GroupName="a1"  Font-Bold="false" Font-Size="14px" TabIndex="5"/>
                                                            </td>

                                                            <td class="headings2" >S S NUMBER <span style="color:red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="fssn" runat="server" MaxLength="9" Width="180px" TabIndex="6"></asp:TextBox>
 <asp:RequiredFieldValidator ID="Requiredfieldvalidator222" runat="server" ControlToValidate="fssn" Display="Dynamic"
                                                                    ErrorMessage="Select Birth date" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2a" runat="server" InvalidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,./"
                                                                    ValidChars="1234567890" TargetControlID="fssn"></cc1:FilteredTextBoxExtender>

                                                            </td>

                                                            <td class="headings2">
                                                                 Marital Status <span style="color: red">*</span>
                                                            </td>
                                                            <td  class="headings2">:</td>
                                                            <td> 
                                                              <asp:RadioButton ID="chkmarried" runat="server" Text="Married" Font-Bold="false" Font-Size="14px"  GroupName="marital"  Width="82px"  TabIndex="7" /> &nbsp; 
                                                               <asp:RadioButton ID="chkunmaried"  runat="server" GroupName="marital" Font-Bold="false" Font-Size="14px"   Text="Unmarried" Checked="true"  Width="102px"  TabIndex="8"/>
                                                            </td>
              
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Birth Date <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="bdate" runat="server" MaxLength="30" Width="180px" TabIndex="9"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="ccs" TargetControlID="bdate" runat="server"></cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator25" runat="server" ControlToValidate="bdate" Display="Dynamic"
                                                                    ErrorMessage="Select Birth date" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" InvalidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="bdate">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Birth City <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="bcity" runat="server" MaxLength="50" Width="180px" TabIndex="10"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator28" runat="server" ControlToValidate="bcity" Display="Dynamic"
                                                                    ErrorMessage="Provide Birth city" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
                                                                    TargetControlID="bcity">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Birth State <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="bstate" runat="server" MaxLength="50" Width="180px" TabIndex="11"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator27" runat="server" ControlToValidate="bstate" Display="Dynamic"
                                                                    ErrorMessage="Provide Birth State" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
                                                                    TargetControlID="bstate">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Birth Country <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="bcountry" runat="server" MaxLength="50" Width="180px" TabIndex="12"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator26" runat="server" ControlToValidate="bcountry" Display="Dynamic"
                                                                    ErrorMessage="Provide Birth Country" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                    TargetControlID="bcountry">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Citizenship <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="ccountry" runat="server" MaxLength="50" Width="180px" TabIndex="13"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator29" runat="server" ControlToValidate="ccountry" Display="Dynamic"
                                                                    ErrorMessage="Provide Citizenship" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                    TargetControlID="ccountry">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                               <td class="headings2">Nationality<span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="ncountry" runat="server" MaxLength="30" Width="180px" TabIndex="14"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator24" runat="server" ControlToValidate="ncountry" Display="Dynamic"
                                                                    ErrorMessage="Provide Nationality" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                                    TargetControlID="ncountry">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                           
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                             <td class="headings2">Passport No <span style="color:red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="passno" runat="server" MaxLength="20" Width="180px" TabIndex="15"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator30" runat="server" ControlToValidate="passno" Display="Dynamic"
                                                  ErrorMessage="Provide Passport Number" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true"  >*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
                                                                    TargetControlID="passno">
                                                                </cc1:FilteredTextBoxExtender>

                                                            <td class="headings2">Issued at <span style="color:red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="pcountry" runat="server" MaxLength="50" Width="180px" TabIndex="16"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator31" runat="server" ControlToValidate="pcountry" Display="Dynamic"
                                                  ErrorMessage="Provide Issued Place" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true"  >*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="pcountry">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Issued Date <span style="color:red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="issdate" runat="server" MaxLength="50" Width="180px" TabIndex="17"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="ccs1" runat="server" TargetControlID="issdate"></cc1:CalendarExtender>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="issdate">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator32" runat="server" ControlToValidate="issdate" Display="Dynamic"
                                                  ErrorMessage="Provide Issued Date" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true"  >*</asp:RequiredFieldValidator>
                                                            </td>
                                                           
                                                        </tr>
                                                         <tr><td height="2px">&nbsp;</td></tr>

                                                        <tr>
                                                             <td class="headings2">Expiry Date <span style="color:red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="expdate" runat="server" MaxLength="50" Width="180px" TabIndex="18"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="expdate"></cc1:CalendarExtender>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="expdate">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator33" runat="server" ControlToValidate="expdate" Display="Dynamic"
                                                  ErrorMessage="Select Expired Date" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true" >*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="20px"><b><span style="font-size: 18px">Family Details</span> </b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Father Name <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="fatname" runat="server" MaxLength="50" Width="180px" TabIndex="19"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator34" runat="server" ControlToValidate="fatname" Display="Dynamic"
                                                                    ErrorMessage="Provide Father Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="fatname">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Mother Name <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="motname" runat="server" MaxLength="50" Width="180px" TabIndex="20"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator35" runat="server" ControlToValidate="motname" Display="Dynamic"
                                                                    ErrorMessage="Provide Mother Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="motname">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                               <td class="headings2">Spouse Name </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="mmname" runat="server" MaxLength="50" Width="180px" TabIndex="21"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="mmname">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                               <td class="headings2">Spouse S S Number </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="Spssn" runat="server" MaxLength="9" Width="180px" TabIndex="22"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890" TargetControlID="Spssn">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                         

                                                            <td class="headings2">Birth Date</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="sbd" runat="server" MaxLength="50" Width="180px" TabIndex="23"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="sbdcal" runat="server" TargetControlID="sbd"></cc1:CalendarExtender>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="sbd">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Gender</td>
                                                            <td style="width: 8px">&nbsp;:
                                                            </td>
                                                            <td>
                                                                <asp:RadioButton ID="spgen1" runat="server" Text="Male" Font-Bold="false" Font-Size="14px"  TabIndex="24" GroupName="b1" />
                                                                <asp:RadioButton ID="spgen2" runat="server" Text="Female" Font-Bold="false" Font-Size="14px"  GroupName="b1"  TabIndex="25"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Chid Name 1</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="k1name" runat="server" MaxLength="50" Width="180px" TabIndex="26"></asp:TextBox>
                                                               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="k1name">
                                                                </cc1:FilteredTextBoxExtender></td>
                                                            <td class="headings2">Child Name 2</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="k2name" runat="server" MaxLength="50" Width="180px" TabIndex="27"></asp:TextBox>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="k2name">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Child Name 3</td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="k3name" runat="server" MaxLength="50" Width="180px" TabIndex="28"></asp:TextBox>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="k3name">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Gender</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:RadioButton ID="k1gen1" runat="server" Text="Male" TabIndex="29" GroupName="c1" Font-Bold="false" Font-Size="14px" />
                                                                <asp:RadioButton ID="k1gen2" runat="server" Text="Female" GroupName="c1"  Font-Bold="false" Font-Size="14px" TabIndex="30"/>
                                                            </td>

                                                            <td class="headings2">Gender</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:RadioButton ID="k2gen1" runat="server" Text="Male" TabIndex="31" GroupName="d1"  Font-Bold="false" Font-Size="14px"/>
                                                                <asp:RadioButton ID="k2gen2" runat="server" Text="Female" GroupName="d1" Font-Bold="false" Font-Size="14px" TabIndex="32" />
                                                            </td>

                                                            <td class="headings2">Gender</td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:RadioButton ID="k3gen1" runat="server" Text="Male" TabIndex="33" GroupName="e1"  Font-Bold="false" Font-Size="14px"/>
                                                                <asp:RadioButton ID="k3gen2" runat="server" Text="Female" GroupName="e1"  Font-Bold="false" Font-Size="14px" TabIndex="34"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>

                                                            <td class="headings2">Birth Date</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="k1bd" runat="server" MaxLength="50" Width="180px" TabIndex="35"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="k1bd"></cc1:CalendarExtender>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="k1bd">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Birth Date</td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="k2bd" runat="server" MaxLength="50" Width="180px" TabIndex="36"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="k2bd"></cc1:CalendarExtender>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="k2bd">
                                                                </cc1:FilteredTextBoxExtender>

                                                            </td>

                                                            <td class="headings2">Birth Date</td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="k3bd" runat="server" MaxLength="50" Width="180px" TabIndex="37"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="k3bd"></cc1:CalendarExtender>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890/" TargetControlID="k3bd">
                                                                </cc1:FilteredTextBoxExtender>

                                                            </td>
                                                        </tr>

                                                       <tr><td height="2px">&nbsp;</td></tr>

                                                        <tr>
                                                            <td class="headings2" >
                                                                S S NUMBER
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                            <asp:TextBox   ID="k1ssn" runat="server"   MaxLength="9" Width="180px" TabIndex="38"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2052" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890" TargetControlID="k1ssn">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                    
                                         <td class="headings2" >
                                                                S S NUMBER
                                                            </td>

                                         <td>&nbsp;:</td>

                                         <td>
                                                               <asp:TextBox   ID="k2ssn" runat="server"  MaxLength="9" Width="180px" TabIndex="39"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2053" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890" TargetControlID="k2ssn"></cc1:FilteredTextBoxExtender>
                                                             </td>
                                          
                                         <td class="headings2" >
                                                                S S NUMBER
                                                            </td>

                                         <td>&nbsp;:</td>

                                         <td style="width: 201px">
                                                                 <asp:TextBox   ID="k3ssn" runat="server"  MaxLength="9" Width="180px" TabIndex="40"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2054" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890" TargetControlID="k3ssn"></cc1:FilteredTextBoxExtender>
                                                            </td>

                                      </tr>

                                     <tr>
                                         <td height="10px">&nbsp;</td>
                                     </tr>

                                     <tr>
                                         <td height="20px" colspan="4"><b><span style="font-size: 18px">Communication Details </span></b></td>
                                      </tr>

                                      <tr>
                                            <td height="10px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                                            <td style="width: 110px; height: 15px;" class="headings2">Door Number<span style="color: red">*</span> </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 192px; height: 15px;">
                                                                <asp:TextBox ID="txtdoor" runat="server" MaxLength="50" Width="180px" TabIndex="41"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator36" runat="server" ControlToValidate="txtdoor" Display="Dynamic"
                                                                    ErrorMessage="Provide Door Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890-/" TargetControlID="txtdoor">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="width: 110px; height: 15px;" class="headings2">Street<span style="color: red">*</span> </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 192px; height: 15px;">
                                                                <asp:TextBox ID="street" runat="server" MaxLength="50" Width="180px" TabIndex="42"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator37" runat="server" ControlToValidate="street" Display="Dynamic"
                                                                    ErrorMessage="Provide Street Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" InvalidChars="/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="street"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">City<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="city" runat="server" MaxLength="50" Width="180px" TabIndex="43"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator38" runat="server" ControlToValidate="city" Display="Dynamic"
                                                                    ErrorMessage="Provide CIty Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="city"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                      <tr>
                                         <td height="2px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                                            <td class="headings2">State<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="state" runat="server" MaxLength="50" Width="180px" TabIndex="44"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator39" runat="server" ControlToValidate="state" Display="Dynamic"
                                                                    ErrorMessage="Provide state Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="state"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="width: 110px; height: 15px;" class="headings2">Country<span style="color: red">*</span> </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 192px; height: 15px;">
                                                                <asp:TextBox ID="country" runat="server" MaxLength="50" Width="180px" TabIndex="45"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator40" runat="server" ControlToValidate="country" Display="Dynamic"
                                                                    ErrorMessage="Provide Country Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server" InvalidChars="1234567890/~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="country"></cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td class="headings2">Zip<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="zip" runat="server" MaxLength="6" Width="180px" TabIndex="46"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator41" runat="server" ControlToValidate="zip" Display="Dynamic"
                                                                    ErrorMessage="Provide ZIp code" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="zip"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                      <tr>
                                          <td height="10px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                         <td height="20px"><b><span style="font-size: 18px">Contact Details </span></b></td>
                                      </tr>

                                      <tr>
                                          <td height="10px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                                            <td style="height: 15px;" width="13%" class="headings2">Ph:Work <span style="color: red">*</span></td>
                                                            <td style="height: 15px;" width="2%">&nbsp;:&nbsp;</td>
                                                            <td style="height: 15px;" width="17%">

                                                                <asp:TextBox Width="35px" ID="wp1" runat="server" MaxLength="3" TabIndex="47"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator42" runat="server" ControlToValidate="wp1" Display="Dynamic"
                                                                    ErrorMessage="Provide Work Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="wp1"></cc1:FilteredTextBoxExtender>
                                                               -
                                                                <asp:TextBox ID="wp2" Width="35px" runat="server" MaxLength="3" TabIndex="48"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator43" runat="server" ControlToValidate="wp2" Display="Dynamic"
                                                                    ErrorMessage="Provide Work Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="wp2"></cc1:FilteredTextBoxExtender>
                                                             -
                                                                <asp:TextBox ID="wp3" Width="50px" runat="server" MaxLength="4" TabIndex="49"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator44" runat="server" ControlToValidate="wp3" Display="Dynamic"
                                                                    ErrorMessage="Provide Work Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="wp3"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="width: 110px; height: 15px;" class="headings2">Ph:Home <span style="color: red">*</span> </td>
                                                            <td style="height: 15px;">&nbsp;:&nbsp;</td>
                                                            <td style="width: 192px; height: 15px;">
                                                                <asp:TextBox ID="hp1" Width="35px" runat="server" MaxLength="3" TabIndex="50"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator45" runat="server" ControlToValidate="hp1" Display="Dynamic"
                                                                    ErrorMessage="Provide Home Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="hp1"></cc1:FilteredTextBoxExtender>
                                                               -
                                                                <asp:TextBox ID="hp2" Width="35px" runat="server" MaxLength="3" TabIndex="51"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator46" runat="server" ControlToValidate="hp2" Display="Dynamic"
                                                                    ErrorMessage="Provide Home Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="hp2"></cc1:FilteredTextBoxExtender>
                                                            -
                                                                <asp:TextBox ID="hp3" Width="50px" runat="server" MaxLength="4" TabIndex="52"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator47" runat="server" ControlToValidate="hp3" Display="Dynamic"
                                                                    ErrorMessage="Provide Home Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="hp3"></cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td style="width: 110px; height: 15px;" class="headings2">Mobile <span style="color: red">*</span></td>
                                                            <td style="width: 8px; height: 15px;">&nbsp;:&nbsp;</td>
                                                            <td style="width: 201px; height: 15px;">
                                                                <asp:TextBox ID="mb1" Width="35px" runat="server" MaxLength="3" TabIndex="53"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator48" runat="server" ControlToValidate="mb1" Display="Dynamic"
                                                                    ErrorMessage="Provide Mobile Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="mb1"></cc1:FilteredTextBoxExtender>
                                                               -
                                                                <asp:TextBox ID="mb2" Width="35px" runat="server" MaxLength="3" TabIndex="54"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator49" runat="server" ControlToValidate="mb2" Display="Dynamic"
                                                                    ErrorMessage="Provide Mobile Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="mb2"></cc1:FilteredTextBoxExtender>
                                                           -
                                                                <asp:TextBox ID="mb3" Width="50px" runat="server" MaxLength="4" TabIndex="55"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator50" runat="server" ControlToValidate="mb3" Display="Dynamic"
                                                                    ErrorMessage="Provide Mobile Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender36" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="mb3"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                      <tr>
                                          <td height="10px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                         <td height="20px" colspan="10"><b><span style="font-size: 18px">Bank Account Details </span></b></td>
                                      </tr>

                                      <tr>
                                          <td height="10px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                                            <td class="headings2">Account Name<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtacname" runat="server" MaxLength="50" Width="180px" TabIndex="56"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator51" runat="server" ControlToValidate="txtacname" Display="Dynamic"
                                                                    ErrorMessage="Provide Name in Account" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender116" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtacname"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Account Number<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtacnum" runat="server" MaxLength="20" Width="180px" TabIndex="57"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator52" runat="server" ControlToValidate="txtacnum" Display="Dynamic"
                                                                    ErrorMessage="Provide Account Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender37" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="txtacnum"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Bank Name<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="txtbankname" runat="server" MaxLength="30" Width="180px" TabIndex="58"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator53" runat="server" ControlToValidate="txtbankname" Display="Dynamic"
                                                                    ErrorMessage="Provide Bank Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender40" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtbankname"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                      <tr>
                                         <td height="2px">&nbsp;</td>
                                      </tr>

                                      <tr>
                                                            <td class="headings2">Branch Address<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtbankadd" runat="server" MaxLength="200" Width="180px" TabIndex="59"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator54" runat="server" ControlToValidate="txtbankadd" Display="Dynamic"
                                                                    ErrorMessage="Provide Brnach Address" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender39" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,."
                                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy-/z " TargetControlID="txtbankadd"></cc1:FilteredTextBoxExtender>

                                                            </td>
                                                            <td class="headings2">IFSC CODE<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtifsc" runat="server" MaxLength="11" Width="180px" TabIndex="60"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator55" runat="server" ControlToValidate="txtifsc" Display="Dynamic"
                                                                    ErrorMessage="Provide Ifsc Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender38" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="txtifsc"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Swift Code<%--<span style="color:red">*</span>--%>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtswift" runat="server" MaxLength="20" Width="180px" TabIndex="61"> </asp:TextBox>
                                                                <%--  <asp:RequiredFieldValidator ID="Requiredfieldvalidator56" runat="server" ControlToValidate="txtswift" Display="Dynamic"
                                           ErrorMessage="Provide Home Number" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true" >*</asp:RequiredFieldValidator>--%>
                                                            </td>
                                                        </tr>

                                       <tr>
                                            <td height="2px">&nbsp;</td>
                                       </tr>

                                      <tr>
                                                            <td class="headings2">Address In Your Bank Account <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 192px" colspan="5">
                                                                <asp:TextBox ID="txtbranchacaddress" runat="server" Width="450px" MaxLength="200" TabIndex="62"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator57" runat="server" ControlToValidate="txtbranchacaddress" Display="Dynamic"
                                                                    ErrorMessage="Provide address in Bank Account" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender41" runat="server" InvalidChars="~`!@#$%^&*()_=+<>.-/"
                                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -/," TargetControlID="txtbranchacaddress"></cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td style="width: 6px"></td>
                                                            <td></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="20px" colspan="10"><b><span style="font-size: 18px">Identification Details </span></b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Driving Licence Number<%--<span style="color: red">*</span>--%>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtdrivenumber" runat="server" MaxLength="16" TabIndex="63" Width="180px"></asp:TextBox>
                                                                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender44" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890" TargetControlID="txtdrivenumber"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Issue Place<%--<span style="color: red">*</span>--%>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtdriveplace" runat="server" MaxLength="20" TabIndex="64" Width="180px"></asp:TextBox>
                                                                       <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender45" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtdriveplace"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Issue city<%--<span style="color: red">*</span>--%>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="txtdrivecity" runat="server" MaxLength="20" TabIndex="65" Width="180px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender46" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtdrivecity"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="20px" colspan="10"><b><span style="font-size: 18px">Emergency Contact Details </span></b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Cont.Person-1 <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="cpname1" runat="server" MaxLength="40" Width="180px" TabIndex="66"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator59" runat="server" ControlToValidate="cpname1" Display="Dynamic"
                                                                    ErrorMessage="Provide Person name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender47" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="cpname1"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Phone Number<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="cpphone1" runat="server" MaxLength="10" Width="180px" TabIndex="67"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator60" runat="server" ControlToValidate="cpphone1" Display="Dynamic"
                                                                    ErrorMessage="Provide Phone number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender49" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="cpphone1"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Email ID <span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="cpemail1" runat="server" MaxLength="40" Width="180px" TabIndex="68"> </asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator61" runat="server" ControlToValidate="cpemail1" Display="Dynamic"
                                                                    ErrorMessage="Provide Email Id" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Address <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 192px" colspan="5">
                                                                <asp:TextBox ID="cpaddr1" runat="server" Width="450px" MaxLength="250" TabIndex="69"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator62" runat="server" ControlToValidate="cpaddr1" Display="Dynamic"
                                                                    ErrorMessage="Provide Contact person Address" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender52" runat="server" InvalidChars="~`!@#$%^&*()_=+<>."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890/-," TargetControlID="cpaddr1"></cc1:FilteredTextBoxExtender>
                                                            </td>

                                                            <td style="width: 6px"></td>
                                                            <td></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Cont.Person-2 <span style="color: red">*</span></td>
                                                            <td style="width: 8px"></td>
                                                            <td>
                                                                <asp:TextBox ID="cpname2" runat="server" MaxLength="40" Width="180px" TabIndex="70"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator63" runat="server" ControlToValidate="cpname2" Display="Dynamic"
                                                                    ErrorMessage="Provide Person name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender48" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="cpname2"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Phone Number <span style="color: red">*</span><br />
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="cpphone2" runat="server" MaxLength="10" Width="180px" TabIndex="71"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator64" runat="server" ControlToValidate="cpphone2" Display="Dynamic"
                                                                    ErrorMessage="Provide Phone Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender50" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,.-/"
                                                                    ValidChars="1234567890" TargetControlID="cpphone2"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Email ID<span style="color: red">*</span>
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="cpemail2" runat="server" MaxLength="40" Width="180px" TabIndex="72"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator65" runat="server" ControlToValidate="cpemail2" Display="Dynamic"
                                                                    ErrorMessage="Provide Email Id" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="headings2">Address <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 292px" colspan="5">
                                                                <asp:TextBox ID="cpaddr2" runat="server" Width="449px" MaxLength="250" TabIndex="73"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator66" runat="server" ControlToValidate="cpaddr2" Display="Dynamic"
                                                                    ErrorMessage="Provide Person Address" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender51" runat="server" InvalidChars="~`!@#$%^&*()_=+<>."
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890/-," TargetControlID="cpaddr2"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td style="width: 6px"></td>
                                                            <td></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="20px" colspan="10"><b><span style="font-size: 18px">Technical Experience</span> </b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td width="150" class="headings2">Exp Years &amp; Months <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox Width="28px" ID="expyrs" runat="server" MaxLength="2" TabIndex="74"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator67" runat="server" ControlToValidate="expyrs" Display="Dynamic"
                                                                    ErrorMessage="Provide Experience Years" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender56" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="expyrs"></cc1:FilteredTextBoxExtender>
                                                                <span >Years&nbsp;</span>-
                                                            <asp:TextBox Width="28px" ID="expmon" runat="server" MaxLength="2" TabIndex="75"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator68" runat="server" ControlToValidate="expmon" Display="Dynamic"
                                                                    ErrorMessage="Provide Experience months " ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender55" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="expmon"></cc1:FilteredTextBoxExtender>
                                                                <span >Months</span>
                                                            </td>
                                                            <td class="headings2">Functional Area <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:TextBox ID="fnarea" runat="server" Width="180px" MaxLength="60" TabIndex="76"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator69" runat="server" ControlToValidate="fnarea" Display="Dynamic"
                                                                    ErrorMessage="Provide Functional Area" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender53" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.1234567890/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="fnarea"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="headings2">Current Industry <span style="color: red">*</span></td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 201px">
                                                                <asp:TextBox ID="currind" runat="server" MaxLength="60" TabIndex="77" Width="180px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator70" runat="server" ControlToValidate="currind" Display="Dynamic"
                                                                    ErrorMessage="Provide Current Industry " ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender54" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890" TargetControlID="currind"></cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="9"></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="25px"><b><span style="font-size: 18px">Technical Skills </span></b></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="10px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="9" width="100%">
                                                                <table width="100%" cellpadding="2">
                                                                    <tr id="trskills1" runat="server">
                                                                        <td class="headings2" width="10%">Skills-1 <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="skills1" runat="server" MaxLength="50" TabIndex="78"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator73" runat="server" ControlToValidate="skills1" Display="Dynamic"
                                                                                ErrorMessage="Provide Skill 1" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender83" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890# " TargetControlID="skills1"></cc1:FilteredTextBoxExtender>
                                                                        </td>

                                                                        <td class="headings2" width="10%">No of Years <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="5%">
                                                                            <asp:TextBox ID="sk1yrs" runat="server" Width="40px" MaxLength="2" TabIndex="79"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator72" runat="server" ControlToValidate="sk1yrs" Display="Dynamic"
                                                                                ErrorMessage="Provide number of Years" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender57" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk1yrs"></cc1:FilteredTextBoxExtender>
                                                                        </td>

                                                                        <td class="headings2" width="10%">No Of Months <span style="color: red">*</span>
                                                                        </td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="5%">
                                                                            <asp:TextBox ID="sk1mnts" runat="server" Width="40px" MaxLength="2" TabIndex="80"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator71" runat="server" ControlToValidate="sk1mnts" Display="Dynamic"
                                                                                ErrorMessage="Provide Number of Months" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender58" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk1mnts"></cc1:FilteredTextBoxExtender>
                                                                        </td>

                                                                        <td class="headings2" width="10%">
                                                                            <span style="width: 100px;">Expert Level</span> <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="20%">
                                                                            <%--<asp:TextBox ID="sk1exp" runat="server" Width="156px" MaxLength="20" ></asp:TextBox>--%>
                                                                            <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender89" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk1exp"></cc1:FilteredTextBoxExtender>--%>
                                                                            <asp:Dropdownlist ID="sk1exp" runat="server"  Width="156px" TabIndex="81" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator74" runat="server" ControlToValidate="sk1exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="trskills2" runat="server">
                                                                        <td class="headings2" width="10%">Skills-2 <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="skills2" runat="server" MaxLength="50" TabIndex="82"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator75" runat="server" ControlToValidate="skills2" Display="Dynamic"
                                                                                ErrorMessage="Provide Skill 2" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender84" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890# " TargetControlID="skills2"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td class="headings2" width="10%">No of Years <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="5%">
                                                                            <asp:TextBox ID="sk2yrs" runat="server" Width="40px" MaxLength="2" TabIndex="83"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator77" runat="server" ControlToValidate="sk2yrs" Display="Dynamic"
                                                                                ErrorMessage="Provide Experience in Years" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender59" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk2yrs"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td class="headings2" width="10%">No of Months <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="5%">
                                                                            <asp:TextBox ID="sk2mnts" runat="server" Width="40px" MaxLength="2" TabIndex="84"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator76" runat="server" ControlToValidate="sk2mnts" Display="Dynamic"
                                                                                ErrorMessage="Provide Experience in Months" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender60" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk2mnts"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td class="headings2" width="10%">Expert Level <span style="color: red">*</span></td>
                                                                        <td width="2%">&nbsp;:</td>
                                                                        <td width="20%">
                                                                          <%--  <asp:TextBox ID="sk2exp" runat="server" Width="156px" MaxLength="50" TabIndex="74"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator78" runat="server" ControlToValidate="sk2exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender90" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk2exp"></cc1:FilteredTextBoxExtender>--%>
                                                                             <asp:Dropdownlist ID="sk2exp" runat="server"  Width="156px" TabIndex="85" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="sk2exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="trskills3" runat="server">
                                                                        <td class="headings2">Skills-3</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="skills3" runat="server" MaxLength="50" TabIndex="86"></asp:TextBox>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender85" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890# " TargetControlID="skills3"></cc1:FilteredTextBoxExtender>
                                                                            <%--     <asp:RequiredFieldValidator ID="Requiredfieldvalidator79" runat="server" ControlToValidate="skills3" Display="Dynamic"
                                                 ErrorMessage="Provide Skill 3" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true" >*</asp:RequiredFieldValidator>--%>

                                                                        </td>
                                                                        <td class="headings2">No of Years</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="sk3yrs" runat="server" Width="40px" MaxLength="2" TabIndex="87"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender61" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk3yrs"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">No of Months</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td style="width: 30px">
                                                                            <asp:TextBox ID="sk3mnts" runat="server" Width="40px" MaxLength="2" TabIndex="88"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender62" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk3mnts"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">Expert Level</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <%--<asp:TextBox ID="sk3exp" runat="server" Width="156px" MaxLength="50" TabIndex="78"> </asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender91" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk3exp"></cc1:FilteredTextBoxExtender>--%>
                                                                            <asp:Dropdownlist ID="sk3exp" runat="server"  Width="156px" TabIndex="89" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="sk3exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="trskills4" runat="server">
                                                                        <td class="headings2">Skills-4</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="skills4" runat="server" MaxLength="50" TabIndex="90"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender86" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890# " TargetControlID="skills4"></cc1:FilteredTextBoxExtender>
                                                                            </td>
                                                                        <td class="headings2">No of Years</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="sk4yrs" runat="server" Width="40px" MaxLength="2" TabIndex="91"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender63" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk4yrs"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">No of Months</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td style="width: 30px">
                                                                            <asp:TextBox ID="sk4mnts" runat="server" Width="40px" MaxLength="2" TabIndex="92"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender64" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk4mnts"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">Expert Level</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                           <%-- <asp:TextBox ID="sk4exp" runat="server" Width="156px" MaxLength="50" TabIndex="82"></asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender92" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk4exp"></cc1:FilteredTextBoxExtender>--%>
                                                                            <asp:Dropdownlist ID="sk4exp" runat="server"  Width="156px" TabIndex="93" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="sk4exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="trskills5" runat="server">
                                                                        <td class="headings2">Skills-5</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="skills5" runat="server" MaxLength="50" TabIndex="94"></asp:TextBox>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender87" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890# " TargetControlID="skills5"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td class="headings2">No of Years</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="sk5yrs" runat="server" Width="40px" MaxLength="2" TabIndex="95"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender65" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk5yrs"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">No of Months</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td style="width: 30px">
                                                                            <asp:TextBox ID="sk5mnts" runat="server" Width="40px" MaxLength="2" TabIndex="96"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender66" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk5mnts"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">Expert Level</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                           <%-- <asp:TextBox ID="sk5exp" runat="server" Width="156px" MaxLength="50" TabIndex="86"></asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender93" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk5exp"></cc1:FilteredTextBoxExtender>--%>
                                                                            <asp:Dropdownlist ID="sk5exp" runat="server"  Width="156px" TabIndex="97" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="sk5exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="trskills6" runat="server">
                                                                        <td class="headings2">Skills-6</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="skills6" runat="server" MaxLength="50" TabIndex="98"></asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender88" runat="server" InvalidChars="~`!@$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.1234567890 #" TargetControlID="skills5"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td class="headings2">No of Years</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="sk6yrs" runat="server" Width="40px" MaxLength="2" TabIndex="99"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender67" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk6yrs"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">No of Months</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td style="width: 30px">
                                                                            <asp:TextBox ID="sk6mnts" runat="server" Width="40px" MaxLength="2" TabIndex="100"></asp:TextBox>
                                                                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender68" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="sk6mnts"></cc1:FilteredTextBoxExtender></td>
                                                                        <td class="headings2">Expert Level</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                           <%-- <asp:TextBox ID="sk6exp" runat="server" Width="156px" MaxLength="50" TabIndex="90"></asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender94" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="sk6exp"></cc1:FilteredTextBoxExtender>--%>
                                                                            <asp:Dropdownlist ID="sk6exp" runat="server"  Width="156px" TabIndex="101" >
                                                                              <asp:ListItem>Novice</asp:ListItem>
                                                                              <asp:ListItem >Intermediate</asp:ListItem>
                                                                             <asp:ListItem>Advance</asp:ListItem>
                                                                             <asp:ListItem>Expert</asp:ListItem>
                                                                             </asp:Dropdownlist> 
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="sk6exp" Display="Dynamic"
                                                                                ErrorMessage="Provide Expert Level" InitialValue="Novice" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                        </td>
                                                                    </tr>

                                                                   
                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="2px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="9">
                                                                <table  width="100%">
                                                                    <tr>
                                                                        <td colspan="20" height="25px"><b><span style="font-size: 18px">Education Details </span></b></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu1" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">PG <%--<span style="color: red">*</span>--%></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu1" runat="server" Width="120px" MaxLength="50" TabIndex="102"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="edu1" Display="Dynamic"
                                                                                ErrorMessage="Provide Pg" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender95" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu1"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>

                                                                        <td class="headings2">Board/University<%--<span style="color: red">*</span>--%></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed1brd" runat="server" Width="150px" MaxLength="60" TabIndex="103"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="ed1brd" Display="Dynamic"
                                                                                ErrorMessage="Provide Board/University" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender96" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed1brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in<%--<span style="color: red">*</span>--%></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed1sub" runat="server" Width="150px" MaxLength="50" TabIndex="104"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="ed1sub" Display="Dynamic"
                                                                                ErrorMessage="Provide Major Subject" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender97" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed1sub"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass <%--<span style="color: red">*</span>--%></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed1yr" runat="server" Width="60px" MaxLength="4" TabIndex="105"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="ed1yr" Display="Dynamic"
                                                                                ErrorMessage="Provide Passing Year" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender69" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                                    ValidChars="1234567890" TargetControlID="ed1yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%) <%--<span style="color: red">*</span>--%></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed1per" runat="server" Width="50px" MaxLength="4" TabIndex="106"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="ed1per" Display="Dynamic"
                                                                                ErrorMessage="Provide Percentage" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                                                  <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender70" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed1per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu2" runat="server">
                                                                        <td>&nbsp;</td>
                                                                        <td class="headings2">Graduation <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu2" runat="server" Width="120px" MaxLength="50" TabIndex="107"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="edu2" Display="Dynamic"
                                                                                ErrorMessage="Provide Graduation" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender98" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu2"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td class="headings2">Board/University <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed2brd" runat="server" Width="150px" MaxLength="60" TabIndex="108"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="ed2brd" Display="Dynamic"
                                                                                ErrorMessage="Provide Board/University" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender99" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed2brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed2sub" runat="server" Width="150px" MaxLength="50" TabIndex="109"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="ed2sub" Display="Dynamic"
                                                                                ErrorMessage="Provide Major Subject" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender100" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed2sub"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed2yr" runat="server" Width="60px" MaxLength="4" TabIndex="110"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator9" runat="server" ControlToValidate="ed2yr" Display="Dynamic"
                                                                                ErrorMessage="Provide Passing Year" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender71" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed2yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%) <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed2per" runat="server" Width="50px" MaxLength="4" TabIndex="111"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator10" runat="server" ControlToValidate="ed2per" Display="Dynamic"
                                                                                ErrorMessage="Provide Pass Percentage" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender72" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed2per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu3" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">UG <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu3" runat="server" Width="120px" MaxLength="60" TabIndex="112"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator11" runat="server" ControlToValidate="edu3" Display="Dynamic"
                                                                                ErrorMessage="Provide under Graduation" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender101" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu3"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Board/University <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed3brd" runat="server" Width="150px" MaxLength="60" TabIndex="113"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator12" runat="server" ControlToValidate="ed3brd" Display="Dynamic"
                                                                                ErrorMessage="Provide Board/University" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender102" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed3brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed3sub" runat="server" Width="150px" MaxLength="60" TabIndex="114"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator13" runat="server" ControlToValidate="ed3sub" Display="Dynamic"
                                                                                ErrorMessage="Provide Major Subject" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender103" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed3sub"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass<span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed3yr" runat="server" Width="60px" MaxLength="4" TabIndex="115"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator14" runat="server" ControlToValidate="ed3yr" Display="Dynamic"
                                                                                ErrorMessage="Provide Passing Year" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender82" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed3yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%) <span style="color: red">*</span></td>
                                                                        <td>&nbsp; :</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed3per" runat="server" Width="50px" MaxLength="4" TabIndex="116"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator15" runat="server" ControlToValidate="ed3per" Display="Dynamic"
                                                                                ErrorMessage="Provide Pass Percentage" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender73" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed3per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu4" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">SSC <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu4" runat="server" Width="120px" MaxLength="60" TabIndex="117"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator16" runat="server" ControlToValidate="edu4" Display="Dynamic"
                                                                                ErrorMessage="Provide SSc" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender104" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu4"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Board/University <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed4brd" runat="server" Width="150px" MaxLength="60" TabIndex="118"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator17" runat="server" ControlToValidate="ed4brd" Display="Dynamic"
                                                                                ErrorMessage="Provide Board/University" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender105" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed4brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed4sub" runat="server" Width="150px" MaxLength="60" TabIndex="119"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator18" runat="server" ControlToValidate="ed4sub" Display="Dynamic"
                                                                                ErrorMessage="Provide Major Subject" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender106" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed4sub"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed4yr" runat="server" Width="60px" MaxLength="4" TabIndex="120"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator19" runat="server" ControlToValidate="ed4yr" Display="Dynamic"
                                                                                ErrorMessage="Provide Passing Year" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender81" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed4yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%) <span style="color: red">*</span></td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed4per" runat="server" Width="50px" MaxLength="4" TabIndex="121"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="Requiredfieldvalidator20" runat="server" ControlToValidate="ed4per" Display="Dynamic"
                                                                                ErrorMessage="Provide Pass Percentage" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender74" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed4per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu5" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">Other </td>
                                                                        <td></td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu5" runat="server" Width="120px" MaxLength="60" TabIndex="122"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender107" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu5"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Board/University </td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed5brd" runat="server" Width="150px" MaxLength="60" TabIndex="123"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender108" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed5brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in </td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed5sub" runat="server" Width="150px" MaxLength="60" TabIndex="124"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender109" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed5sub"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass </td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed5yr" runat="server" Width="60px" MaxLength="4" TabIndex="125"></asp:TextBox>

                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender80" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed5yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%) </td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed5per" runat="server" Width="50px" MaxLength="4" TabIndex="126"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender75" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed5per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu6" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">Other1</td>
                                                                        <td style="width: 5px">&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu6" runat="server" Width="120px" MaxLength="60" TabIndex="127"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender110" runat="server" InvalidChars=".1234567890 ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="edu6"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Board/University</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed6brd" runat="server" Width="150px" MaxLength="60" TabIndex="128"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender111" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed6brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed6sub" runat="server" Width="150px" MaxLength="60" TabIndex="129"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender112" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed1brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed6yr" runat="server" Width="60px" MaxLength="4" TabIndex="130"></asp:TextBox>
                                                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender79" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed6yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%)</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed6per" runat="server" Width="50px" MaxLength="4" TabIndex="131"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender76" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed6per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                    <tr id="tredu7" runat="server">
                                                                        <td></td>
                                                                        <td class="headings2">Other2</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="edu7" runat="server" Width="120px" MaxLength="60" TabIndex="132"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender113" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="edu7"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Board/University</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed7brd" runat="server" Width="150px" MaxLength="60" TabIndex="133"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender114" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_,=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="ed7brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Major in</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed7sub" runat="server" Width="150px" MaxLength="60" TabIndex="134"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender115" runat="server" InvalidChars=".1234567890~`!@#$%^&*()_=+<>/-"
                                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ," TargetControlID="ed1brd"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">Year Of&nbsp; Pass</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed7yr" runat="server" Width="60px" MaxLength="4" TabIndex="135"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender78" runat="server" InvalidChars=".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890" TargetControlID="ed7yr"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="headings2">(%)</td>
                                                                        <td>&nbsp;:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="ed7per" runat="server" Width="50px" MaxLength="4" TabIndex="136"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender77" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,/-"
                                                                    ValidChars="1234567890." TargetControlID="ed7per"></cc1:FilteredTextBoxExtender>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td height="2px">&nbsp;</td>
                                                                    </tr>

                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td height="5px">&nbsp;</td>
                                                        </tr>
                                                          <tr>
                                                            <td colspan="9">
                                                                <table  width="100%">
                                                                    <tr>
                                                                        <td ><span style="font-size: 18px">Non Immigrant Travel Record </span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td heigh="3px">&nbsp;</td>
                                                                    </tr>

<tr>
    <td colspan="6" table width="100%" >
               <table table width="100%" >
                <tr>
                    <td class="headings2">
                        <asp:Label ID="lblintial" runat="server" Text="Initial Landing in USA" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lblfrom" runat="server" Text="From" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lbldateofarrival" runat="server" Text="Date of Arrival" Font-Size="15px"></asp:Label>
                    </td>
                     <td class="headings2">
                        <asp:Label ID="lbli94" runat="server" Text="I-94 No" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lblvisatype" runat="server" Text="Visa Type" Font-Size="15px"></asp:Label>
                    </td>
                </tr>
                   
                <tr>
                    <td>
                        <asp:DropDownList ID="dduscitis" runat="server" Font-Size="15px" Width="170px" Height="25px">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                         <asp:DropDownList ID="ddindcitis" runat="server" Font-Size="15px" Width="170px" Height="25px">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                         <asp:TextBox ID="txtdateofarrival" runat="server" Font-Size="15px" Width="170px" Height="25px"></asp:TextBox>
                        <cc1:CalendarExtender ID="cc1a" runat="server" TargetControlID="txtdateofarrival" Format="MM/dd/yyyy"></cc1:CalendarExtender>
                    </td>
                     <td>
                           <asp:TextBox ID="txti94" runat="server" Font-Size="15px" Width="170px" Height="25px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddvisatype" runat="server" Font-Size="15px" Width="170px" Height="25px">
                                                    <asp:ListItem>Select</asp:ListItem>

                            <asp:ListItem>H1</asp:ListItem>
                            <asp:ListItem>B1</asp:ListItem>
                            <asp:ListItem>H4</asp:ListItem>
                            <asp:ListItem>J1</asp:ListItem>
                            <asp:ListItem>F1</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                     <tr>
                                                                        <td heigh="3px">&nbsp;</td>
                                                                    </tr>
                  <tr>
                    <td class="headings2">
                        <asp:Label ID="lblreason" runat="server" Text="Reason for Travel" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lblstayfrom" runat="server" Text="Stay From" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lblstayto" runat="server" Text="Stay TO" Font-Size="15px"></asp:Label>
                    </td>
                     <td class="headings2">
                        <asp:Label ID="lblvisalocation" runat="server" Text="Visa Stamp Location" Font-Size="15px"></asp:Label>
                    </td>
                    <td class="headings2">
                        <asp:Label ID="lblpassportcountry" runat="server" Text="Passport Issued Country" Font-Size="15px"></asp:Label>
                    </td>
                </tr>
                   
                <tr>
                    <td>
                        <asp:TextBox ID="txtreason" runat="server" Font-Size="15px" Width="170px" Height="25px"></asp:TextBox>
                    </td>
                    <td>
                                               <asp:TextBox ID="txtstayfrom" runat="server" Font-Size="15px" Width="170px" Height="25px"></asp:TextBox>

                    </td>
                    <td>
                                              <asp:TextBox ID="txtstayto" runat="server" Font-Size="15px" Width="170px" Height="25px"></asp:TextBox>

                    </td>
                     <td>
                                                <asp:DropDownList ID="ddvisastamp" runat="server" Font-Size="15px" Width="170px" Height="25px">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                </asp:DropDownList>

                    </td>
                    <td>
                                              <asp:DropDownList ID="ddindpassport" runat="server" Font-Size="15px" Width="170px" Height="25px">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                </asp:DropDownList>

                    </td>
                     <td>
                                            <asp:Button ID="btnsubmit1" runat="server" Text="Add" Font-Size="15px" Width="60px" OnClick="btnsubmit1_Click" />

                    </td>
                </tr>
            </table>
    </td>
</tr>

                                                                    <tr>
                                                                        <td heigh="3px">&nbsp;</td>
                                                                    </tr>

                                                                    <%--  <tr>
                                                <td colspan="12" align="center" class="headings">
                                                    <asp:Label ID="lbledudet" Visible="false" runat="server"></asp:Label>
                                                    <asp:LinkButton ID="lnkedu" runat="server" Text="Add Education Details" OnClick="lnkedu_Click" ></asp:LinkButton>
                                                </td> 
                                                <td colspan="8">&nbsp;</td>
                                            </tr>--%>
                                                                </table>
                                                            </td>
                                                        </tr>

                                             <tr>
                                                 <td colspan="8" width="100%">
                                                       <div id="divgrid1" runat="server" style="width:100%;">
               <%--   <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                <asp:GridView ID="GridView1" Width="80%" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="16px" DataKeyNames="sno"
                    ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting"  OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Sno" DataField="sno" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"  Visible="false" />--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("sno") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Initial Landing in USA" DataField="Initial_Landing_USA" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"  />--%>
                         <asp:TemplateField HeaderText="Initial Landing in USA">
                            <ItemTemplate>
                                <asp:Label ID="lbl" runat="server" Text='<%#Eval("Initial_Landing_USA") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtin" runat="server" Text='<%#Eval("Initial_Landing_USA") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="From">
                            <ItemTemplate>
                                <asp:Label ID="lbl1" runat="server" Text='<%#Eval("From_Location") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtfrom" runat="server" Text='<%#Eval("From_Location") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date of Arrival">
                            <ItemTemplate>
                                <asp:Label ID="lbl2" runat="server" Text='<%#Eval("Date_Arrived") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtdateArrive" runat="server" Text='<%#Eval("Date_Arrived") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="I-94 No">
                            <ItemTemplate>
                                <asp:Label ID="lbl3" runat="server" Text='<%#Eval("I94") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtI94" runat="server" Text='<%#Eval("I94") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Visa Type">
                            <ItemTemplate>
                                <asp:Label ID="lbl4" runat="server" Text='<%#Eval("Visa_Type") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtVisaType" runat="server" Text='<%#Eval("Visa_Type") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Reason for Travel">
                            <ItemTemplate>
                                <asp:Label ID="lbl5" runat="server" Text='<%#Eval("Reason_Travel") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtReasonTravel" runat="server" Text='<%#Eval("Reason_Travel") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Stay From">
                            <ItemTemplate>
                                <asp:Label ID="lbl8" runat="server" Text='<%#Eval("Stay_From") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtStayFrom" runat="server" Text='<%#Eval("Stay_From") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Stay To">
                            <ItemTemplate>
                                <asp:Label ID="lbl9" runat="server" Text='<%#Eval("Stay_To") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtStayTo" runat="server" Text='<%#Eval("Stay_To") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Visa Stamp Location">
                            <ItemTemplate>
                                <asp:Label ID="lbl6" runat="server" Text='<%#Eval("Visa_Stamp_Location") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtVisaStampLoc" runat="server" Text='<%#Eval("Visa_Stamp_Location") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Passport Issued Country">
                            <ItemTemplate>
                                <asp:Label ID="lbl7" runat="server" Text='<%#Eval("Passport_Issued_Country") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                                <asp:TextBox ID="txtPassportIssCountry" runat="server" Text='<%#Eval("Passport_Issued_Country") %>' ></asp:TextBox>
                             </EditItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="From" DataField="From_Location" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                         <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Date of Arrival" DataField="Date_Arrived" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                         <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="I-94 No" DataField="I94" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                         <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Visa Type" DataField="Visa_Type" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                        <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Reason for Travel" DataField="Reason_Travel" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                           <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Stay From" DataField="Stay_From" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                           <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Stay To" DataField="Stay_To" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                           <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Visa Stamp Location" DataField="Visa_Stamp_Location" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"   />--%>
                           <%--<asp:BoundField HeaderStyle-Width="120px" HeaderText="Passport Issued Country" DataField="Passport_Issued_Country" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center"    />--%>

                          <asp:TemplateField ItemStyle-Width="8%" HeaderText="Edit">    
                         <ItemTemplate>    
                              <asp:LinkButton ID="LinkButton3" Text="Edit" runat="server" CommandName="Edit" />    
                         </ItemTemplate>    
                         <EditItemTemplate>    
                             <asp:LinkButton ID="LinkButton5" Text="Update" runat="server" CommandName="Update"   ForeColor="Black" />    
                            <asp:LinkButton ID="LinkButton6" Text="Cancel" runat="server" OnClick="OnCancel" ForeColor="Black" />    
                         </EditItemTemplate>    
                      </asp:TemplateField>    
                        <asp:ButtonField HeaderText="Delete" ButtonType="Link" Text="Delete" CommandName="Delete" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <%--<EditRowStyle BackColor="#2461BF" ForeColor="White" Font-Size="14px" />--%>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="20px" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle  ForeColor="White" HorizontalAlign="Center" />
                    <%--<RowStyle BackColor="#EFF3FB" />--%>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                   <%--   </ContentTemplate>
            </asp:UpdatePanel>--%>
            </div>
                                                 </td>
                                             </tr>

                                             <tr>
                                                 <td><br /></td>
                                             </tr>
                                                        <tr>
                                                            <td colspan="3" align="right" class="headings2">Latest Image Upload :     
                                                            </td>
                                                            <td colspan="3" align="left">
                                                                <asp:FileUpload ID="txtimgfupload" runat="server" TabIndex="138"></asp:FileUpload>
                                                            </td>
                                                            <td align="right" class="headings2">Resume Upload :     </td>
                                                            <td colspan="2" align="left">
                                                                <asp:FileUpload ID="txtresupload" runat="server" TabIndex="139"></asp:FileUpload>
                                                            </td>
                                                        </tr>

                                                         <tr>
                                                            <td height="5px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="4" align="right" class="headings2">Certificates Upload :     
                                                            </td>
                                                                            <td>
                                                                            <asp:DataList ID="dlc" runat="server" >
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkc" runat="server" Text='<%# Eval("imgname") %>' CommandArgument='<%#Eval("did") %>' OnCommand="lnkc_Command"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                            </asp:DataList>
                                                                        </td>
                                                             <td>
                                                                 <asp:DropDownList ID="ddc" runat="server"  >
                                                                     <asp:ListItem>Select</asp:ListItem>
                                                                     <asp:ListItem>SSC</asp:ListItem>
                                                                     <asp:ListItem>Intermediate</asp:ListItem>
                                                                     <asp:ListItem>Graduation</asp:ListItem>
                                                                     <asp:ListItem>PG</asp:ListItem>
                                                                     <asp:ListItem>Other1</asp:ListItem>
                                                                     <asp:ListItem>Other2</asp:ListItem>
                                                                 
                                                                 </asp:DropDownList>
                                                                   <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="ddc" Display="Dynamic"
                                                           InitialValue="Select"                      ErrorMessage="Select Course" ValidationGroup="emp2" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                              </td>
                                                                        &nbsp;  &nbsp;  &nbsp;
                                                            <td  align="left">
                                                                <asp:FileUpload ID="filedoc" runat="server" TabIndex="140" ></asp:FileUpload>
                                                            </td>
                                                              &nbsp;  &nbsp;  &nbsp;
                                                                        <td>
                                                                       <asp:Button ID="upload" runat="server" Text="Upload" Width="70px" Height="30px" TabIndex="141" OnClick="upload_Click" ValidationGroup="emp2"   />
                                                                        </td>
                                                        </tr>
                                                       

                                                        <tr>
                                                            <td height="15px">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="12" align="center">
                                                                <asp:Button ID="Button1" runat="server" Text="Save" Width="70px" height="30px" TabIndex="141" OnClick="btnsubmit_Click1"  />

                                                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="70px" height="30px" TabIndex="141" OnClick="btnsubmit_Click"  ValidationGroup="emp" />
                                                                <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="70px" height="30px" TabIndex="142" OnClick="btncancel_Click" />
                                                            </td>
                                                        </tr>

                                                        <tr height="15">
                                                            <td colspan="8" class="headings2" align="center">
                                                                <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
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


