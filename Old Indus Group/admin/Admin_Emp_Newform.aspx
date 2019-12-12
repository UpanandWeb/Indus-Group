<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_Newform.aspx.cs" Inherits="Employee_Newform" %>--%>

<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Admin_Emp_Newform.aspx.cs" Inherits="Admin_Emp_Newform" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - EmployeeRegistration</title>
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
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script language="Javascript" type="text/javascript">

        function moveOnMax(field, nextFieldID) {
            if (field.value.length >= field.maxLength) {
                document.getElementById(nextFieldID).focus();
            }
        }

    </script>
    <script language="Javascript" type="text/javascript">
       <!--    Users_Information
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </script>
    <script language="javascript" type="text/javascript">
        function skltest(field) {
            if (field.value != "") {
                document.frmRegistration.hdnskl.value = field.value;
                alert(document.frmRegistration.hdnskl.value)
            }
            else {

                document.frmRegistration.hdnskl.value = "";
                //  alert(document.regForm.hidState.value)
            }
        }


        function exptest(field) {
            if (field.value != "") {
                document.frmRegistration.hdnexp.value = field.value;
                alert(document.frmRegistration.hdnexp.value)
            }
            else {

                document.frmRegistration.hdnexp.value = "";
                //  alert(document.regForm.hidState.value)
            }
        }



        function yrstest(field) {
            if (field.value != "") {
                document.frmRegistration.hdnyrs.value = field.value;
                alert(document.frmRegistration.hdnyrs.value)
            }
            else {

                document.frmRegistration.hdnyrs.value = "";
                //  alert(document.regForm.hidState.value)
            }
        }


    </script>

    <script language="JavaScript" src="addrows.js" type="text/javascript"></script>
    <script language="JavaScript" src="Jscripts/regformvalidation.js" type="text/javascript"></script>

    <style type="text/css">
        .style24 {
            width: 3%;
        }
    </style>

</head>

<body topmargin="0" bottommargin="0" leftmargin="0">
    <form id="frmRegistration" name="frmRegistration" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <center>
<table width="96%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>


<tr>
<td width="80%" valign="top">
<table width="100%">
<tr height="19">
               <td width="100%" align="center" class="toplft" height="15" colspan="2"><u>Employee Registration</u>
                   </td>
              </tr>
              <tr height="19">
               <td >&nbsp;
                   </td>
              </tr>
              <tr height="190">
             <%-- <td width="20%" align="left"></td>--%>
                <td  align="center" class="border"  valign="top" width="80%"  style="height: 190px;">
      <table width="99%" cellpadding="0" cellspacing="2" align="left">
  
  
  <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Login Details</span></td>
    </tr>    
    <tr style="height:15px;">
    
    <td>
    <table>  
    <tr>
      <td width="15%" align="center" colspan="10" style="color: #174eb4;background-color: #ffffff;font-size: 12px;font-weight: normal;font-family: Geneva, Arial, Helvetica, sans-serif;height: 20px;">*Email ID<strong>&nbsp;:&nbsp;</strong>
             <asp:TextBox ID="txtemail" runat="server"  Width="190px" CssClass="headings2"
             BorderWidth="1"  BorderColor="Black" AutoPostBack="true"
            ontextchanged="txtemail_TextChanged" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="Please Enter Email Address" ControlToValidate="txtemail" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ErrorMessage="Please Enter Valid Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail" 
                  ValidationGroup="Empform">*</asp:RegularExpressionValidator>
                   <asp:Image ID="imgcheck1" ImageUrl="../admin/images/check.gif" runat="server" Width="17px" Height="17px" Visible="false"/>
           <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label><br />
         
     </td>
    </tr>
