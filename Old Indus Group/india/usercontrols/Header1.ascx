﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header1.ascx.cs" Inherits="usercontrols_Header1" %>

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
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />

    <link href="../css/styles1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
 </style>
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

 
 <table width="100%">
 <tr>
 <td align="left" valign="middle"  >
 
 <div class="col-lg-3 col-md-3 col-xs-10 logo">
        <p>
          <a href="Default.aspx"><img src="Images/logo2.png"   alt="logo" /></a>
        </p>
      </div>
 
 
 </td>
 <td>
 <table width="100% !important" class="  col-sm-10 menu-wrapper col-xs-12 table-lg-9">
 <tr><td>

     
    
               
        
      
      <div class="top-menu pull-right hidden-xs hidden-sm">
          <ul class="top-menu-inner">
          
          <li>
              <a href="india/Default.aspx"><img src="Images/national-flags-250x250.jpg"  height="30" alt="INDIA" title="INDIA" /></a>
            </li>
                  
            <li>                     

              <a href="Default.aspx"><img src="Images/american_us_flag_mini_button.jpg" height="20" alt="USA" title="USA" /> </a>
              
            </li>
            
            
            
            <li>
              <ul>
                             <li>
                                <img src="../Images/Key-icon.png"    class="a" id="lnkimg" runat="server"  />
                                <asp:LinkButton ID="lnk1" runat="server" Text="Login" onclick="lnk1_Click" CssClass="a">
                                </asp:LinkButton>
                                   <asp:LinkButton ID="lnkOut" runat="server" OnClick="lnkOut_Click">Logout</asp:LinkButton>
                              </li>
                           </ul>
            
             
             
              <!--<div class="desktop-search-wrap">

                <form role="search" method="get" action="#">

                  <input type="search"  class="form-control" placeholder="Search &hellip;" value="" name="s" title="Search for:" />

                  <button type="submit"><img src="#" alt="search"></button>
                </form>

              </div>-->
            </li>
            
            
           
          </ul>
         

			<ul class="social-media-icons">
               <li>
                 <a title="Facebook" href="#" target="_blank">
                   <img src="Images/facebook-(2).png" alt="Facebook" />
                 </a>
               </li>
               <li>
                 <a title="Twitter" href="#" target="_blank">
                   <img src="Images/Twitter.png" alt="Twitter" />
                 </a>
               </li>
               <li>
                 <a title="Linkedin" href="#" target="_blank">
                   <img src="Images/LinkedIn-(2).png" alt="Linkedin" />
                 </a>
               </li>
             </ul>

        </div>     </td>
      
      
      
      </tr>
      
      <tr><td >

      <div class="menu-main-menu-container">
            
            <ul id="menu-main-menu" class="menu" style="padding:0;">
            

<li id="menu-item-1001" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1001"><a href="Corporate.aspx">Corporate</a>

</li>

<li id="menu-item-1002" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1001"><a href="services.aspx">Services</a>
</li>

<li id="menu-item-1059" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1059"><a href="Careers.aspx">Careers</a>

</li>
<li id="menu-item-1006" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1006"><a href="Clients.aspx">Clients</a>

</li>

<li id="menu-item-1054" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1054"><a href="Itconsulting.aspx">IT Consulting</a>

</li>

<li id="menu-item-1054" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1054"><a href="Products.aspx">Products</a>

</li><li id="menu-item-1054" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1054"><a href="Support.aspx">Support</a></li>

<li id="menu-item-1055" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1055"><a href="Feedback.aspx"> Feedback</a>
</li>




<li id="menu-item-1057" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1057"><a href="#">Career</a></li>
<li id="menu-item-1058" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1058"><a href="#">Contact Us</a></li>
</ul></div></td></tr>
      
 
 
 
 </table>
 </td>
 
 </tr>
 
 
 </table>