<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_reg.aspx.cs" Inherits="Employee_reg" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>:: Ace Indus :: Employee Register page</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/chromestyle.css" />
    <script type="text/javascript" src="js/chrome.js"></script>
    <link rel="stylesheet" type="text/css" href="css/flexdropdown.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/flexdropdown.js"></script>
    <link rel="stylesheet" type="text/css" href="css/coin-slider-styles.css" />
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/TitilliumText14L_600.font.js"></script>
    <script type="text/javascript" src="js/cufon-run.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/hoverintent.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/coin-slider.min.js"></script>
    
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />


<script language="javascript" type="text/javascript">
    
    function moveOnMax(field,nextFieldID)
    {
      if(field.value.length >= field.maxLength)
      {
        document.getElementById(nextFieldID).focus();
        //document.getElementById(nextFieldId1).focus();
      }
    }
    
    function skltest(field)
    {
        if(field.value != "" )
        {
            document.frmRegistration.hdnskl.value=field.value;
	        alert(document.frmRegistration.hdnskl.value)
        }
        else
        {
            
            document.frmRegistration.hdnskl.value="";
          //  alert(document.regForm.hidState.value)
        }
    }


    function exptest(field)
    {
    if(field.value != "" )
        {
            document.frmRegistration.hdnexp.value=field.value;
	        alert(document.frmRegistration.hdnexp.value)
        }
        else
        {
            
            document.frmRegistration.hdnexp.value="";
          //  alert(document.regForm.hidState.value)
        }
    }



    function yrstest(field)
    {
    if(field.value != "" )
        {
            document.frmRegistration.hdnyrs.value=field.value;
	        alert(document.frmRegistration.hdnyrs.value)
        }
        else
        {
            
            document.frmRegistration.hdnyrs.value="";
          //  alert(document.regForm.hidState.value)
        }
    }


</script>

 <script language= "JavaScript" src="addrows.js" type="text/javascript"></script> 
<script language="JavaScript" src="Jscripts/regformvalidation.js" type="text/javascript"></script>

    
<style type="text/css">
.style19
{
    width: 13%;
}
.bodytext
{
width: 138%;
}
#Checkbox3
{
width: 21px;
}
#Checkbox2
{
width: 26px;
}
.style20
{
color: #174eb4;
background-color: #ffffff;
font-size: 11px;
font-weight: normal;
font-family: Geneva, Arial, Helvetica, sans-serif;
height: 15px;
padding-left: 5px;
width: 15%;
}
</style>    
</head>
<body topmargin="0" bottommargin="0" leftmargin="0">
<form id="regForm" name="regForm"  runat="server">

