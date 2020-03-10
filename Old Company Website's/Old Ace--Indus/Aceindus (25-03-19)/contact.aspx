<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Ace Indus :: Contact page</title>
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
<script  type="text/javascript" language="javascript">
function CallPrint(strid)  
{   
     var prtContent = document.getElementById(strid);  
     var WinPrint = window.open('','','letf=0,top=0,width=400,height=400,toolbar=0,scrollbars=0,status=0');    
      WinPrint.document.write(prtContent.innerHTML);   
         WinPrint.document.close();     
          WinPrint.focus();     
           WinPrint.print();     
            WinPrint.close();
  }
</script>
</head>
<body>
<form id="ffb" runat="server">
<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px"><table width="100%" border="0">
      <tr>
        <td width="20%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
        <td width="51%" align="center" style="padding-left:70px"><a href="#"><img src="images/iso1.png" width="131" height="60" style="border:none" /></a></td>
        <td width="29%" valign="middle"><table width="100%" border="0" class="text" style="font-size:11px">
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
    <td height="200" valign="top"><div class="slider">
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
   <div class="innerleft"><table width="100%" border="0" class="text">
  <tr>
    <td class="innertext">Contact :</td>
  </tr>
  <tr>
    <td height="529" valign="top" style=" padding-left:20px; padding-top:10px">Professional, Courteous Service. This is our commitment to you. We are glad to hear from you! If you have suggestions or any general comments, we can also be reached via traditional mail or telephone.<br /><br />

<font class="hedings">Please Contact us.</font><br />
<div style="padding-left:10px; text-align:center;"  align="center">
     
	<table width="100%" height="192"  align="right">
 <tr>
    <td ><br /><br /></td>
  </tr>
         <tr>
    <td width="42%" valign="top"><%--<font class="crentopenings" style="font-size:20px;">INDIA</font>--%>
 <table>
     
     <tr>
         <td  >
            <span style="font-size:16px;"><b>Aceindus Tech Sol India Pvt Ltd,<br /></b></span>
            <span style="font-size:14px;"> Plot No-21,Flat No-203,<br /></span>
            <span style="font-size:14px;"> Techno Residency,<br /></span>
           <span style="font-size:14px;">  Opposite Raheja Mind Space,<br /></span>
           <span style="font-size:14px;">  Madhapur,Hyderabad,<br /></span>
              <span style="font-size:14px;"> Telangana,<br /></span>
           <span style="font-size:14px;">  India-500081. </span>
         </td>
     </tr>
     <tr>
    <td ><br /><br /></td>
  </tr>
     <tr>
         <td>
             <span style="font-size:14px;">  Voice	 : 	91-402-311-6226<br /></span>
<span style="font-size:14px;"> Fax	 :  	91-402-311-6228<br /></span><br /><br />