</table>
</td>
</tr>
 <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Employee Information</span></td>
    </tr>  
    
    <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">   
      <tr>
      <td width="15%" class="headings2" align="left" height="15px">*First Name</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" style="padding-top:2px;margin-bottom:4px;" valign="middle">
     <asp:TextBox ID="fname" runat="server"  Width="170px" 
             BorderWidth="1"   BorderColor="Black"  ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" ControlToValidate="fname" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
     </td>

      <td width="15%" class="headings2" align="left">*Middle Name</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" style="padding-top:2px;margin-bottom:4px;" valign="middle">
      <asp:TextBox ID="mname" runat="server" Width="170px" style="margin-top:0px"
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
     </td>
      <td width="15%" class="headings2" align="left">*Last Name</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" style="padding-top:2px;margin-bottom:4px;" valign="middle">
     <asp:TextBox ID="lname" runat="server"  Width="170px" style="margin-top:0px; padding-right:15px;"
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Last Name" ControlToValidate="lname" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
     </td>
    </tr>

    <tr>
      <td width="15%" class="headings2" align="left">*Gender</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" style="padding-top:2px;margin-bottom:4px;" valign="middle">
      <asp:RadioButtonList ID="gend" runat="server" RepeatDirection="Horizontal" CssClass="headings2_rb" Width="170px" style="margin-top:0px">
    <asp:ListItem Value="Male" Selected="True"  Text="  Male"></asp:ListItem>
    <asp:ListItem Value="Female"  Text="  Female"></asp:ListItem>
    </asp:RadioButtonList>
     </td>

      <td width="15%" class="headings2" align="left">*Mobile Number</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" style="padding-top:2px;margin-bottom:4px;" valign="middle">
       <asp:TextBox ID="txtmobile" runat="server"  Width="170px" BorderWidth="1"  BorderColor="Black" MaxLength="10" onkeypress="return isNumberKey(event)" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="Rfvfat" runat="server" ErrorMessage="*" ValidationGroup="Empform"
      ControlToValidate="fatname">*</asp:RequiredFieldValidator>
         
     </td>
      <td width="15%" class="headings2" align="left">*Marital Status</td>
      <td class="headings2_colon" valign="middle"><strong>&nbsp;:&nbsp;</strong></td>
       <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;margin-bottom:4px;" valign="middle">
     <asp:RadioButton ID="chkmarried" runat="server" Text="Married" class="headings2_percent" GroupName="marital" AutoPostBack="true" /> &nbsp; 
     <asp:RadioButton ID="chkunmaried" class="headings2_percent" runat="server" GroupName="marital" AutoPostBack="true"  Text="Unmarried" Checked="true" />
         
     </td>
    </tr>  
    
    </table>
    </td>
    </tr>
    
 <%--Present Address--%>
    <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Birth Details</span></td>
    </tr>  
    
   
   
  <tr>
    <td>
  
   <table width="100%" border="0" cellpadding="0" cellspacing="0">   
      <tr>
          <td width="15%" class="headings2" align="left" height="15px" style="padding-top:2px;padding-bottom:3px;">*Birth Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="txtbdate" runat="server" Width="170px"  
                 BorderWidth="1"  BorderColor="Black" style="margin-top:0px"></asp:TextBox>
             <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtbdate">
             </cc1:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Select Birth Date" ControlToValidate="txtbdate" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Birth Country</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
          <asp:Dropdownlist ID="bcountry" runat="server"  Width="171px"  
                 BorderWidth="1"  BorderColor="Black" AutoPostBack="true" style="margin-top:0px"
                 onselectedindexchanged="bcountry_SelectedIndexChanged" >
         <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
         </asp:Dropdownlist>
     
             <asp:RequiredFieldValidator ID="RequiredFieldValidator35" InitialValue="Select Country"
              runat="server" ErrorMessage="Please Select Birth Country" ControlToValidate="bcountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Birth State</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
         <asp:Dropdownlist ID="bstate" runat="server"  Width="171px"
         style="margin-top:0px"  BorderWidth="1"  BorderColor="Black" 
                 onselectedindexchanged="bstate_SelectedIndexChanged" AutoPostBack="true">
         <asp:ListItem Text="Select State">Select State</asp:ListItem>
         </asp:Dropdownlist>
   
             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" InitialValue="Select State"
              ErrorMessage="Please Select Birth State" ControlToValidate="bstate" ValidationGroup="Empform">*</asp:RequiredFieldValidator>  
         
         </td>
    </tr>

    <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">* Birth City</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
         <asp:DropDownList ID="bcity" runat="server"  Width="171px"  BorderWidth="1"  BorderColor="Black">
         <asp:ListItem Text="Select City">Select City</asp:ListItem>
         </asp:DropDownList>
     
             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" InitialValue="Select City" runat="server" ErrorMessage="Please Select Birth City" ControlToValidate="bcity" ValidationGroup="Empform">*</asp:RequiredFieldValidator>      
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Citizenship</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:Dropdownlist ID="ccountry" runat="server"  BorderWidth="1"  BorderColor="Black"  Width="171px">
         <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
         </asp:Dropdownlist>
     
             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please Select Citizenship" ControlToValidate="ccountry" InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;Passport No</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
          <asp:TextBox ID="passno" runat="server"  Width="171px"  BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
         </td>
     </tr> 
     <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;Issued at</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="pcountry" runat="server"  Width="171px" BorderWidth="1px" BorderColor="Black">
              <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
              </asp:Dropdownlist>
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;Issue Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="txtisdate" runat="server"  Width="171px"  
                 BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;Expiry Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="txtexpdate" runat="server"  Width="171px"  
                 BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                  <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtexpdate">
             </cc1:CalendarExtender>
         
         </td>
     </tr>  
     <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Nationality</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="ncountry" runat="server"  Width="171px"  BorderWidth="1px" BorderColor="Black" style="margin-top:0px">
                  <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
              </asp:Dropdownlist>  
              <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Please Select Nationality" InitialValue="Select Country"
              ControlToValidate="ncountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           &nbsp;
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;"> &nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            &nbsp;
         
         </td>
    </tr>    
    </table>
    </td>
    </tr>
      <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Family Information</span></td>
    </tr> 
    <tr>
    <td>
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Father Name</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="fatname" runat="server" CssClass="headings2" Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="Empform"
                       ControlToValidate="fatname">*</asp:RequiredFieldValidator>
         
         </td>

          <td width="15%" class="headings2" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Mother Name</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="motname" runat="server" CssClass="headings2_terms1" Width="171px" 
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvmname" runat="server" ErrorMessage="*" ValidationGroup="Empform"
                      ControlToValidate="motname">*</asp:RequiredFieldValidator>
     
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator19" InitialValue="Select Country"
              runat="server" ErrorMessage="Please Select Birth Country" ControlToValidate="bcountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>--%>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             &nbsp;
         
         </td>
    </tr>
    <tr id="trsname" runat="server">
          <td width="15%" class="headings2" align="left" height="15px" style="padding-top:2px;padding-bottom:3px;">&nbsp;Spouse Name</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="mmname" runat="server" CssClass="headings2" Width="171px" 
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Spouse Gender</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:RadioButtonList ID="spgen" runat="server" RepeatDirection="Horizontal" CssClass="headings2_rb" Width="171px">
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
     
             <asp:RequiredFieldValidator ID="RequiredFieldValidator40" InitialValue="Select Country"
              runat="server" ErrorMessage="Please Select Birth Country" ControlToValidate="bcountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2_rb" align="left" style="padding-top:2px;padding-bottom:3px;">Spouse Birth Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="txtsb" runat="server" Width="171px" 
                 BorderWidth="1"  BorderColor="Black"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtsb">
                 </cc1:CalendarExtender>
         
         </td>
    </tr>
     <tr id="trchname" runat="server">
          <td width="15%" class="headings2" align="left" height="15px" style="padding-top:2px;padding-bottom:3px;">Child Name - 1</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="k1name" runat="server" Width="171px"  BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Child Name - 2</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="k2name" runat="server" Width="171px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
     
             <asp:RequiredFieldValidator ID="RequiredFieldValidator38" InitialValue="Select Country"
              runat="server" ErrorMessage="Please Select Birth Country" ControlToValidate="bcountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Child Name - 3</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="k3name" runat="server" Width="171px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
    </tr>  
      <tr id="trchgender" runat="server">
          <td width="15%" class="headings2" align="left" height="15px" style="padding-top:2px;padding-bottom:3px;">&nbsp;Gender</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:RadioButtonList ID="k1gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2_rb" Width="171px">
                 <asp:ListItem Value="Male">Male</asp:ListItem>
                     <asp:ListItem Value="Female">Female</asp:ListItem>
                     </asp:RadioButtonList>
         
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Gender</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:RadioButtonList ID="k2gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2_rb" Width="171px">
              <asp:ListItem Value="Male">Male</asp:ListItem>
             <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Gender</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:RadioButtonList ID="k3gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2_rb" Width="171px">
                <asp:ListItem Value="Male">Male</asp:ListItem>
                   <asp:ListItem Value="Female">Female</asp:ListItem>
                   </asp:RadioButtonList>
         
         </td>
    </tr>      
      <tr id="trchbdate" runat="server">
          <td width="15%" class="headings2" align="left" height="15px" style="padding-top:2px;padding-bottom:3px;">&nbsp;Birth Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="txtk1bd" runat="server"  Width="171px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
             <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtk1bd">
             </cc1:CalendarExtender>
         
         </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Birth Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="txtk2bd" runat="server" Width="171px"  BorderWidth="1"  BorderColor="Black"></asp:TextBox>
             <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtk2bd">
             </cc1:CalendarExtender>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Birth Date</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="txtk3bd" runat="server" Width="171px"  BorderWidth="1"  BorderColor="Black"></asp:TextBox>
             <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtk3bd">
             </cc1:CalendarExtender>
         
         </td>
    </tr> 
    
    <tr height="15">
    
    <td></td>
    </tr>    
    </table>
    </td>
    </tr>
     <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Present Address</span></td>
    </tr>   
  <tr>    
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Country</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:Dropdownlist ID="country" runat="server" 
                 BorderWidth="1"  BorderColor="Black"  AutoPostBack="true" Width="171px" onselectedindexchanged="country_SelectedIndexChanged"   >        
               <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
                    </asp:Dropdownlist>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Select Present Country" ControlToValidate="country" InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*State</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:Dropdownlist ID="state" runat="server" Width="171px"  
             BorderWidth="1"  AutoPostBack="true" BorderColor="Black" 
             onselectedindexchanged="state_SelectedIndexChanged" >
             <asp:ListItem Text="Select State">Select State</asp:ListItem>
             </asp:Dropdownlist>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="Select State"
                ErrorMessage="Please Select  State" ControlToValidate="state" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="center" style="padding-top:2px;padding-bottom:3px;">*City</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:DropDownList ID="city" runat="server" Width="171px"  BorderWidth="1"  BorderColor="Black" >
                   <asp:ListItem Text="Select City">Select City</asp:ListItem>
                   </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Select Present City" InitialValue="Select City" ControlToValidate="city" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td>
    </tr>  
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Address</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="street" runat="server" Width="171px" 
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
              ErrorMessage="Please Enter address" ControlToValidate="street" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Zip</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="zip" runat="server" Width="171px"  MaxLength="6" onkeypress="return isNumberKey(event)"
                     BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Please Enter Zip code" 
                 ControlToValidate="zip" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               &nbsp;
          </td>
    </tr> 
      <tr>
          <td width="15%" class="headings2_phone" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Ph:Work</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="wp1" runat="server"  Width="50px" 
             BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'wp1')" ></asp:TextBox>   
             <asp:TextBox ID="wp2" runat="server"  Width="50px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'wp2')"></asp:TextBox>   
                 <asp:TextBox ID="wp3" runat="server"  Width="62px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="4" onkeyup="moveOnMax(this,'wp3')"></asp:TextBox>   
                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Numbers" TargetControlID="wp1"></cc1:FilteredTextBoxExtender>
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="Numbers" TargetControlID="wp2"></cc1:FilteredTextBoxExtender> 
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" FilterType="Numbers" TargetControlID="wp3"></cc1:FilteredTextBoxExtender>
   
          </td>
          <td width="15%" class="headings2_phone" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Ph:Home</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_state" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="hp1" runat="server"  Width="50px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'hp1')"></asp:TextBox>   
               <asp:TextBox ID="hp2" runat="server"  Width="50px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="3"  onkeyup="moveOnMax(this,'hp2')"></asp:TextBox>   
               <asp:TextBox ID="hp3" runat="server"  Width="62px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="4"  onkeyup="moveOnMax(this,'hp3')"></asp:TextBox>   
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="hp1"></cc1:FilteredTextBoxExtender>
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="hp2"></cc1:FilteredTextBoxExtender> 
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers" TargetControlID="hp3"></cc1:FilteredTextBoxExtender>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Home number" ValidationGroup="Empform"
                  ControlToValidate="hp1" >*</asp:RequiredFieldValidator>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Enter Home number"
                ValidationGroup="Empform" ControlToValidate="hp2" >*</asp:RequiredFieldValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Enter Home number" 
                ValidationGroup="Empform" ControlToValidate="hp3" >*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" valign="top" style="padding-top:2px;">&nbsp;</td>
          <td class="headings2_colon" valign="top" style="padding-top:2px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;" valign="middle">
               &nbsp;
          </td>
    </tr> 
     </table>
    </td>
    </tr>

    <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Permanent Address</span></td>
    </tr>   
    <tr >    
    <td>
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Country</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:Dropdownlist ID="prcountry" runat="server" 7
             BorderWidth="1"  BorderColor="Black"  AutoPostBack="true" Width="171px" onselectedindexchanged="prcountry_SelectedIndexChanged"   >        
           <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
           </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
         ErrorMessage="Please Select Present Country" ControlToValidate="prcountry"
          InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>  
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*State</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_state" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:Dropdownlist ID="prstate" runat="server"  Width="171px"  
             BorderWidth="1"  BorderColor="Black" 
             onselectedindexchanged="prstate_SelectedIndexChanged" AutoPostBack="true">
             <asp:ListItem Text="Select State">Select State</asp:ListItem>
             </asp:Dropdownlist>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" InitialValue="Select State"
                ErrorMessage="Please Select  State" ControlToValidate="prstate" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="center" style="padding-top:2px;padding-bottom:3px;">*City</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:DropDownList ID="txtprcity" runat="server"  Width="171px"  BorderWidth="1"  BorderColor="Black" >
                <asp:ListItem Text="Select City">Select City</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" InitialValue="Select City" runat="server" ErrorMessage="Please Select Present City"
                    ControlToValidate="txtprcity" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td>
      </tr>  
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Address</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="txtpraddress" runat="server"  Width="171px" 
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server"
          ErrorMessage="Please Enter address" ControlToValidate="txtpraddress" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Zip</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="txtprzip" runat="server" Width="171px"  MaxLength="6" onkeypress="return isNumberKey(event)"
                     BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Please Enter Zip code" 
            ControlToValidate="txtprzip" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               &nbsp;
          </td>
    </tr> 
      <tr>
          <td width="15%" class="headings2_phone" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Ph:Work</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="wpr1" runat="server"  Width="50px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'wpr1')" ></asp:TextBox>   
             <asp:TextBox ID="wpr2" runat="server"  Width="50px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'wpr2')"></asp:TextBox>   
             <asp:TextBox ID="wpr3" runat="server" Width="62px" 
                     BorderWidth="1"  BorderColor="Black" MaxLength="4" onkeyup="moveOnMax(this,'wpr3')"></asp:TextBox>   
                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers" TargetControlID="wpr1"></cc1:FilteredTextBoxExtender>
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers" TargetControlID="wpr2"></cc1:FilteredTextBoxExtender> 
               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers" TargetControlID="wpr3"></cc1:FilteredTextBoxExtender>
   
          </td>
          <td width="15%" class="headings2_phone" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Ph:Home</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td align="left" class="headings2_state" style="padding-top:2px; padding-bottom:3px;" valign="middle">
                          <asp:TextBox ID="hpr1" runat="server"  Width="50px" 
                         BorderWidth="1"  BorderColor="Black" MaxLength="3" onkeyup="moveOnMax(this,'hpr1')"></asp:TextBox>   
                 <asp:TextBox ID="hpr2" runat="server"  Width="50px" 
                         BorderWidth="1"  BorderColor="Black" MaxLength="3"  onkeyup="moveOnMax(this,'hpr2')"></asp:TextBox>   
                 <asp:TextBox ID="hpr3" runat="server"  Width="64px" 
                         BorderWidth="1"  BorderColor="Black" MaxLength="4"  onkeyup="moveOnMax(this,'hpr3')"></asp:TextBox>   
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers" TargetControlID="hpr1"></cc1:FilteredTextBoxExtender>
                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers" TargetControlID="hpr2"></cc1:FilteredTextBoxExtender> 
                   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers" TargetControlID="hpr3"></cc1:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Enter Home number" ValidationGroup="Empform"
                 ControlToValidate="hpr1" >*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Enter Home number"
                ValidationGroup="Empform" ControlToValidate="hpr2" >*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Enter Home number" 
                ValidationGroup="Empform" ControlToValidate="hpr3" >*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" valign="top" style="padding-top:0px;padding-bottom:0px;">&nbsp;</td>
          <td class="headings2_colon" valign="top" style="padding-top:0px;padding-bottom:0px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:0px;padding-bottom:0px;" valign="middle">
               &nbsp;
          </td>
    </tr> 
     </table>
    </td>
    </tr>
    <%--Emergency Details    --%>
 <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Emergency Contact Person Details</span></td>
    </tr> 
  <tr >
    <td >
      <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:250%;">
       <tr>
          <td width="15%" class="headings2" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Cont. Person-1</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="cpname1" runat="server" Width="171px"  BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Enter contact person"
                 ControlToValidate="cpname1" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
     
           </td>

          <td width="15%" class="headings2" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Phone No</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="cpphone1" runat="server"  MaxLength="10" Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server" FilterType="Numbers"
                      TargetControlID="cpphone1"></cc1:FilteredTextBoxExtender>                      
                         <asp:RequiredFieldValidator ID="rfvphoneNo" runat="server" 
                              ErrorMessage="Please Enter Phone Number" ControlToValidate="cpphone1" 
                               ValidationGroup="Empform">*</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revPhno" runat="server" 
                              ControlToValidate="cpphone1" ValidationGroup="Empform"
                              ErrorMessage="Please enter a valid phone number of 10 digits" 
                              ValidationExpression="\d{10}" >*</asp:RegularExpressionValidator>
         
         </td>
          <td width="15%" class="headings2" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Email ID</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="cpemail1" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Enter email id" 
                  ControlToValidate="cpemail1" ValidationGroup="Empform" >*</asp:RequiredFieldValidator>        
                   <asp:RegularExpressionValidator ID="Regulaexp" runat="server" 
                         ErrorMessage="Enter valid email" ControlToValidate="cpemail1" ValidationGroup="Empform"
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
          </td>
      </tr>  
       <tr>
          <td width="15%" class="headings2" align="left" valign="top" style="padding-top:2px;padding-bottom:3px;">*Address</td>
          <td class="headings2_colon" valign="top" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="top">
             <asp:TextBox ID="cpaddr1" runat="server"  Width="171px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvadd" runat="server" ErrorMessage="Enter address"
             ValidationGroup="Empform" ControlToValidate="cpaddr1" >*</asp:RequiredFieldValidator>  
          </td>
          <td width="15%" class="headings2" align="left" valign="top" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="top" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="top">
             &nbsp;
         
         </td>
          <td width="15%" class="headings2" align="left" valign="top" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="top" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="top">
               &nbsp;
          </td>
    </tr> 
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Cont. Person-2</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="cpname2" runat="server"  Width="171px"  BorderWidth="1"  BorderColor="Black"></asp:TextBox>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Phone No</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="cpphone2" runat="server" Width="171px" BorderWidth="1"  BorderColor="Black"  MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="Ftbcpphone2" runat="server" FilterType="Numbers" TargetControlID="cpphone2"></cc1:FilteredTextBoxExtender>
          </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Email ID</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="cpemail2" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
      
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Enter valid email" ControlToValidate="cpemail2" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
          </td>
      </tr>  
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Address</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             <asp:TextBox ID="cpaddr2" runat="server"  Width="171px"  
                BorderWidth="1"  BorderColor="Black" ></asp:TextBox> 
          </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
             &nbsp;
         
         </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               &nbsp;
          </td>
    </tr>       
     </table>
     </td>
    </tr>

