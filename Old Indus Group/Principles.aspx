<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Principles.aspx.cs" Inherits="india_Principles" %>

<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon' />
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>:  : 1indus.com :  : </title>



    <script type="text/JavaScript">

<!--
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
        }
    }

    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }

    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2) ; i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }
    //-->
    </script>


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
    <style type="text/css">
    

        .headings2 { 
	color: #174eb4;
	background-color: #ffffff; 
	font-size: 15px;
	font-weight: normal;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	height: 20px;  	
	
	
	
}



        .headings3 { 
	color: #ffffff; 
	background-color: #336699; 
	font-size: 15px;
	font-weight: bold;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	height: 17px;  	
	padding-left: 5px; 
}

        .style2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 18%;
        }

        .style3 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            padding-left: 5px;
            width: 19%;
        }

        .style4 {
            height: 20px;
        }

        .style5 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 11px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 5px;
        }
    </style>
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


<style type="text/css">
    .recentcomments a {
        display: inline !important;
        padding: 0 !important;
        margin: 0 !important;
    }
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

        <style type="text/css">
	p{font-family: sans-serif;font-size: 17px;}
#main-wrapper{ width:1170px; height:auto; margin:0 auto;}	

#main-wrapper h1{text-align:center; color:#15406A;}	
	
</style>
<%--<script src="../jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //Disable cut copy paste
        $('body').bind('cut copy paste', function (e) {
            e.preventDefault();
        });

        //Disable mouse right click
        $("body").on("contextmenu", function (e) {
            return false;
        });
    });
</script>--%>
<body>
    <form id="form1" runat="server">
 <header id="header">
            <div class="container-fluide header-inner-wrap">
                <head:Header ID="Header1" runat="server" />
            </div>
        </header>
        <br />
        <br />
        <section class="about text-left" id="about">
            <div class="container">
                <div class="row">
                  <br />
                    <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
            <br /> <br />
                    <table align="center">
                        <tr>
                            <td align="center">
                               <br /> <br />  <asp:Label ID="lvl" runat="server" Text="Mandatory Instructions" Font-Size="20px" Font-Bold="true"></asp:Label> <br /> <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="border:1px solid black; padding-left:10px;padding-right:10px;padding-top:10px;padding-bottom:10px;">

                                <asp:Label ID="lbldata" runat="server" ></asp:Label>
                                <%--              <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"> </asp:TextBox>
                                <br />
                               <asp:TextBox ID="txtdata" runat="server" TextMode="MultiLine" Width="600px"></asp:TextBox>--%>


                                <%--<p style="text-align:justify;">
                                    Dear All Colleagues,  <br />

                                    Hope all are doing well.  <br /><br />
                                    Here is the important information 2017 year round holidays, leaves and mandatory instructions according to Indus Solutions Policies. <br />

                                    We all are well aware of the office hours which are from 10.00am to 8.00pm for Development Team 
                                     & 9.30 AM to 7.30 PM Recruiting, Admin, Customer Service, Training, Travels etc. 9.00AM to 6.00PM of EST  
                                    with United States of America  for US Recruiting and other positions for night shift, However,  
                                    it has been observed that most of the staff is not reporting duty on time and thus violating the code of
                                     conduct of the organization. This will be considered as serious misconduct of the employee.  <br /> <br />

                                    Hence forth staff will be given a grace period of Max 10 mins from the reporting time.  <br />
                                    Two initial warnings will be given, on 3rd warning a day's half salary will be deducted from the monthly package.  <br />

                                    Emergency circumstances or some other natural problem should be informed to the person in-charge  
                                    and the reception is Mandatory and with email communication as well, also genuine reasons only will be taking into consideration.
 
No Visitors are allowed inside the office unless there is business meeting and the prior schedule is required.<br />
 
Permissions are not allowed and if it is urgent needed permission will be calculated as half day leave.<br />
 
Employees will be subjected to pay cut for unscheduled leaves & excess leaves from their salaries. <br />

Kindly adhere to the above failing which the management will be forced to take strict disciplinary action against those who are found violating the code of conduct hereafter. <br />

