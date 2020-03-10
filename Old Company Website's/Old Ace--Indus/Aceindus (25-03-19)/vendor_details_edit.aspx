<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vendor_details_edit.aspx.cs" Inherits="vendor_details_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Ace Indus ::  Edit Vendor Details</title>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/chromestyle.css" />
<script type="text/javascript" src="js/chrome.js"></script>
<link rel="stylesheet" type="text/css" href="css/flexdropdown.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/flexdropdown.js"></script>
<link rel="stylesheet" type="text/css" href="css/coin-slider-styles.css" />
<!--[if IE]>
    <link rel="stylesheet" type="text/css" href="css/ie.css" />
<![endif]--> 
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/TitilliumText14L_600.font.js"></script>
<script type="text/javascript" src="js/cufon-run.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/hoverintent.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px"><table width="100%" border="0">
      <tr>
        <td width="20%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
         <td width="51%" align="center" style="padding-left:70px"><a href="#"><img src="images/iso1.png" width="131" height="60" border="0" /> </a></td>
        <td width="29%" valign="middle"><table width="100%" border="0" class="text" style="font-size:11px">
           <tr>
            <td width="11" align="right" valign="top"><img src="images/home-icon.png" width="13" height="16" /></td>
            <td width="33" valign="top"><a href="http://www.aceindus.in/Default.aspx">Home</a></td>
            <td width="13" valign="top" align="right"><img src="images/webdev-site-map-icon.png" width="15" height="15" /></td>
            <td width="51" valign="top"><a href="http://www.aceindus.in/sitemap.html">Site map</a></td>
            <td width="14" valign="top" align="right"><img src="images/phone-icon.png" width="15" height="13" /></td>
            <td width="50" align="left" valign="top"><a href="http://www.aceindus.in/contact.aspx">
                Contact</a></td>
            <td width="11" align="left" valign="top"><img src="images/loginicon.png" width="13" height="14" /></td>
            <td width="64" align="left" valign="top"><a href="http://www.aceindus.in/login.aspx">
                Login</a></td>
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
    </table></td>
  </tr>
  <tr>
    <td height="30"><div class="chromestyle" id="chromemenu">
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
<a href="http://www.aceindus.in/newsevents.html">News&amp;Events</a>

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
<a href="http://www.aceindus.in/design_development.html">Design &amp; Development</a>
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
    <td  valign="top" align="left"><div id="contentbox">
   <!--start the inner content-->
   <div class="innerleft"><table width="100%" border="0" class="text">
  <tr>
    <td class="innertext">Edit Vendor Details :</td>
  </tr>
  <tr>
    <td>
        
<table width="100%" align="left" border="0" cellpadding="0" cellspacing="0">
    <tr height="8">
      <td align="left" valign="top" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"><asp:Label ID="lblmail" runat="server" Width="385px" Font-Italic="True" Font-Names="Arial" ForeColor="Red" Font-Size="Medium"></asp:Label></td>
    </tr>
   
    <tr height="15">
      <td align="right" valign="top" width="20%" height="15"></td>
      <td align="left" valign="top" width="50%" height="15"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Username<font color="red">  </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtusername" runat="server" Height="19px" 
                                                Width="146px"></asp:TextBox>
        <%--&nbsp;&nbsp; &nbsp; <span style="font-size: 9pt; color: #cf3131">Enter Email ID as User
              ID.</span><!---&nbsp; Tip: Use your email-id as your username-----%></td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" style="height: 9px"></td>
      <td align="right" valign="top" width="50%" style="height: 9px"></td>
    </tr>
    
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">
          Company Name <font color="red">  </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtcompname" runat="server" Height="19px" 
                                                 Width="146px"></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Company Mail id<font color="red">&nbsp; </font> :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtcompmail" runat="server" Height="19px" 
                                                Width="146px" ></asp:TextBox>
        </td>
    </tr>
    <tr height="15">
      <td align="left" valign="top" width="20%" height="15"></td>
      <td align="left" valign="top" width="50%" height="15"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Industry Type 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:DropDownList ID="indtype" runat="server" Width="344px" CssClass="lable">
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
            <asp:ListItem value="extiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
            <asp:ListItem value="Tyres">Tyres</asp:ListItem>
            <asp:ListItem value="Other">Other</asp:ListItem>
          </asp:DropDownList>
       </td>
    </tr>
    <tr height="8">
      <td align="left" valign="middle" width="20%" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Contact Person 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="conperson" runat="server" Width="146px"> 
                                                </asp:TextBox>
       </td>
    </tr>
    <tr height="8">
      <td align="left" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Contact Person's Designation<font color="red">&nbsp; </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="cpersondesig" runat="server" Width="146px">
                                                </asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable"> URL :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txturl" runat="server" >
                                               </asp:TextBox>
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable"> Brief Description 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtdesc" runat="server" Height="70px" TextMode="MultiLine" Width="310px"></asp:TextBox>
      </td>
    </tr>
    <tr height="15">
      <td width="20%" height="2" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%"></td>
    </tr>
      <tr height="15">
      <td width="20%" align="right" valign="middle" style="height: 19px" class="lable">Address for Communication<font color="red">&nbsp; </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="praddr" runat="server" Width="181px" Height="19px" 
                                                ></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td width="20%" align="right" valign="middle" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 19px" class="lable">Street Address<font color="red">&nbsp; </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="staddr" runat="server" Width="181px" 
                                                ></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td width="20%" align="right" valign="top" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 22px" class="lable"> Country 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 22px" class="lable">&nbsp;&nbsp;
        <asp:Dropdownlist ID="country" runat="server" CssClass="textfield" Width="190px"  
             BorderWidth="1"  AutoPostBack="true" 
             onselectedindexchanged="country_SelectedIndexChanged">
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
    
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 22px" class="lable">State 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 22px" class="lable">&nbsp;&nbsp;
        <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select State</asp:ListItem>
     </asp:Dropdownlist>
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 19px" class="lable"><span id="spanindtype_id">City<font color="red">&nbsp; </font>:</span></td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="city" runat="server" Height="19px"
                                                Width="181px"></asp:TextBox>
      </td>
      <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    </tr>
    <tr height="19">
      <td width="20%" align="right" valign="middle" style="height: 19px" class="lable"> Phone 
          <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable"> &nbsp;
          <asp:TextBox ID="W1_phno" runat="server" Height="19px" Width="181px" MaxLength="11"></asp:TextBox>
        </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr>
    <td width="20%" align="right" valign="middle" style="height: 19px" class="lable"> 
        Fax <font color="red"> &nbsp;</font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable"> &nbsp;
      
    <asp:TextBox ID="txtfax" runat="server" Height="19px" Width="181px" MaxLength="11"></asp:TextBox>
    </td>
    </tr>
       <tr height="8">
      <td width="20%" height="8" align="right" valign="middle">
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
              ShowMessageBox="True" ShowSummary="False" ValidationGroup="vendorgrp" />
      </td>
      <td align="left" valign="top" width="50%" height="7"></td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="left" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
       <tr height="15">
      <td colspan="2" align="center" valign="top" style="height: 19px" class="lable">
          <asp:Button ID="btn_continue" runat="server" Text="Update" 
              onclick="btn_continue_Click" ValidationGroup="vendorgrp" />
      </td>
    </tr>
  </table>        
        </td>
  </tr>
