﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_register2.aspx.cs" Inherits="Employee_register2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
</head>
<body>
<form id="form1" runat="server">

<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px"><table width="100%" border="0">
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
<a href="http://www.aceindus.in/post_yourresume.aspx">Post your resume</a>
<a href="http://www.aceindus.in/new_employeeform.aspx">New Employee Form</a>
</div>

</td>
  </tr>
  <tr>
    <td height="200" valign="top"><div class="slider">
      <div id="coin-slider">
        <div id="nav_wrapper"> <a href="#"><img src="images/slide1.jpg" width="100%" height="250" alt="slide1"  border="0"/></a> <a href="#"><img src="images/slide3.jpg"  width="100%" height="250"  border="0"/></a> <a href="#"><img src="images/slide4.jpg"  width="100%" height="250"  border="0"/></a> 
</div>
  </div>
          </div>
    </tr>
 
  <tr>
  <!-- start the DIV-->
    <td  valign="top" align="left"><div id="contentbox">
   <!--start the inner content-->
   <div class="innerleft"><table width="100%" border="0" class="text">
  <tr>
    <td class="innertext">Employee Register :</td>
  </tr>
  <tr>
    <td style=" padding-left:20px;padding-top:10px" valign="top">
    <table width="100%" border="0" style="background:url(images/emplyeeregister03.jpg) no-repeat; height:310px" class="fotertext">
     <tr>
        <td width="53%"></td>
        <td>
            <table width="100%" border="0">
                <tr>
                     <td colspan="3">
                        <font class="crentopenings">
                            <asp:Label ID="Label1" runat="server" Text="User id &amp; Password"></asp:Label>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td height="25">
                        <asp:Label ID="lblcountry" runat="server" Text="Country"></asp:Label>
                    </td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlcountry" runat="server" Font-Size="Small" 
                            Width="180px" Font-Bold="True" Font-Names="Courier New">
                            <asp:ListItem>Select your Country</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>INDIA</asp:ListItem>
                        </asp:DropDownList>
                    </td>
               </tr>
               <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td valign="top">
                    <asp:RequiredFieldValidator ID="rqvcountry" runat="server" 
                        ControlToValidate="ddlcountry" InitialValue="Select your Country" 
                        ErrorMessage="Please Select the Country." Font-Size="Smaller">
                    </asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td width="17%" height="25">
                    <asp:Label ID="lblfname" runat="server" Text="First Name"></asp:Label>
                </td>
                <td width="1%">:</td>
                <td width="25%">
                    <asp:TextBox ID="txtfname" runat="server" Width="180px" AutoPostBack="True" 
                        Font-Names="Courier New"></asp:TextBox>
                 </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td valign="top">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtfname" 
                        ErrorMessage="Select Your First Name." Font-Size="Smaller">
                    </asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td width="17%" height="25">
                    <asp:Label ID="lbllname" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td width="1%">:</td>
                <td width="25%">
                    <asp:TextBox ID="txtlname" runat="server" Width="180px" AutoPostBack="True" 
                        Font-Names="Courier New"></asp:TextBox>
                 </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td valign="top">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtlname" 
                        ErrorMessage="Select Your First Name." Font-Size="Smaller">
                    </asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td width="17%" height="25">
                    <asp:Label ID="lblemail" runat="server" Text="User ID (Email ID)"></asp:Label>
                </td>
                <td width="1%">:</td>
                <td width="25%">
                    <asp:TextBox ID="txtemail" runat="server" Width="180px" AutoPostBack="True" 
                        Font-Names="Courier New"></asp:TextBox>
                 </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td valign="top">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Please Enter Valid Email Address"  
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtemail" Font-Size="Smaller"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ErrorMessage="Please Enter Email" ControlToValidate="txtemail" 
                        Font-Size="Smaller"></asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td height="25">
                    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtpwd" runat="server" Width="180px" TextMode="Password" 
                        Font-Names="Courier New"></asp:TextBox>
                </td>
              </tr>
              <tr>    
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                     ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                     Font-Size="Smaller"></asp:RequiredFieldValidator>  
                </td>
              </tr>
              <tr>
                <td height="25">
                    <asp:Label ID="lblcnfpwd" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtcnfpwd" runat="server" Width="180px" TextMode="Password" 
                        Font-Names="Courier New"></asp:TextBox>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtcnfpwd" ErrorMessage="Please Enter The Confirm Password" Font-Size="Smaller"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtcnfpwd" ControlToCompare="txtpwd" 
                        ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller"></asp:CompareValidator>    
                </td>
              </tr>
              <tr>
                <td colspan="3"><asp:Label ID="lblerror" runat="server" CssClass="fotertext" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="btnsubmit" runat="server" Text="Accept & Continue" onclick="btnsubmit_Click" />
                </td>
              </tr>
            </table>
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
       <tr>
         <td><div class="hleft"></div>
                                 <div class="hmidil"><font class="hedings">
                                 New Job Applicants</font></div>
                                 <div class="hright"></div></td>
       </tr>
       <tr>
         <td><a href="client_register.aspx"><img src="images/new_resume_box.jpg" width="100%" height="130" /></a></td>
       </tr>
       <tr>
         <td><div class="hleft"></div>
                                 <div class="hmidil"><font class="hedings">
                                 Current Openings</font></div>
                                 <div class="hright"></td>
       </tr>
       <tr>
         <td class="text" style="border-left:1px #A5B4FA  dashed; padding:10px;"><marquee onMouseOver="stop();" onMouseOut="start();" scrollamount="3" direction="up" height="134px">
                                                          <font class="crentopenings">Development Team Lead</font><br />
