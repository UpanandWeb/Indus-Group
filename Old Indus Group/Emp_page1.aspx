<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_page1.aspx.cs" Inherits="Emp_page1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
   <title>:  : 1indus.com :  : </title>


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
</head>
<script language="javascript">
<!--
    $(document).ready(function () {
        $(".defaultText").focus(function (srcc) {
            if ($(this).val() == $(this)[0].title) {
                $(this).removeClass("defaultTextActive");
                $(this).val("");
            }
        });

        $(".defaultText").blur(function () {
            if ($(this).val() == "") {
                $(this).addClass("defaultTextActive");
                $(this).val($(this)[0].title);
            }
        });

        $(".defaultText").blur();
    });
//-->
</script>
<style type="text/css">

.headings21 { 
	color: #174eb4;
	background-color: #ffffff; 
	font-size: 12px;
	font-weight: normal;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	
}
.color
{
	color:#174eb4;
}
.headings3 {	color: #000000; 
 	font-size: 12px;
	font-weight: bold;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	height: 15px;  	
	padding-left: 5px; 
}
.style2 {            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 18%;
}
.style3 {            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 19%;
}
.style4 {            height: 20px;
}
.style5 {            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 5px;
}

</style>
 
    <style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
     </style>
     <script type="text/javascript">
         function entries(val) {
             if (val == '') {
                 window.location.href = "#";
             }
             else if (val == 'middle-east') {
                 window.open('#', '_blank');
             }
             else {
                 window.location.href = "#" + val;
             }

         }

</script>
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
   <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
  </header>
  <div style="height:10px;"></div>
  <section class="about text-left" id="about">
    <div class="container">
     <div class="row">


     <table width="100%" >
