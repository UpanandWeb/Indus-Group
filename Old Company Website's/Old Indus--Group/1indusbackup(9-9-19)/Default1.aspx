<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/Header1.ascx" TagName="Header" TagPrefix="head" %>

<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
	 
<script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
  
  <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>Indus Group  Technologies | Corporate IT Solutions | IT Business Solution | IT Service Provider | Information Technology Company</title>
      <style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<script src="jquery.js" type="text/javascript"></script>

<style media="screen" type="text/css">
    .defaultText { width: 300px; }
    .defaultTextActive { color: #a1a1a1; font-style: italic; }
</style>

 <style type="text/css">
        #map {
            height: 100%;
            width: 100%;
            /*text-align:center;
            vertical-align:top;*/
           float:initial;
        }
    </style>



<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

<style type="text/css">
    .panle
    {
       position:absolute;
    top: 50%;
    left:100%;
    padding-left:100%;
    }
</style>

  

<style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
 </style>
</head>
<script type="text/javascript">
    function entries(val) {
        if (val == '') {
            window.location.href = "#";
        }
        else if (val == 'middle-east') {
            window.open('#', '_blank');
        }
        else {
            window.location.href = "#" + val;
        }

    }

</script>

<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">

    <form id="form1" runat="server">
 <cc1:ToolkitScriptManager ID="sc" runat="server"></cc1:ToolkitScriptManager>
    <div class="container-fluide header-inner-wrap">
   <head:Header ID="uc1" runat="server" />
    
    </div>
   <div style="height:5px;"></div>
    <div class="container-fluid">
     <div class="row">
       <!-- carousel starts here-->
           <div id = "myCarousel" class = "homepage_first_slider home-page-big-slider carousel slide">
            <!-- Carousel indicators -->
                        <!--<ol class = "carousel-indicators">
                              <li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
                              <li data-target = "#myCarousel" data-slide-to = "1" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "2" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "3" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "4" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "5" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "6" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "7" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "8" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "9" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "10" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "11" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "12" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "13" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "14" class = ""></li>
                              <li data-target = "#myCarousel" data-slide-to = "15" class = ""></li>
                             
                              
                           </ol>-->
             <!-- Carousel items -->
             <div class = "carousel-inner">

                            <div class = "item active ">
                                     <img src="Images/slide-three.jpg" alt="slider">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/wave-of-colour-copy.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Consulting </h3>
                        
                        
                       </div>
                     </div>
                   </div>
                </div>
                
                
                <div class = "item ">
                                     <img src="Images/slider.jpg" alt="0">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/wave-bg2.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Consulting </h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                <div class = "item ">
                                     <img src="Images/consulting-banner1.jpg" alt="0">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/waves-big.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Consulting </h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                
                <div class = "item ">
                                     <img src="Images/consulting-banner.jpg" alt="0">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/waves-big.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Consulting </h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                
                
                
                          <div class = "item ">
                                     <img src="Images/technology-partners.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/wave-2.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Technology Partners</h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                         
                         <div class = "item ">
                                     <img src="Images/technology-partners-banner.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/Soft_Wave_Background.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Technology Partners</h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                <div class = "item ">
                                     <img src="Images/technology-partners-banner1.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                         <img src="Images/wave-2.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Technology Partners</h3>
                        <!--<p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                         
                         <div class = "item ">
                                     <img src="Images/outsourcing.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/resized-wave.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Out Souricing </h3>
                      <!--  <p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                
                <div class = "item ">
                                     <img src="Images/outsourcing-banner3.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/wave-bg-img.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Out Souricing </h3>
                      <!--  <p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                
                <div class = "item ">
                                     <img src="Images/outsourcing-banner5.jpg" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                         <img src="Images/resized-wave.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Out Souricing </h3>
                      <!--  <p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                <div class = "item ">
                                     <img src="Images/outsourcing-banner.png" alt="Big Data and Analytic Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                         <img src="Images/resized-wave.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Out Souricing </h3>
                      <!--  <p>Let igiit show you how</p>-->
                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                         <!--<a href="/services/analytics/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                
                
                
                
                <div class = "item ">
                                     <img src="Images/healthcare-banner2.jpg" alt="Cloud Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                         <img src="Images/wave.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Healthcare </h3>
