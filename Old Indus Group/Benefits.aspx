<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Benefits.aspx.cs" Inherits="Benefits" %>

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
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
   <title>:  : 1indus.com :  : </title>


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
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />
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
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
   <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
  </header>
  <div style="height:10px;"></div>

  <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
     <br />
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/benefits-banner.jpg"/></td></tr>
     <tr>
        <td align="center" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="180" valign="top" bgcolor="#EFEFEF" align="left">
              <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                  <tr><td><br /><br /></td></tr>

              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead">
                    <span class="head-black">&nbsp;&nbsp;</span><span style="color:black;font-size: 18px">Overview</span></span></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             
             
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead" ><a href="Careers.aspx" style="color:black;font-size: 15px">Careers</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="hd1"><a href="Benefits.aspx" style="color:black;font-size: 15px">Benefits</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" style="color:black;font-size: 15px">Fulltime Jobs</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="seminar.aspx" style="color:black;font-size: 15px">Seminars</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Postyour_Resume.aspx" style="color:black;font-size: 15px">Post your Resume</a></td>
                  </tr>
                </table></td>
              </tr>
         
           
            </table>

            </td>

            <td width="5" align="right" valign="top">&nbsp;</td>
            <td width="863" align="right" valign="top" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center" valign="top" class="head-black"><h3 style="color:#2471a3;">Benefits</h3>	<span class="head-red"></span></td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table></td>
              </tr>
            
              <tr>
                <td align="justify" valign="top"> 
			<div align="justify" ><h4>IGI places a strong emphasis on our valuable     human   resources. We are very proud to provide our employees with     outstanding benefits.   Our policies and benefits are designed to     provide incentives and to reward   excellent job performance. 
                    <br />
We maintain an &ldquo;open door&rdquo; policy, and   encourage   employees to   make suggestions that may aid in our continuous     improvement and   welcome employees who enjoy challenging assignments and     constantly   strive for a higher standard of professionalism.

                </h4>
                  <h4>The following benefits apply to our full time employees and are occasionally   subject to change. </h4>
                    
                    <h3>Health Insurance</h3>
                  <h4>  All   employees are eligible to select from   Medical, Dental   and/or Vision Insurance   for themselves and family   members from the   date of hire.</h4> 
  
  <h3>Life Insurance</h3>
                    <h4> employees are eligible   for Company paid   $50,000 Life and   Accidental Death or Dismemberment Insurance   the day   they join Indus   Group.</h4> 
 
<%--  <h3>Flexible Spending   Plan</h3>
                    <h4>All employees are eligible to participate in our   Flexible  
                           Spending Plan. Under this plan, you may put aside pre-tax   money to use   to pay  
                         for medical expenses that are not covered by     insurance.</h4>--%>
  
<%--  <h3>401(k) Retirement Savings Plan/Tax   Benefit</h3> 
  <h4>Employees are eligible to participate   in our 401(k) plan at     date of hire. They may contribute up to 15% of their 
        salary on a     tax-deferred basis up to the annual maximum set by the IRS.   Employees     are able to choose among a
       wide variety of investment options in order       to achieve their personal financial goals. The tax benefits of the   
      plan   are   excellent as well.</h4>--%>
 
  <h3>Accrual of Vacation/Sick   Time</h3>
                    <h4>Certain classifications of employees may accrue   up to five     days of paid vacation per year during their first two years   of   service. At two   years of service or above, there is an accrual of   up   to ten vacation days.   Employees may accrue up to a total 20     vacation days.</h4>

                   <h4> All employees are   also eligible to accrue up to five paid sick days per year. </h4>
 
  <h3>Referral Bonus</h3>
                    <h4>Certain classifications of   technical employees   may earn a   bonus for the referral of a new employee who   completes 90   days of   service. We also pay a referral bonus to certain     classifications of   technical employees who inform IGI of an   opening with   a new   client. Under the technical employee   classification, IGI will   also   pay bonus for an opening at an   existing client, upon successful   placement in a   three-month plus   project.</h4> 
  
  <h3>Educational   Assistance</h3>
                   <h4> During the first two years of service, interest   free   loans   may be made available for the cost of additional education   in the   areas of   IGI's business. For employees with more than   two   years of service, up to   $1,000 may be made available to help pay   for   costs of additional education in   areas IGI does business.     We may also reimburse pre-approved software and   technical books and     materials purchases up to a certain limit per   year.</h4>

  <h3>Permanent Residence or Green Card</h3>
                   <h4> We   go out of our way to process permanent   residency   applications for eligible   employees after three months of   service.   If you come from afar, we want you to   be healthy and happy   right   here. </h4>
                  <h4>For details on the prospective client referral program please contact</h4> <a href="mailto:info@1indus.com"><strong>info@</strong></a><a href="mailto:info@1indus.com?subject=Info"><strong>1indus.com</strong></a> or call us @   703-291-8299 <br>
                    <br>
                   <h4> For details on the referral program for prospective   employees please contact </h4><a href="mailto:info@1indus.com"><strong>info@</strong></a><a href="mailto:info@1indus.com?subject=Info"><strong>1indus.com </strong></a>or call us   @ 703-291-8299 </p>
                  <h4>IGI is an Equal Opportunity Employer.</h4>
                <%--  <p><br>--%>
                  </p></div></td>
              </tr>
             
            </table></td>
          </tr>
         
      
        </table></td>
      </tr>
     
     
     </table>
 
    </div></div>
    </section>
    <div >
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
