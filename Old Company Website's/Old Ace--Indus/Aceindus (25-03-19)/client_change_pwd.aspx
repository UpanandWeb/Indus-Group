﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="client_change_pwd.aspx.cs" Inherits="client_change_pwd" %>
<%@ Register Src="~/Usercontrols/footer.ascx" TagName="footer" TagPrefix="footer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>:: Ace Indus :: Client Change Password.</title>
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
        font-family: Tahoma, Geneva, sans-serif;
        font-size: 16px;
        font-weight: bold;
        color: #003366;
        background: url('images/innerbg.jpg') no-repeat;
        height: 32px;
    }
   
    .style17
    {
        font-size: 11px;
        color: #0f71c1;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        text-align: justify;
        height: 20px;
        width: 166px;
    }
    .style18
    {
        font-size: 11px;
        color: #0f71c1;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        text-align: justify;
        width: 166px;
    }
</style>

    </head>
<body>
<form id="kb" runat="server">
<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px"><table width="100%" border="0">
      <tr>
        <td width="30%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
        <td width="25%" align="center" style="padding-left:70px"><a href="#"><img src="images/iso1.png" width="131" height="60" style="border:none" /></a></td>
        <td width="21%" valign="middle"><table width="100%" border="0" class="text" style="font-size:11px">
            <tr>
            <td width="11" align="right" valign="top"><img src="images/home-icon.png" width="13" height="16" /></td>
            <td width="33" valign="top"><a href="Default.aspx">Home</a></td>
            <td width="13" valign="top" align="right"><img src="images/webdev-site-map-icon.png" width="15" height="15" /></td>
            <td width="51" valign="top"><a href="sitemap.html">Site map</a></td>
            <td width="14" valign="top" align="right"><img src="images/phone-icon.png" width="15" height="13" /></td>
            <td width="50" align="left" valign="top"><a href="contact.aspx">Contact</a></td>
            <td width="11" align="left" valign="top"><img src="images/loginicon.png" width="13" height="14" /></td>
            <td width="64" align="left" valign="top"><a href="login.aspx">Login</a></td>
           
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
    <td height="200" valign="top"><div class="slider">
      <div id="coin-slider">
        <div id="nav_wrapper"> <a href="#"><img src="images/slide1.jpg" width="95%" height="200" alt="slide1" /></a> <a href="#"><img src="images/slide3.jpg"  width="95%" height="200" alt="slide3" /></a> <a href="#"><img src="images/slide4.jpg"  width="95%" height="200" alt="slide4" /></a> </div>
  </div>
          </div>
    </tr>
  <tr>
        <td class="style1"> Client Change Password :</td>
  </tr>
  <tr>
  <!-- start the DIV-->
    <td  valign="top" align="left"><div id="contentbox">
   <!--start the inner content-->
   <div class="innerleft">
      <table border="0" style="margin-top:20px; border:1px  #039; " cellpadding="2" cellspacing="6">
       <tr>
            <td colspan="3" align="center" class="heading"  style=" background-image:url(images/yellowmenubg_1.jpg); background-repeat:repeat-x; border:1px; height:25px; font-weight:bold; color:#bc5441" valign="top">Change Password</td>
       </tr>
       <tr>
            <td colspan="3" height="20px"></td>
        </tr>
        <tr>
          <td class="style17">
            <asp:Label ID="lblemail" runat="server" Text="Email ID *"></asp:Label>
          </td>
          <td><strong>:</strong></td>
          <td style="width: 249px; height: 20px;">
            <asp:TextBox ID="email" runat="server" CssClass="data" Width="164px" ValidationGroup="r1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="email" ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
            <td colspan="3" height="20px"></td>
        </tr>
        <tr>
          <td class="style17">
            <asp:Label ID="lbluname" runat="server" Text="username*"></asp:Label>
          </td>
          <td><strong>:</strong></td>
          <td style="width: 249px; height: 20px;">
            <asp:TextBox ID="txtuname" runat="server" CssClass="data" Width="164px" ValidationGroup="r1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
            <td colspan="3" height="20px"></td>
        </tr>
        <tr>
          <td class="style17">
              <asp:Label ID="lbloldpwd" runat="server" Text="Old Password *"></asp:Label>
          </td>
          <td><strong>:</strong></td>
          <td style="width: 249px; height: 20px;">
            <asp:TextBox ID="oldpassword" runat="server" CssClass="data" Width="164px" TextMode="Password" ValidationGroup="r1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="oldpassword" ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
            <td colspan="3" height="20px"></td>
        </tr>
        <tr>
            <td class="style17">
                <asp:Label ID="lblnewpwd" runat="server" Text="New Password *"></asp:Label>
            </td>
            <td><strong>:</strong></td>
            <td style="width: 249px; height: 20px;">
              <asp:TextBox ID="newpassword" runat="server" CssClass="data" Width="164px" TextMode="Password" ValidationGroup="r1"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="newpassword"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="20px"></td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="lblcnfpwd" runat="server" Text="Confirm Password *"></asp:Label>
            </td>
            <td><strong>:</strong></td>
            <td style="width: 249px">
                <asp:TextBox ID="confirmpassword" runat="server" CssClass="data" Width="164px" TextMode="Password" ValidationGroup="r1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpassword"
                   ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td height="20px" colspan="3"></td>
        </tr>
        <tr>
          <td colspan="3" align="center"><label> </label>
              <div align="center">
                  <asp:ImageButton ID="ImageButton1" runat="server" Height="22px" ImageUrl="images/submit.gif" Width="86px" 
                      onclick="ImageButton1_Click"  />
                  &nbsp;&nbsp;<img src="images/cancel_btn.gif" alt='' border='0' onclick='javascript:resetall();' />
              </div>
          </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3"> 
                <asp:Label ID="lblmsg" runat="server" ></asp:Label><br>
                <asp:Label ID="lblerror" runat="server" Height="17px" Width="246px"></asp:Label>
            </td>
        </tr>
    </table>
   </div>
   <div class="innerright">
     <table width="100%" border="0">
       <tr>
         <td>
            <div class="hleft"></div>
             <div class="hmidil">
                <font class="hedings">New Job Applicants</font>
             </div>
             <div class="hright"></div></td>
       </tr>
       <tr>
         <td><a href="client_register.aspx"><img src="images/new_resume_box.jpg" width="100%" height="130" /></a></td>
       </tr>
       <tr>
         <td><div class="hleft"></div>
             <div class="hmidil">
                <font class="hedings">Current Openings</font>
             </div>
             <div class="hright">
         </td>
       </tr>
       <tr>
         <td class="text"><marquee onMouseOver="stop();" onMouseOut="start();" scrollamount="2" direction="up" height="150px">
          <span class="crentopenings">Development Team Lead</span> <br>
          <div align="justify">Be part of a core team that will architect, design and build the technology platform that will revolutionize the BFSI industry (Banking, Finance, Securities and Insurance).Building cost ...</div><br>
        
          <span class="crentopenings">Net Programer </span><br>
          <div align="justify">M&amp;H Associate is a national provider of technology resource solutions </div><br>
         
		  <span class="crentopenings">TechLead - DWH/BI</span><br>
         <div align="justify">Translates business requirements into technical details. Resolve user-identified functional and technical issues relating to Data Mart and reporting services. . Provides onsite/ ...</div><br>
          <span class="crentopenings">PHP Developer</span><br>
<div align="justify">Responsibilities and skills : Expertise in QARun & QTP is required · Utilizing Automated Scripting Tools such as QARun, Test Partner, and/or Hyperstation Automated Tester, develop s ...</div><br>

<span class="crentopenings"> Sr. Dot Net Developer</span><br>
<div align="justify">Candidate Must have 5+ yrs strong experience in: .Net, VB, JSP, SQL Server2005 Developing Windows based as well as Web Based applications Position in financial domain ...</div></marquee></td>
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
