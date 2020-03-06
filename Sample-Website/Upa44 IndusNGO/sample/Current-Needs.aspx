<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Current-Needs.aspx.cs" Inherits="Current_Needs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container-fluid">      	
      	<div class="row">
        	<div class="col-lg-12">
            	<div class="three_supportouter">
                	<div class="row">
                    	<div class="col-lg-3">
            	            <div class="options_outer">
                            	<ul>
                              <li><a href="Support.aspx">SPONSOR A CHILD'S EDUCATION</a></li>
                                    <li><a href="Support-Nutrition.aspx" target="_self">SPONSOR A CHILD FOR NUTRITION FOOD</a></li>
                                    <li><a href="Monthly-Need.aspx">SPONSOR MONTHLY NEEDS</a></li>
                                    <li><a href="Current-Needs.aspx">SPONSOR CURRENT HOME NEEDS</a></li>
                                    <li><a href="Special-Day.aspx">SPONSOR YOUR SPECIAL DAY</a></li>
                                    <li><a href="Donation.aspx" >ANY DONATION</a></li>
                                    <li><a href="Fund.aspx">CORPUS FUND</a></li>
                                </ul>
                            </div>	
                        </div>
                        <div class="col-lg-6">
                            <div class="centersupport_content">
                            	<h1>Current Needs</h1>
                                <ul>
                                	<li>Gas connections(domestic) New connections. Rs.7950 need atleast 4 connections.priority 2)</li>
                                    <li>5 kgs  capacity steel boxes for storage of pulses 6Nos Total Rs.6000</li>
                                    <li>2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>1kgs 2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>1/2 kgs 2kgs capacity  steel boxes for storage of pulses 6Nos</li>
                                </ul>
                                <div class="support_sliderpic">  
                                        <div id="blogCarousel" class="carousel slide" data-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#blogCarousel" data-slide-to="1"></li>
                                            </ol>          
                                            <!-- Carousel items -->
                                            <div class="carousel-inner">
                    
                                                <div class="carousel-item active">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_1.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Wall Clock</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_2.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Iron Box</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_3.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Stool</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_4.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Electric Cooker</h3>
                                                        </div>
                                                    </div>
                                                    <!--.row-->
                                                </div>
                                                <!--.item-->
                    
                                                <div class="carousel-item">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_5.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Mat</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_6.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Chapathi Maker</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_7.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Stiching Machine</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_8.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Rice Bowl</h3>
                                                        </div>
                                                    </div>
                                                    <!--.row-->
                                                </div>
                                                <!--.item-->
                    
                                            </div>
                                            <!--.carousel-inner-->
                                        </div>
                                		<!--.Carousel--> 
                                </div>                         	                                
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="rightsuppor_block">
                       	    	<img src="images/supportpic_1.jpg" width="450" height="100" alt="" class="img-fluid"/> 
                            </div>
                        </div>                                       
                    </div>
                    
                </div>            	
            </div>
        	
        </div>
      </div>
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
 <!--logo_slider-->
 <!--support-carousal-->
 <script>
     $('#blogCarousel').carousel({
         interval: 2000
     });
</script>
</asp:Content>