<%--Professional Experience    --%>
  <tr style="height:25px;" class="headings2">
      <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Professional Experience Details</span></td>
    </tr>  
 <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
          <td width="15%" class="headings2_terms1" align="left" style="padding-top:2px;padding-bottom:3px;">*Total Exp.Yrs & Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" class="headings2_percent" valign="middle">
               <asp:TextBox ID="expyrs" runat="server" MaxLength="3"  Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
             <asp:TextBox ID="expmon" runat="server" MaxLength="2" Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
      
          <asp:RequiredFieldValidator ID="RequiredField" runat="server" ErrorMessage="Enter experience years and months"
           ControlToValidate="expyrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">*Designation</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="fnarea" runat="server" Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="Enter Designation" 
          ControlToValidate="fnarea" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         
         </td>
          <td width="15%" class="headings2_percent" align="left" style="padding-top:2px;padding-bottom:3px;">*Current Company</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="currind" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Current Industry" 
          ControlToValidate="currind" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td>
    </tr>  
       <tr>
          <td width="15%" class="headings2_terms1" align="left" style="padding-top:2px;padding-bottom:3px;">Total Exp.Yrs & Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" class="headings2_percent" valign="middle">
               <asp:TextBox ID="expyrs1" runat="server" MaxLength="3"  Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
                 <asp:TextBox ID="expmon1" runat="server" MaxLength="2"  Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Designation</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="fnarea1" runat="server" Width="171px" BorderWidth="1"  BorderColor="Black"></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent" align="left" style="padding-top:2px;padding-bottom:3px;">Previous Company</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="currind1" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
    </tr>
        <tr>
          <td width="15%" class="headings2_terms1" align="left" style="padding-top:2px;padding-bottom:3px;">Total Exp.Yrs & Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="expyrs2" runat="server" MaxLength="3" Width="50px"  
             BorderWidth="1"  BorderColor="Black"  onkeypress="return isNumberKey(event)"></asp:TextBox>
                 <asp:TextBox ID="expmon2" runat="server" MaxLength="2"  Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
     
           </td>

          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">&nbsp;Designation</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="fnarea2" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent" align="left" style="padding-top:2px;padding-bottom:3px;">Previous Company</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="currind2" runat="server"  Width="171px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
    </tr>
     </table>
    </td>
   </tr>
