<%@ Page Language="C#" AutoEventWireup="true" CodeFile="new_employeeform.aspx.cs" Inherits="new_employeeform" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="client_register.aspx.cs" Inherits="client_register" %>
--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Ace Indus :: New Employee Form</title>
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
<script type="text/javascript" src="js/coin-slider.min.js"></script><style type="text/css">
        .style1
        {
            width: 759px;
        }
    </style></head><body><form id="kb" runat="server">
<table width="1014px" border="0" class="main">
  <tr>
    <td height="60" style="padding-left:10px">
    <table width="100%" border="0">
      <tr>          
        <td width="20%" height="48" valign="middle"><a href="Default.aspx"><img src="images/logo.png" width="199" height="46" border="0"/></a></td>
        <td width="25%" align="center" style="padding-left:70px"><a href="#"><img src="images/iso1.png" width="131" height="60" style="border:none" /></a></td>
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
                 <tr height="10px">
                   <td>
            <asp:Label ID="lblmessage" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
            </td>
                </tr>
                <tr>
                     <td class="innertext">New Employee Form  :</td>
  </tr>
  <tr>
    <td style=" padding-left:16px;padding-top:10px" valign="top"><table width="100%" border="0">
      <tr>
        <td width="780" height="708" valign="top" style="background:url(images/New_Employee_bg.jpg) no-repeat" >
        <table width="100%" border="0">
          <tr>
            <td width="1%" height="5">&nbsp;</td>
            <td width="69%">&nbsp;</td>
            </tr>
          <tr>
            <td height="30" class="crentopenings" style="padding-left:10px;">PROSPECTIVE EMPLOYEE DATA SHEET </td>            
            </tr>
          <tr>            
            <td>
            <table width="100%" border="0" align="left">
              <tr>
                <td width="3%" height="30">&nbsp;</td>
                <td width="41%" height="30">Family Name(Last Name)</td>
                <td width="3%" align="center"><strong>:</strong></td>
                <td width="53%">
                <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvlname" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Last name" ControlToValidate="txtlname">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">First Name</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvfname" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter First name" ControlToValidate="txtfname">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">Full Middle Name</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtmname" runat="server" ></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvmanme" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Middle Name" ControlToValidate="txtmname">*</asp:RequiredFieldValidator>--%>
                </td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30">All Other NamesUsed(Include maiden name and name before & after marriage)</td>
                <td align="center"><strong>:</strong></td>
                <td><asp:TextBox ID="txtoname" runat="server" Height="20px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvoname" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Other Name Before or After Marriage" ControlToValidate="txtoname">*</asp:RequiredFieldValidator>
                </td>               
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="45">Present Address<br />
                  (Street/City/State/Zip/Country) </td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvaddr" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Address" ControlToValidate="txtaddress">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="45">Permanent Address<br />
                  (Street/City/State/Zip/Country) </td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtpaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvpadd" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Permanent Address" ControlToValidate="txtpaddress">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="45">Permanent Address in Foreign Country </td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtusadd" runat="server" TextMode="MultiLine"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvuadd" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Foreign Address" ControlToValidate="txtusadd">*</asp:RequiredFieldValidator>--%>
                </td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td>Birth Date </td>
                <td align="center"><strong>:</strong></td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:TextBox ID="txtbdate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbdate">
                    </asp:CalendarExtender>
                  </td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="45">Birth Place:
                  (City/Town/State/Country) </td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtbplace" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvbplace" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Birth Place" ControlToValidate="txtbplace">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">Country of Citizenship</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:DropDownList ID="country" runat="server"  BorderWidth="1">
                <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvcountry" runat="server"
                 ErrorMessage="please select country" ValidationGroup="empreg"
                 ControlToValidate="country" >*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">Social Security Number(if any)</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="ssnum" runat="server" CssClass="textfield"  BorderWidth="1" MaxLength="16"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvssnum" runat="server" ControlToValidate="ssnum"
                ErrorMessage="Please Enter 16 digits Number" ValidationGroup="empreg">*</asp:RequiredFieldValidator>--%>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">Alien Registration Number(if any)</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="regnum" runat="server" MaxLength="7"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvregnum" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="regnum">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td>Dependendant Tax Identification Number</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txttinnum" runat="server" MaxLength="12"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtin" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="txttinnum">*</asp:RequiredFieldValidator>
                </td>
                </tr>
              
              
            </table></td>
            </tr>
          <tr>
            <td height="30"><div align="center"><b>IF THE BENEFICIARY IS IN THE U.S.,Please provide the following information</b></div></td>
            </tr>
          <tr>
            <td>
            <table width="100%" border="0">
              <tr>
                <td width="3%" height="30">&nbsp;</td>
                <td width="41%" height="30">Current Nonimmigrant Status</td>
                <td width="3%" align="center"><strong>:</strong></td>
                <td width="53%">
                <asp:TextBox ID="txtnonimm" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvnonimm" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter NonImmigrant Status" ControlToValidate="txtnonimm">*</asp:RequiredFieldValidator>--%>
                </td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">Date Of most recent Admission to the   U.s.</td>
                <td align="center"><strong>:</strong></td>
                <td><table width="100%" border="0">
                  <tr>
                    <td>
                        
                    <asp:TextBox ID="txtdate2" runat="server"></asp:TextBox>      
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID ="txtdate2">
                        </asp:CalendarExtender>              
                    <%--<asp:RequiredFieldValidator ID="rfvcalender" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Select Date" ControlToValidate="txtdate2">*</asp:RequiredFieldValidator>--%>
                    </td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30">I-94 Number</td>
                <td align="center"><strong>:</strong></td>
                <td>
                <asp:TextBox ID="txtnumber" runat="server" ></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvnumber" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="txtnumber">*</asp:RequiredFieldValidator>--%>
                </td>
                </tr>
               
            </table>
            </td>
            </tr>
          <tr>          
            <td height="40" rowspan="4" align="center" valign="top" style="padding-top:">              
              <asp:Button ID="btnsave" runat="server" Text="Save & Continue" 
                    ValidationGroup="empreg" onclick="btnsave_Click" />
            </td> 
            </tr> 
                          
        </table>
        </td>
      </tr>
      
    </table></td>
  </tr>
                               
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