<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px">
        <table width="100%" border="0">
          <tr>
            <td width="20%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
            <td width="51%" align="center" style="padding-left:70px"><a href="#"><img src="images/iso1.png" width="131" height="60" border="0" /> </a></td>
            <td width="29%" valign="middle">
               <table width="100%" border="0" class="text" style="font-size:11px">
                   <tr>
                    <td width="11" align="right" valign="top"><img src="images/home-icon.png" width="13" height="16" /></td>
                    <td width="33" valign="top"><a href="http://www.aceindus.in/Default.aspx">Home</a></td>
                    <td width="13" valign="top" align="right"><img src="images/webdev-site-map-icon.png" width="15" height="15" /></td>
                    <td width="51" valign="top"><a href="http://www.aceindus.in/sitemap.html">Site map</a></td>
                    <td width="14" valign="top" align="right"><img src="images/phone-icon.png" width="15" height="13" /></td>
                    <td width="50" align="left" valign="top"><a href="http://www.aceindus.in/contact.aspx">Contact</a></td>
                    <td width="11" align="left" valign="top"><img src="images/loginicon.png" width="13" height="14" /></td>
                    <td width="64" align="left" valign="top"><a href="http://www.aceindus.in/login.aspx">Login</a></td>
                  </tr>
                </table>
            </td>
         </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td height="30">
        <div class="chromestyle" id="chromemenu">
            <ul>
                <li><a href="#" rel="dropmenu1">Corporate</a></li>
                <li><a href="#" rel="dropmenu2">IT Company</a></li>
                <%--<li><a href="http://www.aceindus.in/logistics.html" >Logistics</a></li>--%>
                <li><a href="#" rel="dropmenu4">Clients</a></li>
                <li><a href="academic/index.html" rel="dropmenu5" target="_blank">Academic</a></li>
                <li><a href="#" rel="dropmenu6">Websolutions</a></li>
                <li><a href="http://www.aceindus.in/products.html">Products</a></li>
                <li><a href="#" rel="dropmenu7">Software</a></li>	
                <li><a href="careersjob.aspx" rel="dropmenu8">Careers</a></li>
                <li><a href="http://www.aceindus.in/support.html" >Support</a></li>
                <li ><a href="http://www.aceindus.in/feedbackform.aspx">Feedback</a></li>	
            </ul>
        </div>
        <!--1st drop down menu -->                                                   
        <div id="dropmenu1" class="dropmenudiv" style="width:110px">
        <a href="http://www.aceindus.in/aboutus.html">About Us</a>
        <a href="http://www.aceindus.in/management.html">Management</a>
        <a href="http://www.aceindus.in/aceindusvision.html">Ace Indus Vision</a>
        <a href="http://www.aceindus.in/newsevents.html">News & Events</a>

        </div>


        <!--2nd drop down menu -->                                                
        <div id="dropmenu2" class="dropmenudiv" style="width:135px;">
        <a href="http://www.aceindus.in/technologies.html">Technologies</a>
        <a href="http://www.aceindus.in/companyoverview.html">Company Overview</a>
        <a href="http://www.aceindus.in/consulting.html">Consulting</a>
        <a href="http://www.aceindus.in/projectmanagement.html">Project Management</a>

        </div>

        <!--4rd drop down menu -->                                                   
        <div id="dropmenu4" class="dropmenudiv" style="width: 90px;">
         <a href="http://www.aceindus.in/alliances.html">Alliances</a>
         <a href="http://www.aceindus.in/clients.html">Clients</a>
         <a href="http://www.aceindus.in/partnerships.html">Partnerships</a>
         <a href="http://www.aceindus.in/business.html">Business</a>

        </div>

        <div id="dropmenu5" class="dropmenudiv" style="width:93px;">
        <%--<a href="http://www.aceindus.in/academic/" target="_blank">Computer </a>--%>
        <!--<a href="http://www.aceindus.in/academic/" target="_blank">Engineering</a>-->
        <!--<a href="http://www.aceindus.in/academic/" target="_blank">Management</a>-->
        </div>
        <div id="dropmenu6" class="dropmenudiv" style="width: 150px;">
        <a href="http://www.aceindus.in/Portfolio.html">Portfolio</a>
        <a href="http://www.aceindus.in/webhosting.html">Webhosting</a>
        <a href="http://www.aceindus.in/design_development.html">Design & Development</a>
        <a href="http://www.aceindus.in/graphic_designing.html">Graphic Designing</a>
        <a href="http://www.aceindus.in/website_Maintenance.html">Website Maintenance </a>

        </div>

        <div id="dropmenu7" class="dropmenudiv" style="width: 185px;">
         <a href="http://www.aceindus.in/software_development.html">Software Development</a>
         <a href="http://www.aceindus.in/crm_applications.html"> CRM Applications Accounting</a>
         <a href="http://www.aceindus.in/software_desktop.html">Software Desktop Application</a>
         <a href="http://www.aceindus.in/wap_application.html">WAP Application </a>
          <a href="http://www.aceindus.in/erp_software.html">ERP Software</a>

        </div>

        <div id="dropmenu8" class="dropmenudiv" style="width: 130px;">
        <a href="http://www.aceindus.in/overview.html">Overview</a>
        <a href="http://www.aceindus.in/benefits.html"> Benefits</a>
        <a href="http://www.aceindus.in/fulltime_jobs.aspx">Fulltime Jobs</a>
        <a href="http://www.aceindus.in/postresume.aspx">Post your resume</a>
        <a href="http://www.aceindus.in/new_employeeform.aspx">New Employee Form</a>
        </div>
    </td>
  </tr>
  <tr>
    <td height="200" valign="top">
        <div class="slider">
          <div id="coin-slider">
            <div id="nav_wrapper"> <a href="#"><img src="images/slide1.jpg" width="100%" height="250" alt="slide1"  border="0"/></a> <a href="#"><img src="images/slide3.jpg"  width="100%" height="250"  border="0"/></a> <a href="#"><img src="images/slide4.jpg"  width="100%" height="250"  border="0"/></a> 
            </div>
          </div>
        </div>
    </td>    
  </tr>
  <tr>
  <!-- start the DIV-->
    <td  valign="top" align="left">
        <div id="contentbox">
            <!--start the inner content-->
            <div class="innerleft">
                <table width="100%" border="0" class="text">
                    <tr>
                        <td class="innertext">Employee Register :</td>
                    </tr>
                    <tr>
                        <td width="1000" align="center">
                            <table width="99%" cellpadding="0" cellspacing="2" align="left" style="height:700px">
                                <tr height="15" class="headings2">
                                  <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
                                      <font color="white"><strong>UserID & Password:</strong></font></span>
                                  </td>
                                </tr>
                                <tr height="15">
                                  <td colspan="4">
                                    <table>
                                      <tr>
                                        <td width="2%"></td>
                                        <td width="13%" class="headings2" align="left">
                                            * User ID (EmailID)</td>
                                         <td width="2%">:</td>
                                         <td width="26%" align="left">
                                            <asp:TextBox ID="txtemail" runat="server" CssClass="textfield" Width="190px" 
                                                 BorderWidth="1" ></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ErrorMessage="*" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                                         </td>
                                         <td width="2%"></td>
                                         <td width="13%" class="headings2" align="left">
                                            &nbsp; Conf. Mail ID
                                         </td>
                                         <td width="2%">:</td>
                                         <td width="26%" align="left">
                                            <asp:TextBox ID="ctxtmail" runat="server" CssClass="textfield" Width="190px" 
                                                 BorderWidth="1" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvctxtmail" runat="server" ErrorMessage="*" ControlToValidate="ctxtmail">
                                            </asp:RequiredFieldValidator>
                                         </td>
                                         <td width="2%"></td>
                                         <td width="13%" class="headings2" align="left">
                                            * Password
                                         </td>
                                         <td width="2%" valign="top">:</td>
                                         <td width="26%" align="left">
                                         <asp:TextBox ID="txtpwd" runat="server" CssClass="textfield" Width="190px" 
                                                 BorderWidth="1" TextMode="Password" ></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ErrorMessage="*" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
                                         </td>
                                         
                                        </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr height="15" class="headings2">
                                    <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" >
                                        <span class="headings3">
                                            <font color="white"><strong>Contact Information:</strong></font>
                                        </span>
                                    </td>
                                </tr>
                                <tr height="15">
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td width="2%"></td>
                                                <td width="13%" class="headings2" align="left">
                                                    * First Name
                                                 </td>
                                                 <td width="2%">:</td>
                                                 <td width="26%" align="left">
                                                 <asp:TextBox ID="fname" runat="server" CssClass="textfield" Width="190px" 
                                                         BorderWidth="1" ></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="fname"></asp:RequiredFieldValidator>
                                                     
                                                 </td>
                                                 <td width="2%"></td>
                                                 <td width="13%" class="headings2" align="left">
                                                    &nbsp; Middle Name
                                                 </td>
                                                 <td width="2%">:</td>
                                                 <td width="26%" align="left">
                                                 <asp:TextBox ID="mname" runat="server" CssClass="textfield" Width="190px" 
                                                         BorderWidth="1" ></asp:TextBox>
                                                
                                                 </td>
                                                <td width="2%"></td>
                                                <td width="13%" class="headings2" align="left">
                                                    * Last Name
                                                 </td>
                                                 <td width="2%" valign="top">:</td>
                                                 <td width="26%" align="left">
                                                 <asp:TextBox ID="lname" runat="server" CssClass="textfield" Width="190px" 
                                                         BorderWidth="1" ></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="lname"></asp:RequiredFieldValidator>
                                                 </td>
                                               </tr>
    
                                            <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Gender
     </td>
     <td width="2%">:</td>
