<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_EmployeeInfo.aspx.cs" Inherits="india_Emp_EmployeeInfo" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/Indfooter.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<!DOCTYPE html>

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
                    <br />
                    <br />
                    <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>

                        <table width="100%">
                            <tr><td><br /><hr /></td></tr>

                            <tr>
                                <td width="100%" align="center" colspan="6">
                                    <table width="100%">
                                        <tr>
                                            <td align="center"  align="center" style="font-size: 24px" >Employee Form </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                                <td align="center" colspan="6">
                                    <asp:Image ID="imgdisplay" runat="server" ImageUrl='<%#Eval("photo") %>' Width="250px" Height="250px" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Email ID :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="txtemail" runat="server" MaxLength="50" Enabled="false" Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Email :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="conemail" runat="server" MaxLength="50"  Enabled="false" Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Emp ID :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="txtempid" runat="server" MaxLength="10"  Enabled="false" Width="180px"></asp:TextBox>
                               </td>
                             </tr>
                             
                            <tr><td><br /></td></tr>

                            <tr>
                               <td  align="left" colspan="8" valign="top" bgcolor="#336699" style="height: 18px">
                                    <b><span class="headings3">Reference Details</span> </b>
                               </td>
                            </tr>

                            <tr><td><br /></td></tr>

                             <tr>
                               <td align="right" width="15%" class="headings2">
                                   Referenced By :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="emprefname" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Designation :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="emprefdesig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id:<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="emprefemail" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                            <tr><td><br /></td></tr>

                      
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="emprefmob" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="emprefalter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="emprefaddress" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>
                             
                             <tr><td><br /></td></tr>
                             
                            <tr>
                               <td  align="left" colspan="8" valign="top" bgcolor="#336699" style="height: 18px">
                                    <b><span class="headings3">Father Details</span> </b>
                               </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Father Name :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empfathername" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empfatherdesig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empfatheremail" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empfathermobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empfatheralter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empfatheraddress" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>
                             
                             <tr><td><br /></td></tr>
                             
                            <tr>
                               <td  align="left" colspan="8" valign="top" bgcolor="#336699" style="height: 18px">
                                    <b><span class="headings3">Mother Details</span> </b>
                               </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mother Name :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empmothername" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empmotherdesig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empmotheremail" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empmothermobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empmotheralter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empmotheraddress" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                             
                             <tr><td><br /></td></tr>
                             
                            <tr>
                               <td  align="left" colspan="8" valign="top" bgcolor="#336699" style="height: 18px">
                                    <b><span class="headings3">Brothers Details</span> </b>
                               </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Brother Name :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empbrother1name" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empbrother1desig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empbrother1email" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empbrother1mobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empbrother1alter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empbrother1address" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Brother Name :<%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empbrother2name" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empbrother2desig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empbrother2email" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empbrother2mobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empbrother2alter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empbrother2address" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>


                             <tr><td><br /></td></tr>
                             
                            <tr>
                               <td  align="left" colspan="8" valign="top" bgcolor="#336699" style="height: 18px">
                                    <b><span class="headings3">Sisters Details</span> </b>
                               </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Sister Name :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empsister1name" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empsister1desig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empsister1email" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<span style="color: red">*</span> &nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empsister1mobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empsister1alter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<span style="color: red">*</span>&nbsp;&nbsp;
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empsister1address" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Sister Name :<%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empsister2name" runat="server" MaxLength="50"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                  Occupation :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empsister2desig" runat="server" MaxLength="50"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Email Id :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empsister2email" runat="server" MaxLength="60"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /></td></tr>
                             
                            <tr>
                               <td align="right" width="15%" class="headings2">
                                   Mobile Number :<%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   <asp:TextBox ID="empsister2mobile" runat="server" MaxLength="10"  Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2" >
                                   Alternate Number :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                   &nbsp;&nbsp;    <asp:TextBox ID="empsister2alter" runat="server" MaxLength="10"   Width="180px"></asp:TextBox>
                               </td>
                               <td align="right" width="15%" class="headings2">
                                    Address :<%--<span style="color: red">*</span>&nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="18%">
                                     &nbsp;&nbsp;   <asp:TextBox ID="empsister2address" runat="server" MaxLength="100"   Width="180px"></asp:TextBox>
                               </td>
                             </tr>

                              <tr><td><br /><br /></td></tr>

                             <tr>
                               <td align="right" width="20%" class="headings2" colspan="2">
                                   Description :<%--<span style="color: red">*</span> &nbsp;&nbsp;--%>
                               </td>
                               <td align="left" width="79%" colspan="4">
                                   <asp:TextBox ID="empdesc" runat="server" MaxLength="10"  Width="580px" Height="100px"></asp:TextBox>
                               </td>
                             </tr>
                             <tr><td><br /><br /><br /></td></tr>
                              <tr>
                               <td align="center" width="50%" class="headings2" colspan="6">
                                   <asp:Button ID="btmnsave" runat="server" Text="Submit" Width="80px" Height="30px" ValidationGroup="personal" OnClick="btmnsave_Click" />
                                  <asp:Button ID="Button1" runat="server" Text="Cancel" Width="80px" Height="30px" />
                               </td>
                             </tr>
                             <tr><td><br /><br /><br /></td></tr>
                        </table>
             </div>
            </div>
        </section>
    </form>
</body>
</html>
