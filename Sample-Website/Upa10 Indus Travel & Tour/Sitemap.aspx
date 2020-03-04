<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Indus Tours &amp; Travels</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/aos.css" />
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
    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <section class="text-justify " id="sitemap">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">            	 
                <div class="row">        
                	<div class="text-count">
                        <img src="./images/ads-img2.jpeg"  class="img-fluid">
                    </div> 
                    <div class="site_heading">
                        <h1>Site Map</h1>
                    </div>
                     <div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                         <div class="pic-wrapper2">
                             <figure class="htl2-1"></figure>
                             <figure class="htl2-2"></figure>
                             <figure class="htl2-3"></figure>
                        </div>
                     </div>    
                    <div class="col-lg-8">
                         <div class="backsite_color">                                   	
                            <div class="row">                                                              	           	
                                <div class="col-lg-6">                            	
                                    <div class="siteone_outer">
                                        <h1>Home</h1>
                                        <h2>Inbound Tours</h2>
                                        <ul>                                    
                                            <li><a href="PackageDetails.aspx?id=21" target="_self">Exotic Kashmir</a></li>                                        
                                            <li> <a href="PackageDetails.aspx?id=22" target="_self">Experience Andamans</a></li>
                                            <li><a href="PackageDetails.aspx?id=23" target="_self">Golden Triangle Holiday</a></li>
                                            <li><a href="#" target="_self">Heritage Travel India</a></li>
                                            <li><a href="PackageDetails.aspx?id=4" target="_self">Scenic Kerala</a></li>
                                        </ul>
                                         <h2>Outbound Tours</h2>
                                        <ul>
                                            <li><a href="PackageDetails.aspx?id=11" target="_self">Australia Holiday Packages</a></li>
                                            <li><a href="PackageDetails.aspx?id=27" target="_self">Europe Tour Packages</a></li>
                                            <li><a href="PackageDetails.aspx?id=26" target="_self">New Zealand Tour Packages</a></li>
                                            <li><a href="PackageDetails.aspx?id=25" target="_self">South East Asia Tours</a></li>
                                            <li><a href="PackageDetails.aspx?id=24" target="_self">Srilanka Tours</a></li>
                                        </ul> 
                                        <h2>Hotel Booking</h2>
                                        <ul>
                                            <li><a href="#" target="_self">France , Swiss Paris</a></li>
                                            <li><a href="PackageDetails.aspx?id=29" target="_self">Highlights Of Turkey</a></li>
                                            <li><a href="PackageDetails.aspx?id=28" target="_self">Hongkong With Macau Package</a></li>
                                            <li><a href="PackageDetails.aspx?id=10" target="_self">Luxury in Singapore</a></li>
                                            <li><a href="#" target="_self">Maldives With Cochin Stopover</a></li>
                                        </ul> 
                                         <h2>Travel Services</h2>
                                        <ul>
                                            <li><a href="#" target="_self">Domestic and International Air Ticketing</a></li>
                                            <li><a href="#" target="_self">Holiday Packages</a></li>
                                            <li><a href="#" target="_self">Passport and Visa Assistance</a></li>
                                            <li><a href="#" target="_self">Travel Insurance</a></li>
                                            <li><a href="#" target="_self">Rail and Bus Tickets</a></li>
                                        </ul> 
                                        <h1>Company</h1> 
                                        <h1>Product &amp; Services</h1>                           		
                                        <h1>Holiday Packages</h1>
                                    </div>
                                </div> 
                                <div class="col-lg-6">
                                    <div class="sitetwo_outer">
                                        <h1>Cruises</h1>
                                        <h1>Visas</h1>
                                        <ul>
                                            <li><a href="#" target="_self">Visit to USA</a></li>
                                            <li><a href="#" target="_self">Visit to Australia</a></li>
                                            <li><a href="#" target="_self">Visit to UAE</a></li>                                        
                                            <li><a href="#" target="_self">Visit to Singapore</a></li>                                        
                                            <li><a href="#" target="_self">Visit to Malaysia</a></li>
                                            <li><a href="#" target="_self">Visit to china</a></li>                                        
                                        </ul>
                                        <h1>Travel Ideas</h1>                                                                                                     		                                    
                                        <h1>Special Offers</h1>
                                        <h1>Careers</h1>
                                        <h1>Contact</h1>
                                        <h1>Feedback</h1>
                                        <h1>Other Links</h1>
                                        <ul>
                                            <li><a href="#" target="_self">Time Zones</a></li>
                                            <li><a href="#" target="_self">Airline Numbers</a></li>
                                            <li><a href="#" target="_self">Currency</a></li>
                                            <li><a href="#" target="_self">Weather</a></li>
                                            <li><a href="#" target="_self">Weight Conversion</a></li>
                                            <li><a href="#" target="_self">Travel Insurance</a></li>
                                            <li><a href="#" target="_self">Terms &amp; Conditions</a></li>
                                            <li><a href="#" target="_self">Advertise</a></li>
                                            <li><a href="#" target="_self">FAQ</a></li>
                                            <li><a href="#" target="_self">Route Map</a></li>                                        
                                            <li><a href="#" target="_self">Privacy Policy</a></li>                                                                              
                                        </ul>
                                    </div>                               
                                </div>                                                       
                            </div>
                        </div>                       
                    </div>
                    <div class="col-lg-2">
                    	<div class="col-lg-12">
                        	<div class="spec_site">
                            	<a href="#" target="_self"><img src="images/spec_final1.jpg" width="350" height="250" alt="" class="img-fluid"/></a> 
                            	<h1>Special Offers on Hotels</h1>
                        	</div>
                        </div>                                            		
                       <div class="col-lg-12">                       		
                 				<div class="spec_site">
                       	    		<a href="#" target="_self"><img src="images/spec_final2.jpg" width="350" height="250" alt="" class="img-fluid"/></a> 
                                	<h1>Tourism Summer Vacation</h1>
                            	</div>                            
                       </div>
                        <div class="col-lg-12">
                           	<div class="spec_site">
                       	    	<a href="#" target="_self"><img src="images/spec_final3.jpg" width="350" height="250" alt="" class="img-fluid"/> </a>
                                <h1>Honeymoon Packages</h1>
                            </div>	
                        </div>
                        <div class="col-lg-12">
                        	<div class="spec_site">
                       	    	<a href="#" target="_self"><img src="images/spec_final4.jpg" width="350" height="250" alt="" class="img-fluid"/> </a>
                                <h1>International Hotels</h1>
                            </div>
                        </div> 
                        <div class="col-lg-12">
                        	 <div class="spec_site">
                       	    	<a href="#" target="_self"><img src="images/spec_final5.jpg" width="350" height="250" alt="" class="img-fluid"/> </a>
                                <h1>Value Added Benefits</h1>
                            </div>
                        </div>                                             
                    </div>                   
                </div>
            </div>
        </div>
    </section>
</asp:Content>