<td width="26%" align="left">
    <asp:RadioButtonList ID="gend" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem  Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>    
</td>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Spouse Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
        <asp:TextBox ID="mmname" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
     </td>
     <td width="2%"></td>
     <td width="13%" class="headings2" align="left">
        * Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
 
         <asp:ScriptManager ID="ScriptManager2" runat="server">
         </asp:ScriptManager>
        <asp:TextBox ID="txtsb" runat="server" CssClass="textfield" Width="190px" contenteditable="false" ></asp:TextBox>   
         <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtsb">
         </asp:CalendarExtender>
                           
     </td>     
   </tr>
     
                                            <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        *Spouse Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:RadioButtonList ID="spgen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem  Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
     
     
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Father Name
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="fatname" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="fatname"></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Mother Name
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="motname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="motname"></asp:RequiredFieldValidator>
         
     </td>
     
    </tr>
    
                                            <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;Child Name - 1
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k1name" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
         
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;Child Name - 2
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k2name" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;Child Name - 3
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k3name" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       
     </td>
    </tr>
                                            <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-1 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k1gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    
   <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-2 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k2gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-3 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k3gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem  Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    </tr>
                                            <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">            
        
        <asp:TextBox ID="txtk1bd" runat="server" CssClass="textfield" Width="190px" ></asp:TextBox>                             
         <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtk1bd">
         </asp:CalendarExtender>
     </td>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="txtk2bd" runat="server" CssClass="textfield" Width="190px"></asp:TextBox>      
         <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID ="txtk2bd">
         </asp:CalendarExtender>
     
    </td>
 <td width="2%"></td>   
