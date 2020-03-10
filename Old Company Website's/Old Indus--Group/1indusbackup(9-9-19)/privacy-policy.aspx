<%@ Page Language="C#" AutoEventWireup="true" CodeFile="privacy-policy.aspx.cs" Inherits="privacy_policy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
	 
  
  <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title> Corporate IT Solutions | IT Business Solution | IT Service Provider | Information Technology Company</title>
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

<script language="javascript">
<!--
    $(document).ready(function () {
        $(".defaultText").focus(function (srcc) {
            if ($(this).val() == $(this)[0].title) {
                $(this).removeClass("defaultTextActive");
                $(this).val("");
            }
        });

        $(".defaultText").blur(function () {
            if ($(this).val() == "") {
                $(this).addClass("defaultTextActive");
                $(this).val($(this)[0].title);
            }
        });

        $(".defaultText").blur();
    });
//-->
</script>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />



  

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
    <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
    <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
  </header>
    <section class="about text-left" id="about">
				<div class="container">
					<div class="row">
						<h2>Privacy Policy</h2>
                        <h4>The privacy of our visitors is important to us.<br />

At 1INDUS.com, we recognize that privacy of your personal information is important. Here is information on what types of personal information we receive and collect when you use and visit 1INDUS.com, and how we safeguard your information. We never sell your personal information to third parties.</h4><br />

<h3>Log Files</h3>
<h4>as with most other websites, we collect and use the data contained in log files. The information in the log files include your IP (internet protocol) address, your ISP (internet service provider, such as AOL or Shaw Cable), the browser you used to visit our site (such as Internet Explorer or Firefox), the time you visited our site and which pages you visited throughout our site.</h4><br />

<h3>Cookies and Web Beacons</h3>
<h4>we do use cookies to store information, such as your personal preferences when you visit our site. This could include only showing you a popup once in your visit, or the ability to login to some of our features, such as forums.</h4><br />

<h4>We may also use third party advertisements on 1INDUS.com to support our site. Some of these advertisers may use technology such as cookies and web beacons when they advertise on our site, which will also send these advertisers information including your IP address, your ISP , the browser you used to visit our site, and in some cases, whether you have Flash installed. This is generally used for geotargeting purposes or showing certain ads based on specific sites visited.</h4>
<h4>You can choose to disable or selectively turn off our cookies or third-party cookies in your browser settings, or by managing preferences in programs such as Norton Internet Security. However, this can affect how you are able to interact with our site as well as other websites. This could include the inability to login to services or programs, such as logging into forums or accounts.<br />
<h4>Deleting cookies does not mean you are permanently opted out of any advertising program. Unless you have settings that disallow cookies, the next time you visit a site running the advertisements, a new cookie will be added.</h4>

</h4>  <br />                 
                          
                        
                        
          
					</div>
				</div>
			</section>


            
 
                            
                            
                            <foot:footer ID="foot1" runat="server" />  
     
     <!-- modal pop up for the static fixed button -->
     <div id="request-info-mobile" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
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
      <asp:ImageButton ID="img1" runat="server" 
            ImageUrl="http://www.yash.com/wp-content/themes/Yash/images/request_button.png" 
            onclick="img1_Click" />
     <%-- <img src="http://www.yash.com/wp-content/themes/Yash/images/request_button.png" alt="Request For Information">--%></a>
    </div>


    <cc1:ModalPopupExtender ID="mp1" runat="server" TargetControlID="img1" PopupControlID="view" CancelControlID="btncancel" ></cc1:ModalPopupExtender>


   
    <!--Request form desktop-->
    <asp:Panel id="pan1" runat="server">
    
    <div class="animation-wrapper" id="view" runat="server">
    <div align="right"><asp:Button ID="btncancel"  runat="server" Text="X" /></div>
      <div class="close-request-info-popup">X</div>
      <form class="rfi-form rfi-form-desktop">
	  <input type="hidden" id="Hidden1" name="hid_location" value="http://www.yash.com/" />
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
<script type='text/javascript' src="../js/jquery.form.min.js"></script>
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

    </form>
</body>
</html>