<tr height="19">
               <td width="100%" align="center" class="toplft" height="15" colspan="2"><strong style="font-size:medium"><u>Employee Registration</u></strong>
                   </td>
              </tr>
              <tr height="19">
               <td >&nbsp;
                   </td>
              </tr>
              <tr height="190">
             <%-- <td width="20%" align="left"></td>--%>
                <td  align="center" class="border"  valign="top" width="80%"  style="height: 190px;">
      <table width="1113" border="0" align="center" cellpadding="0" cellspacing="0" style="border-color:Black;border-width:2px; border-style:dotted;" >
  <tr>
     <td height="25" align="left" valign="middle" bgcolor="#d4d8e1"><span class="headings3">Login Details</span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="5px"></td>
          <td class="headings21" align="left" valign="middle" width="145px" >* Email ID     </td>
          <td valign="middle" width="5px">:</td>
          <td class="headings21" align="left" valign="middle" width="200px" >
          <asp:TextBox ID="txtemail" runat="server" AutoPostBack="true" Width="150"
                  style="border-color:Black; border-width:1px; border-style:solid; " ></asp:TextBox>         
             <asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="Please Enter Email Address" ControlToValidate="txtemail" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="reg1" runat="server" 
                                    ErrorMessage="Please Enter Valid Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail" 
                  ValidationGroup="Empform">*</asp:RegularExpressionValidator>
                   <asp:Image ID="imgcheck1" ImageUrl="images/check.gif" runat="server" Width="17px" Height="17px" Visible="false"/>
          <td>
           <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>
          <td height="30"></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span style="height: 15px"><span class="headings3">Employee Information</span></td></tr>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="5px"></td>
          <td class="headings21" align="left" valign="middle" width="130px" > * First Name </td>
          <td valign="middle" width="5px">:</td>
          <td class="headings21" align="left" valign="middle" width="170px" >
           <asp:TextBox ID="fname" runat="server"  style="border-color:Black; border-width:1px; border-style:solid; " Width="150"
              BorderWidth="1"   BorderColor="Black"  ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" ControlToValidate="fname" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender13" runat="server" TargetControlID="fname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
           </td>
          <td width="5px"></td>
          <td class="headings21" align="left" valign="middle" width="150px" >
            Middle Name </td>
          <td valign="middle" width="5px">:</td>
          <td class="headings21" align="left" valign="middle"  width="170px"  >
           <asp:TextBox ID="mname" runat="server" style="border-color:Black; border-width:1px; border-style:solid;" Width="150" 
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
     <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender16" runat="server" TargetControlID="mname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
     </td>
          <td width="5px"></td>
          <td class="headings21" align="left" valign="middle"  width="150px" > * Last Name </td>
          <td valign="middle" width="5px">:</td>
          <td class="headings21" align="left" valign="middle"  width="170px"  >
           <asp:TextBox ID="lname" runat="server" style="border-color:Black; border-width:1px; border-style:solid; width:150;" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Last Name" ControlToValidate="lname" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
    <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender14" runat="server" TargetControlID="lname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
          </td>
        </tr>
        <tr >
          <td ></td>
          <td class="headings21" align="left" valign="middle" > * Gender </td>
          <td  align="left" valign="middle">:</td>
         <td class="headings21" align="left" valign="middle"  >         
             <asp:RadioButtonList ID="gend" runat="server" CellPadding="3" CellSpacing="3" RepeatDirection="Horizontal" CssClass="headings21 color"   >             
    <asp:ListItem Value="Male" Selected="True">Male</asp:ListItem>
    <asp:ListItem  Value="Female"> Female</asp:ListItem>
    </asp:RadioButtonList>
            
           <%-- <span id="ctl00_ContentPlaceHolder1_RequiredFieldValidator40"  style="color:Red; width:5px; visibility:hidden;">*</span>--%>
          </td>
          <td align="left" valign="middle">&nbsp;</td>
          <td class="headings21" align="left" valign="middle" > * Mobile Number </td>
          <td align="left" valign="middle">:</td>
          <td class="headings21" align="left" valign="middle" >          
          <%--<input name="ctl00_ContentPlaceHolder1_txtmobile" maxlength="10" id="ctl00_ContentPlaceHolder1_txtmobile2" class="headings2" onkeypress="return isNumberKey(event)" style="border-color:Black;border-width:1px;border-style:solid;width:190px;" type="text" />--%>
                      <asp:TextBox ID="txtmobile" runat="server"  BorderColor="Black" Width="150" BorderWidth="1"  MaxLength="11" onkeypress="return isNumberKey(event)" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="Rfvfat" runat="server" ErrorMessage="*" ValidationGroup="Empform"
      ControlToValidate="txtmobile">*</asp:RequiredFieldValidator>
            <span id="ctl00_ContentPlaceHolder1_Rfvfat2" style="color:Red; visibility:hidden;">*</span></td>
          <td align="left" valign="middle">&nbsp;</td>
          <td class="headings21" align="left" valign="middle" > * Marital Status </td>
          <td width="5px" align="left" valign="middle">:</td>
          <td class="headings21" align="left" valign="middle" >
                <asp:RadioButton ID="chkmarried" runat="server" Text="  Married" GroupName="marital" AutoPostBack="true" /> &nbsp; 
     <asp:RadioButton ID="chkunmaried"  runat="server" GroupName="marital" AutoPostBack="true"  Text="  Unmarried" Checked="true" />            
            </td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span style="height: 15px"><span class="headings3">Birth Details</span></span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="5px"></td>
          <td  width="130px" align="left" class="headings21"> * Birth Date </td>
          <td  width="5px">:</td>
          <td width="170px" align="left" class="headings21">