<td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
    <asp:TextBox ID="txtk3bd" runat="server" CssClass="textfield" Width="190px"></asp:TextBox>      
         <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID ="txtk3bd">
         </asp:CalendarExtender>
    </td>
    
    </tr>
                                            <%--<tr>
     <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp; S S No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
         <table border="0">
            <tr>
                <td>
                    <asp:TextBox ID="k1ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" MaxLength="16"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="RegExprk1ssn" runat="server" ErrorMessage="PLease enter the 16 digit Number"
                     ValidationExpression="\d{16}" ControlToValidate="k1ssn" Font-Size="Smaller"></asp:RegularExpressionValidator>    
                </td>
            </tr>
        </table>
    </td>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; S S No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
        <table border="0">
            <tr>
                <td>
                    <asp:TextBox ID="k2ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" MaxLength="16"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="RegExprk2ssn" runat="server" ErrorMessage="PLease enter the 16 digit Number"
                     ValidationExpression="\d{16}" ControlToValidate="k2ssn" Font-Size="Smaller"></asp:RegularExpressionValidator>    
                </td>
            </tr>
        </table>
    
     </td>
    
 <td width="2%"></td>
    <td width="13%" class="headings2" align="left" valign="top">
        &nbsp; S S No
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
        <table border="0">
            <tr>
                <td>
                    <asp:TextBox ID="k3ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" MaxLength="16"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="RegExprk3ssn" runat="server" ErrorMessage="PLease enter the 16 digit Number"
                     ValidationExpression="\d{16}" ControlToValidate="k3ssn" Font-Size="Smaller"></asp:RegularExpressionValidator>    
                </td>
            </tr>
        </table>
     </td>
    </tr>--%>
                                        </table>
                                    </td>
                                </tr>
                                <%--Present Address--%>
   
                                <tr height="15" class="headings2">
                                    <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
                                        <font color="white"><strong>Present Address:</strong></font></span>
                                    </td>
                                </tr>
                                <tr height="15">
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td width="2%"></td>
                                                <td width="13%" class="headings2" align="left">
                                                    * Country
                                                 </td>
                                                 <td width="2%">:</td>
                                                 <td width="26%" align="left">
                                                 <asp:Dropdownlist ID="country" runat="server" CssClass="textfield" Width="190px"  
                                                         BorderWidth="1"  AutoPostBack="true" 
                                                         onselectedindexchanged="country_SelectedIndexChanged">
                                                 <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                                 </asp:Dropdownlist>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="country" InitialValue="Select Country" ></asp:RequiredFieldValidator>
                                                    
                                                 </td>
                                                <td width="2%"></td>
                                                <td width="13%" class="headings2" align="left">*Street</td>
                                                <td width="2%" valign="top">:</td>
                                                <td width="26%" align="left" colspan="5">
                                                 <asp:TextBox ID="street" runat="server" CssClass="textfield" Width="580px" 
                                                         BorderWidth="1" ></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="street"></asp:RequiredFieldValidator>
                                                </td>
                                                   <%-- <td width="2%"></td>
                                                    <td width="13%" class="headings2" align="left" >
                                                        Street2
                                                     </td>
                                                     
                                                     <td width="2%">:</td>
                                                     <td width="26%" align="left">
                                                     <asp:TextBox ID="stret2" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
                                                   </td>--%>
                                                    
                                                <%--<td width="2%"></td>
                                                    <td width="13%" class="headings2" align="left">
                                                    * City
                                                     </td>
                                                     <td width="2%">:</td>
                                                     <td width="26%" align="left">
                                                     <asp:TextBox ID="TextBox3" runat="server" CssClass="textfield" Width="190px" 
                                                             BorderWidth="1" ></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="lname"></asp:RequiredFieldValidator>
                                                     </td>
                                                --%>     
                                            </tr>
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * State      </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
         <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
         <asp:ListItem Value="Select Country">Select State</asp:ListItem>
         </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="state" InitialValue="Select State"></asp:RequiredFieldValidator>
     </td>
     <td width="2%"></td>
     <td width="13%" class="headings2" align="left">
        * City
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
       <asp:TextBox ID="city" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="city"></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Zip</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="zip" runat="server" CssClass="textfield" Width="199px" 
             BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="zip"></asp:RequiredFieldValidator>  
     </td>
    </tr>
    
    
    
    
     <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Work Ph
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <%--<asp:TextBox ID="wphone" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>     --%>
     <asp:TextBox ID="wp1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'wp2')"></asp:TextBox>   
     <asp:TextBox ID="wp2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="4" onkeyup="moveOnMax(this,'wp3')" 
             Height="20px" ></asp:TextBox>   
     <asp:TextBox ID="wp3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4" ></asp:TextBox>   
     
     
         <asp:RequiredFieldValidator ID="rfvwp1" runat="server" ErrorMessage="*" ControlToValidate="wp1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvwp2" runat="server" ErrorMessage="*" ControlToValidate="wp2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvwp3" runat="server" ErrorMessage="*" ControlToValidate="wp3" ></asp:RequiredFieldValidator>
    
     </td>
     
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Home Ph
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left"> 
     <%--<asp:TextBox ID="hphone" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>--%>
     
     <asp:TextBox ID="hp1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'hp2')" ></asp:TextBox>   
     <asp:TextBox ID="hp2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="4" onkeyup="moveOnMax(this,'hp3')" ></asp:TextBox>   
     <asp:TextBox ID="hp3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4"  ></asp:TextBox>   
     
     
     
    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" ControlToValidate="hp1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*" ControlToValidate="hp2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" ControlToValidate="hp3" ></asp:RequiredFieldValidator>
     </td>
     
 <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Mobile</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
    <%-- <asp:TextBox ID="mobile" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>--%>
    
     <asp:TextBox ID="mb1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'mb2')" 
             Height="18px" ></asp:TextBox>   
     <asp:TextBox ID="mb2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="4" onkeyup="moveOnMax(this,'mb3')" ></asp:TextBox>   
     <asp:TextBox ID="mb3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4" ></asp:TextBox>   
     
     <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="mb1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="*" ControlToValidate="mb2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="*" ControlToValidate="mb3" ></asp:RequiredFieldValidator>
    
     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="mobile"></asp:RequiredFieldValidator>  --%>
     
     </td>
    </tr>
    
    
    
    </table>
    </td>
    </tr>
    
