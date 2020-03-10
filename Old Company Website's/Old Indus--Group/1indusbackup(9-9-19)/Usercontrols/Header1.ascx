<%@ control language="C#" autoeventwireup="true" codefile="Header1.ascx.cs" inherits="usercontrols_Header1" %>

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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="highlightNav.js"></script>
<script src="jquery.js" type="text/javascript"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../css/header.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/responsive.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link href="../css/styles1.css" rel="stylesheet" type="text/css" />
<link href="menuuu.css" rel="stylesheet" type="text/css" />

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
    .a {
        text-decoration: none;
    }

        .a:hover {
            text-decoration: underline;
        }

    /*a, a:visited{color:#000;  text-decoration:none; font-size:12px;}
            ul.navigation{list-style:none; font: 0.75em/1.5em normal Tahoma, Verdana, Geneva, sans-serif; position:relative; margin:0; padding:0;}
            ul.navigation1 li{ margin:1px; height:40px;   text-align:center; display:block; float:left; position:relative; line-height:40px;}

            ul.navigation1 li a{ padding:5px 17px;}
            ul.navigation1 li a:hover{ color:#06C;border-bottom:2px solid #e23827;}
            ul.navigation1 li.highlight{ background:#666;}
            ul.navigation1 li.highlight a, ul.navigation1 li.highlight a:hover { color:#f5f5f5; cursor:default;}

            ul.navigation1 ul.childNav{ position:absolute; top:2.5em; left:0; list-style:none; margin:0; padding:0; display:none;}
            ul.navigation1 ul.childNav li{ float:none;}
            ul.navigation1 li.highlight ul.childNav a { color:#444; cursor:pointer;}
            ul.navigation1 li.highlight ul.childNav a:hover{ color:#06c; border-bottom:2px solid #e23827;}
            ul.navigation1 li.highlight ul.childNav li.highlight{ background:#999; }
            ul.navigation1 li.highlight ul.childNav li.highlight a, ul.navigation1 li.highlight ul.childNav li.highlight a:hover{color:#fff;}
            ul.navigation1 li:hover ul.childNav { display:block;}*/
    .auto-style1 {
        left: 0px;
        top: 0px;
        width: 142px;
    }
</style>


<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td align="left" valign="middle" width="22%">
                    <div class="auto-style1">
                        <p>
                            <a href="Default.aspx">
                                <img src="Images/logo2.png" alt="logo" /></a>
                        </p>
                    </div>
                </td>
                <td width="78%">
                    <table width="100% !important" class=" menu-wrapper col-xs-12 table-lg-9">
                        <tr>
                            <td height="8px"></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="top-menu pull-right hidden-xs hidden-sm">
                                    <ul class="top-menu-inner">
                                        <li>
                                            <%--<a href="http://aceindus.in/"><img src="Images/national-flags-250x250.jpg" height="20" alt="Ind" title="Ind" /></a>--%>
                                            <%--<a href="india/Default.aspx"><img src="Images/national-flags-250x250.jpg" height="20" alt="Ind" title="Ind" /></a>--%>
                                            <%--     <asp:ImageButton ID="dd" runat="server" OnClick="dd_Click"
                                      ImageUrl="Images/national-flags-250x250.jpg" height="20" alt="Ind" title="Ind" />--%>

                                        </li>

                                        <li>
                                            <%--<a href="http://1indus.com/"><%--<img src="Images/american_us_flag_mini_button.jpg"  height="30"alt="Usa" title="Usa" /> </a>--%>
                                        </li>
                                    </ul>

                                    <ul>
                                        <li>
                                            <img src="../Images/Key-icon.png" class="a" id="lnkimg" runat="server" />
                                            <asp:LinkButton ID="lnk1" runat="server" Text="Login" OnClick="lnk1_Click" CssClass="a">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lnkOut" runat="server" OnClick="lnkOut_Click">Logout</asp:LinkButton>
                                        </li>
                                    </ul>

                                    <ul class="social-media-icons">
                                        <li>
                                            <a title="Facebook" href="#" target="_blank">
                                                <img src="Images/facebook-(2).png" alt="Facebook" />
                                            </a>
                                        </li>
                                        <li>
                                            <a title="Twitter" href="#" target="_blank">
                                                <img src="Images/Twitter.png" alt="Twitter" />
                                            </a>
                                        </li>
                                        <li>
                                            <a title="Linkedin" href="#" target="_blank">
                                                <img src="Images/LinkedIn-(2).png" alt="Linkedin" />
                                            </a>
                                        </li>
                                        <li>
                                            <a title="Linkedin" href="#" target="_blank">
                                                <img src="Images/google.png" alt="Google+" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="navMenu" width="100%" align="center">
                                <div style="float: right;">
                                    <ul class="navigation" style="padding: 0;">
                                        <%--  <li><a href="Default.aspx">Home</a></li>
                                <li><a href="Corporate.aspx">Corporate</a></li>
                                <li><a href="services.aspx">Services</a></li>
	                            <li><a href="Careers.aspx">Careers</a></li>
	                            <li><a href="Clients.aspx">Clients</a></li>
	                            <li><a href="Itconsulting.aspx">IT Consulting</a></li>
	                            <li><a href="Products.aspx">Products</a></li>
	                            <li><a href="Support.aspx">Support</a></li>
	                            <li><a href="Feedback.aspx">Feedback</a></li>--%>

                                        <li>
                                            <asp:LinkButton ID="lnkhome" runat="server" Text="Home" OnClick="lnkhome_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkcorporate" runat="server" Text="Corporate" OnClick="lnkcorporate_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkservices" runat="server" Text="Services" OnClick="lnkservices_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkcareers" runat="server" Text="Careers" OnClick="lnkcareers_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkclients" runat="server" Text="Clients" OnClick="lnkclients_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkit" runat="server" Text="IT Consulting" OnClick="lnkit_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkproducts" runat="server" Text="Products" OnClick="lnkproducts_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnksupport" runat="server" Text="Support" OnClick="lnksupport_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkfeedback" runat="server" Text="Feedback" OnClick="lnkfeedback_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnknonit" runat="server" Text="Non IT"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkhealthcare" runat="server" Text="Health Care"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnktraining" runat="server" Text="Training"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkoverseas" runat="server" Text="Overseas Education Jobs"></asp:LinkButton>                                         
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    </div>
</div>