<%--<input name="ctl00_ContentPlaceHolder1_txtbdate" id="ctl00_ContentPlaceHolder1_txtbdate2" class="headings2" style="border-color:Black;border-width:1px;border-style:solid;width:190px;" type="text" />--%>          
          <asp:TextBox ID="txtbdate" runat="server"  Width="150px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtbdate">
         </cc1:CalendarExtender>
          </td>
          <td  width="5px"></td>
          <td  width="150px" align="left" class="headings21"> * Birth Country </td>
          <td width="5px">:</td>
          <td  width="170px" align="left" class="headings21">
          <asp:Dropdownlist ID="bcountry" runat="server"  Width="150px" BorderWidth="1"   AutoPostBack="true" 
             onselectedindexchanged="bcountry_SelectedIndexChanged" >
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" InitialValue="Select Country"
          runat="server" ErrorMessage="Please Select Birth Country" ControlToValidate="bcountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
    </td>
          <td width="5px"></td>
          <td width="150px" align="left" class="headings21"> *
            Birth State </td>
          <td width="5px">:</td>
          <td width="170px" align="left" valign="middle" class="headings21">
         <asp:Dropdownlist ID="bstate" runat="server"  Width="150px"  
             BorderWidth="1" style="margin-top:0px" BorderColor="Black" AutoPostBack="true" 
             onselectedindexchanged="bstate_SelectedIndexChanged" >
     <asp:ListItem Text="Select State">Select State</asp:ListItem>
     </asp:Dropdownlist>   
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="Select State"
          ErrorMessage="Please Select Birth State" ControlToValidate="bstate" ValidationGroup="Empform">*</asp:RequiredFieldValidator>             
            </td>
        </tr>
        <tr>
          <td > </td>
          <td align="left" class="headings21"> *
            Birth City </td>
          <td>:</td>
          <td  align="left" class="headings21">          
          <asp:DropDownList ID="bcity" runat="server" CssClass="headings21" Width="150px"  
             BorderWidth="1"  BorderColor="Black" >
             <asp:ListItem Text="Select City">Select City</asp:ListItem>
             </asp:DropDownList>     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" InitialValue="Select City" runat="server" 
         ErrorMessage="Please Select Birth City" ControlToValidate="bcity" ValidationGroup="Empform">*</asp:RequiredFieldValidator>        
            </td>
          <td ></td>
          <td  align="left" class="headings21"> *
            Citizenship </td>
          <td >:</td>
          <td align="left" class="headings21">          
          <asp:Dropdownlist ID="ccountry" runat="server" CssClass="headings21" BorderWidth="1" Width="150px">
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please Select Citizenship" 
         ControlToValidate="ccountry" InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
    
            </td>
          <td ></td>
          <td  align="left" class="headings21"> Passport No </td>
          <td>:</td>
          <td  align="left" class="headings21">
            <asp:TextBox ID="passno" runat="server"  Width="150px"  BorderWidth="1" BorderColor="Black"  ></asp:TextBox>
         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="passno"></asp:RequiredFieldValidator>  --%>
   
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td  align="left" class="headings21"> &nbsp;Issued at </td>
          <td >:</td>
          <td  align="left"  class="headings21">          
            <asp:Dropdownlist ID="pcountry" runat="server" CssClass="headings21" BorderColor="Black"  Width="150px" BorderWidth="1px" >
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
          </td>
          <td  ></td>
          <td  align="left" class="headings21"> Issue Date </td>
          <td >:</td>
          <td  align="left" class="headings21">
        <asp:TextBox ID="txtisdate" runat="server"  Width="150px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtisdate">
         </cc1:CalendarExtender>          
          </td>
          <td ></td>
          <td  align="left" class="headings21"> Expiry Date </td>
          <td >:</td>
          <td align="left" class="headings21">
          <asp:TextBox ID="txtexpdate" runat="server"  Width="150px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
              <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtexpdate">
         </cc1:CalendarExtender>
          </td>
        </tr>
        <tr>
          <td  ></td>
          <td  align="left" class="headings21" > * Nationality </td>
          <td  >:</td>
          <td  align="left" class="headings21" >
          <asp:Dropdownlist ID="ncountry" runat="server" BorderColor="Black"  CssClass="headings21" Width="150px"  BorderWidth="1px" >
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select Nationality" InitialValue="Select Country"
              ControlToValidate="ncountry" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
          <td   ></td>
          <td align="left" ></td>
          <td  ></td>
          <td  align="left" ></td>
          <td ></td>
          <td align="left" ></td>
          <td  ></td>
          <td   align="left" ></td>
        </tr>
        <tr>
          <td><%--<img src="images/spacer1.gif" alt="" width="5" height="5" />--%></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Family Information</span></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="12"><%--<img src="images/spacer2.gif" width="10" height="10" />--%>&nbsp;</td>
      </tr>
      <tr>
      <td width="5px"></td>
            <td  align="left" class="headings21" width="130px"> * Father Name </td>
            <td width="5px">:</td>
            <td align="left" class="headings21" width="170px">
            <asp:TextBox ID="fatname" runat="server" Width="150px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ValidationGroup="Empform"
      ControlToValidate="fatname">*</asp:RequiredFieldValidator>
      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17"  runat="server" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars"  TargetControlID="fatname"></cc1:FilteredTextBoxExtender>
    
            </td> 
            <td width="5px">&nbsp;</td>
        <td  width="150px" align="left" valign="middle"><span class="headings21"> * Mother Name </span></td>
        <td align="left" valign="middle" width="5px">:</td>        
        <td align="left" valign="middle" colspan="5">        
        <asp:TextBox ID="motname" runat="server"  Width="150px" 
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvmname" runat="server" ErrorMessage="*" ValidationGroup="Empform"
          ControlToValidate="motname">*</asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18"  runat="server" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" TargetControlID="motname"></cc1:FilteredTextBoxExtender>
   </td>
       
      </tr>
       <tr id="trsname" runat="server">
       <td width="5px">&nbsp;</td>
   <td class="headings21" align="left" width="130px">  
     Spouse Name
     </td>
     <td width="5px">:</td>
     <td align="left" width="170px">
     <asp:TextBox ID="mmname" runat="server"  Width="150px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
     </td>
    <td width="5px">&nbsp;</td>
    <td class="headings21" align="left" width="150px">
    Spouse Gender
     </td>
     <td width="5px">:</td>
     <td align="left" width="170px">
          <asp:RadioButtonList ID="spgen" runat="server" RepeatDirection="Horizontal" CssClass="headings21">
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
      <td width="5px">&nbsp;</td>
       <td class="headings21" align="left" width="150px">
    Spouse Birth Date
     </td>
     <td width="5px">:</td>
     <td align="left" width="170px">
     <asp:TextBox ID="txtsb" runat="server"  Width="150px" BorderWidth="1"  BorderColor="Black"></asp:TextBox>
         <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtsb">
         </cc1:CalendarExtender>
     </td>
  
    </tr>
    <tr id="trchname" runat="server">
    <td >&nbsp;</td>
    <td class="headings21" align="left">
    Child Name - 1
     </td>
     <td >:</td>
     <td align="left">
     <asp:TextBox ID="k1name" runat="server"  Width="150"  BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
     </td>
    <td ></td>
    <td class="headings21" align="left">
     Child Name - 2
     </td>
     <td >:</td>
     <td align="left">
     <asp:TextBox ID="k2name" runat="server"  Width="150" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
     </td>