<%--Birth Details    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong>Birth Details:</strong></font> </span></td>
    </tr>

    

<tr height="15">
    <td colspan="4">
<table>
<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">    
     
  <asp:TextBox ID="txtbdate" runat="server" CssClass="textfield" Width="190px"></asp:TextBox> 
         <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID ="txtbdate">
         </asp:CalendarExtender>    
                           <asp:RequiredFieldValidator ID="rfvtxtbdate" runat="server" 
                        ErrorMessage="Please Enter Birth Date  " ControlToValidate="txtbdate" >*</asp:RequiredFieldValidator>        
         
         </td>
    
    <td width="1%" ></td>
    <td width="13%"  align="left" class="headings2">
        * Birth Country </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:Dropdownlist ID="bcountry" runat="server" CssClass="textfield" Width="190px"  
             BorderWidth="1" AutoPostBack="true" 
             onselectedindexchanged="bcountry_SelectedIndexChanged" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="bcountry" InitialValue="Select Country"></asp:RequiredFieldValidator>
    
     </td>
    
<td width="1%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Birth State
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="bstate" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select State">Select State</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="bstate" InitialValue="Select State"></asp:RequiredFieldValidator>  
     </td>
    </tr>
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Birth City
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="bcity" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="bcity" ></asp:RequiredFieldValidator>      
     </td>
    
    <td width="2%" ></td>
    <td width="13%"  align="left" class="headings2">
        * Citizenship </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:Dropdownlist ID="ccountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ccountry" InitialValue="Select Country"></asp:RequiredFieldValidator>
    
     </td>
    
