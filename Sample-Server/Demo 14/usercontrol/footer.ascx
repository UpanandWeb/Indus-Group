<%@ Control Language="C#" AutoEventWireup="true" CodeFile="footer.ascx.cs" Inherits="usercontrol_footer" %>
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



<div id="contact">
            <div class="footer_bg">
                <div class="container-fluid">
                     <div class="row">
                        <div class="col-lg-12">
                            <div class="footer_parts">
                                <div class="row">	                            	 
                                    <div class="col-lg-3">
                                        <div class="add_outer">                                    
                                            <h2>Address</h2>
                                            <span><img src="images/map-pin-marked.png" width="30" height="30" alt="" class="img-fluid"/></span><p>xxxxxxxxx<!--Century Super Speciality Hospital,<br>Road no : 12,Banjarahills,<br>Telengana,Hyderabad.--></p>                                                                          
                                             <span class="newinfo"><img src="images/mail-black-envelope-symbol.png" width="30" height="30" alt="" class="img-fluid"/></span><a href="mailto:soroptimisthyderabad@gmail.com">soroptimisthyderabad@gmail.com</a>                                     
                                             <div class="another_emerg">
                                                <span><img src="images/mobile-phone.png" width="30" height="30" alt="" class="img-fluid"/></span><p>M : 9848012345</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="contact_form">
                                        	<form>
                                                <asp:TextBox ID="txt1" runat="server" placeholder="Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rc" runat="server" ControlToValidate="txt1" ValidationGroup="val" ErrorMessage="Fill Name" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                 <asp:TextBox ID="txtmob" runat="server" placeholder="Mobile"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="val" ControlToValidate="txtmob" ErrorMessage="Fill Mobile" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                
                                                 <asp:TextBox ID="txtemail" runat="server" placeholder="Emailid"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="val" runat="server" ControlToValidate="txtemail" ErrorMessage="Fill Email" ForeColor="Red">*</asp:RequiredFieldValidator>


                                                 <asp:TextBox ID="txtmsg" runat="server" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="val" runat="server" ControlToValidate="txtmsg" ErrorMessage="Fill Message" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                <br />

                                                <asp:Button ID="btn" runat="server" Text="Submit" ValidationGroup="val" />

                                                <asp:ValidationSummary ID="vl" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />

                                            	<%--<input type="text" placeholder="Name"/>
                                                <input type="tel" placeholder="Mobile" />
                                                <input type="email" placeholder="Email">
                                               <!-- <select>
                                                	<option value="Location">Location</option>
                                                    <option value="Hyderabad">Hyderabad</option>
                                                    <option value="Bangalore">Bangalore</option>
                                                    <option value="Mumbai">Mumbai</option>
                                                    <option value="Pune">Pune</option>
                                                </select>-->
                                                <textarea placeholder="Message">
                                                </textarea></br>
                                                <input type="submit" value="submit" />--%>
                                            </form>
                                        </div>                              	
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="footer_links">
                                            <ul>
                                                <li><a href="Default.aspx" target="_self">Home</a></li>
                                                <li><a href="About.aspx" target="_self">About</a></li>
                                                <li><a href="Our-Work.aspx" target="_self">Our work</a></li>
                                            </ul>
                                            <ul>
                                                <li><a href="Events.aspx" target="_self">Events</a></li>  
                                                <li><a href="Gallery.aspx" target="_self">Gallery</a></li>  
                                                <li><a href="News.aspx" target="_self">News</a></li>
                                            </ul>
                                        </div>
                                    </div>                                   
                                     <div class="col-lg-3">
                                     	<div class="social_footer">                                                         
                                            <ul class="social-network social-circle">
                                                <li><a href="www.facebook.com" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="www.linkedin.com" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="www.gmail.com" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a href="www.twitter.com" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li> 
                                            </ul>
                                        </div>
                                        <div class="donate_outer">
                                            <a href="#" target="_self">SUBSCRIBE</a>
                                            <a href="#" target="_self">DONATE</a>
                                            <a href="#" target="_self">JOIN</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>        	
                </div>
            </div>
         </div>


<div class="container-fluid">
    	<div class="row">
        	<div class="col-lg-12 nopadding">
            	<div class="footer_outer">
                    <div class="footer_whole">
                    	<div class="row">
                        	<div class="col-lg-6">
                            	<div class="left_copyright">                                   
                                	<p>Powered by <a href="http://aceindus.in/" target="_self"><img src="images/powered.jpg" width="80" height="20" alt=""/></a></p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="rite_links">
                                    <ul>
                                        <li><a href="#" target="_self">Disclaimer</a></li>
                                        <li><a href="#" target="_self">Terms &amp; Conditions</a></li>
                                        <li><a href="#" target="_self">Privacy Policy</a></li>
                                    </ul>
                                </div>                                
                            </div>                                                     
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