<%--Skills    --%>
<tr class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Skills</span></td>
 </tr> 
<tr >
    <td>
    <table width="100%" style="height:20px;" border="0" cellpadding="0" cellspacing="0">
     <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">*Skills - 1</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="skills1" runat="server" Width="59px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="please enter skills"
              ControlToValidate="skills1" ValidationGroup="Empform">*</asp:RequiredFieldValidator>   
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle"  style="padding-top:2px;padding-bottom:3px;">*No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
          <asp:TextBox ID="sk1yrs" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="please enter years"
              ControlToValidate="sk1yrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator>      
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">*No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="sk1mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Enter no. of Months"
           ControlToValidate="sk1mnts" ValidationGroup="Empform">*</asp:RequiredFieldValidator>              
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="sk1exp" runat="server" Width="86px" BorderWidth="1"  BorderColor="Black" >
             <asp:ListItem>Novice</asp:ListItem>
             <asp:ListItem>Advance</asp:ListItem>
             <asp:ListItem>Expert</asp:ListItem>
             </asp:Dropdownlist>           
          </td>
       </tr> 
           <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">*Skills - 2</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="skills2" runat="server" Width="59px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="please enter skills"
              ControlToValidate="skills2" ValidationGroup="Empform">*</asp:RequiredFieldValidator>   
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">*No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
          <asp:TextBox ID="sk2yrs" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="please enter years"
              ControlToValidate="sk1yrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator>      
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">*No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="sk2mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Enter no. of Months"
           ControlToValidate="sk1mnts" ValidationGroup="Empform">*</asp:RequiredFieldValidator>              
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">*Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="sk2exp" runat="server" Width="86px" BorderWidth="1"  BorderColor="Black" >
             <asp:ListItem>Novice</asp:ListItem>
             <asp:ListItem>Advance</asp:ListItem>
             <asp:ListItem>Expert</asp:ListItem>
             </asp:Dropdownlist>           
          </td>
       </tr> 
        <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">&nbsp;Skills - 3</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="skills3" runat="server"  Width="59px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="sk3yrs" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1"  style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="sk3mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="sk3exp" runat="server"  Width="86px" BorderWidth="1"  BorderColor="Black" >
                 <asp:ListItem>Novice</asp:ListItem>
                 <asp:ListItem>Advance</asp:ListItem>
                 <asp:ListItem>Expert</asp:ListItem>
                 </asp:Dropdownlist>        
          </td>
       </tr> 
         <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">&nbsp;Skills - 4</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="skills4" runat="server" Width="59px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="sk4yrs" runat="server"  Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>       
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="sk4mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>        
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:Dropdownlist ID="sk4exp" runat="server"  Width="86px" BorderWidth="1"  BorderColor="Black" >
                 <asp:ListItem>Novice</asp:ListItem>
                 <asp:ListItem>Advance</asp:ListItem>
                 <asp:ListItem>Expert</asp:ListItem>
                 </asp:Dropdownlist>        
          </td>
       </tr> 
         <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">&nbsp;Skills - 5</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="skills5" runat="server"  Width="59px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="sk5yrs" runat="server"  Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>        
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="sk5mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>            
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:Dropdownlist ID="sk5exp" runat="server" Width="86px" BorderWidth="1"  BorderColor="Black" >
                     <asp:ListItem>Novice</asp:ListItem>
                     <asp:ListItem>Advance</asp:ListItem>
                     <asp:ListItem>Expert</asp:ListItem>
           </asp:Dropdownlist>         
          </td>
       </tr>
       <tr>
          <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;padding-left:13px;">&nbsp;Skills - 6</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="skills6" runat="server"  Width="59px"  
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
           </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle"  style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Years</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
           <asp:TextBox ID="sk6yrs" runat="server"  Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>       
         
         </td>
          <td width="15%" class="headings2_percent3" align="center" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;No.Months</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_percent1" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="sk6mnts" runat="server" Width="80px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>               
          </td>
           <td width="15%" class="headings2_percent3" align="left" valign="middle" style="padding-top:2px;padding-bottom:3px;">&nbsp;Expert Level</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:Dropdownlist ID="sk6exp" runat="server"  Width="86px" BorderWidth="1"  BorderColor="Black" >
                 <asp:ListItem>Novice</asp:ListItem>
                 <asp:ListItem>Advance</asp:ListItem>
                 <asp:ListItem>Expert</asp:ListItem>
               </asp:Dropdownlist>         
          </td>
       </tr> 
      
       
     </table>
    </td>
    