<!--                        <p>Discover a secure, flexible, and reliable infrastructure for all your enterprise needs.</p-->                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                    <!-- <a href="/services/cloud/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                
                <div class = "item ">
                                     <img src="Images/healthcare-banner3.jpg" alt="Cloud Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                         <img src="Images/wave.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Healthcare </h3>
<!--                        <p>Discover a secure, flexible, and reliable infrastructure for all your enterprise needs.</p-->                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                    <!-- <a href="/services/cloud/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
                         
                          <div class = "item ">
                                     <img src="Images/healthcare-banner.jpg" alt="Cloud Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/wave_bg1.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Healthcare </h3>
<!--                        <p>Discover a secure, flexible, and reliable infrastructure for all your enterprise needs.</p-->                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                    <!-- <a href="/services/cloud/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>
          
          <div class = "item ">
                                     <img src="Images/healthcare.jpg" alt="Cloud Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/landing_waves.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Healthcare </h3>
<!--                        <p>Discover a secure, flexible, and reliable infrastructure for all your enterprise needs.</p-->                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                    <!-- <a href="/services/cloud/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>



<div class = "item ">
                                     <img src="Images/healthcare-banner1.jpg" alt="Cloud Solution">
                   <div class="hidden_for_mobile"></div>
                   <div class="time_linewrapper">
                      <div class="big-wave waves">
                        <img src="Images/landing_waves.png" alt="Wave" />
                      </div>
                   </div>
                   <div class="slider_content_wrapper added-zindex">
                     <div class="slider_content">
                       <div class="table_layout">
                        <h3 class="home-slider-heding banner-heading">Healthcare </h3>
