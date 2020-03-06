<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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

    <script>
        $(function () {
            $('#txt').keydown(function (e) {
                if (e.shiftKey || e.ctrlKey || e.altKey) {
                    e.preventDefault();
                } else {
                    var key = e.keyCode;
                    if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
                        e.preventDefault();
                    }
                }
            });
        });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Please enter only Numbers.");
                return false;
            }

            return true;
        }

        function ValidateNo() {
            var phoneNo = document.getElementById('txtPhoneNo');

            if (phoneNo.value == "" || phoneNo.value == null) {
                alert("Please enter your Mobile No.");
                return false;
            }
            if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
                alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
                return false;
            }

            alert("Success ");
            return true;
        }
    </script>
    <script>
        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false) {
                alert('Invalid Email Address');
                return false;
            }

            return true;

        }
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
                                                <li><a href="Default.aspx">Home</a></li>
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
                                                <li><a href="">News &amp; Events</a></li>
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
                                <img src="images/contactslidefinal.jpg" width="1200" height="300" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="contactpage_outer">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-12 nopadding">
                                            <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>
                                            >>
                                            <asp:Label ID="lbhome" Text="Contact" runat="server" ForeColor="#ff9933" Font-Size="22px"></asp:Label>
                                            <div class="contacus_outer">

                                                <div class="row">


                                                    <div class="col-lg-4">
                                                        <h1>Fill the Details</h1>
                                                        <form method="post" autocomplete="off">


                                                            <asp:TextBox ID="txt" runat="server" placeholder="Name"></asp:TextBox>

                                                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt" ErrorMessage="Add Name" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                                            <%--   <input type="text" placeholder="Name" required /--%>



                                                            <asp:TextBox ID="txt2" runat="server" placeholder="Email" onblur="validateEmail(this);"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2" ErrorMessage="Add Email Id" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                                            <%--    <input type="email" placeholder="Email" required />--%>

                                                            <div class="row">
                                                                <div class="col-lg-7">
                                                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Phone*"  MaxLength="10" onkeypress="return isNumber(event)"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Add Phone no." ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Location"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Add Location" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    <asp:Button ID="btn" runat="server" Text="SUBMIT" ValidationGroup="sub" OnClick="btn_Click" />
                                                                    <asp:ValidationSummary ID="val" runat="server" ValidationGroup="sub" ShowMessageBox="true" ShowSummary="false" />
                                                                    <%--   <input type="submit" value="SUBMIT" />--%>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="contact_map">
                                                            <h1>INDIA</h1>
                                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.39254374366!2d78.37332263224428!3d17.440916087628004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb93e6f2afdd65%3A0x93bff6ac5aa7ebf5!2sTechno+Residency%2C+Phase+2%2C+HITEC+City%2C+Hyderabad%2C+Telangana+500081!5e0!3m2!1sen!2sin!4v1533190649940" width="100%" height="300" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="contact_map_rite">
                                                            <h1>USA</h1>
                                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3101.857182306107!2d-77.40325238439927!3d38.972928979559015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b63887c8e8e94b%3A0xba230cd042ce4dc8!2sSterling+Rd%2C+Herndon%2C+VA+20170%2C+USA!5e0!3m2!1sen!2sin!4v1533274209086" width="100%" height="300" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                    <a href="Donation.aspx">DONATE</a>
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
