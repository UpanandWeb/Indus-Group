<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_page2.aspx.cs" Inherits="Emp_page2" %>
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



   <script type="text/JavaScript">

<!--
       function MM_preloadImages() { //v3.0
           var d = document; if (d.images) {
               if (!d.MM_p) d.MM_p = new Array();
               var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                   if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
           }
       }

       function MM_swapImgRestore() { //v3.0
           var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
       }

       function MM_findObj(n, d) { //v4.01
           var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
               d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
           }
           if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
           for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
           if (!x && d.getElementById) x = d.getElementById(n); return x;
       }

       function MM_swapImage() { //v3.0
           var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
               if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
       }
//-->
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

.headings2 	
{
	color: #174eb4;
	background-color: #ffffff; 
	font-size: 12px;
	font-weight: normal;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	height: 20px;  	
	padding-left: 15px;
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
     <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
    <div>
      <table width="100%" style="border-width:2px;border-style:dotted;">
<tr height="19" width="100%">
               <td width="100%" align="center" class="toplft" height="15" colspan="2"><strong style="font-size:medium"><u>Employee Registration</u></strong>
                   </td>
              </tr>
                            </tr>
              <tr height="190">
             <%-- <td width="20%" align="left"></td>--%>
                <td  align="center" class="border"  valign="top" width="80%"  style="height: 190px;">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td align="left" valign="middle"><%--<img src="images/spacer2.gif" width="10" height="10" />--%>&nbsp;</td>
  </tr>
  
  <tr>
              <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Professional Experience Details</span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
      <tr height="5">
          <td></td>
        </tr>
  <tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left"> *
            Total Exp.Yrs &amp; Months </td>
          <td width="5px">:</td>
          <td class="headings2" align="left" >
          
            <asp:TextBox ID="expyrs" runat="server" MaxLength="2" CssClass="headings2" Width="50px" 
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>         
          
            <asp:TextBox ID="expmon" runat="server" MaxLength="2" CssClass="headings2" Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
                          
             <asp:RequiredFieldValidator ID="RequiredField" runat="server" ErrorMessage="Enter experience years and months"
           ControlToValidate="expyrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
             
          </td>
          <td ></td>
          <td class="headings2" align="left" >Designation </td>
          <td width="5px">:</td>
          <td class="headings2" align="left" >         
          
                 <asp:TextBox ID="fnarea" runat="server" CssClass="headings2" Width="150" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="Enter Designation" 
                        ControlToValidate="fnarea" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          
          </td>
          <td ></td>
          <td class="headings2" align="left">
            Current Company </td>
          <td width="5px">:</td>
          <td align="left" class="headings2">          
            <asp:TextBox ID="currind" runat="server" CssClass="headings2" Width="200" BorderWidth="1"  BorderColor="Black"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Current Industry" 
                ControlToValidate="currind" ValidationGroup="Empform">*</asp:RequiredFieldValidator>  
          </td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" >&nbsp; Total Exp.Yrs &amp; Months </td>
          <td >:</td>
          <td class="headings2" align="left"  >
          
            <asp:TextBox ID="expyrs1" runat="server" MaxLength="3" CssClass="headings2" Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <asp:TextBox ID="expmon1" runat="server" MaxLength="2" CssClass="headings2" Width="50px"  
             BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" >Designation </td>
          <td >:</td>
          <td class="headings2" align="left" >          
                <asp:TextBox ID="fnarea1" runat="server" CssClass="headings2" Width="150" BorderWidth="1"  BorderColor="Black"></asp:TextBox>          
          </td>
          
          <td ></td>
          <td class="headings2" align="left" >
            Previous Company </td>
          <td >:</td>
          <td align="left" class="headings2">          
                <asp:TextBox ID="currind1" runat="server" CssClass="headings2" Width="200" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>          
          </td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" > &nbsp; Total Exp.Yrs &amp; Months </td>
          <td >:</td>
          <td class="headings2" align="left" >
          
                <asp:TextBox ID="expyrs2" runat="server" MaxLength="3" CssClass="headings2" Width="50px"  
                        BorderWidth="1"  BorderColor="Black"  onkeypress="return isNumberKey(event)"></asp:TextBox>
                <asp:TextBox ID="expmon2" runat="server" MaxLength="2" CssClass="headings2" Width="50px"  
                        BorderWidth="1"  BorderColor="Black" onkeypress="return isNumberKey(event)"></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" >Designation </td>
          <td >:</td>
          <td class="headings2" align="left">
          
                <asp:TextBox ID="fnarea2" runat="server" CssClass="headings2" Width="150" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
         
          </td>
          <td ></td>
          <td class="headings2" align="left" >
            Previous Company </td>
          <td >:</td>
          <td align="left" class="headings2">          
          <asp:TextBox ID="currind2" runat="server" CssClass="headings2" Width="200" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>          
          </td>
        </tr>
        <tr height="5">
          <td></td>
        </tr>
        <%--<tr>
          <td></td>
          <td colspan="11" align="left" class="headings2"><img src="images/spacer2.gif" width="10" height="10" /></td>
          </tr>--%>
      </tbody>
    </table></td>
  </tr>
  <tr>
 <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Skills</span></td>
  </tr>
  <tr>
    <td><table width="100%">
      <tbody>
      <tr height="5">
          <td></td>
        </tr>
        <%--<tr >
          <td ></td>
          <td colspan="15" align="left" class="headings2"><img src="images/spacer2.gif" width="10" height="10" /></td>
          </tr>--%>
        <tr >
          <td width="3px"></td>
          <td class="headings2" align="left" > *Skills - 1 </td>
          <td  width="3px">:</td>
          <td   align="left" class="headings2">          
          <asp:TextBox ID="skills1" runat="server"  CssClass="headings2"  Width="59px"  
             BorderWidth="1"  BorderColor="Black" align="left"> </asp:TextBox>        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="please enter Skills"
              ControlToValidate="skills1" ValidationGroup="Empform">*</asp:RequiredFieldValidator>
          </td> 
          <td width="3px"></td>         
          <td class="headings2" align="left" >*No. Years </td>
          <td width="3px">:</td>
          <td align="left" class="headings2" ><asp:TextBox ID="sk1yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="please enter years"
              ControlToValidate="sk1yrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
          <td width="3px"></td>
          <td class="headings2" align="left" >*No. Months </td>
          <td width="3px">:</td>
          <td align="left" class="headings2" >
           <asp:TextBox ID="sk1mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Enter no. of Months"
           ControlToValidate="sk1mnts" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
          <td width="3px"></td>
          <td class="headings2" align="left" >
            *Expert Level </td>
          <td width="3px">:</td>
          <td class="headings2"  align="left" > <asp:Dropdownlist ID="sk1exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
      <asp:ListItem>Novice</asp:ListItem>
      <asp:ListItem>Intermediate</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist> </td>
        </tr>
        <tr>
          <td width="3px"></td>
          <td class="headings2" align="left" > *Skills - 2 </td>
          <td >:</td>
          <td  align="left" class="headings2"> <asp:TextBox ID="skills2"  CssClass="headings2" runat="server"  Width="59px"  
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>             
           <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="please enter skills"
              ControlToValidate="skills2" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
              <td></td>
          <td class="headings2" align="left" >*No. Years </td>
          <td >:</td>
          <td align="left" class="headings2">
            <asp:TextBox ID="sk2yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Enter Skills"
              ControlToValidate="sk2yrs" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
          <td ></td>
          <td class="headings2" align="left" >*No. Months </td>
          <td >:</td>
          <td align="left" class="headings2" >
           <asp:TextBox ID="sk2mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" MaxLength="2" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Enter no. of Months"
           ControlToValidate="sk2mnts" ValidationGroup="Empform">*</asp:RequiredFieldValidator></td>
          <td ></td>
          <td class="headings2" align="left" >
            *Expert Level </td>
          <td >:</td>
          <td class="headings2" align="left" > <asp:Dropdownlist ID="sk2exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
      <asp:ListItem>Novice</asp:ListItem>
      <asp:ListItem>Intermediate</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>  </td>
        </tr>
        <tr >
          <td ></td>
          <td class="headings2" align="left"> &nbsp;Skills - 3 </td>
          <td >:</td>
          <td align="left" class="headings2">
         <asp:TextBox ID="skills3" runat="server" CssClass="headings2" Width="59px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Years </td>
          <td >:</td>
          <td  align="left" class="headings2">
     <asp:TextBox ID="sk3yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > &nbsp;No. Months </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="sk3mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
          
          </td>
          <td ></td>
          <td class="headings2" align="left" >
            Expert Level </td>
          <td >:</td>
          <td class="headings2" align="left" ><asp:Dropdownlist ID="sk3exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
      <asp:ListItem>Novice</asp:ListItem>
    <asp:ListItem>Intermediate</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>   </td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;Skills - 4 </td>
          <td >:</td>
          <td align="left" class="headings2">
          <asp:TextBox ID="skills4" runat="server" CssClass="headings2" Width="59px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Years </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="sk4yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>           
          
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Months </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="sk4mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > &nbsp;Expert Level </td>
          <td >:</td>
          <td class="headings2" align="left" ><asp:Dropdownlist ID="sk4exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
      <asp:ListItem>Novice</asp:ListItem>
        <asp:ListItem>Intermediate</asp:ListItem>  
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>   </td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;Skills - 5 </td>
          <td >:</td>
          <td align="left" class="headings2">
          <asp:TextBox ID="skills5" runat="server" CssClass="headings2" Width="59px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Years </td>
          <td >:</td>
          <td class="headings2" align="left">
          <asp:TextBox ID="sk5yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>   
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Months </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="sk5mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>    
          
          </td>
          <td ></td>
          <td class="headings2" align="left">
            Expert Level </td>
          <td >:</td>
          <td class="headings2" align="left" ><asp:Dropdownlist ID="sk5exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
      <asp:ListItem>Novice</asp:ListItem>
  <asp:ListItem>Intermediate</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>  </td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;Skills - 6 </td>
          <td>:</td>
          <td align="left" class="headings2">
          <asp:TextBox ID="skills6" runat="server" CssClass="headings2" Width="59px"  
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;No. Years </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="sk6yrs" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          
          </td> 
          <td></td>
          <td class="headings2" align="left" width="13%">&nbsp;No. Months </td>
          <td >:</td>
          <td class="headings2" align="left">
          <asp:TextBox ID="sk6mnts" runat="server" CssClass="headings2" Width="100px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>  
          </td>
          <td ></td>
          <td class="headings2" align="left" >&nbsp;
            Expert Level </td>
          <td >:</td>
          <td class="headings2" align="left" ><asp:Dropdownlist ID="sk6exp" runat="server" CssClass="headings2" Width="180px" BorderWidth="1"  BorderColor="Black" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Intermediate</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>   </td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr height="5">
          <td></td>
        </tr>
 <%-- <tr>
    <td><img src="images/spacer2.gif" width="10" height="10" /></td>
  </tr>--%>
  <tr>
     <td style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3">Education Details</span></td>
  </tr>
 <%-- <tr>
    <td><img src="images/spacer2.gif" width="10" height="10" /></td>
  </tr>--%>
  <tr height="5">
          <td></td>
        </tr>
  <tr>
    <td><table width="100%">
      <tbody>
        <tr>
          <td width="3px"></td>
          <td class="headings2" align="left" > PG </td>
          <td width="3px">:</td>
          <td class="headings2" align="left">
          <asp:TextBox ID="edu1" runat="server" CssClass="headings2" Width="112px"  
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
          <td width="3px"></td>
          <td class="headings2" align="left" > Board/University </td>
          <td width="3px">:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed1brd" runat="server" CssClass="headings2" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
          <td width="3px"></td>
          <td class="headings2" align="left" > Major in </td>
          <td width="3px">:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="ed1sub" runat="server" CssClass="headings2" Width="120px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
</td>          
          <td width="3px"></td>
          <td class="headings2" align="left" > Year of Pass </td>
          <td width="3px">:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed1yr" runat="server" MaxLength="4" CssClass="headings2" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
           <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" FilterType="Numbers" TargetControlID="ed1yr"></cc1:FilteredTextBoxExtender>

          
          </td>
          <td width="3px"></td>
          <td class="headings2" align="left" width="3%"> (%) </td>
          <td width="3px">:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed1per" runat="server" MaxLength="2" CssClass="headings2" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
           <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" FilterType="Numbers" TargetControlID="ed1per"></cc1:FilteredTextBoxExtender>

          </td>
          <td width="10px"></td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" > Graduation </td>
          <td>:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="edu2" runat="server" CssClass="headings2" Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" > Board/University </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed2brd" runat="server" CssClass="headings2" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
    
          </td>
          <td ></td>
          <td class="headings2" align="left" > Major in </td>
          <td >:</td>
          <td class="headings2" align="left" >
     <asp:TextBox ID="ed2sub" runat="server" CssClass="headings2" Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > Year of Pass </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed2yr" runat="server" CssClass="headings2" MaxLength="4" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" FilterType="Numbers" TargetControlID="ed2yr"></cc1:FilteredTextBoxExtender>

          </td>
          <td ></td>
          <td class="headings2" align="left" > (%) </td>
          <td >:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed2per" runat="server" CssClass="headings2" MaxLength="2" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
           <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" runat="server" FilterType="Numbers" TargetControlID="ed2per"></cc1:FilteredTextBoxExtender>

          </td><td width="10px"></td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" > UG</td>
          <td >:</td>
          <td class="headings2" align="left">
           <asp:TextBox ID="edu3" runat="server" CssClass="headings2" Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left"> Board/University </td>
          <td width="1%">:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed3brd" runat="server" CssClass="headings2" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
    
          </td>
          <td ></td>
          <td class="headings2" align="left" > Major in </td>
          <td >:</td>
          <td class="headings2" align="left" >
     <asp:TextBox ID="ed3sub" runat="server" CssClass="headings2" Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > Year of Pass </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed3yr" runat="server" CssClass="headings2" MaxLength="4" Width="60px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" FilterType="Numbers" TargetControlID="ed3yr"></cc1:FilteredTextBoxExtender>
     
          </td>
          <td ></td>
          <td class="headings2" align="left" > (%) </td>
          <td >:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed3per" runat="server" CssClass="headings2" MaxLength="2" Width="60px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server" FilterType="Numbers" TargetControlID="ed3per"></cc1:FilteredTextBoxExtender>
     
          </td><td width="10px"></td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left" > SSC</td>
          <td>:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="edu4" runat="server" CssClass="headings2" Width="112px"  
             BorderWidth="1"  BorderColor="Black"></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" > Board/University </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed4brd" runat="server" CssClass="headings2" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
    
          </td>
          <td ></td>
          <td class="headings2" align="left" > Major in </td>
          <td >:</td>
          <td class="headings2" align="left" >
     <asp:TextBox ID="ed4sub" runat="server" CssClass="headings2" Width="120px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > Year of Pass </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed4yr" runat="server" CssClass="headings2" MaxLength="4" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" FilterType="Numbers" TargetControlID="ed4yr"></cc1:FilteredTextBoxExtender>
  
          </td>
          <td ></td>
          <td class="headings2" align="left" > (%) </td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="ed4per" runat="server" CssClass="headings2" MaxLength="2" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender28" runat="server" FilterType="Numbers" TargetControlID="ed4per"></cc1:FilteredTextBoxExtender>
  
          </td><td width="10px"></td>
        </tr>
        <tr>
          <td ></td>
          <td class="headings2" align="left"> Other</td>
          <td >:</td>
          <td class="headings2" align="left" >
           <asp:TextBox ID="edu5" runat="server" CssClass="headings2" Width="112px"  
             BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left" > Board/University </td>
          <td >:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed5brd" runat="server" CssClass="headings2" Width="137px" 
             BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          </td>
          <td ></td>
          <td class="headings2" align="left"> Major in </td>
          <td >:</td>
          <td class="headings2" align="left">
     <asp:TextBox ID="ed5sub" runat="server" CssClass="headings2" Width="120px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
          
          </td>
          <td ></td>
          <td class="headings2" align="left" > Year of Pass </td>
          <td >:</td>
          <td class="headings2" align="left">
          <asp:TextBox ID="ed5yr" runat="server" CssClass="headings2" MaxLength="4" Width="60px" BorderWidth="1"  BorderColor="Black"  ></asp:TextBox>
   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server" FilterType="Numbers" TargetControlID="ed5yr"></cc1:FilteredTextBoxExtender>

          </td>
          <td ></td>
          <td class="headings2" align="left" > (%) </td>
          <td >:</td>
          <td class="headings2" align="left" >
          <asp:TextBox ID="ed5per" runat="server" CssClass="headings2" MaxLength="2" Width="60px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server" FilterType="Numbers" TargetControlID="ed5per"></cc1:FilteredTextBoxExtender>

          </td><td width="10px"></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <%--<tr>
    <td><img src="images/spacer2.gif" width="10" height="10" /></td>
  </tr>--%>
  <tr>
    <td><table align="left" cellpadding="0" cellspacing="2" width="100%">
      <tbody>
       
        <tr height="5">
          <td></td>
        </tr>
        <tr class="headings2" height="15">
          <td colspan="4"  align="left" valign="middle" bgcolor="#d4d8e1" class="headings3" style="height: 25px; "> Upload Resume </td>
        </tr>
      <%--  <tr >
          <td ><img src="images/spacer2.gif" width="10" height="10" /></td>
        </tr>--%>
        <tr height="15">
          <td width="100%" height="35" colspan="4" align="left"><table width="80%" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td width="3px"></td>
                <td class="headings2" width="15%"> Resume Title </td>
                <td width="3px">:</td>
                <td align="left" class="headings2">
     <asp:TextBox ID="restitle" runat="server" CssClass="textfield" Width="160px" BorderWidth="1"  BorderColor="Black" ></asp:TextBox>
                
                </td>
                <td width="3px">&nbsp;</td>
               
                <td class="headings2" width="15%"> Upload Resume </td>
                <td width="3px">:</td>
                <td align="left" class="headings2">
    <asp:FileUpload ID="rfile" runat="server" />                
                </td>
                <td width="2%"></td>
                <td class="headings2" width="8%"></td>
              </tr>
            </tbody>
          </table></td>
        </tr>
        <tr height="15">
          <td colspan="4" align="left" width="100%"><table width="100%" align="left" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td width="3px"></td>
                <td class="headings2" width="20%" align="left"> Resume in Text <br />
                  (Cut &amp; Paste Your Resume Here) </td>
                  <td width="3px">:</td>
                <td align="left" width="20%" class="headings2">
                <asp:TextBox ID="txtres" runat="server" TextMode="MultiLine" Height="188px" 
            Width="725px"></asp:TextBox>
                </td>
                <td width="2%"></td>
                <td class="headings2" width="8%"></td>
              </tr>
            </tbody>
          </table></td>
        </tr>
        <tr height="15">
          <td colspan="4"></td>
        </tr>
        <tr class="headings2" height="15">
          <td  colspan="4" align="left" valign="middle" bgcolor="#d4d8e1" style="height: 25px"><span class="headings3"> Upload your photo</span></td>
        </tr>
        <%--<tr height="15">
          <td colspan="4" align="left"><img src="images/spacer2.gif" width="10" height="10" /></td>
        </tr>--%>
        <tr height="15">
          <td colspan="4" align="left" width="100%"><table>
            <tbody>
              <tr>
                <td width="1%"></td>
                <td class="headings2" width="15%"> Upload your Photo </td>
                <td width="3px">:</td>
                <td align="left" width="80%" class="headings2">
                <asp:FileUpload ID="Fileupphoto" runat="server" Width="300px" />
                        (image size must be 135 x 135)
                        <br /> 
                </td>
                <td width="2%"></td>
                <td class="headings2" width="2%"></td>
              </tr>
            </tbody>
          </table></td>
        </tr>
        <tr height="15">
          <td colspan="4"></td>
        </tr>
        <tr class="headings2" height="15">
          <td colspan="4" style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3"> Mail &amp; Privacy Settings</span></td>
        </tr>
        <tr height="39">
          <td class="lable4" style="height: 30px" align="center" valign="top" width="100%"><table class="headings2" border="0" width="950">
            <tbody>
              <tr>
                <td class="headings2" width="33%">&nbsp;
                <asp:CheckBox ID="Checkbox1" runat="server" Checked="true" CssClass="chk-class" ValidationGroup="RS" />
               <%--   <input id="Checkbox1" name=" chkjobalerts" value="RS" checked="checked" type="checkbox" />--%>
                  Job 
                  Alerts and InduGroup products.</td>
                <td class="headings2" width="33%">&nbsp;
                <asp:CheckBox ID= "Checkbox2" CssClass="chk-class" runat="server" />
                 <%-- <input id="Checkbox2" name="mailers[]" value="RS" checked="checked" class="chk-class" type="checkbox" />--%>
                  Training 
                  Programs.</td>
                <td class="headings2" width="33%">&nbsp;
                <asp:CheckBox ID="Checkbox3" CssClass="chk-class" runat="server" />
                 <%-- <input id="Checkbox3" name="mailers[]" value="RS" checked="checked" type="checkbox" class="chk-class" />--%>
                  News 
                  Letters</td>
              </tr>
              
            </tbody>
          </table></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>
</td>
</tr>

<tr class="headings2" height="15">
          <td colspan="4" style="height: 25px" align="left" bgcolor="#d4d8e1" valign="middle"><span class="headings3"> Terms &amp; Conditions</span></td>
        </tr>
<tr height="15">
    <td colspan="4" align="center" class="login">
        * <%--<input id="termscond" type="checkbox" name="mailers[]" value="RS" checked="checked" />--%>
<asp:CheckBox ID="termscond" runat="server"  CssClass="chk-class"/>
 
        I have read and understood and agree to the Terms and Conditions governing the 
        use of <a href="http://www.igiit.net" target="_blank">igiit.net</a> 
   <br /> <span id="spanTNCmsg" class="messagetext">You must agree to the terms and 
        conditions before you can continue.</span>
    </td>
</tr>
 <tr>
    <td align="center" class="headings2">
    <asp:Button ID="btnSave_Emp" runat="server" Text="Submit" Width="101px" 
            onclick="btnSave_Emp_Click1" ValidationGroup="Empform"  />  
      <%-- <asp:Button ID="btnmail" runat="server" Text="Save & Sent Mail " Width="111px" OnClick="btnmail_Click"  
           /> --%>      
    </td>
    </tr>
    <tr height="15">
    <td class="headings2">
    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblid" runat="server" Visible=false></asp:Label>
    </td>
    </tr>
</table>
    </div></div></div></section>
    </form>
</body>
</html>