<div align="justify">Be part of a core team that will architect, design and build the technology platform that will revolutionize the BFSI industry (Banking, Finance, Securities and Insurance).Building cost </div><br/>

<font class="crentopenings">Lead/Sr. Application Engineer</font><br />
<div align="justify">Position Responsibility:Application Engineer, will act as a bridge between Atrenta Customers and Atrenta development team globally. In the field, you will support Pre/Post sales activit</div> <br/> 

<font class="crentopenings">Senior Websphere Administrator</font><br />
<div align="justify">Senior Websphere Administrator for IPSoft.plus to have exp in Weblogic admin.strong Solaris/Linux skills exp in some of the following Tomcat, Apache, siteminder, Sunone/iPlanet? shell,</div> <br/>
 
<font class="crentopenings">Sr. Dot Net Developer</font><br />
<div align="justify">Candidate Must have 5+ yrs strong experience in: .Net, VB, JSP, SQL Server2005 Developing Windows based as well as Web Based applications Position in financial domain </div><br/> 

<font class="crentopenings">Project Manager (J2EE / Java) -- Banking / Capital Market Domain</font><br />
<div align="justify">Project Management of production and application support. Experience of working on banking domain / capital market is a must. . Must have worked in a support/M&E engagement for</div> <br/>
 
<font class="crentopenings">TechLead - DWH/BI</font><br />
<div align="justify">Translates business requirements into technical details. Resolve user-identified functional and technical issues relating to Data Mart and reporting services. . Provides onsite</div><br/>
 
<font class="crentopenings">People Soft - Technical Consultant</font><br />
<div align="justify">5+yrs of experience in PeopleSoft implementation (Technical Consultant). Experience in Vers.9.0/Vers. 4.48/higher. Should have worked on an upgrade and are competent in Application En</div> <br/> 

<font class="crentopenings">SAP Netweaver Sr. Administrator</font><br />
<div align="justify">Required Skills: 5 years experience in SAP Basis/Netweaver Administration; experience with SAP Netweaver 7.0 and SAP Web Application Server technologies a must. Database Management </div> <br/>
 
<font class="crentopenings">Senior .Net Technical Leads</font><br />
<div align="justify">Should have 7+ years of experience working on Microsoft technologies with 5+ years on .Net programming and Minimum 2+ Years of Experience in Share Point Technology.</div> <br/> 

<font class="crentopenings">Hyperion BI Designer</font><br />
<div align="justify">Provide pro-active design, development, enhancements, acceptance testing, implementation and support of efficient and effective data warehousing for the financial industry for medium to </div><br/> 

<font class="crentopenings">SAP MM Project Manager</font><br />
<div align="justify">Skill: SAP MM project Manager Overall Experience: Minimum 8+ years Relevant Exp: around 6+ years. With very good hands on with project management skills & full life cycle implementat </div><br/>
 
<font class="crentopenings">Microsoft CRM Professional</font><br />
<div align="justify">Position: MS CRM Professional Must have good exposure on MS CRM 3.0 / 4.0 Must have a good exposure of .Net. Must have a good knowledge of SDLC process. Must be a good team player </div><br/>
 
<font class="crentopenings">PHP Developer</font><br />
<div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required • Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or Hyperstation Automated Tester, develop s</div> <br/> 

<font class="crentopenings">Siebel EAI/EIM Expert</font><br />
<div align="justify">Job Description - EAI Expert . Should have Architected, Designed, Developed, and Implemented Custom EAI Solutions . Should have Strong Understanding on EBCs </div><br/> 