</tr>

<%--Education    --%>
  <tr style="height:25px;" class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Education Details</span></td>
 </tr>  
 <tr>

     <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">PG</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="edu1" runat="server" Width="112px"  
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
           </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Board/University</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="ed1brd" runat="server"  Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent1" align="center" style="padding-top:2px;padding-bottom:3px;">Major in</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed1sub" runat="server" Width="120px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent" align="center" style="padding-top:2px;padding-bottom:3px;">Year of Pass</td>
          <td class="headings2_colon" valign="middle" align="left"  style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed1yr" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>  
          </td>
           <td width="15%" class="headings2_percent2" align="center" style="padding-top:2px;padding-bottom:3px;">(%)</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed1per" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black"  MaxLength="5"></asp:TextBox> 
          </td>
       </tr> 
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Graduation</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="edu2" runat="server" Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
           </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Board/University</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="ed2brd" runat="server" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent1" align="center" style="padding-top:2px;padding-bottom:3px;">Major in</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed2sub" runat="server" Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent" align="center" style="padding-top:2px;padding-bottom:3px;">Year of Pass</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed2yr" runat="server" Width="40px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>  
          </td>
           <td width="15%" class="headings2_percent2" align="center" style="padding-top:2px;padding-bottom:3px;">(%)</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed2per" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black"  MaxLength="5"></asp:TextBox>
          </td>
       </tr> 
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">UG</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="edu3" runat="server"  Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
           </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Board/University</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="ed3brd" runat="server" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent1" align="center" style="padding-top:2px;padding-bottom:3px;">Major in</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="ed3sub" runat="server" Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent" align="center" style="padding-top:2px;padding-bottom:3px;">Year of Pass</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="ed3yr" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox> 
          </td>
           <td width="15%" class="headings2_percent2" align="center" style="padding-top:2px;padding-bottom:3px;">(%)</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed3per" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black" MaxLength="5"></asp:TextBox>
          </td>
       </tr> 
       <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">SSC</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="edu4" runat="server" Width="112px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
           </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Board/University</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="ed4brd" runat="server"  Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent1" align="center" style="padding-top:2px;padding-bottom:3px;">Major in</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="ed4sub" runat="server"  Width="120px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent" align="center" style="padding-top:2px;padding-bottom:3px;">Year of Pass</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="ed4yr" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox> 
          </td>
           <td width="15%" class="headings2_percent2" align="center" style="padding-top:2px;padding-bottom:3px;">(%)</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed4per" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black"  MaxLength="5"></asp:TextBox>
          </td>
       </tr>
         <tr>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Other</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="edu5" runat="server"  Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
           </td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:3px;">Board/University</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
            <asp:TextBox ID="ed5brd" runat="server"  Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         
         </td>
          <td width="15%" class="headings2_percent1" align="center" style="padding-top:2px;padding-bottom:3px;">Major in</td>
          <td class="headings2_colon" valign="middle" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
              <asp:TextBox ID="ed5sub" runat="server"  Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent" align="center" style="padding-top:2px;padding-bottom:3px;">Year of Pass</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
                <asp:TextBox ID="ed5yr" runat="server" Width="40px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
           <td width="15%" class="headings2_percent2" align="center" style="padding-top:2px;padding-bottom:3px;">(%)</td>
          <td class="headings2_colon" valign="middle" align="left" style="padding-top:2px;padding-bottom:3px;"><strong>&nbsp;:&nbsp;</strong></td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:2px;padding-bottom:3px;" valign="middle">
               <asp:TextBox ID="ed5per" runat="server"  Width="40px" BorderWidth="1"  BorderColor="Black" MaxLength="5"></asp:TextBox>
          </td>
       </tr>  
             
     </table>
    </td>
    