<!--                        <p>Discover a secure, flexible, and reliable infrastructure for all your enterprise needs.</p-->                                                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                    <!-- <a href="/services/cloud/" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
                       </div>
                     </div>
                   </div>
                </div>




             </div>
             <!-- Carousel nav -->
             <a class="left carousel-control">
              <!--   <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
              <img src="Images/left-arrow.png" alt="LeftArrow" class="glyphicon-chevron-left" href="#myCarousel" role="button" data-slide="prev">
            </a>
            <a class="right carousel-control">
              <!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
              <img src="Images/right-arrow.png" alt="RightArrow" class="glyphicon-chevron-right" href="#myCarousel" role="button" data-slide="next">
            </a>

          </div>
       <!-- carosel ends here -->
     </div>
     
     
     
     
     
     
     
     <!-- about section -->
			<section class="about text-center" id="about">
				<div class="container">
					<div class="row">
						<h2>Welcome to Indus Group</h2>
						<h4>Indus Group is an organization specialized in offering customized services in web design and development, Software development and IT Staffing. Client-centric approach is what we adhere to, as it gives us the clarity to identify client’s specific IT (or) NON-IT requirements, and then after provide them a feasible solution, that can ultimately satisfy our valued clients. </h4>
			<div class="row"><%-- <button type="button" class="btn btn-default">Learn More</button>--%> </div>
            
            

						



					</div>
				</div>
			</section><!-- end of about section -->
     
     
     
     
     
     <div class="row home_services">
       <h1 class="ourservices">OUR SERVICES</h1>
       <div class="col-xs-12 services_wrapper">
         <div class="col-md-3 col-sm-6 col-xs-12">
                      <div class="caption_image_wrapper">
              <img src="Images/consulting.png"  class="img-responsive" alt="0" />
            </div>
            <div class="caption_content_wrapper">
              <h3>Consulting</h3>
              <p>A team of skilled consulting experts coupled with a time-tested consulting methodology,...</p>
              <!--<a href="#" class="caption_readmore hvr-rectangle-out" title="Read More">Read More</a>-->
            </div>
         </div>
         <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="caption_image_wrapper">
              <img src="Images/financial.png" alt="0" />
            </div>
            <div class="caption_content_wrapper">
               <h3>Financial</h3>
              <p>Hassle-free financial solutions for your diverse business needs....</p>
               <!--<a href="#" class="caption_readmore hvr-rectangle-out" title="Read More">Read More</a>-->
            </div>
         </div>
         <div class="col-md-3 col-sm-6 col-xs-12">
                      <div class="caption_image_wrapper">
              <img src="Images/health-care.png" alt="0" />
            </div>
            <div class="caption_content_wrapper">
               <h3>Healthcare</h3>
              <p>Customized Healthcare services depending upon your pertinent healthcare needs....</p>
              <!--<a href="#" class="caption_readmore hvr-rectangle-out" title="Read More">Read More</a>-->
            </div>
         </div>
         <div class="col-md-3 col-sm-6 col-xs-12">
                      <div class="caption_image_wrapper">
              <img src="Images/Web-Development-Icon.png" alt="0" />
            </div>
            <div class="caption_content_wrapper">
               <h3>Development</h3>
              <p>Customized S/W development along with exquisite Web design and development,...</p>
               <!--<a href="#" class="caption_readmore hvr-rectangle-out" title="Read More">Read More</a>-->
            </div>
         </div>

       </div>
     </div>      <div class="row homepagesecond_slider ">
        <div class="col-xs-12 no_margin_padding">
          <!-- carousel starts here-->
           <div id = "myCarousel1" class = "homepage_first_slider carousel slide yash-insighsts">

             <!-- Carousel items -->
             <div class = "carousel-inner ">

                              <div class = "item active" style="background-image:url(http://www.yash.com/wp-content/themes/Yash/images/application-management.png)">
                   <!-- <img src = "http://www.yash.com/wp-content/themes/Yash/images/application-management.png" class="hidden-xs"> -->
                   <div class="hidden_for_mobile"></div>

                   <div class="slider_content_wrapper">
                     <div class="slider_content">
                       <div class="table_layout">
                           <h3 class="home-slider-heding">A ONE-STOP DESTINATION FOR ALL YOUR WEB DESIGN AND DEVELOPMENT NEEDS.</h3>
                                                         <!--<a target="_blank" href="#" class='read_more_button hvr-rectangle-out' title="View PDF">Read Complete Case Study</a>-->
                                                    <!--  <a href="h" target="_blank" class="read_more_button hvr-rectangle-out" title="Read Complete Case Study">Read Complete Case Study</a> -->
                       </div>
                     </div>
                   </div>
                </div>
                                <div class = "item " style="background-image:url(http://www.yash.com/wp-content/themes/Yash/images/application-management.png)">
                  
                   <div class="hidden_for_mobile"></div>

                   <div class="slider_content_wrapper">
                     <div class="slider_content">
                       <div class="table_layout">
                           <h3 class="home-slider-heding">RIGHT AMOUNT OF EXPERTISE IN SOFTWARE DEVELOPMENT, IT STAFFING AND RECRUITMENT AND INTERNATIONAL TICKETING SERVICES </h3>
                            <%--<p>Learn how Wabash selected igiit for SAP SuccessFactors LMS to provide one central database for all training worldwide.</p>--%>
                                                         <!--<a target="_blank" href="#" class='read_more_button hvr-rectangle-out' title="View PDF">Read Complete Case Study</a>-->
                                                    <!--  <a href="h" target="_blank" class="read_more_button hvr-rectangle-out" title="Read Complete Case Study">Read Complete Case Study</a> -->
                       </div>
                     </div>
                   </div>
                </div>
                                <div class = "item " style="background-image:url(http://www.yash.com/wp-content/themes/Yash/images/application-management.png)">
                  
                   <div class="hidden_for_mobile"></div>

                   <div class="slider_content_wrapper">
                     <div class="slider_content">
                       <div class="table_layout">
                           <h3 class="home-slider-heding">AGRICULTURAL ORGANIZATION INTRODUCES MOBILE COUPONING TO IMPROVE CONSUMER EXPERIENCE</h3>
                            <p>A leading agricultural organization, provide products and solutions to farmers all around the world.</p>
                                                         <!--<a target="_blank" href="#" class='read_more_button hvr-rectangle-out' title="View PDF">Read Complete Case Study</a>-->
                                                    <!--  <a href="h" target="_blank" class="read_more_button hvr-rectangle-out" title="Read Complete Case Study">Read Complete Case Study</a> -->
                       </div>
                     </div>
                   </div>
                </div>
                  
             </div>
             

             <a class="left carousel-control">
              <!--   <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
              <img src="Images/left-down-arrow.png" alt="previous"class="glyphicon-chevron-left" href="#myCarousel1" role="button" data-slide="prev" />
            </a>
            <a class="right carousel-control">
              <!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
              <img src="Images/right-down-arrow.png" alt="next" class="glyphicon-chevron-right" href="#myCarousel1" role="button" data-slide="next" />
            </a>

          </div>
       <!-- carosel ends here -->
        </div>
     </div>     <div class="row events_wrapper">
       <div class="no_margin_padding col-xs-12">
         <div class="no_margin_padding zoom_effect col-xs-12 col-sm-3">
           <img src="Images/partners.jpg" class="" alt="News" />
                                 <div class="slider_content_wrapper">
             <div class="slider_content">
               <div class="table_layout">
                 <span class="big_text">parnters</span>
                 <!--<span class="small_text">igiit Technologies Achieves ISO 27001:2013 Information Security Management System Certification (ISMS)</span>-->
                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
               <!--  <a href="#" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
               </div>
             </div>
           </div>
         </div>
         <div class="no_margin_padding zoom_effect col-xs-12 col-sm-3">
           <img src="Images/services.jpg" alt="0" />
                                 <div class="slider_content_wrapper">
             <div class="slider_content">
               <div class="table_layout">
                 <span class="big_text">Services</span>
                 <!--<span class="small_text">HR Connect 2016</span>-->
                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
               <!--  <a href="#" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
               </div>
             </div>
           </div>
         </div>
         <div class="no_margin_padding zoom_effect col-xs-12 col-sm-3">
           <img src="Images/technology-partnerss.jpg" alt="0" />
                                  <div class="slider_content_wrapper">
             <div class="slider_content">
               <div class="table_layout">
                 <span class="big_text">Technology Partners</span>
                <!-- <span class="small_text">Why SAP Fiori Should Be Your Next IT Investment?</span>-->
                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                <!-- <a href="#" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
               </div>
             </div>
           </div>
                    </div>
                    
                    <div class="no_margin_padding zoom_effect col-xs-12 col-sm-3">
           <img src="Images/seminars.jpg" alt="0" />
                                  <div class="slider_content_wrapper">
             <div class="slider_content">
               <div class="table_layout">
                 <span class="big_text">Seminars</span>
                <!-- <span class="small_text">Why SAP Fiori Should Be Your Next IT Investment?</span>-->
                 <!-- <div class="read_more_button"><a href="">Read More</a></div> -->
                <!-- <a href="#" class="read_more_button hvr-rectangle-out" title="Read More">Read More</a>-->
               </div>
             </div>
           </div>
                    </div>
       </div>
       
      <div class="container-fluid form-contact">
 <div class="row">
 
 
 <div class="container">
 <div class="row">
 
 <div class="contact-caption clearfix">
								<div class="contact-heading text-center">
									<!--<h2>contact us</h2>-->
								</div>

								<div class="col-md-4 contact-info text-left">
									<h3>USA</h3>
									<div class="info-detail">
							<ul style="margin-bottom:10px;"><li><i class="fa fa-calendar"></i><span>Monday - Friday</span>: 9:30 AM to 5:30 PM</li></ul>
							<ul ><li><i class="fa fa-map-marker" ></i><span>Address</span> : Global Head Quarters - USA </li></ul>
	
					<ul class="m-left"><li> Indus Group Incorporated,</li></ul>
					<ul class="m-left"><li>  1033 Sterling Road, Ste. 204,</li></ul>
					<ul class="m-left"><li>  Herndon-VA-20170. USA.</li></ul>
					<ul class="m-left"  style="margin-bottom:15px;"><li>   Washington DC Metro Area.</li></ul>
					
                    