<td width="1%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Passport No
     </td>
     <td width="2%">:</td>
     <td colspan="5" width="24%" align="left">
       <asp:TextBox ID="passno" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" MaxLength="9" ></asp:TextBox>
     </td>
    </tr>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Issued at
       </td>
     <td width="2%">:</td>
     <td width="25%" align="left">
     <asp:Dropdownlist ID="pcountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
     </td>
    
    
    <td width="2%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Issed at Place
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" >
       <asp:TextBox ID="pplace" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
             
         </td>
    
    <td width="1%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Issue Date </td>
     <td width="2%">:</td>
     <td width="25%" align="left">
     <asp:TextBox ID="txtisdate" runat="server" CssClass="textfield" Width="190px"></asp:TextBox>      
         <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtisdate">
         </asp:CalendarExtender>
          </td>  
    </tr>       
    <tr>    
    
    <td width="2%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Expiry Date
       </td>
     <td width="2%">:</td>
     <td width="26%" align="left" >
    <asp:TextBox ID="txtexpdate" runat="server"></asp:TextBox>   
         <asp:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID ="txtexpdate">
         </asp:CalendarExtender>
         </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Nationality
     </td>
     <td width="1%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="ncountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
     </td>
    
    <td width="1%" ></td>
    <td width="15%"  align="left"  class="headings2">
        &nbsp;</td>
     <td width="1%"></td>
     <td width="24%" align="left">
     <asp:TextBox ID="cpassport" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" Visible="false" ></asp:TextBox>
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="issdate" ></asp:RequiredFieldValidator>--%>
     </td>
    
<td width="1%" ></td>
    <td class="style20" align="left">
     
     </td>
     </td>
    </tr>
    
    </table>
    </td>
    </tr>
                    <%--Emergency Details    --%>
                    <tr height="15">
                        <td colspan="4"></td>
                    </tr>
                    <tr height="15" class="headings2">
                        <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
            <font color="white"><strong>Emergency Contact Person Details:</strong></font>
          </span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Cont Person-1
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpname1" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="*" ControlToValidate="cpname1" ></asp:RequiredFieldValidator>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpphone1" runat="server" CssClass="textfield" MaxLength="10" Width="190px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvphoneNo" runat="server" 
                              ErrorMessage="Please Enter Phone Number" ControlToValidate="cpphone1" 
                              >*</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revPhno" runat="server" 
                              ControlToValidate="cpphone1" 
                              ErrorMessage="Please enter a valid phone number of 10 digits" 
                              ValidationExpression="\d{10}" >*</asp:RegularExpressionValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Email ID
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpemail1" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="*" ControlToValidate="cpemail1" ></asp:RequiredFieldValidator>  
       
       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
             ErrorMessage="*" ControlToValidate="cpemail1" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       
     </td>
    </tr>
    

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Address
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" colspan="9">
     <asp:TextBox ID="cpaddr1" runat="server" CssClass="textfield" Width="530px"  
             BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="*" ControlToValidate="cpaddr1" ></asp:RequiredFieldValidator>  
     </td>
    </tr>

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Cont Person-2</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpname2" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="*" ControlToValidate="cpname2" ></asp:RequiredFieldValidator>  
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpphone2" runat="server" CssClass="textfield" MaxLength="10" Width="190px" BorderWidth="1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvphno2" runat="server" 
                              ErrorMessage="Please Enter Phone Number" ControlToValidate="cpphone2" 
                              >*</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revph2" runat="server" 
                              ControlToValidate="cpphone2" 
                              ErrorMessage="Please enter a valid phone number of 10 digits" 
                              ValidationExpression="\d{10}" >*</asp:RegularExpressionValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Email ID
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpemail2" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="*" ControlToValidate="cpemail2" ></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
             ErrorMessage="*" ControlToValidate="cpemail2" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </td>
    </tr>

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Address
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left" colspan="9">
     <asp:TextBox ID="cpaddr2" runat="server" CssClass="textfield" Width="529px"  
             BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="*" ControlToValidate="cpaddr2" ></asp:RequiredFieldValidator>      
     </td>
    </tr>
   </table>
    </td>
    </tr>

