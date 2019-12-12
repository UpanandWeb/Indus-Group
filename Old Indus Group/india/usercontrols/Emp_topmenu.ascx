<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Emp_topmenu.ascx.cs" Inherits="usercontrols_Emp_topmenu" %>

<style type "text/css">
<!--
/* @group Blink */
.blink {
	-webkit-animation: blink .75s linear infinite;
	-moz-animation: blink .75s linear infinite;
	-ms-animation: blink .75s linear infinite;
	-o-animation: blink .75s linear infinite;
	 animation: blink .75s linear infinite;
}
@-webkit-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-moz-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-ms-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-o-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
/* @end */
-->
</style>
<style type="text/css">
body {
	
}
    a1{
        width:100px;
        border:0;
        border-spacing:0; 
        border-width:0;
    }
    a3
    {
        border-spacing:0;
        border-width:0;
        border:0;
    }
    a2
    {
        border-spacing:0;
        border-width:0;
    }
    img
    {
        border:0;
    }
    b1
    {
        border-spacing:0;
        border-width:0;
    }
    .img-responsive .b2
    {
        border-width:0px;
    }

</style>
 <script>
     $(function () {
         var path = window.location.pathname;
         path = path.replace(/\/$/, "");
         path = decodeURIComponent(path);

         $(".nav li a").each(function () {
             var href = $(this).attr('href');
             if (path.substring((path.lastIndexOf('/') + 1), path.lenght) === href) {
                 $(this).closest('li').addClass('active');
             } else {
                 $(this).closest('li').removeClass();
             }
         });
     });
    </script>

<link rel="stylesheet" type="text/css" href="../style.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../highlightNav.js"></script>

<div width="100%" align="center">

<ul class="menucontrol">
    <li><a href="Emp_Home.aspx">Home</a></li>
    <li><a href="Emp_profile.aspx">Profile</a></li>
    <li><a href="Emp_EmployeeInfo.aspx">Employee Info</a></li>
	<%--<li><a href="Emp_Careers.aspx">Careers</a></li>--%>
	<li><a href="Emp_Timesheet.aspx">TimeSheet</a></li>
	<li><a href="Uploaddocs.aspx">All Docs</a></li>
	<li><a href="Principles.aspx">Principles</a></li>
</ul>
</div>