<ul>
<li><i class="fa fa-phone" style="height:20px;"></i><span class="span-width">Voice </span>:  703-957-7829      </li></ul>
  
 <ul class="m-left"  style="margin-bottom:15px;"><li>  703-291-8299   </li></ul> 
  
<ul style="height:30px;">
<li><i class="fa fa-phone"></i><span class="span-width">Fax </span>:   703-956-6769
</ul> 
									
	<ul><li><i class="fa fa-envelope" style="height:15px !important;"></i><span>General Enquiries </span>: info@1indus.com
    </li></ul>
	<ul><li><i class="fa fa-envelope" style="height:15px;"></i><span>For Clients </span>: sales@1indus.com</li></ul>
	<ul><li><i class="fa fa-envelope" style="height:15px;"></i><span>For Careers</span>: 	resume@1indus.com</li></ul>

				


									</div>
								</div>


								<div class="col-md-4 contact-form">
									<h3>Leave a message</h3>
                                    	<div class="info-detail">
								<form class="form">
                                        <asp:TextBox ID="txt1name" runat="server" CssClass="name"  PlaceHolder="Enter Your Name"   ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1name" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtemail" runat="server" CssClass="email" PlaceHolder="Enter Your Email"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtphone" runat="server" CssClass="phone" PlaceHolder="Enter Your Phone No" ></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphone" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
										<%--<input class="name" placeholder="Name" type="text">--%>
										<%--<input class="email" placeholder="Email" type="email">--%>
										<%--<input class="phone" placeholder="Phone No:" type="text">--%>
                                         <asp:TextBox ID="txtmsg" runat="server" CssClass="message" PlaceHolder="Message"  TextMode="MultiLine"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmsg" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
									<%--	<textarea class="message" name="message" id="message" cols="30" rows="10" placeholder="Message"></textarea>--%>
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="submit-btn" Text="SUBMIT" 
                                            onclick="btnsubmit_Click" ValidationGroup="submit1" />
                                            <asp:ValidationSummary ID="valsum" runat="server" ValidationGroup="submit1"    />
										<%--<input class="submit-btn" value="SUBMIT" type="submit">--%>
									</form>
								</div>
                                </div>
                                
                                 	





