<%@ Page Language="C#" AutoEventWireup="true" CodeFile="client_register.aspx.cs" Inherits="client_register" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Ace Indus :: Client Register Page</title>
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

    <style type="text/css">
        .style1
        {
            width: 759px;
        }
    </style>
</head>
<body>
<form id="kb" runat="server">
<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px">
    <table width="100%" border="0">
      <tr>
        <td width="36%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
        <td width="10%">&nbsp;</td>
        <td width="21%" valign="middle">
        <table width="100%" border="0" class="text" style="font-size:11px">
           <tr>
            <td width="9" align="right" valign="top"><img src="images/home-icon.png" width="13" height="16" /></td>
            <td width="33" valign="top"><a href="http://www.aceindus.in/Default.aspx">Home</a></td>
            <td width="13" valign="top" align="right"><img src="images/webdev-site-map-icon.png" width="15" height="15" /></td>
            <td width="51" valign="top"><a href="http://www.aceindus.in/sitemap.html">Site map</a></td>
            <td width="14" valign="top" align="right"><img src="images/phone-icon.png" width="15" height="13" /></td>
            <td width="50" align="left" valign="top"><a href="http://www.aceindus.in/contact.aspx">Contact</a></td>
            <td width="11" align="left" valign="top"><img src="images/loginicon.png" width="13" height="14" /></td>
            <td width="64" align="left" valign="top"><a href="http://www.aceindus.in/login.aspx">Login</a></td>
          </tr>
             <tr>
                <td>
                    <br />
                </td>
            </tr>

            <tr>
                <td  align="right" >
                      <p style="color:#c40909; font-family:'Segoe UI'; font-size:16px; top:-10px; font-weight:bold; width:212px; margin-top:-5px; margin-right:-212px;">
                          <img src="images/ph.png" alt="" style="height:20px;width:20px; margin-bottom:-4px;" />&nbsp;&nbsp;: 040-2311-6227</p>
                </td>
            </tr>
        </table></td>
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
  <li ><a href="http://www.aceindus.in/ittraining/" target="_blank">Training</a></li>
</ul>
</div>

