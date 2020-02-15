<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="usercontrol_header" %>



<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
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


<div class='thetop'></div>
	<div class="container-fluid">
    	<div class="row">
       		<div class="topcontact">
            	<div class="col-lg-12">
                	<div class="row">
                    	<div class="col-lg-4"></div>
                    	<div class="col-lg-3">
                        	<div class="phone_outer">
                                 <span><img src="images/speech-bubble.png" width="30" height="25" alt=""/>IND :</span><a href="tel:8885847688" target="_blank">+91-9848012345</a>
                            </div> 
                        </div>  
                        <div class="col-lg-3 nopadding">
                        	<div class="mail_outer">
                                <span><img src="images/mailid.png" width="30" height="25" alt=""/></span><a href="mailto:soroptimisthyderabad@gmail.com" target="_blank">soroptimisthyderbad@gmail.com</a>                              
                            </div> 
                        </div>	                  	
                        <div class="col-lg-2">
                        	<div class="social_outer">                            
                                <ul class="social-network social-circle">
                                    <li><a href="www.facebook.com" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="www.linkedin.com" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="www.gmail.com" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="www.twitter.com" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li> 
                                </ul>
                            </div>
                        </div>                                                                       
                    </div>
                </div>
            </div> 	
        </div>
    </div>
    <div class="container-fluid">
    	<div class="row">
        	<div class="menu_outer">
                 <div class="col-lg-12">
                 	<div class="row">
                    	<div class="col-lg-6">
                        	<div class="logo_block">
                                <asp:ImageButton ID="img" runat="server" AlternateText="No Image" Height="108px" Width="278px" OnClick="img_Click" ImageUrl="images/sorophyd_logoano.png" />
                   	    		<%--<img src="images/sorophyd_logoano.png" width="278" height="105" alt=""/>--%>
                            </div> 
                        </div>
                        <div class="col-lg-6">
                              <div class="menu_line">
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
                                        <li><a href="About.aspx">About</a></li>                                
                                         <li><a href="Our-Work.aspx">Our Work</a></li>                                                                                                                                                              
                                        <li><a href="Events.aspx">Events</a></li>
                                        <li><a href="Gallery.aspx">Gallery</a></li>                                                                                                                                                                
                                        <li><a href="News.aspx">News</a></li> 
                                        <li><a href="#contact">Contact</a></li>   
                                               <li><a href="Register.aspx">Register</a></li>                                                                     
                                        <!--<li class="dropdown">
                                          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Donate</a>
                                          <ul class="dropdown-menu">
                                            <li><a href="#">Company</a></li>
                                            <li><a href="#">Individuals</a></li>   
                                            <li><a href="#">Organizations</a></li>                                                                     
                                          </ul>
                                        </li> -->                                                                                                                                                                           
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
        </div>
    </div>