<div class="col-md-4 contact-info text-left">
									<h3>INDIA</h3>
									<div class="info-detail">
							<ul style="margin-bottom:10px;"><li><i class="fa fa-calendar"></i><span>Monday - Friday</span>: 9:30 AM to 6:30 PM</li></ul>
							<ul ><li><i class="fa fa-map-marker" >

							  </i><span>Address</span> : Plot # 21,Flat #203 </li></ul>
					
					<ul class="m-left"><li> Techno Residency, </li></ul>
					<ul class="m-left"><li> Opp: Mind Space(Raheja IT Park),Madhapur, </li></ul>

					<ul class="m-left"><li>  Hyderabad,TS-500081.</li></ul>
					<ul class="m-left"  style="margin-bottom:15px;"><li>    India.</li></ul> 
                                        <ul class="m-left"  style="margin-bottom:15px;"><li>     <asp:HyperLink ID="map" runat="server" ForeColor="White" Text="View Map" NavigateUrl="~/Default14.aspx"></asp:HyperLink></li></ul> 
                                                          
					
                    
<ul>
<li><i class="fa fa-phone" style="height:20px;"></i><span class="span-width">Voice </span>:   888 584 7688 </li></ul>
  
 <ul class="m-left"  style="margin-bottom:15px;"><li>   040-66736226  </li></ul>
  
