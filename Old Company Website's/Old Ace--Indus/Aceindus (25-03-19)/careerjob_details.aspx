<%@ Page Language="C#" AutoEventWireup="true" CodeFile="careerjob_details.aspx.cs" Inherits="careerjob_details" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Ace Indus :: CarrerJob Details page</title>
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
        <div id="nav_wrapper"> <a href="#"><img src="images/slide1.jpg" width="100%" height="250" alt="slide1"  border="0"/></a> <a href="#"><img src="images/slide3.jpg"  width="100%" height="250"  border="0"/></a> <a href="#"><img src="images/slide4.jpg"  width="100%" height="250"  border="0"/></a> 
</div>
  </div>
          </div>
     
</div>
  </div>
          </div>
    </tr>
 
  <tr>
  <!-- start the DIV-->
    <td  valign="top" align="left"><div id="contentbox">
    <!--start the inner content-->
        <table border="0"width="100%" style="vertical-align:top"> 
            <tr>
                <td>
                    <table border="0">
                        <tr>
                            <td><asp:Button ID="btnbacklist" runat="server" Text="Back to the List" 
                                    onclick="btnbacklist_Click" ForeColor="FloralWhite" BackColor="#003366" /></td>
                            <td>|</td>
                            <%--<td><asp:Button ID="btnjobtofrd" runat="server" Text="Forward this job to a Friend" 
                                    Width="200px" onclick="btnjobtofrd_Click" ForeColor="FloralWhite" BackColor="#003366" /></td>
                            <td>|</td>--%>
                            <td><asp:Button ID="btnemailwithoutreg" runat="server" 
                                    Text="Apply By Email Without Registration" Width="220px" 
                                    onclick="btnemailwithoutreg_Click" ForeColor="FloralWhite" BackColor="#003366" /></td>
                            <td>|</td>                            
                            <td><asp:Button ID="btncratingaccount" runat="server" 
                                    Text="Apply By creating / Using an Account" Width="250px" 
                                     ForeColor="FloralWhite" BackColor="#003366" 
                                    /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:DataList ID="dljobpost" runat="server" Width="100%" BackColor="#B3A037" 
                        BorderColor="#E9D0AB" BorderStyle="None" BorderWidth="0px" CellPadding="3" 
                        CellSpacing="2" Font-Bold="false" Font-Size="14px" GridLines="Vertical">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="White" />
                        <ItemStyle BackColor="#0066cc" ForeColor="FloralWhite" Font-Names="Franklin Gothic Medium Cond" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table border="0" width="100%">
                                <tr>
                                    <td><asp:Label ID="lblref" runat="server"  Text="Reference #"></asp:Label></td>
                                    <td>:</td>
                                    <td><%#DataBinder.Eval(Container.DataItem, "jobid")%></td>
                                    <td width="160px">&nbsp;</td>
                                    <td><asp:Label ID="lbltitle" runat="server" Text="Title"></asp:Label></td>
                                    <td>:</td>
                                    <td><%#DataBinder.Eval(Container.DataItem, "jobtitle")%></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="lblcmpdept" runat="server" Text="Company/Department"></asp:Label></td>
                                    <td>:</td>
                                    <td><asp:Label ID="Label1" runat="server" Text="Ace Indus"></asp:Label></td>
                                    <td>&nbsp;</td>
                                    <td><asp:Label ID="lbllocation" runat="server" Text="Location"></asp:Label></td>
                                    <td>:</td>
                                    <td><%#DataBinder.Eval(Container.DataItem, "Location")%></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="lblexplevel" runat="server" Text="Experience Level"></asp:Label></td>
                                    <td>:</td>
                                    <td align="left">
                                        <table border="0" width="100%">
                                            <tr>
                                                <td><%#DataBinder.Eval(Container.DataItem,"Min_Exp")%></td>
                                                <td><asp:Label ID="lbl" runat="server" Text="To"></asp:Label></td>
                                                <td><%#DataBinder.Eval(Container.DataItem,"Max_Exp")%></td>
                                                <td style="width:60%"></td>
                                            </tr>
                                        </table>
                                    </td>    
                                    <td>&nbsp;</td>
                                    <td><asp:Label ID="lblstartdate" runat="server" Text="Start Date"></asp:Label></td>
                                    <td>:</td>
                                    <td><%#DataBinder.Eval(Container.DataItem, "pdate")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="dldescription" runat="server" Width="100%" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                        CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both">
                        <FooterStyle BackColor="#6699CC" />
                        <ItemStyle BackColor="FloralWhite" />
                        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="100%" height="300px" border="0">
                             <tr>
                                <td width="100%" align="center"><asp:Label ID="lbldesc" runat="server" Width="100%" Text="Description" BackColor="#6699cc" ForeColor="FloralWhite" Font-Bold="True"></asp:Label></td>
                             </tr>
                             <tr>   
                                <td width="100%" height="100%" style="font-size:14px; font-family:Arial Narrow">
                                    <asp:TextBox ID="txtFirstName" runat="server" Width="100%" Height="1000px" style="border:none" TextMode="MultiLine" Text='<%# Bind("jobdesc") %>'></asp:TextBox>
                                </td>
                             </tr>
                            </table>        
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
   <!-- end of inner content-->
    
    <div class="contentfooter">
    <table width="100%" border="0" class="fotertext">
  <tr>
    <td width="17%" height="18">&nbsp;</td>
    <td width="7%" align="center"><a href="aboutus.html">About Us|sp;&nbsp;&nbsp;<a href="accounting.html">Accounting</a>&nbsp;&nbsp;&nbsp;|</td>
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