<td >&nbsp;</td>
    <td class="headings21" align="left">
        Child Name - 3
     </td>
     <td >:</td>
     <td align="left">
     <asp:TextBox ID="k3name" runat="server" Width="150" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>       
     </td>
    </tr>
    <tr id="trchgender" runat="server">
    <td ></td>
    <td class="headings21" align="left">
      Gender
     </td>
     <td >:</td>
     <td align="left" class="headings21">
      <asp:RadioButtonList ID="k1gen" runat="server" RepeatDirection="Horizontal" CssClass="headings21" >
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
   </td>
    <td >&nbsp;</td>
    <td  align="left" class="headings21">
     Gender </td>
     <td >:</td>
     <td align="left" class="headings21">
          <asp:RadioButtonList ID="k2gen" runat="server" RepeatDirection="Horizontal" CssClass="headings21" >
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
<td >&nbsp;</td>
    <td align="left"  class="headings21">
    Gender
     </td>
     <td >:</td>
     <td  align="left" class="headings21">   
    <asp:RadioButtonList ID="k3gen" runat="server" RepeatDirection="Horizontal" CssClass="headings21" >
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>   
     </td>
    </tr>
    <tr id="trchbdate" runat="server">
    <td >&nbsp;</td>
    <td class="headings21" align="left">
      Birth Date
     </td>
     <td >:</td>
     <td align="left" class="headings21">
     <asp:TextBox ID="txtk1bd" runat="server" CssClass="headings21" Width="150"  BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtk1bd">
         </cc1:CalendarExtender>
     </td>
    <td >&nbsp;</td>
    <td align="left" class="headings21">
     Birth Date </td>
     <td >:</td>
     <td align="left" class="headings21">    
         <asp:TextBox ID="txtk2bd" runat="server" CssClass="headings21" Width="150"  BorderWidth="1" BorderColor="Black"></asp:TextBox>
         <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtk2bd">
         </cc1:CalendarExtender>
     </td>