</tr>
<%--Upload Resume    --%>

<%--Mail Alert   --%>
 <tr style="height:25px;" class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Upload Resume</span></td>
 </tr>  
<tr >
    <td colspan="4" width="100%" align="left">
    <table>
    <tr>
      
    <td width="8%" style="padding-left:15px;" class="headings2">
        Resume Title
    </td>
    <td width="1%" style="color: #174eb4;"><strong>:</strong></td>
    <td width="20%" align="left">
     <asp:TextBox ID="restitle" runat="server" CssClass="textfield" Width="160px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
    </td>
    
    <td width="2%"></td>
    <td width="8%" class="headings2">
        Upload Resume
    </td>
    <td width="20%" align="left">
    <asp:FileUpload ID="rfile" runat="server" />
    </td>
    <td width="2%"></td>
    <td width="8%" class="headings2"></td>
    
    </tr>
    
</table>
</td>
</tr>
<tr>
    <td colspan="4" width="100%" align="left">
    <table>
    <tr>
    <td width="1%">
    
    </td>
    
    <td width="8%" class="headings2">
       Resume in Text:
        <br />
        (Cut &amp; Paste Your Resume Here)
    </td>  
  
    <td width="20%" align="left">
 <asp:TextBox ID="txtres" runat="server" TextMode="MultiLine" Height="188px" 
            Width="725px"></asp:TextBox>
    </td>
    <td width="2%"></td>
    <td width="8%" class="headings2"></td>
    
    </tr>
    
