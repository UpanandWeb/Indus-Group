﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Donation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="pragma" content="no-cache">
    <title>Anandam Foundation</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/full-slider.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!--menu_links-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--menu_links-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!--gallery_outer--->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <!--gallery_outer-->

    <script>
        $(function () {
            var path = window.location.pathname;
            path = path.replace(/\/$/, "");
            path = decodeURIComponent(path);

            $(".nav li a").each(function () {
                var href = $(this).attr('href');
                if (path.substring((path.lastIndexOf('/') + 1), path.lenght) === href) {
                    $(this).closest('li').addClass('active');
                } else {
                    $(this).closest('li').removeClass();
                }
            });
        });
    </script>

       <script type="text/javascript">
           function SessionExpireAlert(timeout) {
               var seconds = timeout / 1000;
               document.getElementsByName("secondsIdle").innerHTML = seconds;
               document.getElementsByName("seconds").innerHTML = seconds;
               setInterval(function () {
                   seconds--;
                   document.getElementById("seconds").innerHTML = seconds;
                   document.getElementById("secondsIdle").innerHTML = seconds;
               }, 1000);
               setTimeout(function () {
                   //Show Popup before 20 seconds of timeout.
                   $find("mpeTimeout").show();
               }, timeout + 1 * 1000);
               setTimeout(function () {
                   window.location = "Default.aspx";
               }, timeout);
           };
           function ResetSession() {
               //Redirect to refresh Session.
               window.location = window.location.href;
           }
            </script>    
           

