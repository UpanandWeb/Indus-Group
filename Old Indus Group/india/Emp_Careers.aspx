<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_Careers.aspx.cs" Inherits="Emp_Careers" %>
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
             </div>
            </div>
        </section>
    </form>
</body>
</html>
