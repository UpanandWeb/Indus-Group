<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top.ascx.cs" Inherits="UControls_Top" %>
            <div class="container-fluid">
                <div class="row">
                    <div class="header">
                        <div class="row top-line">
                            <div class="col-md-12">
                                <div class="social-icons">
                                    <div class="text-center center-block">
                                        <p class="par"><i class="fa fa-envelope"aria-hidden="true"></i>&nbsp; info@indusabroad.com &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                                        <i class="fa fa-mobile" aria-hidden="true"></i> &nbsp; 571-777-9969 &nbsp;&nbsp;&nbsp;</p> 
                                        &nbsp; &nbsp; &nbsp; 
                                        <a href="https://www.facebook.com"><i id="social-fb" class="fa fa-facebook-square fa-2x social"></i></a> &nbsp; &nbsp;
                                        <a href="https://twitter.com"><i id="social-tw" class="fa fa-twitter-square fa-2x social"></i></a> &nbsp; &nbsp;
                                        <a href="https://plus.google.com"><i id="social-gp" class="fa fa-google-plus-square fa-2x social"></i></a> &nbsp; &nbsp;
                                        <a href="gmail.com"><i id="social-em" class="fa fa-envelope-square fa-2x social"></i></a> 
                                        &nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        <span style="padding-right:50px;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-3">
                            <div class="logo">
                             <a href="Default.aspx">   <img src="img/indusabroad.png" alt="0" style="margin-top: -19px; height: 80px; width: 100%;"></a>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <!-- /.navbar-collapse -->
                            <nav class="navbar navbar-inverse" style="margin-left:100px;">
                                <div class="container-fluid">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        <!-- <a class="navbar-brand" href="#">WebSiteName</a> -->
                                    </div>
                                    <div class="collapse navbar-collapse" id="myNavbar">
                                        <ul class="nav navbar-nav">
                                            <li class="#"><%--<a href="#">Home</a>--%>
                                                  <asp:LinkButton ID="lnkhome" runat="server" Text="Home" OnClick="lnkhome_Click"></asp:LinkButton>

                                            </li>
                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">About Us<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="About.aspx">About Indus Abroad</a></li>
                                                    <li><a href="#">Membership</a></li>
                                                    <li><a href="#">Management Team</a></li>
                                                </ul>
                                            </li>

                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Services<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Consulting</a></li>
                                                    <li><a href="#">Financial Assistance</a></li>
                                                    <li><a href="Scholarships.aspx">Scholarship Opportunities</a></li>
                                                    <li><a href="#">Visa Guidance</a></li>
                                                    <li><a href="Counselling.aspx">Counseling</a></li>

                                                </ul>
                                            </li>

                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">academy<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="MedicineDetails.aspx">Medicine</a></li>
                                                    <li><a href="#">Engineering</a></li>
                                                    <li><a href="#">MBA</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">IMMIGRATION<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Australia</a></li>
                                                    <li><a href="#">Canada</a></li>
                                                    <li><a href="#">New-Zealand</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Events<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Seminars</a></li>
                                                    <li><a href="#">Workshops</a></li>
                                                    <li><a href="#">Photo Gallery</a></li>
                                                    <li><a href="#">Press Release</a></li>
                                                </ul>
                                            </li>

                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Support<span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Apply Online</a></li>
                                                    <li><a href="#">Faq</a></li>
                                                    <li><a href="#">Reviews</a></li>
                                                </ul>
                                            </li>


                                            <li><a href="Contact.aspx">Contact</a></li>
                                           <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Training
                                                    <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">TOEFL</a></li>
                                                    <li><a href="#">GRE</a></li>
                                                    <li><a href="#">IELTS</a></li>
                                                </ul>
                                            </li>

                                          <%-- <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>--%>
                                              <li style="float:left;"><%--<a href="Login.aspx">Login / Sign Up</a>--%>
                                                  <asp:LinkButton ID="lnklogin" runat="server" Text="Login / Sign Up" OnClick="lnklogin_Click" CausesValidation="false"></asp:LinkButton>
                                                  <%--<asp:LinkButton ID="lnklogout" runat="server" Text="Logout" Visible="false" OnClick="lnklogout_Click"></asp:LinkButton>--%>

                                              </li>
                                            <li style="float:right;padding-right:100px;"><%--<a href="Login.aspx">Login / Sign Up</a>--%>
                                                  <asp:LinkButton ID="lnklogout" runat="server" Text="Logout" Visible="false" OnClick="lnklogout_Click"></asp:LinkButton>

                                              </li>
                                        </ul>

                                    </div>
                                </div>
                            </nav>

                        </div>

                    </div>

                </div>
            </div>