</table>
</td>
</tr>

<%--Mail Alert   --%>
  <tr style="height:25px;" class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Upload your photo</span></td>
 </tr>  
<%--Mail Alert   --%>
<tr >
    <td colspan="4" width="100%" align="left">
    <table>
    <tr>
      
    <td align="left" class="headings2_percent2" style="padding-left:10px;">
       Upload your Photo <strong>&nbsp;&nbsp;:</strong>
    </td>  
  
    <td width="60%" align="left" class="headings2" colspan="3">
<asp:FileUpload ID="Fileupphoto" runat="server" Width="300px" />
                        (image size must be 64 x 64)
                         
    </td>
    
    </tr>
    
</table>
</td>
</tr>
 
 <tr style="height:25px;" class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Mail &amp; Privacy Settings</span></td>
 </tr>  
 <tr>

     <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr>
          <td width="15%" class="headings2_terms" align="left" colspan="3" style="padding-top:4px;padding-bottom:4px;"><input id="Checkbox1" type="checkbox" name=" chkjobalerts" value="RS" checked="checked" />Job 
                Alerts and InduGroup products.</td>
          <td width="15%" class="headings2" align="left" style="padding-top:4px;padding-bottom:4px;" colspan="3"><input id="Checkbox2" type="checkbox" name="mailers[]" value="RS" checked="checked" />Training 
                Programs.</td>
          <td width="15%" class="headings2" align="left" style="padding-top:2px;padding-bottom:4px;">&nbsp;</td>
          <td class="headings2" valign="middle" style="padding-top:4px;padding-bottom:4px;"><input id="Checkbox3" type="checkbox" name="mailers[]" value="RS" checked="checked" />News 
                Letters</td>
           <td width="16%" align="left" class="headings2_skls" style="padding-top:4px;padding-bottom:4px;" valign="middle">
               &nbsp;
          </td>
          
       </tr> 