</head>
<body>
    <form id="form1" runat="server">
        <div class="total_section">
            <div class="container-fluid nopadding">
                <div class="row">
                    <div class="address_outer">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="logo_outer">
                                        <img src="images/color_change_logoaf.png" width="160" height="60" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-2 nopadding">
                                    <div class="phone_outer">
                                        <span>
                                            <img src="images/phone.png" width="25" height="25" alt="" />IND :</span><a href="tel:6303850877" target="_blank">+91-6303850877</a>
                                    </div>
                                </div>
                                <div class="col-lg-2 nopadding">
                                    <div class="mail_outer">
                                        <!--<span><img src="images/mail.png" width="25" height="25" alt=""/></span>-->
                                        <a href="mailto:info@anandamfoundation.com" target="_blank">info@anandamfoundation.com</a>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="phone_outer">
                                        <span>
                                            <img src="images/phone.png" width="25" height="25" alt="" />USA :</span><a href="tel:703-593-1234" target="_blank">703-593-1234</a>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="social_outer">
                                        <!--<ul>
                                    <li><a href="#" target="_blank"><img src="images/facebook.png" width="30" height="30" alt=""/></a></li>
                                    <li><a href="#" target="_blank"><img src="images/linkedin.png" width="30" height="30" alt=""/></a></li>
                                    <li><a href="#" target="_blank"><img src="images/google-plus.png" width="30" height="30" alt=""/></a></li>
                                    <li><a href="#" target="_blank"><img src="images/twitter.png" width="30" height="30" alt=""/></a></li>	
                                </ul>-->
                                        <ul class="social-network social-circle">
                                            <li><a href="www.facebook.com" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="www.linkedin.com" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                            <li><a href="www.gmail.com" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                            <li><a href="www.twitter.com" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-1">
                            	<div class="login_outer">
                                  <%--   <asp:Label ID="lblname" runat="server" ></asp:Label>--%>
                                    <asp:LinkButton ID="lg" runat="server" Text="Login" OnClick="lg_Click"></asp:LinkButton>
	                            <%--	<a id="lg" runat="server" href="Login.aspx" >Login</a>--%>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header_outer">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-10">
                            <div class="top_menu">
                                <!--menu_outer-->
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid nopadding">
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                        </div>
                                        <div class="collapse navbar-collapse" id="myNavbar">
                                            <ul class="nav navbar-nav">
                                                <li ><a href="Default.aspx">Home</a></li>
                                                <!--<li class="dropdown">
                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">Mergers &amp; Acquisition</a>
                                  <ul class="dropdown-menu">
                                    <li><a href="#">Acquisition Searches</a></li>
                                    <li><a href="#">Business for Sale</a></li>
                                    <li><a href="#">Financing (offered/Needed)</a></li>
                                    <li><a href="#">Done Deals (Completed Trasactions)</a></li>
                                    <li><a href="#">Partners Wanted (Joint Ventures)</a></li>
                                  </ul>
                                </li>-->
                                                <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">About</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">The Organization</a></li>
                                                        <li><a href="#">The People</a></li>
                                                        <li><a href="#">Financial info</a></li>
                                                        <li><a href="#">Press Room</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">What we do</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">Basic Needs</a></li>
                                                        <li><a href="#">Infrastructure</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Services</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">Food</a></li>
                                                        <li><a href="#">Clothing</a></li>
                                                        <li><a href="#">Education</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Team</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">Organization Team</a></li>
                                                        <li><a href="#">Board Members</a></li>
                                                        <li><a href="#">Food Commitee</a></li>
                                                        <li><a href="#">Clothing Commitee</a></li>
                                                        <li><a href="#">Education Commitee</a></li>
                                                        <li><a href="#">Volunteers</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="Support.aspx">Support Us</a></li>
                                                <li><a href="Gallery.aspx">Gallery</a></li>
                                                <li><a href="#">News &amp; Events</a></li>
                                                <li><a href="Donation.aspx">Donate</a></li>
                                                <!--<li class="dropdown">
                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">Donate</a>
                                  <ul class="dropdown-menu">
                                    <li><a href="#">Company</a></li>
                                    <li><a href="#">Individuals</a></li>   
                                    <li><a href="#">Organizations</a></li>                                                                     
                                  </ul>
                                </li> -->
                                                <li><a href="#">Beneficiaries</a></li>
                                                <li><a href="Contact.aspx">Contact</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                                <!--menu_outer-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--donate_part-->
            <div class="donate_outer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 nopadding">
                            <div class="donate_bgouter">
                                <img src="images/donatefinal_pic.jpg" width="1200" height="300" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="donatedetails_outer">
                                <div class="row">
                                    <div class="col-lg-4"></div>
                                    <div class="col-lg-4">
                                        <div class="bankdetails_outer">
                                            <h1>Donation with in India can send Online to the Bank acccount</h1>
                                            <table width="100%" border="1" class="donatetab">
                                                <tbody>
                                                    <tr>
                                                        <td width="200">Bank Account Name :</td>
                                                        <td>Axis Bank</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Bank Account Number :</td>
                                                        <td>101000xxxxx2233</td>
                                                    </tr>
                                                    <tr>
                                                        <td>IFSC CODE :</td>
                                                        <td>UTIB0001634</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Bank Address :</td>
                                                        <td>Hyderabad</td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--donate_part-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 nopadding">
                        <div class="green_outer">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-6 nopadding">
                                <div class="greendonate_cont">
                                    <h1>Your Contribution with in India are eligible for tax benefit under Section 80G</h1>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="greendonate_cont">
                                    <a href="Donation.aspx"> DONATE</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer_part-->
            <div class="amazon_part">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer_four">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="supportus_outer">
                                            <h1>By the Numbers</h1>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="trackrecord_outer">
                                                    <h1>7</h1>
                                                    <p>Trustees</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="trackrecord_outer">
                                                    <h1>11+</h1>
                                                    <p>Years</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="trackrecord_outer">
                                                    <h1>19+</h1>
                                                    <p>Happy Orphan Kids</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="contactano_outer">
                                            <p><strong>Anandam Foundation</strong>
                                                <br>
                                                Plot # 21,Flat #203,Techno Residency,<br>
                                                Opp: Mind Space(Raheja IT Park),<br>
                                                Madhapur, Hyderabad, TS-500081,INDIA.</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="contactnum_outer">
                                            <p><span>IND :</span>+91-6303850877</p>
                                            <p><span>Email</span>info@anandamfoundation.com</p>
                                            <p><span>USA :</span>703-593-1234</p>
                                            <p><span>Visits :</span>31339</p>
                                        </div>
                                    </div>
                                    <!--<div class="col-lg-2">
                            	    <div class="visitor">
                                    	<a href='https://www.counter12.com'><img src='https://www.counter12.com/img-Z68Dz03wxa031ZB5-3.gif' border='0' alt='free counter'></a>
                                        <h1>31339</h1>
                                        <h2>Visitors Count</h2>
                                   </div>                            
                            </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer_part-->
        </div>
        <!--footer-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 nopadding">
                    <div class="footer_outer">
                        <div class="footer">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="left_copyright">
                                        <p>Anandam Foundation Copyright &copy; 2001-2018, All Rights reserved.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="rite_links">
                                        <ul>
                                            <li><a href="#">Privacy Policy</a></li>
                                            <li><a href="#">Terms &amp; Conditions</a></li>
                                            <li><a href="#">Refund &amp; Cancellation Policy</a></li>
                                            <li><a href="#" target="_blank">80G</a></li>
                                            <li><a href="#" target="_blank">12AA</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <script type='text/javascript' src='https://www.counter12.com/ad.js?id=Z68Dz03wxa031ZB5'></script>
        <!--gallery-->
        <script>
            $(document).ready(function () {
                $(".fancybox").fancybox({
                    openEffect: "none",
                    closeEffect: "none"
                });

                $(".zoom").hover(function () {

                    $(this).addClass('transition');
                }, function () {

                    $(this).removeClass('transition');
                });
            });
        </script>
        <!--gallery-->
        <!--logo_slider-->
        <script>
            $(document).ready(function () {
                $('#logoslider').carousel({
                    interval: 3000
                })
            });
        </script>
    </form>
</body>
</html>
