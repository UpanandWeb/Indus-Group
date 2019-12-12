<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="Admin_Home" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Home</title>
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
    <script language="javascript" type="text/javascript">
    </script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <%--<link rel="stylesheet" href="Styles/style.css" />     --%>
    <style type="text/css">
        .contentgap {
            height: 25px;
        }

        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }
    </style>
    <script type="text/javascript">
        function valid(t1, t2) {
            if (t1.value == "") {
                return false;
            }
            else if (document.getElementById('txtOld').value == t1.value) {
                alert('Already Used, try another !!!');
                t1.value = "";
                t2.value = "";
                return false;
            }
            else if (t1.value == t2.value) {
                return true;
            }
            else
                return false;
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
            font-weight: bold;
            color: #C1E97C;
        }

            .hrow td {
                padding-top: 20px;
                width: 140px;
            }
        .Ti {
        padding-right:75px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
    <cc1:ToolkitScriptManager ID="scrp" runat="server"></cc1:ToolkitScriptManager>
    <table width="1500px" cellpadding="0" cellspacing="0">
    <tr width="1500px">
        <td valign="top" align="center" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    </table></center>

        <table border="0" align="center" width="1500px" style="background-color: White" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <table width="1500px" cellpadding="0" cellspacing="0" bgcolor="#ffffff" border='0' height="50%" align="center">

                        <tr width="100%">
                            <td align="right" colspan="2" width='100%' style="color: #0a2c46; font-size: 22px; padding-right: 150px;"><%--<b>Date   & Time  : </b>--%><span id="WashingtonDC" style="text-align:left;"></span></td>
                        </tr>
                        <tr>
                            <td colspan='2' align='center' bgcolor='#ffffff' width='100%' style="height: 53px">
                                <font size='6pt' color="#0e4860"><b>Indus Group Admin Control</b></font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2' align='left' bgcolor="#ffffff" class="lblog" valign='middle' width='100%' style="height: 40px">Welcome &emsp;
                                <asp:Label ID="lblname" runat="server" Font-Size="20px" ForeColor="Blue" />
                                &emsp;&emsp;
               <%-- <span style="cursor:pointer" id="passpop" runat="server" visible="false">[Change Password]</span>--%>
                                <asp:Label ID="passpop" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2' align='left' bgcolor="#ffffff" class="lblog" valign='middle' width='100%' style="height: 22px">
                                <font>
                    Admin Control Panel helps administrator to control all the activities that relates to the igiit Website.
                </font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan='2' align='left' bgcolor="#ffffff" class="lblog" valign='middle' width='100%' style="height: 29px">
                                <font>
                     Following are the Functionalities implemented in the Admin control Panel : 
                </font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="10px"></td>
                        </tr>
                        <tr class="contentgap">
                            <td align='left' valign='top' bgcolor="#ffffff" class="lblog">Client Form :
                            </td>
                            <td align="justify" valign='top' bgcolor="#ffffff" class="lblog">Enrolling a Client for post their jobs.
                            </td>
                        </tr>
                        <tr class="contentgap">
                            <td align="left" bgcolor="#ffffff" class="lblog">Vendor Form:</td>
                            <td align="justify" bgcolor="#ffffff" class="lblog">Enrolling a Vendor for post their jobs.</td>
                        </tr>
                        <tr class="contentgap">
                            <td align="left" bgcolor="#ffffff" class="lblog">Employee Form:</td>
                            <td align="justify" bgcolor="#ffffff" class="lblog">Enrolling an Employee for getting job.</td>
                        </tr>

                        <tr class="contentgap">
                            <td align='left' valign='top' bgcolor="#ffffff" class="lblog">Upload Forms :
                            </td>
                            <td align='justify' valign='top' bgcolor="#ffffff" width='75%' class="lblog" style="height: 69px">Through this control we can upload a form for a new Employee as well as if there is any change in the 
              form for an existing employee &nbsp;you should first select the employee and upload the corresponding forms.
            It will be automatically updated in the Website.
                            </td>
                        </tr>
                        <tr class="contentgap">
                            <td align='left' valign='top' bgcolor="#ffffff" class="lblog">Create Users:
                            </td>
                            <td align='justify' valign='top' bgcolor="#ffffff" width='75%' class="lblog">Here we can create new users and give permissions to the users.
                            </td>
                        </tr>
                        <tr class="contentgap">
                            <td align='left' valign='top' bgcolor="#ffffff" class="lblog">Feedback Administration :
                            </td>
                            <td align='justify' valign='top' bgcolor="#ffffff" width='75%' class="lblog">Here, the page will display all the feedbacks received in the order of the date it got submitted. 
            The administrator can choose the feedbacks and accept it or if it is not good he can reject it. The 
            feedback should be displayed in the website those which are accepted by the administrator.<br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="lable" valign="top" style="width: 783px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <cc1:ModalPopupExtender ID="mdpop" runat="server" BackgroundCssClass="modalBackground" TargetControlID="passpop"
            PopupControlID="divpop">
        </cc1:ModalPopupExtender>
        <center>
    <div id="divpop" runat="server" style="border:1px solid Gray; width:600px; padding-left:10px; background-color:White">
    <table width="600">
    
    <tr>
    <td align="center" colspan="3">
    You must change the password for first time use
    </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td>Current Password</td>
    <td>:</td>
    <td><asp:TextBox ID="txtOld" runat="server" Enabled="false" Width="200"></asp:TextBox>    
    </td>
    </tr>
    <tr>
    <td>New Password</td>
    <td>:</td>
    <td><asp:TextBox ID="txt1" runat="server" TextMode="Password" Width="200"></asp:TextBox>
    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txt1" ValidationGroup="g1">*</asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>Confirm Password</td>
    <td>:</td>
    <td><asp:TextBox ID="txt2" runat="server" TextMode="Password" Width="200"></asp:TextBox>
    <asp:CompareValidator ID="cmpv" runat="server" ControlToCompare="txt1" ErrorMessage="Invalid password" ControlToValidate="txt2" SetFocusOnError="true"></asp:CompareValidator>
    </td>
    </tr>
    <tr><td colspan="3" align="center">
    <asp:Button ID="btnok" runat="server" Text=" Submit " OnClientClick="return valid(document.getElementById('txt1'),document.getElementById('txt2'))" OnClick="btnok_Click" ValidationGroup="g1" />    
    </td></tr>    
    <tr><td>&nbsp;</td></tr>
    </table>
    </div>
    </center>
    </form>

</body>
</html>
