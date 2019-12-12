<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpNewFrmCreate.aspx.cs" Inherits="admin_Admin_EmpNewFrmCreate" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - EmpNewFrmCreate</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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
    <center>
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
     <tr><td height="20px"></td></tr>
    <tr>
      <td id="tdcontent" runat="server" align="left" valign="top" class="lable"> 
        <table style="width:750px; height: 315px" border="0"  cellpadding="3" cellspacing="5">
            <tr>
                <td align='center' width='100%' colspan="3"><font color='#003399' size='3pt'><b>PROSPECTIVE EMPLOYEE DATA SHEET</b></font> </td>
            </tr>
            <tr>
                <td style="width: 100px;" colspan="3">
                    <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
             <td style="width: 15%"></td>
             <td class="lable">
                    Family Name (Last Name):
             </td>
             <td style="width: 100px" class="lable">
                    <asp:TextBox ID="faname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvlname" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Last name" ControlToValidate="faname">*</asp:RequiredFieldValidator>
             </td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td class="lable">
                    First Name:
                </td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="fname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvfname" runat="server"  ValidationGroup="empreg"
                        ErrorMessage="Please Enter First name" ControlToValidate="fname">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td class="lable">
                    Full Middle Name:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="mname" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable" >
                    All Other Names Used(Include maiden name and names from<br />
                    all previous marriages)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="othernames" runat="server" Height="32px" Width="180px"></asp:TextBox>
                 <%--   <asp:RequiredFieldValidator ID="rfvoname" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Other Name Before or After Marriage" ControlToValidate="othernames">*</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Present Address(Street/City/State/Zip/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="presaddr" runat="server" Height="28px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvaddr" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Address" ControlToValidate="presaddr">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Permenant Address
                    (Street/City/State/Zip/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="permaddr" runat="server" Height="31px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpadd" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Permanent Address" ControlToValidate="permaddr">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Permenat Address in Foreign Country:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="permaddr_f" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Birth Date (MM/DD/YYYY):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="dob" runat="server" ReadOnly="false" Width="180px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dob">
                    </cc1:CalendarExtender>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Birth Place
                    (City/Town/State/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="bplace" runat="server" Height="28px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvbplace" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Birth Place" ControlToValidate="bplace">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Country of Citizenship:</td>
                <td style="width: 100px" class="lable">
                    <asp:DropDownList ID="ccitizen" runat="server" Width="180px">
                    <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                    </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="rfvcountry" runat="server" InitialValue="Select Country"
                 ErrorMessage="please select country" ValidationGroup="empreg"
                 ControlToValidate="ccitizen" >*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Social Security Number(if any):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ssno" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Alien Registration Number(if any):&nbsp;</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="arno" runat="server" Width="180px"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="rfvregnum" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="arno">*</asp:RequiredFieldValidator>--%>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Dependendant Tax Identification Number(if any):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="taxno" runat="server" Width="180px"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="rfvtin" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="taxno">*</asp:RequiredFieldValidator>--%>
                    </td>
            </tr>
             <tr><td colspan="3" height="20px"></td></tr>
            <tr>
                <td colspan="3" class="lableb" align="center"><b>IF THE BENEFICIARY IS IN THE U.S ., please provide the following information</b></td>
            </tr>
             <tr><td colspan="3" height="10px"></td></tr>
            <tr>
                <td width="15%">
                 </td>
                <td class="style25">
                    Current Nonimmigrant Status:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="nonimm" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td width="15%">
                 </td>
                <td class="style25">
                    Date Of most recent Admission to the U.S.
                    (MM/DD/YYYY)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="usaddmission" runat="server" ReadOnly="false" Width="180px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="usaddmission">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
            <td width="15%">
             </td>
                <td class="style25">
                    I-94 Number:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="i94no" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
        </table>
        <table style="width: 981px">
            <tr>
                <td class="lable"> &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 <asp:Button Text="Save & Continue" ID="btnedit" runat="server" Width="204px" OnClick="btnedit_Click"
                 ValidationGroup="empreg" />
                </td>
            </tr>
        </table>
      </td>
    </tr>
</table>
</center>
    </form>
</body>
</html>