<font class="crentopenings">Data Warehouse Engineers - Informatica</font><br />
<div align="justify"> Working on ETL Design and Architecture using Informatica. Developing various mappings with the collection of all Sources, Targets and Transformations. Use heterogeneous data sources </div> <br/>
 
<font class="crentopenings">Sr. QA Executive</font><br />
<div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required • Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or Hyperstation Automated Tester, develop s </div><br/> 

<font class="crentopenings">Development Team Lead</font><br />
<div align="justify">Be part of a core team that will architect, design and build the technology platform that will revolutionize the BFSI industry (Banking, Finance, Securities and Insurance).Building cost</div> <br/>
 
<font class="crentopenings">Lead/Sr. Application Engineer</font><br />
<div align="justify">Position Responsibility:Application Engineer, will act as a bridge between Atrenta Customers and Atrenta development team globally. In the field, you will support Pre/Post sales activit </div><br/>
 
<font class="crentopenings">Senior Websphere Administrator</font><br />
<div align="justify">Senior Websphere Administrator for IPSoft.plus to have exp in Weblogic admin.strong Solaris/Linux skills exp in some of the following Tomcat, Apache, siteminder, Sunone/iPlanet? shell,</div> <br/> 

<font class="crentopenings">Sr. Dot Net Developer</font><br />
<div align="justify">Candidate Must have 5+ yrs strong experience in: .Net, VB, JSP, SQL Server2005 Developing Windows based as well as Web Based applications Position in financial domain</div> <br/> 

<font class="crentopenings">Project Manager (J2EE / Java) -- Banking / Capital Market Domain</font><br />
<div align="justify">Project Management of production and application support. Experience of working on banking domain / capital market is a must. . Must have worked in a support/M&E engagement for </div><br/>
 
<font class="crentopenings">TechLead - DWH/BI</font><br />
<div align="justify">Translates business requirements into technical details. Resolve user-identified functional and technical issues relating to Data Mart and reporting services. . Provides onsite </div><br/>
 
<font class="crentopenings">People Soft - Technical Consultant</font><br />
<div align="justify">5+yrs of experience in PeopleSoft implementation (Technical Consultant). Experience in Vers.9.0/Vers. 4.48/higher. Should have worked on an upgrade and are competent in Application En</div><br/> 

<font class="crentopenings">SAP Netweaver Sr. Administrator</font><br />
<div align="justify">Required Skills: 5 years experience in SAP Basis/Netweaver Administration; experience with SAP Netweaver 7.0 and SAP Web Application Server technologies a must. Database Management </div><br/>
 
<font class="crentopenings">Senior .Net Technical Leads</font><br />
<div align="justify">Should have 7+ years of experience working on Microsoft technologies with 5+ years on .Net programming and Minimum 2+ Years of Experience in Share Point Technology.</div> <br/> 

<font class="crentopenings">Hyperion BI Designer</font><br />
<div align="justify">Provide pro-active design, development, enhancements, acceptance testing, implementation and support of efficient and effective data warehousing for the financial industry for medium to</div> <br/> 

<font class="crentopenings">SAP MM Project Manager</font><br />
<div align="justify">Skill: SAP MM project Manager Overall Experience: Minimum 8+ years Relevant Exp: around 6+ years. With very good hands on with project management skills & full life cycle implementat</div> <br/>
 
<font class="crentopenings">Microsoft CRM Professional</font><br />
<div align="justify">Position: MS CRM Professional Must have good exposure on MS CRM 3.0 / 4.0 Must have a good exposure of .Net. Must have a good knowledge of SDLC process. Must be a good team player</div> <br/>
 
<font class="crentopenings">PHP Developer</font><br />
<div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required • Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or Hyperstation Automated Tester, develop s</div><br/>
 
<font class="crentopenings">Siebel EAI/EIM Expert</font><br />
<div align="justify">Job Description - EAI Expert . Should have Architected, Designed, Developed, and Implemented Custom EAI Solutions . Should have Strong Understanding on EBCs</div> <br/>
 
<font class="crentopenings">Data Warehouse Engineers - Informatica</font><br />
<div align="justify"> Working on ETL Design and Architecture using Informatica. Developing various mappings with the collection of all Sources, Targets and Transformations. Use heterogeneous data sources l</div> <br/> 

<font class="crentopenings">Sr. QA Executive</font><br />
<div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required • Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or</div> <br /></marquee></td>
       </tr>
       <tr>
         <td><div class="hleft"></div>
                                 <div class="hmidil"><font class="hedings">
                                 
Technology Partners :</font></div>
                                 <div class="hright"></td>
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
