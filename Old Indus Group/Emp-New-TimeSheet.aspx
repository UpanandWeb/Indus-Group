;''<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-New-TimeSheet.aspx.cs" Inherits="Emp_New_TimeSheet" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
    
    
    <script type="text/javascript">
      

        function st1() {                 

            var x1 = parseInt(document.getElementById("t1").value);
            if (isNaN(x1))
                x1 = 0;
            var x2 = parseInt(document.getElementById("t2").value);
            if (isNaN(x2))
                x2 = 0;
            var x3 = parseInt(document.getElementById("t3").value);
            if (isNaN(x3))
                x3 = 0;

            var x4 = parseInt(document.getElementById("t4").value);
            if (isNaN(x4))
                x4 = 0;

            var x5 = parseInt(document.getElementById("t5").value);
            if (isNaN(x5))
                x5 = 0;

            var x6 = parseInt(document.getElementById("t6").value);
            if (isNaN(x6))
                x6 = 0;
            var x7 = parseInt(document.getElementById("t7").value);
            if (isNaN(x7))
                x7 = 0;
            var x8 = parseInt(document.getElementById("t8").value);
            if (isNaN(x8))
                x8 = 0;
            var x9 = parseInt(document.getElementById("t9").value);
            if (isNaN(x9))
                x9 = 0;
            var x10 = parseInt(document.getElementById("t10").value);
            if (isNaN(x10))
                x10 = 0;
            var x11 = parseInt(document.getElementById("t11").value);
            if (isNaN(x11))
                x11 = 0;
            var x12 = parseInt(document.getElementById("t12").value);
            if (isNaN(x12))
                x12 = 0;
            var x13 = parseInt(document.getElementById("t13").value);
            if (isNaN(x13))
                x13 = 0;
            var x14 = parseInt(document.getElementById("t14").value);
            if (isNaN(x14))
                x14 = 0;
            var x15 = parseInt(document.getElementById("t15").value);
            if (isNaN(x15))
                x15 = 0;
            var x16 = parseInt(document.getElementById("t16").value);
            if (isNaN(x16))
                x16 = 0;
            var x17 = parseInt(document.getElementById("t17").value);
            if (isNaN(x17))
                x17 = 0;
            var x18 = parseInt(document.getElementById("t18").value);
            if (isNaN(x18))
                x18 = 0;
            var x19 = parseInt(document.getElementById("t19").value);
            if (isNaN(x19))
                x19 = 0;
            var x20 = parseInt(document.getElementById("t20").value);
            if (isNaN(x20))
                x20 = 0;

            var x21 = parseInt(document.getElementById("t21").value);
            if (isNaN(x21))
                x21 = 0;
            var x22 = parseInt(document.getElementById("t22").value);
            if (isNaN(x22))
                x22 = 0;

            var x23 = parseInt(document.getElementById("t23").value);
            if (isNaN(x23))
                x23 = 0;

            var x24 = parseInt(document.getElementById("t24").value);
            if (isNaN(x24))
                x24 = 0;

            var x25 = parseInt(document.getElementById("t25").value);
            if (isNaN(x25))
                x25 = 0;
            var x26 = parseInt(document.getElementById("t26").value);
            if (isNaN(x26))
                x26 = 0;
            var x27 = parseInt(document.getElementById("t27").value);
            if (isNaN(x27))
                x27 = 0;

            var x28 = parseInt(document.getElementById("t28").value);
            if (isNaN(x28))
                x28 = 0;

            var x29 = parseInt(document.getElementById("t29").value);
            if (isNaN(x29))
                x29 = 0;

            var x30 = parseInt(document.getElementById("t30").value);
            if (isNaN(x30))
                x30 = 0;
            var x31 = parseInt(document.getElementById("t31").value);
            if (isNaN(x31))
                x31 = 0;

            var y  = x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x27 + x28 + x29 + x30 + x31;

            //    alert(y);
            document.getElementById("whrs").value = y;
            
        }


          
        function st2() {
            var x1 = parseInt(document.getElementById("o1").value);
            if (isNaN(x1))
                x1 = 0;
            var x2 = parseInt(document.getElementById("o2").value);
            if (isNaN(x2))
                x2 = 0;
            var x3 = parseInt(document.getElementById("o3").value);
            if (isNaN(x3))
                x3 = 0;

            var x4 = parseInt(document.getElementById("o4").value);
            if (isNaN(x4))
                x4 = 0;

            var x5 = parseInt(document.getElementById("o5").value);
            if (isNaN(x5))
                x5 = 0;

            var x6 = parseInt(document.getElementById("o6").value);
            if (isNaN(x6))
                x6 = 0;
            var x7 = parseInt(document.getElementById("o7").value);
            if (isNaN(x7))
                x7 = 0;
            var x8 = parseInt(document.getElementById("o8").value);
            if (isNaN(x8))
                x8 = 0;
            var x9 = parseInt(document.getElementById("o9").value);
            if (isNaN(x9))
                x9 = 0;
            var x10 = parseInt(document.getElementById("o10").value);
            if (isNaN(x10))
                x10 = 0;
            var x11 = parseInt(document.getElementById("o11").value);
            if (isNaN(x11))
                x11 = 0;
            var x12 = parseInt(document.getElementById("o12").value);
            if (isNaN(x12))
                x12 = 0;
            var x13 = parseInt(document.getElementById("o13").value);
            if (isNaN(x13))
                x13 = 0;
            var x14 = parseInt(document.getElementById("o14").value);
            if (isNaN(x14))
                x14 = 0;
            var x15 = parseInt(document.getElementById("o15").value);
            if (isNaN(x15))
                x15 = 0;
            var x16 = parseInt(document.getElementById("o16").value);
            if (isNaN(x16))
                x16 = 0;
            var x17 = parseInt(document.getElementById("o17").value);
            if (isNaN(x17))
                x17 = 0;
            var x18 = parseInt(document.getElementById("o18").value);
            if (isNaN(x18))
                x18 = 0;
            var x19 = parseInt(document.getElementById("o19").value);
            if (isNaN(x19))
                x19 = 0;
            var x20 = parseInt(document.getElementById("o20").value);
            if (isNaN(x20))
                x20 = 0;

            var x21 = parseInt(document.getElementById("o21").value);
            if (isNaN(x21))
                x21 = 0;
            var x22 = parseInt(document.getElementById("o22").value);
            if (isNaN(x22))
                x22 = 0;

            var x23 = parseInt(document.getElementById("o23").value);
            if (isNaN(x23))
                x23 = 0;

            var x24 = parseInt(document.getElementById("o24").value);
            if (isNaN(x24))
                x24 = 0;

            var x25 = parseInt(document.getElementById("o25").value);
            if (isNaN(x25))
                x25 = 0;
            var x26 = parseInt(document.getElementById("o26").value);
            if (isNaN(x26))
                x26 = 0;
            var x27 = parseInt(document.getElementById("o27").value);
            if (isNaN(x27))
                x27 = 0;

            var x28 = parseInt(document.getElementById("o28").value);
            if (isNaN(x28))
                x28 = 0;

            var x29 = parseInt(document.getElementById("o29").value);
            if (isNaN(x29))
                x29 = 0;

            var x30 = parseInt(document.getElementById("o30").value);
            if (isNaN(x30))
                x30 = 0;
            var x31 = parseInt(document.getElementById("o31").value);
            if (isNaN(x31))
                x31 = 0;

            var y = x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x27 + x28 + x29 + x30 + x31;

            //    alert(y);
            document.getElementById("otime").value = y;
            //document.regForm.otime.value = y;
        }

        //function st3(fld) {

        //    var x = regForm.t3.value;
        //    //var x =
        //    var y = 0;
        //    if (parseInt(x) != 0) {
        //        y = document.regForm.whrs.value;
        //        y = y + x;
        //        alert(y);
        //        document.regForm.whrs.value = y;
        //    }



        //}

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

    <style type="text/css">
        .headings2 {
            color: #174eb4;
            background-color: #ffffff;
            font-size: 15px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 20px;
            padding-left: 15px;
        }

        .headings3 {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
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
<body>
    <form id="regForm" runat="server" >
        <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
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
                    <br />
                    <br />
                    <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
                    </div>
                </div></section>

        <table width="100%" align="center">
            <tr>
                <td id="Errmsg" align="right" class="lblog" runat="server"></td>
            </tr>
            <tr>
                <td id="crtopt" runat="server" align="right" style="padding-right: 30px;" class="lblog"></td>
            </tr>
            <%--<tr><td align="center" style="color:#00277a;font-size:22px;"><strong>News & Events</strong></td></tr>--%>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <table style="width: 702px">
                        <tr height="20">
                            <td colspan="3" align="center" style="font-weight: bold; font-size: 20pt">Time Sheet                                </td>
                        </tr>

                        <tr>
                            <td class="lable" align="left" valign="top">
                                <table id="tb1" allign="center" runat="server" width="702">

                                    <tr>
                                        <td class="lable">Emp ID</td>
                                        <td>: </td>
                                        <td class="style26">
                                            <%--<asp:TextBox ReadOnly="true" ID="empid" runat="server" CssClass="lable" Width="94px" 
                                        BorderWidth="1"></asp:TextBox>--%>

                                            <asp:TextBox ID="empid" runat="server" Enabled="false"></asp:TextBox>
                                        </td>


                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="lable">Consultant Name
                                    
                                        </td>
                                        <td>: </td>
                                        <td class="style26">
                                            <asp:TextBox ID="txtcname" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="lable">Client Name
                                        </td>
                                        <td>: </td>
                                        <td class="style26">
                                            <asp:TextBox ID="clname" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="lable">Time Period</td>
                                        <td>: </td>
                                        <td class="style26">
                                            <asp:DropDownList ID="txttime" runat="server" CssClass="lable" Width="209px"
                                                AutoPostBack="true" OnSelectedIndexChanged="txttime_SelectedIndexChanged">

                                                <asp:ListItem Value="Select Time Period">Select Time Period</asp:ListItem>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttime" InitialValue="Select Time Period" ForeColor="Red"
                                                ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>&nbsp;
                                                                
                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="lable">From Date
                                        </td>
                                        <td>:</td>
                                        <td class="style26">
                                            <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>--%>
                                            <%--  <input type="text" id="fromdate" readonly value="" runat="server" style="width: 172px; height: 20px" class="lable9" />
      
         <a href="javascript:show_calendar('regForm.fromdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
           &nbsp;&nbsp;&nbsp;&nbsp; <img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
                                            --%>
                                            <asp:TextBox ID="fromdate" runat="server" Style="width: 172px; height: 20px" class="lable9"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="fromdate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fromdate" ValidationGroup="submit" ForeColor="Red"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                        </td>
                                    </tr>

                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="lable">To Date
                                        </td>
                                        <td>:</td>
                                        <td class="style26">


                                            <%--   <input type="text" id="todate" readonly value="" runat="server" style="width: 172px; height: 20px" class="lable9" />
      
         <a href="javascript:show_calendar('regForm.todate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
           &nbsp;&nbsp;&nbsp;&nbsp; <img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
                                            --%>
                                            <asp:TextBox ID="todate" runat="server" Style="width: 172px; height: 20px" class="lable9"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="todate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="todate" ValidationGroup="submit" ForeColor="Red"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <%--</table>--%>


                                    <%--<table id="tb3" runat="server">--%>

                                    <tr>
                                        <td class="lable" colspan="3">
                                            <table>


                                                <tr>
                                                    <td align="center" class="lable">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                                    </td>
                                                    <td class="lable" align="center">1
                                                    </td>

                                                    <td class="lable" align="center">2
                                                    </td>
                                                    <td class="lable" align="center">3
                                                    </td>
                                                    <td class="lable" align="center">4
                                                    </td>
                                                    <td class="lable" align="center">5
                                                    </td>

                                                    <td class="lable" align="center">6
                                                    </td>

                                                    <td class="lable" align="center">7
                                                    </td>

                                                    <td class="lable" align="center">8
                                                    </td>

                                                    <td class="lable" align="center">9
                                                    </td>

                                                    <td class="lable" align="center">10
                                                    </td>
                                                    <td class="lable" align="center">11
                                                    </td>
                                                    <td class="lable" align="center">12
                                                    </td>

                                                    <td class="lable" align="center">13
                                                    </td>
                                                    <td class="lable" align="center">14
                                                    </td>
                                                    <td class="lable" align="center">15
                                                    </td>

                                                    <td class="lable">&nbsp;
                                                    </td>


                                                </tr>


                                                <tr>
                                                    <td align="center" class="lable">Reg.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                                    </td>
                                                    <td class="lable">
                                                        <asp:TextBox ID="t1" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t2" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t3" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t4" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t5" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t6" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t7" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t8" runat="server" Width="30"  BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t9" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t10" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t11" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t12" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t13" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t14" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t15" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">&nbsp;
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td align="center" class="lable">OT.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                                    </td>
                                                    <td class="lable">
                                                        <asp:TextBox ID="o1" runat="server" Width="30"  BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o2" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o3" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o4" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o5" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o6" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o7" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o8" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o9" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o10" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o11" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o12" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o13" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o14" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o15" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>
                                                    <td class="lable">&nbsp;
                                                    </td>


                                                </tr>

                                                <tr height="10px">
                                                    <td colspan="16">&nbsp; </td>
                                                </tr>


                                                <tr>
                                                    <td align="center" class="lable">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                                    </td>
                                                    <td class="lable" align="center">16
                                                    </td>

                                                    <td class="lable" align="center">17
                                                    </td>
                                                    <td class="lable" align="center">18
                                                    </td>
                                                    <td class="lable" align="center">19
                                                    </td>
                                                    <td class="lable" align="center">20
                                                    </td>

                                                    <td class="lable" align="center">21
                                                    </td>

                                                    <td class="lable" align="center">22
                                                    </td>

                                                    <td class="lable" align="center">23
                                                    </td>

                                                    <td class="lable" align="center">24
                                                    </td>

                                                    <td class="lable" align="center">25
                                                    </td>
                                                    <td class="lable" align="center">26
                                                    </td>
                                                    <td class="lable" align="center">27
                                                    </td>

                                                    <td class="lable" align="center">28
                                                    </td>
                                                    <td class="lable" align="center">29
                                                    </td>
                                                    <td class="lable" align="center">30
                                                    </td>

                                                    <td class="lable" align="center">31
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td align="center" class="lable">Reg.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                                    </td>
                                                    <td class="lable">
                                                        <asp:TextBox ID="t16" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t17" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t18" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t19" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t20" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t21" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t22" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t23" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t24" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t25" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t26" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t27" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t28" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t29" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t30" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="t31" runat="server" Width="30" BorderWidth="1" onkeyup="st1()"></asp:TextBox>
                                                    </td>

                                                </tr>




                                                <tr>
                                                    <td align="center" class="lable">OT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        :</td>
                                                    <td class="lable">
                                                        <asp:TextBox ID="o16" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o17" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o18" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o19" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o20" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o21" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o22" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o23" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o24" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o25" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o26" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o27" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o28" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o29" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o30" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>

                                                    <td class="lable">
                                                        <asp:TextBox ID="o31" runat="server" Width="30" BorderWidth="1" onkeyup="st2()"></asp:TextBox>
                                                    </td>


                                                </tr>


                                            </table>

                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="style24">Total
                                    Working Hours
                                        </td>
                                        <td>: </td>
                                        <td class="lable">
                                            <asp:TextBox ID="whrs" runat="server" CssClass="lable" BorderWidth="1" ReadOnly="true"
                                                Width="209px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="whrs" ValidationGroup="submit" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                           <%-- <input type="button" id="btn" value="Total Working Hrs" style="height: 18px; width: 100px;" class="lable" onclick="st1();" />--%>

                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="style24">Total
                                    Over Time
                                        </td>
                                        <td>: </td>
                                        <td class="lable">
                                            <asp:TextBox ID="otime" runat="server" Width="209px" ReadOnly="true" CssClass="lable" BorderWidth="1" Text="0"></asp:TextBox>&nbsp;&nbsp;
                                <%--<input type="button" id="btn2" value="Total Overtime Hrs"
                                    style="height: 18px; width: 100px;" class="lable" onclick="st2();" />--%>
                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td class="style24">Remarks</td>
                                        <td>: </td>
                                        <td class="lable">
                                            <asp:TextBox ID="txtrem" runat="server" TextMode="MultiLine" BorderWidth="1"
                                                CssClass="lable" Height="102px" Width="296px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr><td height="5px"></td></tr>
                                    <tr>
                                        <td colspan="3">&nbsp; </td>
                                    </tr>

                                    <tr>
                                        <td colspan="3" class="lable" align="center" style="font-weight: bold; font-size: 15pt">Instructions
                                        </td>
                                    </tr>

                                    <tr>
                                        <%-- <td class="style25"></td>
                                        --%>
                                        <td class="lable" colspan="3">Please enter regular hours in Reg. cell and over time hours in OT cell. All days 
                                    in the specified time period must be filled.&nbsp; Use Codes as follows:&nbsp; V = 
                                    Vacation, H = Holiday Monthly: 1 - 30/31 days, Mon-Sun.&nbsp; Please submit the 
                                    time sheet before 5th of every month. Otherwise we will not be able to run the 
                                    payroll by 15th of every month for those who have not submitted the IGI Internal 
                                    payroll time sheet. Thanks for your co-operation.</td>

                                    </tr>

                                    <tr>
                                        <td colspan="3" class="style27">&nbsp; </td>
                                    </tr>

                                    <tr>
                                        <%--<td class="style25"></td>--%>

                                        <td class="lable" colspan="3" align="center">Indus Group Inc. 1033 Sterling Road, Ste. 204, Herndon - VA - 20170, USA.<br />
                                            www.1indus.com email: <a href="mailto:accounts@1indus.com">accounts@1indus.com</a>, Phone:&nbsp; 703-291-8299 / Fax: 703-649-6458
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="3">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td class="lable" colspan="3" align="center">
                                            <asp:Button ID="btnsave" runat="server" Text="Submit" ValidationGroup="submit" OnClick="btnsave_Click" />
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel"  OnClick="btncancel_Click" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br /><br />
    </form>
</body>
</html>
