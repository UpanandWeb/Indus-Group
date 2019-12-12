<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-IndDaily-Timesheet.aspx.cs" Inherits="admin_Admin_IndDaily_Timesheet" EnableEventValidation="false" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - TimeSheet</title>
    <style type="text/css">
body{
	 background:#202020;
	 font:bold 12px Arial, Helvetica, sans-serif;
	 margin:0;
	 padding:0;
	 min-width:960px;
	 color:#bbbbbb; 
}

a { 
	text-decoration:none; 
	color:#00c6ff;
}

h1 {
	font: 4em normal Arial, Helvetica, sans-serif;
	padding: 20px;	margin: 0;
	text-align:center;
}

h1 small{
	font: 0.2em normal  Arial, Helvetica, sans-serif;
	text-transform:uppercase; letter-spacing: 0.2em; line-height: 5em;
	display: block;
}

h2 {
    font-weight:700;
    color:#bbb;
    font-size:20px;
}

h2, p {
	margin-bottom:10px;
}

@font-face {
    font-family: 'BebasNeueRegular';
    src: url('BebasNeue-webfont.eot');
    src: url('BebasNeue-webfont.eot?#iefix') format('embedded-opentype'),
         url('BebasNeue-webfont.woff') format('woff'),
         url('BebasNeue-webfont.ttf') format('truetype'),
         url('BebasNeue-webfont.svg#BebasNeueRegular') format('svg');
    font-weight: normal;
    font-style: normal;

}

.container {width: 960px; margin: 0 auto; overflow: hidden;}

.clock {width:800px; margin:0 auto; padding:30px; border:1px solid #333; color:#fff; }

#Date { font-family:'BebasNeueRegular', Arial, Helvetica, sans-serif; font-size:36px; text-align:center; text-shadow:0 0 5px #00c6ff; }

ul { width:800px; margin:0 auto; padding:0px; list-style:none; text-align:center; }
ul li { display:inline; font-size:10em; text-align:center; font-family:'BebasNeueRegular', Arial, Helvetica, sans-serif; text-shadow:0 0 5px #00c6ff; }

#point { position:relative; -moz-animation:mymove 1s ease infinite; -webkit-animation:mymove 1s ease infinite; padding-left:10px; padding-right:10px; }

@-webkit-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}


@-moz-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Create two variable with the names of the months and days in an array
        var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

        // Create a newDate() object
        var newDate = new Date();
        // Extract the current date from Date object
        newDate.setDate(newDate.getDate());
        // Output the day, date, month and year    
        $('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

        setInterval(function () {
            // Create a newDate() object and extract the seconds of the current time on the visitor's
            var seconds = new Date().getSeconds();
            // Add a leading zero to seconds value
            $("#sec").html((seconds < 10 ? "0" : "") + seconds);
        }, 1000);

        setInterval(function () {
            // Create a newDate() object and extract the minutes of the current time on the visitor's
            var minutes = new Date().getMinutes();
            // Add a leading zero to the minutes value
            $("#min").html((minutes < 10 ? "0" : "") + minutes);
        }, 1000);

        setInterval(function () {
            // Create a newDate() object and extract the hours of the current time on the visitor's
            var hours = new Date().getHours();
            // Add a leading zero to the hours value
            $("#hours").html((hours < 10 ? "0" : "") + hours);
        }, 1000);

    });
</script>
<link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/CSS3-digital-clock/index.html" />
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
        }

        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete ' + username + ' record Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <style type="text/css">
        .style24 {
            height: 15px;
        }
        .AlgRgh
{
  text-align:right;
  /*font-family:Verdana, Arial, Helvetica, sans-serif;*/
}
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }

        .updateProgress {
            border-width: 1px;
            border-style: solid;
            background-color: White;
            position: absolute;
            width: 180px;
            height: 65px;
        }
    </style>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1000px;
            height: 600px;
            background-color: #333;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 350px;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 200px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }

        .style24 {
            color: #7a7a7b;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            text-decoration: none;
            height: 29px;
        }

        #empdata td {
            border: 0.1px solid #CCCCCC;
        }

        #empdata th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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
    <script language="JavaScript">