<%--Professional Experience    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" >
      <font color="white"><strong>Professional Experience Details:</strong></font>
          </td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="1%" valign="middle"></td>
    <td width="13%" class="headings2" align="left">
        * Total Exp.Yrs &amp; Months
     </td>
     <td width="3%">:  </td>
     
     <td align="left" width="20%" class="heading2">
    <asp:TextBox ID="expyrs" runat="server" CssClass="textfield" Width="50px"  
             BorderWidth="1" MaxLength="2"></asp:TextBox>Yrs
             <asp:TextBox ID="expmon" runat="server" CssClass="textfield" Width="50px"  
             BorderWidth="1" MaxLength="2" ></asp:TextBox>Month
             
        <asp:RequiredFieldValidator ID="rfvexp" runat="server" ErrorMessage="Enter Numbers Only" 
        ControlToValidate="expyrs" Font-Size="X-Small" ></asp:RequiredFieldValidator>
    
          <asp:RequiredFieldValidator ID="rfvmonth" runat="server" ErrorMessage="*" ControlToValidate="expmon" ></asp:RequiredFieldValidator>
         </td>
    
    <td width="2%"></td>
    <td width="15%" class="headings2" align="left">
        &nbsp;Functional Area
     </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:TextBox ID="fnarea" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvfnarea" runat="server" ControlToValidate="fnarea"
    ErrorMessage="Please Enter Functional Area">*</asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Current Industry
     </td>
     <td width="2%" valign="top">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="currind" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvcurrind" runat="server" ControlToValidate="currind"
    ErrorMessage="Please Enter Current Industry">*</asp:RequiredFieldValidator>
       
     </td>
    </tr> 
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Desgination
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" colspan="9">
    <%-- <asp:TextBox ID="TextBox1" runat="server" CssClass="textfield" Width="530px"  
             BorderWidth="1" ></asp:TextBox>--%>
             <asp:Label ID="lbldisg" runat="server"></asp:Label>
     </td>
    </tr>
    </table>
    
</td>
</tr>



<%--Skills    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong>Skiils:</strong></font>
          </span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 1
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills1" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
             
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk1yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk1exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 2
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills2" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
             
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk2yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk2exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 3
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills3" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk3yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk3exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
   
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 4
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills4" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk4yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk4exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 5
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills5" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk5yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk5exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 6
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills6" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk6yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk6exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
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
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong>Education Details:</strong></font>
          </span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        PG
     </td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu1" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed1brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Majorin
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed1sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed1yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed1per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr> 
    

 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Graduation
     </td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu2" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed2brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed2sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed2yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed2per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr> 
      

 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        UG</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu3" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed3brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed3sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed3yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed3per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>     
    
   
   
   
    
    
  
 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        SSC</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu4" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed4brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed4sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed4yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed4per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>     
    
   
   
   
   <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Other</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu5" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed5brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed5sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed5yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed5per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>  
    
     <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Other1</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu6" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed6brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed6sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed6yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed6per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>   
    
    <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Othe2</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu7" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed7brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed7sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed7yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed7per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>  
    
    
    
      
       
   
    </table>
    
</td>
</tr>



<%--Upload Resume    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong>Upload Resume:</strong></font></td>
    </tr>
<tr height="15">
    <td colspan="4" width="100%" align="left">
    <table>
    <tr>
    <td width="1%">
    
    </td>
    
    <td width="8%" class="headings2">
        Resume Title
    </td>
    <td width="1%">:</td>
    <td width="20%" align="left">
     <asp:TextBox ID="restitle" runat="server" CssClass="textfield" Width="160px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvrestitle" runat="server"
     ControlToValidate="restitle" ErrorMessage="Please Enter resume Title" >*</asp:RequiredFieldValidator>
    </td>
    
    <td width="2%"></td>
    <td width="8%" class="headings2">
        Upload Resume
    </td>
    <td align="center" width="1%">:</td>
    <td width="20%" align="left">
    <asp:FileUpload ID="rfile" runat="server" />
    <asp:RequiredFieldValidator ID="rfvfile" runat="server" 
                      ErrorMessage="Please upload File" ControlToValidate="rfile" 
                      >*</asp:RequiredFieldValidator><br />  
    </td>
    <td width="2%"></td>
    <td width="8%" class="headings2"></td>
    
    </tr>
    
</table>
</td>
</tr>