<span style="font-size:14px;"> For general inquiries	 : 	infohyd@aceindus.in<br /></span>
<span style="font-size:14px;"> For Clients	 : 	saleshyd@aceindus.in<br /></span>
<span style="font-size:14px;"> For Consultants	 : 	resumehyd@aceindus.in<br /></span>
         </td>
     </tr>

    


 </table>
    </td>
    <td width="4%"></td>
    <td width="100%" valign="top">
    <table   style="background-color:#F4F4F4; border:1px solid #C7C7C7; padding:5px" cellspacing="2px" cellpadding="5px" height="439">
      <tr>
        <td colspan="4" align="center" class="heading"  style=" background-image:url(images/yellowmenubg_1.jpg); 
 background-repeat:repeat-x; border:1px; height:25px; color:#036" valign="top" width="100%">Contact Form </td>
      </tr>
      <tr>
        <td align="left" style="height:25px ">Full Name<span class="our style6">*</span></td>
        <td>&nbsp;:&nbsp;</td>
        <td height="54" align="left" style="height:25px "><asp:TextBox ID="txtfname" 
                runat="server" Width="181px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="*" 
        ControlToValidate="txtfname"></asp:RequiredFieldValidator></td>
      </tr>      
      <tr>
        <td height="50" align="left" style="height:25px ">E-Mail<span class="our style6">*</span></td>
        <td>&nbsp;:&nbsp;</td>
        <td align="left" style="height:25px ">
            <asp:TextBox ID="txtemail" runat="server" Width="181px"></asp:TextBox>
        </td>
        <td>    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>          
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Please Enter Valid Email Address" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtemail" Font-Size="10px"></asp:RegularExpressionValidator>
        </td>
      </tr>
      <tr>
        <td height="114" align="left" valign="top"  style="height:20px; padding-top:5px ">Address</td>
        <td style="height:20px; padding-top:5px " valign="top">:</td>
        <td align="left" style="height:20px "><asp:TextBox ID="txtaddr" 
                TextMode="MultiLine" runat="server" Height="50px"  Width="181px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="rfvaddr" runat="server" ErrorMessage="*" ControlToValidate="txtaddr"></asp:RequiredFieldValidator></td>
      </tr>        
      
       <tr>
            <td height="48" align="left" style="height:25px ">Country</td>
            <td>&nbsp;:&nbsp;</td>
            <td align="left" style="height:20px ">
           <asp:Dropdownlist ID="country" runat="server" CssClass="textfield" Width="183px"  
             BorderWidth="1"  AutoPostBack="true" 
             onselectedindexchanged="country_SelectedIndexChanged">
            <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
          ControlToValidate="country" InitialValue="Select Country" ></asp:RequiredFieldValidator>  
        </td>
        </tr>
        <tr>
        <td height="48" align="left" style="height:25px ">State</td>
        <td>:</td>
        <td align="left" style="height:25px ">
        <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="183px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select State</asp:ListItem>
     </asp:Dropdownlist> </td>        
        <td><asp:RequiredFieldValidator ID="rfvstate" runat="server" ErrorMessage="*"
         ControlToValidate="state"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td height="48" align="left" style="height:20px ">City</td>
        <td>:</td>
        <td align="left" style="height:25px "><asp:TextBox ID="txtcity" runat="server" 
                Width="181px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="rfvcity" runat="server" ErrorMessage="*" ControlToValidate="txtcity"></asp:RequiredFieldValidator></td>
      </tr>
 <tr>
        <td height="48" align="left" style="height:25px ">Zip Code</td>
        <td>:</td>
        <td align="left" style="height:20px ">
        <asp:TextBox ID="txtzipcode" runat="server" Width="181px" MaxLength="8"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="rfvzipcode" runat="server" ErrorMessage="*" ControlToValidate="txtzipcode"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td height="25" align="left" style="height:25px">Phone Number</td>
        <td>&nbsp;:&nbsp;</td>
        <td height="57" align="left" style="height:25px ">
        <asp:TextBox ID="txtphone" MaxLength="11"  runat="server" Width="181px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="rfvphone" runat="server" ErrorMessage="*" ControlToValidate="txtphone"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td height="105" align="left" valign="top" style="height:20px; padding-top:5px ">Comments</td>
        <td valign="top" style="padding-top:10px ">&nbsp;:&nbsp;</td>
        <td align="left" style="height:20px "><asp:TextBox ID="txtcomment" runat="server" 
                TextMode="MultiLine" Height="100px"  Width="181px"></asp:TextBox></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td align="left">
            <table border="0" width="50%">
                <tr>
                    <td><asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                            onclick="btnsubmit_Click" /></td>
                    <td><asp:Button ID="btnreset" runat="server" Text="Reset" 
                            onclick="btnreset_Click" /></td>
                </tr>
            </table>
       </td>     
      </tr>
      <tr>
        <td colspan="3">
            <asp:Label ID="lblerror" runat="server" ></asp:Label>
        </td>
     </tr>
    </table>
    </td>
  </tr>
  <%--<tr>
    <td>Ace Indus Tech-Sol India Pvt. Ltd,<br />
        Plot # 1323, Behind Saradhi Studios,<br />
        Ameerpet, Yellareddyguda,<br />
        Hyderabad-AP-500073. India.</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td><table class="crentopenings" align="left">
      <tr>
        <td class="textred">Voice</td>
        <td>&nbsp;<span class="headline">:</span>&nbsp;</td>
        <td>91-406-613-6226</td>
      </tr>
      <tr>
        <td class="textred">Fax</td>
        <td>&nbsp;<span class="headline">:</span>&nbsp;</td>
        <td>91-406-613-6446</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td><table align="left">
      <tr>
        <td class="textred">For&nbsp;general&nbsp;inquiries</td>
        <td class="textred">&nbsp;:&nbsp;</td>
        <td  class="info"><a href="mailto:info@aceindus.in" style="text-decoration:none">
            info@aceindus.in</a></td>
      </tr>
      <tr>
        <td class="textred">For Clients</td>
        <td class="textred">&nbsp;:&nbsp;</td>
        <td  class="info"><a href="mailto:sales@aceindus.in" style="text-decoration:none">
            sales@aceindus.in</a></td>
      </tr>
      <tr>
        <td class="textred">For Consultants</td>
        <td class="textred">&nbsp;:&nbsp;</td>
        <td  class="info"><a href="mailto:resume@aceindus.in" style="text-decoration:none">
            resume@aceindus.in</a></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>--%>
  <%-- <tr>
    <td> <font class="crentopenings">Global Head Quarters - USA</font></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
  <tr>
    <td valign="top"><p>Ace Indus Tech-Sol,<br>
        1033 Sterling Road, Ste# 204,<br>
        Herndon-VA-20170. USA.<br>
        Washington DC Metro Area. </p></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td> 
