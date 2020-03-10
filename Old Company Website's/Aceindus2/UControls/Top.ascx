<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top.ascx.cs" Inherits="UControls_Top" %>


<header id="this-is-top">
	            <div class="" style="">
	                <div class="topmenu row hidden-xs" style="background-color: #052e70;padding:3px 0 0px 12%">
	                    
	                 <nav class=" col-md-offset-4 col-lg-offset-6 col-sm-9 col-md-5 col-lg-0   top-width " style="padding-right: 0px" >
                       
                            <i class="fa fa-send" style="color: white;"></i> <a href="#" style="text-transform: none; font-size: 14px">i n f o @ a c e i n d u  s . i n</a>
	                        <a href="http://www.facebook.com/" style="
    margin-left: 10%;
"><i class="fa fa-facebook"></i></a>
	                        <a href="http://plus.google.com/"><i class="fa fa-google-plus"></i></a>
	                        <a href="http://www.twitter.com/"><i class="fa fa-twitter"></i></a>
	                       	                    </nav>
	                        
	                        <nav class="col-lg-offset-right-1 col-sm-3 col-md-3 col-lg-2 hidden-xs" style="padding-left: 0px">
                         
  <input  name="search" placeholder="Search.." type="text" />
     <%-- <asp:ImageButton ID="serch" ImageUrl="~/img/searchicon.png" runat="server" Width="20px" Height="23px" />--%>
	         <%--<a href="#"><i class="fa fa-search fa-2x"></i></a>--%>
                                <asp:LinkButton ID="btnserch" runat="server" CssClass="fa fa-search fa-3x" Font-Size="19px" />               
	                                          </nav>
	                </div>
	                
	               <!--- <div class="row header">
	                    <div class="col-sm-3 col-md-3 col-lg-3">
	                        <a href="index####" id="logo"><img src="img/logo.png" alt="" width="250px" height="80px"></a>	                    </div>
	                    <div class="col-sm-offset-1 col-md-offset-1 col-lg-offset-1 col-sm-8 col-md-8 col-lg-8">
	                        <div class="text-right header-padding">
	                            <div class="h-block"><span>CALL US</span>+91 891  2550373 / 74</div>
	                            <div class="h-block"><span>EMAIL US</span>info@synergyshipping.in</div>
	                           
	                        </div>
	                    </div>
	                </div> --->
	               
	               <div class="row" >
	                	<div class="col-lg-2 col-md-2 col-sm-5"><a href="Default.aspx" id="logo"><img class="logo" src="img/logo.png" alt="" width="280px" height="60px"></a>	</div>
	                	<div class="col-lg-9 col-md-9 col-sm-2">
	                	   
	                
	                <a id="menu-open" href="#"><i class="fa fa-bars fa-2x"></i></a> 
	                <nav class="main-menu navbar-main-slide">
						<ul class="nav navbar-nav navbar-main">
							<li class="active dropdown"><a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#"> CORPORATE <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#about.html">ABOUT US</a></li>
					       			<li><a href="#">MANAGEMENT</a></li>
					       			<li><a href="#">ACE INDUS VISION</a></li>
					       			<li><a href="#">NEWS & EVENTS</a></li>
						       			</ul>
								</li>
								<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#"> IT COMPANY <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="Technology.aspx">TECHNOLOGIES</a></li>
												<li><a href="Company-Overview.aspx">COMPANY OVERVIEW</a></li>
												<li><a href="Consulting.aspx">CONSULTING</a></li>
												<li><a href="Project-Management.aspx">PROJECT MANAGEMENT</a></li>
						       			</ul>
								</li>
							
								<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#"> CLIENTS <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#">ALLIANCES</a></li>
												<li><a href="#">CLIENTS</a></li>
												<li><a href="#">PARTNERSHIPS</a></li>
												<li><a href="#">BUSSINESS</a></li>
						       			</ul>
								</li>
							<li><a href="http://www.indusabroad.com" target="_blank">ACADEMIC</a></li>
							<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#">WEB SOLUTIONS <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#">PORTFOLIO</a></li>
												<li><a href="#">WEB HOSTING</a></li>
												<li><a href="#">DESIGN & DEVELOPMENT</a></li>
												<li><a href="#">GRAPHIC DESIGNING</a></li>
					       						<li><a href="#">WEBSITE MAINTANANCE</a></li>
						       			</ul>
								</li>
							
							
							
							<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#">SOFTWARE<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#">SOFTWARE DEVELOPMENT</a></li>
												<li><a href="#">CRM APPLICATIONS ACCOUNTING</a></li>
												<li><a href="#">SPFTWARE DESKTOP APPLICATIONS</a></li>
												<li><a href="#">WAP APPLICATIONS</a></li>
					       						<li><a href="#">ERP SOFTWARE</a></li>
						       			</ul>
								</li>
							<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#">CAREERS<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#">OVERVIEW</a></li>
												<li><a href="#">BENEFITS</a></li>
												<li><a href="#">FULLTIME JOBS</a></li>
												<li><a href="#">POST YOUR RESUME</a></li>
						       			</ul>
								</li>
                           	<li><a href="careers####">SUPPORT</a></li>
                            <li><a href="careers####">FEEDBACK</a></li>
							<li class="dropdown">
							  		<a data-toggle="dropdown" class="dropdown-toggle border-hover-color1" href="#">TRAINING<i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
												<li><a href="#">CLASSROOM TRAINING</a></li>
												<li><a href="#">ONLINE TRAINING</a></li>
												
						       			</ul>
								</li>
												
						</ul>
						
					</nav>
                
	                <a id="menu-close" href="#"><i class="fa fa-times"></i></a>
	                </div>
	                	<div class="col-lg-1 col-md-1 col-sm-1 hidden-xs"><a href="index####" id="A1"><img class="iso " src="img/iso.png" alt=""></a>	</div>
	                </div>
	            </div>
	        </header>
            <div id="ip-container" class="ip-container">
				<div class="ip-header" >
					<div class="ip-loader">
						<svg class="ip-inner" width="60px" height="60px" viewBox="0 0 80 80">
							<path class="ip-loader-circlebg" d="M40,10C57.351,10,71,23.649,71,40.5S57.351,71,40.5,71 S10,57.351,10,40.5S23.649,10,39.3,10z"/>
							<path id="ip-loader-circle" class="ip-loader-circle" d="M40,10C57.351,10,71,23.649,71,40.5S57.351,71,40.5,71 S10,57.351,10,40.5S23.649,10,40.5,10z"/>
						</svg> 
					</div>
				</div>
			</div> 