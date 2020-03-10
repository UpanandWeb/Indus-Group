<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Register.aspx.cs" Inherits="Emp_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>:: Ace Indus :: Employee Register page</title>
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
                <td height="60" style="padding-left: 10px">
                    <table width="100%" border="0">
                        <tr>
                            <td width="20%" height="48" valign="middle"><a href="Default.aspx">
                                <img src="images/logo.png" width="199" height="46" border="0" /></a></td>
                            <td width="51%" align="center" style="padding-left: 70px"><a href="#">
                                <img src="images/iso1.png" width="131" height="60" border="0" />
                            </a></td>
                            <td width="29%" valign="middle">
                                <table width="100%" border="0" class="text" style="font-size: 11px">
                                    <tr>
                                        <td width="11" align="right" valign="top">
                                            <img src="images/home-icon.png" width="13" height="16" /></td>
                                        <td width="33" valign="top"><a href="http://www.aceindus.in/Default.aspx">Home</a></td>
                                        <td width="13" valign="top" align="right">
                                            <img src="images/webdev-site-map-icon.png" width="15" height="15" /></td>
                                        <td width="51" valign="top"><a href="http://www.aceindus.in/sitemap.html">Site map</a></td>
                                        <td width="14" valign="top" align="right">
                                            <img src="images/phone-icon.png" width="15" height="13" /></td>
                                        <td width="50" align="left" valign="top"><a href="http://www.aceindus.in/contact.aspx">Contact</a></td>
                                        <td width="11" align="left" valign="top">
                                            <img src="images/loginicon.png" width="13" height="14" /></td>
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
                            <li><a href="http://www.aceindus.in/support.html">Support</a></li>
                            <li><a href="http://www.aceindus.in/feedbackform.aspx">Feedback</a></li>
                         <li ><a href="http://www.aceindus.in/ittraining/" target="_blank">Training</a></li>
                    </ul>
                    </div>

                    <!--1st drop down menu -->
                    <div id="dropmenu1" class="dropmenudiv" style="width: 110px">
                        <a href="http://www.aceindus.in/aboutus.html">About Us</a>
                        <a href="http://www.aceindus.in/management.html">Management</a>
                        <a href="http://www.aceindus.in/aceindusvision.html">Ace Indus Vision</a>
                        <a href="http://www.aceindus.in/newsevents.html">News&amp;Events</a>

                    </div>


                    <!--2nd drop down menu -->
                    <div id="dropmenu2" class="dropmenudiv" style="width: 135px;">
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

                    <div id="dropmenu5" class="dropmenudiv" style="width: 93px;">
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
                        <a href="http://www.aceindus.in/crm_applications.html">CRM Applications Accounting</a>
                        <a href="http://www.aceindus.in/software_desktop.html">Software Desktop Application</a>
                        <a href="http://www.aceindus.in/wap_application.html">WAP Application </a>
                        <a href="http://www.aceindus.in/erp_software.html">ERP Software</a>

                    </div>

                    <div id="dropmenu8" class="dropmenudiv" style="width: 130px;">
                        <a href="http://www.aceindus.in/overview.html">Overview</a>
                        <a href="http://www.aceindus.in/benefits.html">Benefits</a>
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
                                <a href="#">
                                    <img src="images/slide1.jpg" width="100%" height="250" alt="slide1" border="0" /></a> <a href="#">
                                        <img src="images/slide3.jpg" width="100%" height="250" border="0" /></a> <a href="#">
                                            <img src="images/slide4.jpg" width="100%" height="250" border="0" /></a>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <td valign="top" align="left" width="75%">
                            <table width="100%" border="0" class="text">
                                <tr>
                                    <td class="innertext">Register Page :</td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <img src="images/regiter.jpg" width="250px;" />
                                    </td>
                                    <td width="80%" align="center">
                                        <table border="0" width="100%" align="center">
                                            <tr>
                                                <td width="20px">&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td align="center" style="font-family: Tahoma, Geneva, sans-serif; font-size: 18px; font-weight: bold; color: #003366; background: url('../Images/innerbg.jpg') no-repeat; height: 32px;">New Employee Register</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table width="100%" border="0">
                                                        <tr>
                                                            <td>
                                                                <table border="0" width="100%">
                                                                    <%--<tr>
                           <td height="30" colspan="3" ><font class="crentopenings"><b>New Employee Register</b></font></td>
                          </tr>--%>
                                                                    <tr>

                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                                                        </td>
                                                                        <td valign="top" width="4px" class="style1"><strong>:</strong></td>
                                                                        <td valign="top" align="left" style="padding-left: 10px" width="300px"
                                                                            class="style1">
                                                                            <asp:TextBox ID="txtfname" runat="server" Width="200px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                                                ControlToValidate="txtfname" ErrorMessage="Please enter Name"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
                                                                        </td>
                                                                        <td valign="top" class="style1" width="4px"><strong>:</strong></td>
                                                                        <td valign="top" style="padding-left: 10px">
                                                                            <asp:TextBox ID="txtlname" runat="server" Width="200px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                                                ControlToValidate="txtlname" ErrorMessage="Please enter Lastname"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="lblusername" runat="server" Text="Email"></asp:Label>
                                                                        </td>
                                                                        <td class="style1" valign="top"><strong>:</strong></td>
                                                                        <td valign="top" style="padding-left: 10px">
                                                                            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px" AutoPostBack="true"
                                                                                OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                                ControlToValidate="txtusername" ErrorMessage="Please enter the User Name"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="reg1" runat="server"
                                                                                ErrorMessage="Please Enter Valid Email Address"
                                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                                ControlToValidate="txtusername"
                                                                                ValidationGroup="vendor" ForeColor="Red">*</asp:RegularExpressionValidator>
                                                                            <asp:Image ID="imgcheck1" ImageUrl="../Images/check.gif" runat="server" Width="17px" Height="17px" Visible="false" />
                                                                            <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td valign="top" style="padding-left: 10px">
                                                                <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                                    ControlToValidate="txtpwd" ErrorMessage="Please enter the Password"
                                                                    Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td valign="top" style="padding-left: 10px">
                                                                <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px"
                                                                    TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd"
                                                                    ErrorMessage="*" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red"
                                                                    ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd"
                                                                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="vendor">*</asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanyname" runat="server" Text="Company Name"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>

                                                        <%--<tr>
                                <td   valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanymailid" runat="server" Text="Company Mail ID"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Please Enter Valid Email Address" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="vendor">*</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtcompanymailid" ValidationGroup="vendor">*
                                    </asp:RequiredFieldValidator>    
                                </td>
                            </tr>--%>
                                                        <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                        ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>

                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td style="padding-left: 10px" valign="top">
                                                                <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                                                    ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number."
                                                                    Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style4">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style1" valign="top" style="padding-right: 15px" align="right" class="style4">&nbsp;
                                                            </td>
                                                            <td valign="top">&nbsp;</td>
                                                            <td align="left">
                                                                <asp:Button ID="btnsubmit" runat="server" Text="Submit"
                                                                    OnClick="btnsubmit_Click" ValidationGroup="vendor" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnreset" runat="server" Text="Reset"
                                         OnClick="btnreset_Click" />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center" class="style4">
                                                                <table border="0" align="center">
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style4">
                                                                <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                </td>
                <td align="right" width="25%">
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <div class="hleft"></div>
                                        <div class="hmidil">
                                            <font class="hedings">
                                                     New Job Applicants</font>
                                        </div>
                                        <div class="hright"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="images/new_resume_box.jpg" width="100%" height="130" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="hleft"></div>
                                        <div class="hmidil">
                                            <font class="hedings">
                                     Current Openings</font>
                                        </div>
                                        <div class="hright">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text" style="border-left: 1px #A5B4FA  dashed">
                                        <marquee onmouseover="stop();" onmouseout="start();" scrollamount="3" direction="up" height="134px">
  <asp:DataList ID="ddlcurop" runat="server">
               <ItemTemplate>
                    <table border="0" style="padding:10px">
                         <tr>
                            <td align="justify">
                                <font class="crentopenings">
                                <asp:LinkButton  ID="Linkbutton2"   ForeColor="#993333" runat="server" PostBackUrl='<%# string.Format("fulltime_jobs.aspx?id=" + Eval("ID").ToString()) %>' 
                         Text ='<%# Eval("JobTitle") %>' ></asp:LinkButton>
                                   <%-- <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("JobTitle")%>' />--%>
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
              </asp:DataList>
              </marquee>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="hleft"></div>
                                        <div class="hmidil">
                                            <font class="hedings">
                                 
                                     Technology Partners :</font>
                                        </div>
                                        <div class="hright"></div>
                                    </td>
                                </tr>
                            </table>
                            <img src="images/patner01.jpg" width="238" height="160" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
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
                                    <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="http://www.aceindustraining.com/" target="_blank">Training</a>&nbsp;&nbsp;&nbsp;|</td>
                                    <td width="7%" align="center">&nbsp;&nbsp;&nbsp;<a href="contact.aspx">Contact</a>&nbsp;&nbsp;&nbsp;</td>
                                    <td width="17%">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="footerbottam" align="center">
                            Copy right @1999-2013 Ace Indus Tech -Sol,  All Rights reserved
                        </div>
                </td>
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