<ul style="height:30px;">
<li><i class="fa fa-phone"></i><span class="span-width">Fax </span>:   040-66136446</li>
</ul> 
									
	<ul><li><i class="fa fa-envelope" style="height:15px !important;"></i><span>General Enquiries </span>: infohyd@1indus.com
    </li></ul>
	<ul><li><i class="fa fa-envelope" style="height:15px;"></i><span>For Clients </span>: saleshyd@1indus.com</li></ul>
	<ul><li><i class="fa fa-envelope" style="height:15px;"></i><span>For Careers</span>: 	hydresume@1indus.com</li></ul>

				


									</div>
								</div>

							</div></div></div></div></div> 
       
     </div>


            
 
                            
                            
                            
     <foot:footer ID="foot1" runat="server" />
     <!-- modal pop up for the static fixed button -->


      





    <div   runat="server" class="modal fade" role="dialog">
      <div class="modal-dialog">

      
        <!-- Modal content-->
        <div class="modal-content" id="modalview" runat="server" >
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Request for information</h4>
          </div>
          <div class="modal-body" id="request-form-wrapper">
            <form class="rfi-form rfi-form-mobile">
			<input type="hidden" id="hidlocation" name="hid_location" value="#" />
            <div class="form-group">
                <label for="rfinamemobile">Name*</label>
                <input type="text" id="rfinamemobile" name="rfiname" class="form-control" data-validation="required custom" data-validation-regexp="^([A-Za-z ]+)$" data-validation-error-msg="Please enter name(only alphabets)" >
            </div>

            <div class="form-group">
              <label for="rfiemailmobile">Email*</label>
              <input type="email" id="rfiemailmobile" name="rfiemail"  class="form-control user-email " data-validation="required custom" data-validation-regexp="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" data-validation-error-msg="Please enter correct email id">
            </div>

            <div class="form-group">
              <label for="rfiphonemobile">Phone *</label><br>
              <input type="text" id="rfiphonemobile" name="rfiphone"class="form-control" data-validation-length="min2" data-validation="required custom length" data-validation-regexp="^([0-9\+\-\ \(\)]+)$" data-validation-error-msg="Please enter correct phone number">
            </div>

            <div class="form-group">
              <label for="rficompanymobile">Company</label>
             <input type="text"id="rficompanymobile" name="rficompany" class="form-control">
            </div>

            <div class="form-group">
              <label for="rficommentmobile">Comment</label>
              <textarea rows="3" cols="4" id="rficommentmobile" name="rfi-comment" class="form-control"></textarea>
            </div>

            <input type="submit" class="btn btn-default rfi-submit">
            <div class="rfi-thanku-msg">
              Thank you for your message. It has been sent.
            </div>
          </form>
                    </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <!--request info ends here -->
    <div class="fixed-button" id="mobile-fixed-req-button">
      <a data-toggle="modal" data-target="#request-info-mobile" href="javascript:void(0);" class="desktop-req-button">
    
     
      <img src="http://www.yash.com/wp-content/themes/Yash/images/request_button.png" alt="Request For Information"></a>
    </div>
    <div class="fixed-button" id="desktop-fixed-req-button">
      <a href="javascript:void(0);" class="desktop-req-button" id="desktop-req-button">
        <asp:ImageButton ID="popupview" runat="server" ImageUrl="http://www.yash.com/wp-content/themes/Yash/images/request_button.png" OnClick="mpview" />
     <%-- <img src="http://www.yash.com/wp-content/themes/Yash/images/request_button.png" alt="Request For Information">--%></a>
    </div>


   
  


   <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="view"  TargetControlID="popupview" CancelControlID="btn1"></cc1:ModalPopupExtender>


   
    <!--Request form desktop-->
    <asp:Panel ID="pan1" runat="server" CssClass="panle">
    <div class="animation-wrapper" id="view" runat="server">
    <div align="right"><asp:Button ID="btn1" runat="server" Text="X"  /></div>
      <div class="close-request-info-popup" id="canid" runat="server">X</div>
      <form class="rfi-form rfi-form-desktop">
	  <input type="hidden" id="hidlocation" name="hid_location" value="http://www.yash.com/" />
        <div class="form-group">
        <asp:Label ID="lb1" runat="server" Text="Name*" Font-Bold="true"></asp:Label>
           <%-- <label for="rfinamedesk">Name*</label>--%>
           <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
          <%--  <input type="text" id="rfinamedesk" name="rfiname" class="form-control" data-validation="required custom" data-validation-regexp="^([A-Za-z ]+)$" data-validation-error-msg="Please enter name(only alphabets)" >--%>
        </div>

        <div class="form-group">
        <asp:Label ID="lbl2" runat="server" Text="Email*" Font-Bold="true"></asp:Label>
          <%--<label for="rfiemaildesk">Email*</label>--%>
          <asp:TextBox ID="txtemail1" runat="server" CssClass="form-control user-email"></asp:TextBox>
         <%-- <input type="email" id="rfiemaildesk" name="rfiemail"  class="form-control user-email " data-validation="required custom" data-validation-regexp="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" data-validation-error-msg="Please enter correct email id">--%>
        </div>

        <div class="form-group">
        <asp:Label ID="lb3" runat="server" Text="Phone*" Font-Bold="true" ></asp:Label>
         <%-- <label for="rfiphonedesk">Phone *</label>--%><br>
         <asp:TextBox ID="txtphone1" runat="server" CssClass="form-control" ></asp:TextBox>
        <%--  <input type="text" id="rfiphonedesk" name="rfiphone"class="form-control" data-validation-length="min2" data-validation="required custom length" data-validation-regexp="^([0-9\+\-\ \(\)]+)$" data-validation-error-msg="Please enter correct phone number">--%>
        </div>

        <div class="form-group">
        <asp:Label ID="lb4" runat="server" Text="Company" Font-Bold="true"></asp:Label>
         <%-- <label for="rficompanydesk">Company</label>--%>
         <asp:TextBox ID="txtcompany" runat="server" CssClass="form-control"></asp:TextBox>
         <%--<input type="text"id="rficompanydesk" name="rficompany" class="form-control">--%>
        </div>

        <div class="form-group">
        <asp:Label ID="lb5" runat="server" Text="Comment" Font-Bold="true"></asp:Label>
          <%--<label for="rficommentdesk">Comment</label>--%>
          <asp:TextBox ID="txtcmt" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
         <%-- <textarea rows="3" cols="4" id="rficommentdesk" name="rfi-comment" class="form-control"></textarea>--%>
        </div>
        <asp:Button ID="submitrqst" runat="server" 
          CssClass="btn btn-default rfi-submit" Text="submit" 
          />
       <%-- <input type="submit" class="btn btn-default rfi-submit">--%>
        <div id="msgview" runat="server" class="rfi-thanku-msg">
          Thank you for your message. It has been sent.
        </div>
      </form>

      <!--Request form desktop End-->

             <!-- [submit class:btn class:btn-default "Submit"] -->
          </div>
     
 </asp:Panel>