In office hours strictly personnel emails & mobile phones are not allowed unless there is an emergency for couple of Minutes only. <br />
                                    Also should be able to give explanation for using mobile phones even for emergency.<br />
 
Resignations Notice period must be 3 month.<br />
 
All the employees will have 10 leaves per year and also one day per month should be observed with one week intimation unless 
                                    emergency and with email communication as well, also genuine reasons only will be taking into consideration. 
                                    If more than 10 leaves per year will be deducted in the monthly package.<br />

If anyone has any questions or concerns please email me, so that I can return the answers for your questions within 48 hours either email or phone call.<br />
 
Ace Indus will be communicated its policies as and when it is updated.  <br />
 
Send daily reports to: reportshyd@1indus.com  <br />
  
Thanks one and all - Good Luck!!!<br /><br />
 

                                    <table width="40%" align="center">
                                        <tr>
                                            <td align="center">
                                               <b> <h4>India Office Day Shift Holiday list 2017</h4></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Date
                                            </td>
                                            <td>
                                                Holiday
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                               Saturday, January 14
                                            </td>
                                            <td>
                                                Pongal
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Thursday, January 26
                                            </td>
                                            <td>
                                                Republic day
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Friday, February 24
                                            </td>
                                            <td>
                                                Maha Sivarathri
                                            </td>
                                        </tr>
                                           <tr>
                                            <td>
                                                Tuesday, March 28 
                                            </td>
                                            <td>
                                                Ugadi
                                            </td>
                                        </tr>
                                           <tr>
                                            <td>
                                                Tuesday, August 15
                                            </td>
                                            <td>
                                                Independence Day
                                            </td>
                                        </tr>
                                           <tr>
                                            <td>
                                                Friday, August 25
                                            </td>
                                            <td>
                                                Ganesh Chaturdhi
                                            </td>
                                        </tr>
                                           <tr>
                                            <td>
                                                Saturday, September 30
                                            </td>
                                            <td>
                                                Dussehra
                                            </td>
                                        </tr>
                                             <tr>
                                            <td>
                                                Monday, October 2
                                            </td>
                                            <td>
                                                Gandhi Jayanti
                                            </td>
                                        </tr>
                                             <tr>
                                            <td>
                                                Wednesday, October 18
                                            </td>
                                            <td>
                                                Diwali
                                            </td>
                                        </tr>
                                             <tr>
                                            <td>
                                                Monday, December 25
                                            </td>
                                            <td>
                                                Christmas Day
                                            </td>
                                        </tr>
                                   
                                    </table>

                                    <br />

                                    <table width="40%" align="center">
                                         <tr>
                                            <td align="center">
                                             <b>   <h4>USA Office Night Shift Holiday list 2017</h4></b>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td>
                                                Monday, January 2
                                            </td>
                                            <td>
                                                New Year’s Day
                                            </td>
                                        </tr>

                                         <tr>
                                            <td>
                                                Monday, May 29
                                            </td>
                                            <td>
                                                Memorial Day
                                            </td>
                                        </tr>

                                         <tr>
                                            <td>
                                                Tuesday, July 4
                                            </td>
                                            <td>
                                                Independence Day
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                Monday, September 4
                                            </td>
                                            <td>
                                                Labor Day
                                            </td>
                                        </tr>

                                         <tr>
                                            <td>
                                                Thursday, November 23
                                            </td>
                                            <td>
                                                Thanksgiving Day
                                            </td>
                                        </tr>

                                         <tr>
                                            <td>
                                                Monday, December 25
                                            </td>
                                            <td>
                                                Christmas Day
                                            </td>
                                        </tr>
                                    </table>

Thanks & Regards <br />
Maraka Jagadeesh<br />
Mobile: 9177626226 <br />
Indus Solutions,<br />
Plot No 21 ,Flat No 203<br />
Techno Residency,<br />
Opposite Mind Space(Raheja It Park) <br />
Madhapur,  Hyderabad<br />
Telangana  -500081. India.<br />
                                </p>--%>
                            </td>
                        </tr>
                    </table>
             </div>
            </div>
        </section>
    </form>
</body>
</html>
