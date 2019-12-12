<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_Home.aspx.cs" Inherits="Emp_Home" %>

<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="../Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
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
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />

    <link href="../css/styles1.css" rel="stylesheet" type="text/css" />
</head>
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
    <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server"></head:Header>
    </div>
    </header>
    
    
    <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
     <cc3:topmenu id="top1" runat="server">
     
     
     </cc3:topmenu>
     <h4>
     <table width="95%"  height="650px" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
       <tr>
        <td colspan="3" align="center" style="height:53px">
            <h3 color="#0e4860">
                <b>About Indus Group Employee Control</b>
            </h3> 
        </td>
       </tr>
       <tr>
        <td  colspan="3" align="left" valign="middle" width="100%" style="height: 22px">
            <font color="#336699" size="2px">
                <b>Employee Control Panel helps Employee to access all the activities that relates to the Indus Group Website</b>
            </font>
         </td>
       </tr>
       <tr>
        <td colspan="3" align="left" valign="middle" width="100%" style="height: 29px" >
            <font color="#336699" size="2pt">
                <b>Following are the Functionalities implemented in the Employee control Panel : </b>
            </font>
        </td>
       </tr>
       <tr><td colspan="3" height="20px"></td></tr>
       <tr>
           <td align="left" style="width: 783px; height: 23px; color:Maroon; font-size:12px; font-weight:bold" valign="top">
               Employee Form:</td>
           <td valign="top">&nbsp;:&nbsp;</td>
           <td align="left" class="lblog" valign="top" width="85%">
               Enrolling an Employee for getting job</td>
       </tr>
       
       <tr>
        <td align="left" valign="top" class="lblog" style="width: 783px; height: 69px; color:Maroon; font-size:12px; font-weight:bold">
         Upload Forms
        </td>
        <td valign="top">&nbsp;:&nbsp;</td>
        <td align="left" valign="top" width="85%" class="lblog">  
            Through this control we can upload a form for a new Employee as well as if there is any change in the form for an existing employee &nbsp;you should first select the employee and upload the corresponding forms.
           It will be automaticallly updated in the Website.
        </td>
      </tr>

     <tr>
        <td align="left" valign="top" class="lblog" style="width: 783px; color:Maroon; font-size:12px; font-weight:bold">
            Feedback Administration
        </td>
        <td valign="top">&nbsp;:&nbsp;</td>
        <td align="left" valign="top" width="85%" class="lblog">
            Here, the page will display all the feedbacks recieved in the order of the date it got submitted. The administrator can choose the feedbacks and accept it or if it is not good he can reject it. The feedback should be displayed in the website those which are accepted by the administrator.
        </td>
    </tr>
    <tr>
        <td align="left" class="lable" valign="top" style="width: 783px">
         &nbsp;
        </td>
    </tr>
       </table>

       </h4>
     
     </div></div></section>
     <div>
     <foot:footer ID="foot1" runat="server" />
     </div>
    </form>
</body>
</html>