<table class="crentopenings" align="left">
  <tr>
    <td class="textred">Voice</td>
    <td>&nbsp;<span class="headline">:</span>&nbsp;</td>
    <td >703-957-7829</td>
  </tr>
  <tr>
    <td class="textred">Fax</td>
    <td>&nbsp;<span class="headline">:</span>&nbsp;</td>
    <td>703-842-8746</td>
  </tr>
</table>

</td>
    <td>&nbsp;</td>
    </tr>
 <tr>
    <td>
		<table align="left">
  <tr>
    <td class="textred">For general inquiries</td>
    <td class="headline">&nbsp;:&nbsp;</td>
    <td  class="info"><a href="mailto:info@mnhbs.com" style="text-decoration:none">
        info@aceindus.net</a></td>
  </tr>
 <tr>
    <td class="textred">For Clients</td>
    <td class="headline">&nbsp;:&nbsp;</td>
    <td  class="info"><a href="mailto:sales@mnhbs.com" style="text-decoration:none">
        sales@aceindus.net</a></td>
  </tr>
  <tr>
    <td class="textred">For Consultants</td>
    <td class="headline">&nbsp;:&nbsp;</td>
    <td  class="info"><a href="mailto:resume@mnhbs.com" style="text-decoration:none">
        resume@aceindus.net</a></td>
  </tr>
</table>

	</td>
    <td>&nbsp;</td>
    </tr>--%>
  

</table>
</div>
</td>
  </tr>
</table>
</div>
   <div class="innerright">
     <table width="100%" border="0">
     
       <tr>
         <td><div class="hleft"></div>
             <div class="hmidil"><font class="hedings">
             New Job Applicants</font></div>
             <div class="hright"></div>
         </td>
       </tr>
       <tr>
         <td>
        <%-- <a href="client_register.aspx">--%>
         <img src="images/new_resume_box.jpg" width="100%" height="130" />
      <%--   </a>--%>
         </td>
       </tr>
       <tr>
         <td><div class="hleft"></div>
             <div class="hmidil"><font class="hedings">
             Current Openings</font></div>
             <div class="hright"></div>
         </td>
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
<div class="footerbottam" align="center">Copy right @1999-2013 Ace Indus Tech -Sol, All Rights reserved</div>
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