<!--
    function worldClock(zone, region) {
        var dst = 0
        var time = new Date()
        var gmtMS = time.getTime() + (time.getTimezoneOffset() * 60000)
        var gmtTime = new Date(gmtMS)
        var day = gmtTime.getDate()
        var month = gmtTime.getMonth()
        var year = gmtTime.getYear()
        if (year < 1000) {
            year += 1900
        }
        var monthArray = new Array("January", "February", "March", "April", "May", "June", "July", "August",
                        "September", "October", "November", "December")
        var monthDays = new Array("31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31")
        if (year % 4 == 0) {
            monthDays = new Array("31", "29", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31")
        }
        if (year % 100 == 0 && year % 400 != 0) {
            monthDays = new Array("31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31")
        }

        var hr = gmtTime.getHours() + zone
        var min = gmtTime.getMinutes()
        var sec = gmtTime.getSeconds()

        if (hr >= 24) {
            hr = hr - 24
            day -= -1
        }
        if (hr < 0) {
            hr -= -24
            day -= 1
        }
        if (hr < 10) {
            hr = " " + hr
        }
        if (min < 10) {
            min = "0" + min
        }
        if (sec < 10) {
            sec = "0" + sec
        }
        if (day <= 0) {
            if (month == 0) {
                month = 11
                year -= 1
            }
            else {
                month = month - 1
            }
            day = monthDays[month]
        }
        if (day > monthDays[month]) {
            day = 1
            if (month == 11) {
                month = 0
                year -= -1
            }
            else {
                month -= -1
            }
        }
        if (region == "NAmerica") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(3)
            startDST.setHours(2)
            startDST.setDate(1)
            var dayDST = startDST.getDay()
            if (dayDST != 0) {
                startDST.setDate(8 - dayDST)
            }
            else {
                startDST.setDate(1)
            }
            endDST.setMonth(9)
            endDST.setHours(1)
            endDST.setDate(31)
            dayDST = endDST.getDay()
            endDST.setDate(31 - dayDST)
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Europe") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(2)
            startDST.setHours(1)
            startDST.setDate(31)
            var dayDST = startDST.getDay()
            startDST.setDate(31 - dayDST)
            endDST.setMonth(9)
            endDST.setHours(0)
            endDST.setDate(31)
            dayDST = endDST.getDay()
            endDST.setDate(31 - dayDST)
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }

        if (region == "SAmerica") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(9)
            startDST.setHours(0)
            startDST.setDate(1)
            var dayDST = startDST.getDay()
            if (dayDST != 0) {
                startDST.setDate(22 - dayDST)
            }
            else {
                startDST.setDate(15)
            }
            endDST.setMonth(1)
            endDST.setHours(11)
            endDST.setDate(1)
            dayDST = endDST.getDay()
            if (dayDST != 0) {
                endDST.setDate(21 - dayDST)
            }
            else {
                endDST.setDate(14)
            }
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST || currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Cairo") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(3)
            startDST.setHours(0)
            startDST.setDate(30)
            var dayDST = startDST.getDay()
            if (dayDST < 5) {
                startDST.setDate(28 - dayDST)
            }
            else {
                startDST.setDate(35 - dayDST)
            }
            endDST.setMonth(8)
            endDST.setHours(11)
            endDST.setDate(30)
            dayDST = endDST.getDay()
            if (dayDST < 4) {
                endDST.setDate(27 - dayDST)
            }
            else {
                endDST.setDate(34 - dayDST)
            }
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Israel") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(3)
            startDST.setHours(2)
            startDST.setDate(1)
            endDST.setMonth(8)
            endDST.setHours(2)
            endDST.setDate(25)
            dayDST = endDST.getDay()
            if (dayDST != 0) {
                endDST.setDate(32 - dayDST)
            }
            else {
                endDST.setDate(1)
                endDST.setMonth(9)
            }
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Beirut") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(2)
            startDST.setHours(0)
            startDST.setDate(31)
            var dayDST = startDST.getDay()
            startDST.setDate(31 - dayDST)
            endDST.setMonth(9)
            endDST.setHours(11)
            endDST.setDate(31)
            dayDST = endDST.getDay()
            endDST.setDate(30 - dayDST)
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Baghdad") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(3)
            startDST.setHours(3)
            startDST.setDate(1)
            endDST.setMonth(9)
            endDST.setHours(3)
            endDST.setDate(1)
            dayDST = endDST.getDay()
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST && currentTime < endDST) {
                dst = 1
            }
        }
        if (region == "Australia") {
            var startDST = new Date()
            var endDST = new Date()
            startDST.setMonth(9)
            startDST.setHours(2)
            startDST.setDate(31)
            var dayDST = startDST.getDay()
            startDST.setDate(31 - dayDST)
            endDST.setMonth(2)
            endDST.setHours(2)
            endDST.setDate(31)
            dayDST = endDST.getDay()
            endDST.setDate(31 - dayDST)
            var currentTime = new Date()
            currentTime.setMonth(month)
            currentTime.setYear(year)
            currentTime.setDate(day)
            currentTime.setHours(hr)
            if (currentTime >= startDST || currentTime < endDST) {
                dst = 1
            }
        }


        if (dst == 1) {
            hr -= -1
            if (hr >= 24) {
                hr = hr - 24
                day -= -1
            }
            if (hr < 10) {
                hr = " " + hr
            }
            if (day > monthDays[month]) {
                day = 1
                if (month == 11) {
                    month = 0
                    year -= -1
                }
                else {
                    month -= -1
                }
            }
            //return monthArray[month] + " " + day + ", " + year + "<br>" + hr + ":" + min + ":" + sec + " DST"
            return "Date : " + monthArray[month] + " " + day + ", " + year + "<br> Time : &nbsp;" + hr + ":" + min + ":" + sec + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"

        }
        else {
            return "Date : " + monthArray[month] + " " + day + ", " + year + "<br> Time : &nbsp;" + hr + ":" + min + ":" + sec + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        }
    }

    function worldClockZone() {
        document.getElementById("WashingtonDC").innerHTML = worldClock(-5, "NAmerica")
        setTimeout("worldClockZone()", 1000)
    }
    window.onload = worldClockZone;

    //-->