<td >&nbsp;</td>
    <td align="left" class="headings21">
     Birth Date
     </td>
     <td >:</td>
     <td align="left" class="headings21">
     <asp:TextBox ID="txtk3bd" runat="server" CssClass="headings21" Width="150"  BorderWidth="1" BorderColor="Black" ></asp:TextBox>
         <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtk3bd">
         </cc1:CalendarExtender>       
     </td>
    </tr>
    </table></td>
  </tr>
  <tr>
    <td  align="left" valign="middle"><%--<img src="images/spacer2.gif" width="10" height="10" />--%>&nbsp;</td>
  </tr>
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Present Address</span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px"> * Country </td>
          <td align="left" valign="middle" width="5px">:</td>
          <td class="headings21" align="left" width="170px">         
         <asp:Dropdownlist ID="country" runat="server" CssClass="headings21" 
             BorderWidth="1"  BorderColor="Black"  AutoPostBack="true" Width="150" onselectedindexchanged="country_SelectedIndexChanged"   >        
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Select Present Country" ControlToValidate="country" InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
        </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px"> *Address </td>
          <td width="5px">:</td>
          <td colspan="5" align="left"  class="headings21" >
          <asp:TextBox ID="street" runat="server" Width="450px" BorderWidth="1"  BorderColor="Black"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
          ErrorMessage="Please Enter address" ControlToValidate="street" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px" > * State </td>
          <td  align="left" valign="middle" width="5px">:</td>
          <td class="headings21" align="left" width="170px" >
          <asp:Dropdownlist ID="state" runat="server" CssClass="headings21" Width="150"  BorderWidth="1"  BorderColor="Black" 
             onselectedindexchanged="state_SelectedIndexChanged" AutoPostBack="true">
     <asp:ListItem Text="Select State">Select State</asp:ListItem>
     </asp:Dropdownlist>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="Select State"
        ErrorMessage="Please Select  State" ControlToValidate="state" ValidationGroup="Empform">*</asp:RequiredFieldValidator>          
          </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px"> * City </td>
          <td width="5px">:</td>
          <td align="left"  class="headings21" width="170px">          
          <asp:DropDownList ID="city" runat="server" CssClass="headings21" Width="150"  BorderWidth="1"  BorderColor="Black" >
   <asp:ListItem Text="Select City">Select City</asp:ListItem>
   </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="Select City" ErrorMessage="Please Select Present City" ControlToValidate="city" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
   
            </td>
          <td width="5px"></td>
          <td class="headings21" align="center" width="150px"> *Zip</td>
          <td width="5px">:</td>
          <td align="left" valign="middle" class="headings21" width="170px">
         <asp:TextBox ID="zip" runat="server"  Width="150"  MaxLength="6" onkeypress="return isNumberKey(event)"
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Zip code" 
    ControlToValidate="zip" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left"width="130px" > Ph:Work </td>
          <td align="left" valign="middle" width="5px">:</td>
          <td class="headings21" align="left" width="170px">          
            <asp:TextBox ID="wp1" runat="server"  Width="150" BorderWidth="1"  BorderColor="Black" MaxLength="11" onkeyup="moveOnMax(this,'wp2')"></asp:TextBox>   
    
              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Numbers" TargetControlID="wp1"></cc1:FilteredTextBoxExtender>
             </td>
          <td width="5px"></td>
          <td align="left" class="headings21" width="150px"> Ph:Home </td>
          <td width="5px">:</td>
          <td align="left" class="headings21" colspan="5">
             <asp:TextBox ID="hp1" runat="server" CssClass="headings21"   Width="150"  
             BorderWidth="1"  BorderColor="Black" MaxLength="11" onkeyup="moveOnMax(this,'hp1')"></asp:TextBox>   
           <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="hp1"></cc1:FilteredTextBoxExtender>
           </td>
        </tr>
        <tr height="5">
          <td></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
   <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span style="height: 15px"><span class="headings3">Permanent Address</span></span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px" > * Country </td>
          <td width="5px">:</td>
          <td class="headings21" align="left"  width="170px">
     <asp:Dropdownlist ID="prcountry" runat="server"  CssClass="headings21"
      BorderWidth="1"  BorderColor="Black"  AutoPostBack="true" Width="150" 
                  onselectedindexchanged="prcountry_SelectedIndexChanged"   >        
     <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
         ErrorMessage="Please Select Present Country" ControlToValidate="prcountry"
          InitialValue="Select Country" ValidationGroup="Empform">*</asp:RequiredFieldValidator>   
            </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px"> *Address </td>
          <td width="5px">:</td>
          <td colspan="5" align="left"  class="headings21" width="170px">          
          <asp:TextBox ID="txtpraddress" runat="server"  Width="450" 
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"
          ErrorMessage="Please Enter address" ControlToValidate="txtpraddress" ValidationGroup="Empform">*</asp:RequiredFieldValidator>    
            </td>
        </tr>
        
        <tr >
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px" > * State </td>
          <td width="5px">:</td>
          <td class="headings21" align="left"  width="170px">
          <asp:Dropdownlist ID="prstate" runat="server" CssClass="headings21" Width="150"  
             BorderWidth="1"  BorderColor="Black" onselectedindexchanged="prstate_SelectedIndexChanged" AutoPostBack="true">
     <asp:ListItem Text="Select State">Select State</asp:ListItem>
     </asp:Dropdownlist>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" InitialValue="Select State"
        ErrorMessage="Please Select  State" ControlToValidate="prstate" ValidationGroup="Empform">*</asp:RequiredFieldValidator>  
            </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px"> * City </td>
          <td width="5px">:</td>
          <td align="left" class="headings21" width="170px">          
        <asp:DropDownList ID="txtprcity" runat="server" CssClass="headings21" Width="150"  
             BorderWidth="1"  BorderColor="Black"   >
    <asp:ListItem Text="Select City">Select City</asp:ListItem>
   </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" InitialValue="Select City" runat="server" ErrorMessage="Please Select Present City"
     ControlToValidate="txtprcity" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
            </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="center" width="150px"> *Zip</td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">          
          <asp:TextBox ID="txtprzip" runat="server"  Width="150"  MaxLength="6" onkeypress="return isNumberKey(event)"
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Please Enter Zip code" 
    ControlToValidate="txtprzip" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px"> Ph:Work </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">
           <asp:TextBox ID="wpr1" runat="server"  Width="150" BorderColor="Black" 
             BorderWidth="1"  MaxLength="10" onkeyup="moveOnMax(this,'wpr1')" ></asp:TextBox>   
   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers" TargetControlID="wpr1"></cc1:FilteredTextBoxExtender>

            </td>
          <td width="5px">&nbsp;</td>
          <td  align="left" class="headings21" width="150px">Ph:Home </td>
          <td >:</td>
          <td align="left" class="headings21" colspan="5">          
           <asp:TextBox ID="hpr1" runat="server" BorderColor="Black" Width="150"  BorderWidth="1"  MaxLength="10" onkeyup="moveOnMax(this,'hpr1')"></asp:TextBox>
     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers" TargetControlID="hpr1"></cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        
      </tbody>
    </table></td>
  </tr>
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Emergency Contact Person Details</span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px"> *
            Contact person-1 </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">
          <asp:TextBox ID="cpname1" runat="server"  Width="150"  BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Enter contact person"
           ControlToValidate="cpname1" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
           <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender19" runat="server" TargetControlID="cpname1" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>  
  
          </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px">
            * Phone No </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">          
               <asp:TextBox ID="cpphone1" runat="server"  MaxLength="10" Width="150" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" FilterType="Numbers"
       TargetControlID="cpphone1"></cc1:FilteredTextBoxExtender>
     <asp:RequiredFieldValidator ID="rfvphoneNo" runat="server" 
                              ErrorMessage="Please Enter Phone Number" ControlToValidate="cpphone1" 
                               ValidationGroup="Empform">*</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revPhno" runat="server" 
                              ControlToValidate="cpphone1" ValidationGroup="Empform"
                              ErrorMessage="Please enter a valid phone number of 10 digits" 
                              ValidationExpression="\d{10}" >*</asp:RegularExpressionValidator>
          </td>
          <td width="5px"></td>
          <td class="headings21" align="left" width="150px" >
            * Email ID </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">