<tr height="15">
    <td class="headings2">Resume in Text:
        <br />
        (Cut &amp; Paste Your Resume Here) </td>
    <td colspan="3" align="left">
        <asp:TextBox ID="txtres" runat="server" TextMode="MultiLine" Height="188px" 
            Width="725px"></asp:TextBox>  </td>
</tr>

<%-- Starting Image Upload--%>
<tr height="15" class="headings2">
  <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong>Upload Photo:</strong></font>
  </td>
</tr>
<tr>
    <td style="padding:10px 0px 10px 0px" class="headings2">Upload your Photo:
    </td>
    <td align="left" style="padding:10px 0px 10px 0px">
        <asp:FileUpload ID="fluppic" runat="server" Width="300px" />
        <br />(image size must be 64 x 64)
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="upload Your Photo" ControlToValidate="fluppic">*</asp:RequiredFieldValidator><br />  
   </td>    
</tr>


<%--Ending Image Upload--%>



<%--Mail Alert   --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
      <font color="white"><strong> Mail &amp; Privacy Settings:</strong></font>
         </span></td>
    </tr>
<tr height="15">
    <td colspan="4" width="100%" align="left">
<table>

<%--<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     Cont. Person-2
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox17" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
         
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     &nbsp;
     Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox18" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     &nbsp;
     Email ID
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox19" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       
     </td>
    </tr>
--%>

 <tr height="39">
      <td width="950" align="left" valign="top" class="lable4" style="height: 30px">
          <table class="headings2" border="0" width="950">
          <tr>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox1" type="checkbox" name=" chkjobalerts" value="RS" checked="checked" />Job 
                Alerts and InduGroup products.</td>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox2" type="checkbox" name="mailers[]" value="RS" checked="checked" />Training 
                Programs.</td>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox3" type="checkbox" name="mailers[]" value="RS" checked="checked" />News 
                Letters</td>
          </tr>
   
</table></td>
</tr>
</table>
</td>
</tr>


<tr height="15">
    <td colspan="4" align="center" class="headings2">
    </td>
</tr>
<tr height="15">
    <td colspan="4" align="center" class="headings2">
    </td>
</tr>

    <tr>
    <td colspan="4" align="center" class="headings2">
        <asp:Button ID="btn_submit" runat="server" Text="Submit" Width="101px"  
                OnClick ="btn_submit_Click" />
    </td>
    </tr>
    
    <tr height="15">
    <td colspan="4">
    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
    </td>
    </tr>
    
</table>

  </td>
  </tr>
    </table>
   <!-- end of inner content-->
    
<div class="contentfooter">

  <table width="100%" border="0" class="fotertext">
  <tr>
    <td width="17%" height="18">&nbsp;</td>
    <td width="7%" align="center"><a href="aboutus.html">About Us</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="9%" align="center">&nbsp;&nbsp;&nbsp;<a href="accounting.html">Accounting</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="9%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://hms.aceigi.net/" target="_blank">Healthcare</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="16%" align="center">&nbsp;&nbsp;<a href="consultants_services.html" data-flexmenu="flexmenu1">&nbsp;Consultancy Services</a>&nbsp;&nbsp;&nbsp;&nbsp;|

<ul id="flexmenu1" class="flexdropdownmenu">
<li><a href="interview_tips.html">Interview Tips</a></li>
<li><a href="find_ajob.html">Find a Job</a></li>

<li><a href="http://careersgen.net/jobs_seeker_login.aspx" target="_blank">Job Seekers</a></li>

<li><a href="http://careersgen.net/RecruitersZone/recruiters_zone_Login.aspx" target="_blank">Recruitment</a></li>
</ul>
</td>
    <td width="11%" align="center">&nbsp;&nbsp;&nbsp;<a href="technologies.html">Technologies </a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://www.aceindustraining.com/" target="_blank">Training</a>&nbsp;&nbsp;&nbsp;|</td> <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="contact.aspx">Contact</a>&nbsp;&nbsp;&nbsp;</td>
    <td width="17%">&nbsp;</td>
  </tr>
</table>
</div>
<div class="footerbottam" align="center">Copy right @1999-2012 Ace Indus Tech -Sol, All Rights reserved</div>
    </div></td>
    <!-- end of the DIV-->
  </tr>
  
  <script type="text/javascript">

cssdropdown.startchrome("chromemenu")

</script>
</table>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</form>
</body>
</html>