</script>

<style type="text/css">
.hrow {
font-weight:bold;
color: #C1E97C;
}
.hrow td{
padding-top: 20px;
width: 140px;
}
</style>
</head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

<tr width="100%">
 <td align="right" width='100%' style="color:#0a2c46; font-size:22px;padding-right:150px;"><%--<b>Date   & Time  : </b>--%> <span id="WashingtonDC" > </span></td>
</tr>


            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center">

                    <table width="100%" align="center">
                        <tr>
                            <td align="center" colspan="2" width="100%">
                                <font color='#003399' size='6pt'><b>Employee Daily Timesheet</b></font>
                            </td>
                        </tr>
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>

                        <tr>
                            <td align="center" colspan="2" width="100%">
                                <asp:Label ID="lv" runat="server" Text="Select Country" Font-Size="20px" ForeColor="Black"></asp:Label> &nbsp;&nbsp;&nbsp;<b>:</b>&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="dds" runat="server"  Font-Size="20px" AutoPostBack="true" OnSelectedIndexChanged="Label1_SelectedIndexChanged" Width="100px" Height="35px"> 
                                <asp:ListItem>India</asp:ListItem>
                                                <asp:ListItem>USA</asp:ListItem>
                                 </asp:DropDownList></td>

                        </tr>
                         <tr>
                            <td height="15px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" width="47%" >
                                <table align="center" width="80%">
                                    <tr>
                                         <td width="30%" align="right">
                                            <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="220px" AutoPostBack="true" OnSelectedIndexChanged="ddemp_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      
                                            <asp:DropDownList ID="ddyear" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="100px" >
                                                <asp:ListItem>Year</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                                <asp:ListItem>2021</asp:ListItem>
                                                <asp:ListItem>2022</asp:ListItem>
                                                <asp:ListItem>2023</asp:ListItem>
                                                <asp:ListItem>2024</asp:ListItem>
                                                <asp:ListItem>2025</asp:ListItem>
                                                <asp:ListItem>2026</asp:ListItem> 
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%--</td>
                                        <td width="70%" align="left">--%>
                                           <%-- <asp:LinkButton runat="server" ID="lnkjan" Text="January" Font-Bold="true" Font-Size="16px" OnClick="lnkjan_Click" ToolTip="January"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkfeb" Text="February" Font-Bold="true" Font-Size="16px" OnClick="lnkfeb_Click" ToolTip="February"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkmar" Text="March" Font-Bold="true" Font-Size="16px" OnClick="lnkmar_Click" ToolTip="March"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkapr" Text="April" Font-Bold="true" Font-Size="16px" OnClick="lnkapr_Click" ToolTip="April"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkmay" Text="May" Font-Bold="true" Font-Size="16px" OnClick="lnkmay_Click" ToolTip="May"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkjun" Text="June" Font-Bold="true" Font-Size="16px" OnClick="lnkjun_Click" ToolTip="June"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkjul" Text="July" Font-Bold="true" Font-Size="16px" OnClick="lnkjul_Click" ToolTip="July"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkaug" Text="August" Font-Bold="true" Font-Size="16px" OnClick="lnkaug_Click" ToolTip="August"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnksep" Text="September" Font-Bold="true" Font-Size="16px" OnClick="lnksep_Click" ToolTip="September"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkoct" Text="October" Font-Bold="true" Font-Size="16px" OnClick="lnkoct_Click" ToolTip="October"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnknov" Text="November" Font-Bold="true" Font-Size="16px" OnClick="lnknov_Click" ToolTip="November"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server" ID="lnkdec" Text="December" Font-Bold="true" Font-Size="16px" OnClick="lnkdec_Click" ToolTip="December"></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;--%>
                                              
                  <asp:DropDownList ID="ddmonth" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="90px"  OnSelectedIndexChanged="ddmonth_SelectedIndexChanged" AutoPostBack="true">
                               <asp:ListItem>Month</asp:ListItem>
                               <asp:ListItem Value="1">January</asp:ListItem>
                               <asp:ListItem Value="2">February</asp:ListItem>
                               <asp:ListItem Value="3">March</asp:ListItem>
                               <asp:ListItem Value="4">April</asp:ListItem>
                               <asp:ListItem Value="5">May</asp:ListItem>
                               <asp:ListItem Value="6">June</asp:ListItem>
                               <asp:ListItem Value="7">July</asp:ListItem>
                               <asp:ListItem Value="8">August</asp:ListItem>
                               <asp:ListItem Value="9">September</asp:ListItem>
                               <asp:ListItem Value="10">October</asp:ListItem>
                               <asp:ListItem Value="11">November</asp:ListItem>
                               <asp:ListItem Value="12">December</asp:ListItem>
                  </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        <%--</tr>

                         <tr>--%>
                            <td align="center"  width="40%" >
                                <asp:LinkButton ID="lnkcreate" Text="Create User" runat="server" OnClick="lnkcreate_Click" Font-Size="18px" ></asp:LinkButton>
                                 &nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnkviewall" Text="View All" runat="server" OnClick="lnkviewall_Click" Font-Size="18px" ></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnkold" Text="Save Old Records" runat="server" OnClick="lnkold_Click" Font-Size="18px" ></asp:LinkButton>

                            </td>
                        </tr>

                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" colspan="2">
                                <asp:GridView ID="empdata" runat="server" Width="94%"  AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                DataKeyNames="did"     Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="30"
                                    PagerStyle-BackColor="White" OnPageIndexChanging="empdata_PageIndexChanging" OnDataBound="empdata_DataBound">
                                    <Columns>
                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" >
                                            <ItemTemplate>
                                               <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("dID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempid" ForeColor="Gray" Text='<%# Bind("Empid") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("empname") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />

                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Date (DD-MM-YYYY)">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("ddate") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />

                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work In">
                                            <ItemTemplate>
                                                <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("intime") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch Out">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("outtime") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch In">
                                            <ItemTemplate>
                                                <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("intime1") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch Hours">
                                            <ItemTemplate>
                                                <asp:Label ID="lblwork" ForeColor="Gray" Text='<%# Bind("lunch") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>


                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Out">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout11" ForeColor="Gray" Text='<%# Bind("outtime1") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Hours" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal" ForeColor="Gray" Text='<%# Bind("worktime") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Monthly Salary" >
                <ItemTemplate >
                                 <asp:Label ID="lblsymbol" ForeColor="Gray" Text='<%# Bind("rsymbol") %>' runat="server" CssClass="data"></asp:Label> &nbsp;

                <%-- <asp:Label ID="lblrate" ForeColor="Gray" Text='<%# Bind("hrate") %>' runat="server" CssClass="data"></asp:Label> --%>
                    <asp:Label ID="lblamount" ForeColor="Gray" Text='<%# Bind("mrate") %>' runat="server" CssClass="AlgRgh" Width="15px"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

<%--                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Amount">
                <ItemTemplate>
                     <asp:Label ID="lblrate" ForeColor="Gray" Text='<%# Bind("mrate") %>' runat="server" CssClass="AlgRgh" Width="50px"></asp:Label> 
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>--%>
                                        
                                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Remarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblremark" ForeColor="Gray" Text='<%# Bind("Remarks") %>' runat="server" CssClass="data"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

               
                                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leave">
                                        <ItemTemplate>
                                            <asp:Label ID="lblremark1" ForeColor="Gray" Text='<%# Bind("Remark1") %>' runat="server" CssClass="data"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leave Days">
                <ItemTemplate>
                    <asp:Label ID="lblremark1ss" ForeColor="Gray" Text='<%# Bind("Remark2") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="lnkeditrecord" />
                                            </ItemTemplate>
                                            <ItemStyle Width="3%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>

                                    </Columns>
                                    <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                                    <RowStyle CssClass="datagrid-2" Font-Size="9pt" HorizontalAlign="Center"
                                        Font-Strikeout="False" Font-Underline="False" />
                                    <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                        Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                        Font-Underline="False" Height="20px" Wrap="True" />
                                    <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                    <HeaderStyle BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue"
                                        ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
                                </asp:GridView>

                            </td>
                        </tr>
                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>

                        <tr id="total" runat="server" visible="false">
                            <td align="center" width="94%"  colspan="2">
                                <asp:Label ID="lbltotalwork" runat="server" Text="Total Work Days of the Month :" Font-Size="16px"></asp:Label>
                           <%-- </td>
                            <td align="left" width="20%">&nbsp;      &nbsp; --%>   &nbsp;    &nbsp;   
                <asp:TextBox ID="txttotalwork" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>&nbsp;    &nbsp;    &nbsp;  
                                <asp:Label ID="lblam" runat="server" Text="Total Leaves of the Month :" Font-Size="16px"></asp:Label>
                           <%-- </td>
                            <td align="left" width="20%">&nbsp;      &nbsp; --%>   &nbsp;    &nbsp;    
                <asp:TextBox ID="txtamount" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
                                 &nbsp;    &nbsp;   
             <asp:Label ID="lblsal" runat="server" Text="Total Salary of the Month :" Font-Size="16px"></asp:Label>
                             &nbsp;    &nbsp;    
                <asp:TextBox ID="txtsal" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>

                    <%--   <asp:GridView ID="empdata" runat="server" Width="1450px"   AutoGenerateColumns="False"  BorderColor="#CCCCCC"  BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  Font-Underline="False"  BackColor="White"  AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10" 
                   PagerStyle-BackColor="White"     onpageindexchanging="empdata_PageIndexChanging"  DataKeyNames="did" >            
           <Columns>
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No">
                    <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Id" >
                <ItemTemplate>
                    <asp:Label ID="lblempid"  ForeColor="Gray" Text='<%# Bind("Empid") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Employee Name" >
                <ItemTemplate>
                    <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("empname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Date">
                <ItemTemplate>
                    <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("ddate") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="In Time">
                <ItemTemplate>
                    <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("intime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Out Time">
                <ItemTemplate>
                    <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("outtime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Lunch">
            <ItemTemplate>
            <asp:Label ID="lblwork" ForeColor="Gray" Text='<%# Bind("lunch") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="In Time">
                <ItemTemplate>
                    <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("intime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Out Time">
                <ItemTemplate>
                    <asp:Label ID="lblout11" ForeColor="Gray" Text='<%# Bind("outtime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                      <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Time">
                <ItemTemplate>
                    <asp:Label ID="lbltotal" ForeColor="Gray" Text='<%# Bind("worktime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnedit1" width='20' height='20' runat="server"  ImageUrl="images/edit1.png" OnClick="lnkeditrecord" />
                        </ItemTemplate>
                        <ItemStyle Width="3%"></ItemStyle>
                  </asp:TemplateField>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="5%"></ItemStyle>
                 </asp:TemplateField>   
          
            </Columns>
             <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
              <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
            </asp:GridView>--%>
                </td>
            </tr>


            <tr>
                <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
            </tr>
            <tr>
                <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
            </tr>
        </table>
         <script type="text/javascript">
             function changeColor(CheckBoxObj) {
                 if (CheckBoxObj.checked == true) {

                     CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                 }
                 else {
                     CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                 }
             }
</script>
    </form>
</body>
</html>