</table>
</td>
</tr>
 <tr style="height:25px;" class="headings2">
    <td align="left" valign="middle" bgcolor="#336699" style="height: 25px" ><span class="headings3">Terms &amp; Conditions</span></td>
 </tr>    
<tr >
    <td colspan="4" align="center" class="login">
        * <%--<input id="termscond" type="checkbox" name="mailers[]" value="RS" checked="checked" />--%>
<asp:CheckBox ID="termscond" Checked="true" runat="server" Text="" />
 
        I have read and understood and agree to the Terms and Conditions governing the 
        use of <a href="http://www.igiit.net" target="_blank">igiit.net</a> 
   <br /> <span id="spanTNCmsg" class="messagetext">You must agree to the terms and 
        conditions before you can continue.</span>


    </td>
</tr>
 <tr>
    <td align="center" class="headings2" style="padding-top:10px;">
    <asp:Button ID="btnSave_Emp" runat="server" Text="Save & Submit" Width="101px" ValidationGroup="Empform"
            onclick="btnSave_Emp_Click1"  />  
      <%-- <asp:Button ID="btnmail" runat="server" Text="Save & Sent Mail " Width="111px" OnClick="btnmail_Click"  
           /> --%>      
    </td>
    </tr>
    <tr>
    <td >
    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
    </td>
    </tr>
</table>
</td>
</tr>
 
</table>
    </td></tr></table>
    </center>
    </form>
</body>
</html>