<script type="text/javascript"><!--
    wpa2a.targets = [];
    wpa2a.html_done = true; if (wpa2a.script_ready && !wpa2a.done) wpa2a.init(); wpa2a.script_load();
//--></script>
<script type='text/javascript' src="js/jquery.form.min.js"></script>
<script type='text/javascript'>
/* <![CDATA[ */
var _wpcf7 = {"loaderUrl":"http:\/\/www.igiit.com\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif","recaptchaEmpty":"Please verify that you are not a robot.","sending":"Sending ..."};
/* ]]> */
</script>

<script src="js/script.js" type="text/javascript"></script>
<script src="js/widgets.js" type="text/javascript"></script>
<script src="js/position.min.js" type="text/javascript"></script>
<script src="js/autocomplete.min.js" type="text/javascript"></script>
<script src="js/menu.min.js" type="text/javascript"></script>
<script src="js/jquery-1.9.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script src="js/jquery.form-validator.min.js" type="text/javascript"></script>
<script src="js/file.js" type="text/javascript"></script>
 <script src="js/scripts.js" type="text/javascript"></script>
 <script src="js/wp-embed.min.js" type="text/javascript"></script>



    
<script type="text/javascript"></script>
       
 
 
 
 <script type="text/javascript">
     var pkBaseURL = "#";
     document.write(unescape("%3Cscript src='" + pkBaseURL + "tracking.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
    piwik_action_name = '';
    piwik_idsite = 1;
    piwik_url = pkBaseURL + "tracking.php";
    piwik_coe = '';
    piwik_camp_id = '0';
    piwik_sfid = '';
    piwik_media_id = '0';
    piwik_source_id = '0';
    piwik_ext_id = '0';
    piwik_ppc_adid = '0';
    piwik_log(piwik_action_name, piwik_idsite, piwik_url, piwik_coe, piwik_camp_id, piwik_sfid, piwik_media_id, piwik_source_id, piwik_ext_id, piwik_ppc_adid);
</script> 
 
 
   
<script type="text/javascript">
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-5902091-1', 'test.com');
    ga('set', 'dimension1', "igiit");
    ga('send', 'pageview');

</script>


<script>
    piAId = '73692';
    piCId = '1098';

    (function () {
        function async_load() {
            var s = document.createElement('script'); s.type = 'text/javascript';
            s.src = ('https:' == document.location.protocol ? 'https://pi' : 'http://cdn') + '.pardot.com/pd.js';
            var c = document.getElementsByTagName('script')[0]; c.parentNode.insertBefore(s, c);
        }
        if (window.attachEvent) { window.attachEvent('onload', async_load); }
        else { window.addEventListener('load', async_load, false); }
    })();
</script>
</div>
    </form>
</body>
</html>