<!--1st drop down menu -->                                                   
<div id="dropmenu1" class="dropmenudiv" style="width:110px">
<a href="http://www.aceindus.in/aboutus.html">About Us</a>
<a href="http://www.aceindus.in/management.html">Management</a>
<a href="http://www.aceindus.in/aceindusvision.html">Ace Indus Vision</a>
<a href="http://www.aceindus.in/newsevents.html">News&Events</a>

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
        <div id="nav_wrapper">
            <a href="#"><img src="images/slide1.jpg" width="95%" height="200" alt="slide1" /></a>
            <a href="#"><img src="images/slide3.jpg"  width="95%" height="200" alt="slide3" /></a>
            <a href="#"><img src="images/slide4.jpg"  width="95%" height="200" alt="slide4" /></a>
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
    <table width="100%"  border="0" class="text">
      <tr>
        <td class="style1">
            <table border="0" width="100%"> 
                <tr>
                    <td class="innertext" colspan="2">Client Register :</td>
                </tr>
                <tr height="10px">
                    <td></td>
                </tr>
                <tr>
                     <td width="350"  valign="top">
                                <table width="100%" border="0" style="background:url(images/regiterbg.png) no-repeat; width:401px; height:1335px; padding:10px">
                                  <tr>
                                    <td width="153" height="58" class="hedings" valign="top" style="padding:10px 0  0 10px">Register Form</td>
                                    <td width="26">&nbsp;</td>
                                    <td width="186">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>User ID &amp; Password</b></font></td>
                                  </tr>
                                  <tr>
                                        <td>
                                            <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px" 
                                                ontextchanged="txtusername_TextChanged" AutoPostBack="true"></asp:TextBox>
                                               
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                           <div id="checkusername" runat="server"  Visible="false">
                                                <asp:Image ID="imgstatus" ImageUrl="~/admin/images/check.gif" runat="server" Width="17px" Height="17px"/>
                                                <asp:Label ID="CheckAvailability" runat="server">Check Availability</asp:Label>&nbsp;&nbsp;&nbsp;
                                           </div>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" 
                                                Font-Size="Smaller" Display="Static" Font-Overline="False" SetFocusOnError="True" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>
                                            <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                  </tr>
                                  <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>
                                            <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px" 
                                                TextMode="Password"></asp:TextBox>
                                        </td>
                                  </tr>
                                  <tr> 
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" ErrorMessage="Please Enter Re-Password" ValidationGroup="client">
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                                                ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="client"></asp:CompareValidator>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>
                                            <asp:Label ID="lblcompanyname" runat="server" Text="Company Name"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                  </tr>
                                  <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>
                                            <asp:Label ID="lblcompanymailid" runat="server" Text="Company Mail ID"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                  </tr>
                                  <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>    
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ErrorMessage="Please Enter Valid Email Address" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="client"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtcompanymailid" ValidationGroup="client"></asp:RequiredFieldValidator>    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ddlindustype" runat="server" Text="Industry Type"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:DropDownList ID="ddlindtype" runat="server" Width="200px" 
                                                CssClass="lable4">
                                                <asp:ListItem Selected="True">Select Industry Type</asp:ListItem>
                                                <asp:ListItem value="Accounting/Taxation/Finance">Accounting/Taxation/Finance</asp:ListItem>
                                                <asp:ListItem value="Advertising/PR/MR/Events">Advertising/PR/MR/Events</asp:ListItem>
                                                <asp:ListItem value="Agriculture/Dairy">Agriculture/Dairy</asp:ListItem>
                                                <asp:ListItem value="Architecture/Interior Designing">Architecture/Interior Designing</asp:ListItem>
                                                <asp:ListItem value="Auto/Auto Ancillary">Auto/Auto Ancillary</asp:ListItem>
                                                <asp:ListItem value="Banking/Financial Services/Broking">Banking/Financial Services/Broking</asp:ListItem>
                                                <asp:ListItem value="BPO/ITES/CRM/Transcription">BPO/ITES/CRM/Transcription</asp:ListItem>
                                                <asp:ListItem value="Chemicals/PetroChemical/Plastic/Rubber">Chemicals/PetroChemical/Plastic/Rubber</asp:ListItem>
                                                <asp:ListItem value="Construction/Engineering/Cement/Metals">Construction/Engineering/Cement/Metals</asp:ListItem>
                                                <asp:ListItem value="Consumer Durables">Consumer Durables</asp:ListItem>
                                                <asp:ListItem value="Courier/Transportation/Freight">Courier/Transportation/Freight</asp:ListItem>
                                                <asp:ListItem value="Defence/Government">Defence/Government</asp:ListItem>
                                                <asp:ListItem value="Education/Teaching/Training">Education/Teaching/Training</asp:ListItem>
                                                <asp:ListItem value="Export/Import">Export/Import</asp:ListItem>
                                                <asp:ListItem value="Fertilizers/Pesticides">Fertilizers/Pesticides</asp:ListItem>
                                                <asp:ListItem value="FMCG/Foods/Beverage">FMCG/Foods/Beverage</asp:ListItem>
                                                <asp:ListItem value="Fresher/Trainee">Fresher/Trainee</asp:ListItem>
                                                <asp:ListItem value="Gems and Jewellery">Gems&amp; Jewellery</asp:ListItem>
                                                <asp:ListItem value="Hotels/Restaurants/Airlines/Travel">Hotels/Restaurants/Airlines/Travel</asp:ListItem>
                                                <asp:ListItem value="Industrial Products/Heavy Machinery">Industrial Products/Heavy Machinery</asp:ListItem>
                                                <asp:ListItem value="Insurance">Insurance</asp:ListItem>
                                                <asp:ListItem value="IT-Software/Software Services">IT-Software/Software Services</asp:ListItem>
                                                <asp:ListItem value="IT-Hardware and Networking">IT-Hardware&amp; Networking</asp:ListItem>
                                                <asp:ListItem value="Telcom/ISP">Telcom/ISP</asp:ListItem>
                                                <asp:ListItem value="Legal">Legal</asp:ListItem>
                                                <asp:ListItem value="Media/Dotcom/Entertainment">Media/Dotcom/Entertainment</asp:ListItem>
                                                <asp:ListItem value="Medical/Healthcare/Hospital">Medical/Healthcare/Hospital</asp:ListItem>
                                                <asp:ListItem value="NGO/Social Services">NGO/Social Services</asp:ListItem>
                                                <asp:ListItem value="Office Equipment/Automation">Office Equipment/Automation</asp:ListItem>
                                                <asp:ListItem value="Oil and Gas/Power/Infrastructure/Energy">Oil and Gas/Power/Infrastructure/Energy</asp:ListItem>
                                                <asp:ListItem value="Paper">Paper</asp:ListItem>
                                                <asp:ListItem value="Pharma/Biotech/Clinical Research">Pharma/Biotech/Clinical Research</asp:ListItem>
                                                <asp:ListItem value="Printing/Packaging">Printing/Packaging</asp:ListItem>
                                                <asp:ListItem value="Real Estate/Property">Real Estate/Property</asp:ListItem>
                                                <asp:ListItem value="Recruitment/Employment Firm">Recruitment/Employment Firm</asp:ListItem>
                                                <asp:ListItem value="Retailing">Retailing</asp:ListItem>
                                                <asp:ListItem value="Security/Law Enforcement">Security/Law Enforcement</asp:ListItem>
                                                <asp:ListItem value="Semiconductors/Electronics">Semiconductors/Electronics</asp:ListItem>
                                                <asp:ListItem value="Shipping/Marine">Shipping/Marine</asp:ListItem>
                                                <asp:ListItem value="Textiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
                                                <asp:ListItem value="Tyres">Tyres</asp:ListItem>
                                                <asp:ListItem value="Other">Other</asp:ListItem>
                                              </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                ControlToValidate="ddlindtype" InitialValue="Select Industry Type" 
                                                ErrorMessage="Please Select the Industry Type." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblcontactperson" runat="server" Text="Contact Person"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtcontactperson" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="txtcontactperson" 
                                                ErrorMessage="Please enter the Contact Person" Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblcontactpersondesg" runat="server" Text="Contact Person's Designation"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtcontactpersondesg" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="txtcontactpersondesg" 
                                                ErrorMessage="Please enter the Designation." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblurl" runat="server" Text="URL"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtulr" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                ControlToValidate="txtulr" ErrorMessage="Please enter the URL." 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbldesc" runat="server" Text="Brief Description"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="100px" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                ControlToValidate="txtdesc" ErrorMessage="Please enter the Description." 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbladdrforommunication" runat="server" Text="Address for Communication"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtaddrforcommunication" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                ControlToValidate="txtaddrforcommunication" 
                                                ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblstreetaddr" runat="server" Text="Street Address"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtstreetaddr" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                                ControlToValidate="txtstreetaddr" 
                                                ErrorMessage="Please enter the Street Address." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblcountry" runat="server" Text="Country"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Dropdownlist ID="country" runat="server" CssClass="textfield" Width="190px"  
             BorderWidth="1"  AutoPostBack="true" 
             onselectedindexchanged="country_SelectedIndexChanged">
             
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" 
                                                ControlToValidate="country" InitialValue="Select your Country" 
                                                ErrorMessage="Please Select the Country." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                             <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" 
                                                OnSelectedIndexChanged="country_SelectedIndexChanged">
                                                <asp:ListItem Value="Select Country">Select State</asp:ListItem>
                                                </asp:Dropdownlist>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvstate" runat="server" 
                                                ControlToValidate="state" InitialValue="Select your State" 
                                                ErrorMessage="Please Select the State." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="11"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFax" runat="server" Text="Fax"></asp:Label>
                                        </td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:TextBox ID="txtfax" runat="server" Width="200px" MaxLength="12"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number." 
                                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Terms &amp; Conditions</b></font></td>
                                    </tr>
                                    <tr height="10px">
                                      <td colspan="3" align="left" valign="top" style="height: 15px" class="lable4">&nbsp;&nbsp;
                                          <table border="0">
                                            <tr>
                                                <td valign="top">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </td>
                                                <td width="100%">
                                                     <p>I have read and understood and agree to the <a href="#">Terms and Conditions</a> governing the use of careersgen.com. You must agree to the terms and conditions before you can continue.</p>
                                                     <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                        ErrorMessage="Please select the checkbox." Text="Please select the checkbox." 
                                                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="client"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                          </table>
                                       </td>   
                                    </tr>
                                    <tr>
                                        <td width="100%">
                                            <table border="0" width="80%">
                                                <tr>
                                                    <td><asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                                                            onclick="btnsubmit_Click"  ValidationGroup="client"/></td>
                                                    <td><asp:Button ID="btnreset" runat="server" Text="Reset" 
                                                            onclick="btnreset_Click" /></td>    
                                                </tr>
                                            </table>
                                        </td>    
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="lblerror" runat="server" Text="lblerror"></asp:Label></td>
                                    </tr>
                                </table>
                           
                     </td>
                     <td valign="middle"><img src="images/regiter.jpg" width="322" height="307" /></td>            
                </tr>
            </table>    
        </td>
        <td valign="top" width="20%">
         <table width="100%" border="0">
         <tr>
            <td><div class="hleft"></div>
                 <div class="hmidil"><font class="hedings">
                 New Job Applicants</font></div>
                <div class="hright"></div>
             </td>
           </tr>
           <tr>
             <td><a href="client_register.aspx"><img src="images/new_resume_box.jpg" width="100%" height="150" /></a></td>
           </tr>
           <tr>
            <td style="height:10px"></td>
           </tr>
           <tr>
             <td><div class="hleft"></div>
                 <div class="hmidil"><font class="hedings">
                 Current Openings</font></div>
                 <div class="hright"></td>
           </tr>
           <tr>
             <td class="text"><marquee onMouseOver="stop();" onMouseOut="start();" scrollamount="2" direction="up" height="300px">
              <span class="crentopenings">Development Team Lead</span> <br>
              <div align="justify">Be part of a core team that will architect, design and build the technology platform that will revolutionize the BFSI industry (Banking, Finance, Securities and Insurance).Building cost ...</div><br>
            
              <span class="crentopenings">Net Programer </span><br>
              <div align="justify">M&amp;H Associate is a national provider of technology resource solutions </div><br>
             
		      <span class="crentopenings">TechLead - DWH/BI</span><br>
             <div align="justify">Translates business requirements into technical details. Resolve user-identified functional and technical issues relating to Data Mart and reporting services. . Provides onsite/ ...</div><br>
             <span class="crentopenings">PHP Developer</span><br>
                <div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required · Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or Hyperstation Automated Tester, develop s ...</div><br>
            <span class="crentopenings"> Sr. Dot Net Developer</span><br>
                <div align="justify">Candidate Must have 5+ yrs strong experience in: .Net, VB, JSP, SQL Server2005 Developing Windows based as well as Web Based applications Position in financial domain ...</div></marquee>
            </td>
          </tr>
           <tr>
            <td style="height:10px"></td>
           </tr>
          <tr>
             <td><div class="hleft"></div>
                 <div class="hmidil"><font class="hedings">Technology Partners :</font></div>
                 <div class="hright">
             </td>
          </tr>
         </table>
        <img src="images/patner01.jpg" width="238" height="200" /></div>
        </td>
      </tr>
      <tr height="5px">
        <td class="style1" colspan="2">&nbsp;</td>
      </tr>
      </table>
     </div> 
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
    <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://www.wizardstraining.com/" target="_blank">Training</a>&nbsp;&nbsp;&nbsp;|</td> <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="contact.aspx">Contact</a>&nbsp;&nbsp;&nbsp;</td>
    <td width="17%">&nbsp;</td>
  </tr>
</table>
</div>
<div class="footerbottam" align="center">Copy right @1999-20011 Ace Indus Tech -Sol, All Rights reserved</div>
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
