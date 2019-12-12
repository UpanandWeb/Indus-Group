<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpNewForm_Edit.aspx.cs" Inherits="admin_Admin_EmpNewForm_Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title> : : Indus Group : : - Admin Control Panel - EmpNewForm_Edit</title>
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
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
    {
        alert("Employee Details has been edited Successfully");
    }
    
    function alertdelete()
    {
        alert("Employee Details has been deleted Successfully");
    }
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
    <style type="text/css">
        .style24
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 121px;
        }
        .style25
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 120px;
        }
    </style>
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <center>
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
 <table width="998" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr style="width:998px;">
        <td valign="top" width='100%' class="lblog" >
        <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    
    <tr>
      <td id="tdcontent" runat="server" align="left" valign="top" width="998px;" class="lable"> 
         <table style="width:998px; height: 315px" border="0"  cellpadding="3" cellspacing="5">
            <tr>
                <td align='center' width='100%' colspan="3"><br /><br /><font color='#003399' size='3pt'><b>EDIT PROSPECTIVE EMPLOYEE DATA SHEET</b>
                 <br /><br /></td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                 <td class="lable">Email ID</td>
                 <td style="width: 100px" class="lable">
                   <asp:Label ID="idi" runat="server"></asp:Label>
                 </td>
            </tr>
            <tr>
             <td style="width: 15%">
             </td>
             <td class="lable">
                  Family Name (Last Name):</td>
             <td style="width: 100px" class="lable">
                 <asp:TextBox ID="faname" runat="server" Width="180px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvlname" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Last name" ControlToValidate="faname">*</asp:RequiredFieldValidator>
                 </td>
            </tr>
            <tr>
            <td style="width: 15%">
             </td>
                <td class="lable">
                    First Name:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="fname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvfname" runat="server"  ValidationGroup="empreg"
                        ErrorMessage="Please Enter First name" ControlToValidate="fname">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
            <td style="width: 15%">
             </td>
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
                    Permenant Address(Street/City/State/Zip/Country)</td>
                <td style="width: 168px" class="lable">
                    <asp:TextBox ID="permaddr" runat="server" Height="31px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvpadd" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Permanent Address" ControlToValidate="permaddr">*</asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
            <td style="width: 15%">
             </td>
                <td style="width: 171px" class="lable">
                    Permenat Address in Foreign Country:</td>
                <td style="width: 168px" class="lable">
                    <asp:TextBox ID="permaddr_f" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
            <td style="width: 15%">
             </td>
                <td class="lable">
                    Birth Date (MM/DD/YYYY):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="dob" runat="server" ReadOnly="true" Width="180px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dob">
                    </cc1:CalendarExtender>
                    </td>
            </tr>
            <tr>
            <td style="width: 15%">
             </td>
                <td class="lable">
                    Birth Place:<br />
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
                    <asp:TextBox ID="ccitizen" runat="server" Width="180px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvcountry" runat="server"
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
                    Date Of most recent Admission to the U.S.(MM/DD/YYYY)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="usaddmission" runat="server" ReadOnly="true" Width="180px"></asp:TextBox>
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
                <td class="lable" align="center">
                 <asp:Button Text="Update & Continue" ID="btnedit" runat="server" Width="204px"  ValidationGroup="empreg"
                        onclick="btnedit_Click1"/>
                        
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