<asp:TextBox ID="cpemail1" runat="server"  Width="150" BorderColor="Black" BorderWidth="1" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Enter email id" 
      ControlToValidate="cpemail1" ValidationGroup="Empform" >*</asp:RequiredFieldValidator> 
       <asp:RegularExpressionValidator ID="Regulaexp" runat="server" 
             ErrorMessage="Enter valid email" ControlToValidate="cpemail1" ValidationGroup="Empform"
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>            
            </td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px"> *
            Address </td>
          <td width="5px">:</td>
          <td colspan="9" class="headings21" align="left" >
          <asp:TextBox ID="cpaddr1" runat="server"  Width="512px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
       <asp:RequiredFieldValidator ID="rfvadd" runat="server" ErrorMessage="Enter address"
       ValidationGroup="Empform" ControlToValidate="cpaddr1" >*</asp:RequiredFieldValidator>  
            </td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px"> Contact person-2 </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">
          <asp:TextBox ID="cpname2" runat="server"  Width="150"  BorderWidth="1"  BorderColor="Black"></asp:TextBox>
     <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender20" runat="server" TargetControlID="cpname2"
      FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>     
          </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px">
            Phone No </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px">
          <asp:TextBox ID="cpphone2" runat="server"  Width="150" BorderWidth="1" BorderColor="Black" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
      <cc1:FilteredTextBoxExtender ID="Ftbcpphone2" runat="server" FilterType="Numbers" TargetControlID="cpphone2"></cc1:FilteredTextBoxExtender>
      </td>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="150px">
            Email ID </td>
          <td width="5px">:</td>
          <td class="headings21" align="left" width="170px"> 
          <asp:TextBox ID="cpemail2" runat="server"  Width="150" BorderWidth="1" BorderColor="Black"  ></asp:TextBox>
       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="*" ControlToValidate="cpemail2" ></asp:RequiredFieldValidator>--%>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Enter valid email" ControlToValidate="cpemail2" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
          <td width="5px">&nbsp;</td>
          <td class="headings21" align="left" width="130px" > Address </td>
          <td width="5px">:</td>
          <td colspan="9" class="headings21" align="left" >
           <asp:TextBox ID="cpaddr2" runat="server"  Width="512px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td colspan="12"></td>
          </tr>
      </tbody>
    </table></td>
  </tr>
  <tr height="30px">
    <td align="left" valign="middle"></td>
  </tr>
 <tr>
    <td align="center" class="headings21">
    <asp:Button ID="btnSave_Emp" runat="server" Text="Save & Continue" Width="131px" 
             ValidationGroup="Empform" onclick="btnSave_Emp_Click"  />  
      <%-- <asp:Button ID="btnmail" runat="server" Text="Save & Sent Mail " Width="111px" OnClick="btnmail_Click"  
           /> --%>    
    </td>
    </tr>
    <tr height="15">
    <td class="headings21">
    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
    </td>
    </tr>
</table>


    </div></div></section>
    <div><br /></div>
   
    </form>
    <%--<div>
    <foot:footer ID="foot1" runat="server" />
    </div>--%>
</body>
</html>