</table>
</div>
   <div class="innerright">
     <table width="100%" border="0">
  
       <tr>
         <td>
            <div class="hleft"></div>
             <div class="hmidil"><font class="hedings">
                 New Job Applicantss</font></div>
             <div class="hright"></div>
         </td>
       </tr>
       <tr>
         <td><img src="images/new_resume_box.jpg" width="100%" height="130" /></td>
       </tr>
       <tr>
         <td><div class="hleft"></div>
                                 <div class="hmidil"><font class="hedings">
                                     Current Openings</font></div>
                                 <div class="hright"></td>
       </tr>
       <tr>
         <td class="text" style="border-left:1px #A5B4FA  dashed; padding:10px;"><marquee onMouseOver="stop();" onMouseOut="start();" scrollamount="3" direction="up" height="134px">
        <asp:DataList ID="ddlcurop" runat="server">
               <ItemTemplate>
                    <table border="0" style="padding:10px">
                         <tr>
                            <td align="justify">
                                <font class="crentopenings">
                                    <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("JobTitle")%>' />
                                </font>    
                            </td>
                         </tr>
                         <tr><td></td></tr>
                         <tr>
                            <td align="justify">
                                <asp:Literal ID="Literal7" runat="server" Text='<%#Eval("Description")%>' />
                            </td>
                         </tr>
                         <tr>
                            <td height="10px"></td>
                         </tr>
                   </table>   
               </ItemTemplate>
              </asp:DataList> </marquee></td></tr>
       <tr>
         <td><div class="hleft"></div>
                                 <div class="hmidil"><font class="hedings">
                                 
                                     Technology Partners :</font></div>
                                 <div class="hright"> </div></td>
       </tr>
     </table>
     <img src="images/patner01.jpg" width="238" height="160" /></div>
   <!-- end of inner content-->
    
<div class="contentfooter">

  <table width="100%" border="0" class="fotertext">
  <tr>
    <td width="17%" height="18">&nbsp;</td>
    <td width="7%" align="center"><a href="aboutus.html">About Us</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="9%" align="center">&nbsp;&nbsp;&nbsp;<a href="accounting.html">Accounting</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="9%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://hms.aceigi.net/" target="_blank">Healthcare</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="16%" align="center">&nbsp;&nbsp;<a href="consultants_services.html" data-flexmenu="flexmenu1">&nbsp;Consultancy 
        Services</a>&nbsp;&nbsp;&nbsp;&nbsp;|

<ul id="flexmenu1" class="flexdropdownmenu">
<li><a href="interview_tips.html">Interview Tips</a></li>
<li><a href="find_ajob.html">Find a Job</a></li>

<li><a href="http://careersgen.net/jobs_seeker_login.aspx" target="_blank">Job Seekers</a></li>

<li><a href="http://careersgen.net/RecruitersZone/recruiters_zone_Login.aspx" target="_blank">Recruitment</a></li>
</ul>
</td>
    <td width="11%" align="center">&nbsp;&nbsp;&nbsp;<a href="technologies.html">Technologies&nbsp;</a>&nbsp;&nbsp;&nbsp;|</td>
    <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://www.aceindustraining.com/" target="_blank">Training</a>&nbsp;&nbsp;&nbsp;|</td> <td width="7%" align="center">
      &nbsp;&nbsp;&nbsp;<a href="contact.aspx">Contact</a>&nbsp;&nbsp;&nbsp;</td>
    <td width="17%">&nbsp;</td>
  </tr>
</table>
</div>
<div class="footerbottam" align="center">Copy right @1999-2012 Ace Indus Tech -Sol, 
    All Rights reserved</div>
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

