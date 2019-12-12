<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fulljobsdes.aspx.cs" Inherits="Fulljobsdes" %>
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
  
    <style>
.appfont
{
	font-family:Segoe UI;
	font-weight:bold;
	vertical-align:top;
	font-size:20px;
	color: #005086;
}
.appfont:hover
{
	font-family:Segoe UI;
	font-weight:bold;
	vertical-align:top;
	font-size:24px;
	color: #005086;
}
 .modalBackground 
{
   
    background-color:Gray;
    filter:alpha(opacity=70);
    opacity:0.7;
}
</style>
    
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
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/full-time-job-banner.jpg"/></td></tr>
 <tr>
        <td align="center" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td td width="180" valign="top" bgcolor="#EFEFEF" align="left"><table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                <%--   <td align="left" valign="top" class="mainhead"><span class="head-black">Careers</span></td>--%>
                   <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">&nbsp;&nbsp;</span><span class="head-black">Careers</span></span></td>
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
                    <td align="left" valign="top" class="hd1" ><a href="Careers.aspx" class="sublink">Overview</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="Benefits.aspx" class="sublink">Benefits</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" class="sublink">Fulltime Jobs</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="seminar.aspx">Seminars</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="Postyour_Resume.aspx" class="sublink">Post your Resume</a></td>
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
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
            </table></td>
            <td width="5" align="right" valign="top">&nbsp;</td>
            <td  height="650px" width="863" align="right" valign="top" style="padding:10px;">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" valign="top" class="head-black" width="100%" ><h3 style="color:#2471a3;"></h3> Job Description</td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" >
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table>
                </td>
              </tr>

                      <tr>
                        <td >

                            <asp:Button ID="SearchJobs" runat="server" Text="Search For More Jobs" OnClick="SearchJobs_Click" />
                            <asp:Button ID="forwardfriend" runat="server" Text="Forward this job to a friend" />
                            <%--<asp:Button ID="applyemail" runat="server" Text="APPLY by email without Registration" />--%>
                            <asp:Button ID="applyaccount" runat="server" Text="Apply by creating/Using your Indus Group account" />


                        </td>
                      </tr>

              <tr>
                <td width="100%" >
                    <br />
                  <table width="100%" style="margin-left: 0px">
                    <tr>
                        <td align="left">
                        <asp:Panel ID="pnlbor" Width="100%" runat="server" CssClass="bor" BorderWidth="1">
                            <asp:DataList ID="dlopenings" runat="server" Width="100%" >
                                <ItemTemplate>
                                <h4>
                                    <table width="100%" cellpadding="6" cellspacing="3">
                                        <tr>
                                        <td>
                                        <table border="0" width="100%" style="background-color:#E9E9E9; margin-top:2px" class="bor">
                                        <tr>
                                            <td height="35px" width="11%" style="padding-left:5px">
                                                <span class="datanew" style="font-size:10pt">Job Title</span>
                                            </td>
                                            <td width="1%" class="datanew">
                                                :
                                            </td>
                                            <td width="73%" class="data" >
                                                <asp:Label ID="Label1" runat="server" ForeColor="#ff2e24"  Font-Size="12pt" Text='<%# Bind("JobName") %>' CssClass="lable"></asp:Label>
                                               &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Labe21" runat="server" Font-Size="10pt"  Text="Job ID"></asp:Label>&nbsp;&nbsp;:&nbsp;&nbsp;
                                                                                        
                                             <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#ff2e24"  Target="_blank" CssClass="lable"  Text='<%#Eval("jobid") %>' ></asp:HyperLink>     
                                            </td>
                                            
                                            <td  border="1">
             <asp:HyperLink ID="Hyperpost" runat="server" Font-Bold="true" Font-Size="Larger" Font-Underline="true" Target="_blank"   Text="Apply" ForeColor="Gray" CssClass="lable" NavigateUrl='<%# "Postyour_Resume.aspx?jid="+ Eval("ID") %>'></asp:HyperLink>

                                            </td>
                                            </tr>
                                            </table>
                                            
                                            </td>
                                        </tr>
                                         <%-- <tr>
                                            <td width="15%">
                                                <span class="datanew">Posted Date</span>
                                            </td>
                                            <td width="1%" class="datanew">
                                                :
                                            </td>
                                            <td width="83%" class="data" >
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pdate") %>' CssClass="lable"></asp:Label>
                       
                                                
                                            </td>
                                        </tr>--%>
                                        <tr><td height="5px"></td></tr>
                                        <tr>
                                        <td>
                                        <table border="0" width="100%">
                                        <tr>
                                            <td valign="top" width="15%" style="padding-left:5px">
                                                <span class="datanew" style="text-decoration: underline; font-size:10pt" >Job Description :-</span>
                                               
                                            </td>
                                            </tr>
                                           <tr>
                                            <td  width="83%" class="data" style="padding-left:5px; padding-right:5px">
                                              <h4>&emsp;&emsp;
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("JobDesc") %>' CssClass="lable"></asp:Label></h4>
                                            </td></tr></table></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" height="10px"></td>
                                        </tr>
                                       <%-- <tr>
                                            <td width="15%">
                                                <span class="datanew">Posted On</span>
                                            </td>
                                            <td width="1%" class="datanew">
                                                :
                                            </td>
                                            <td width="83%" class="data" style="color: Red">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date") %>' CssClass="lable"></asp:Label>
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td colspan="3" height="15px"></td>
                                        </tr>
                                    </table></h4>
                        
                                </ItemTemplate>
                            </asp:DataList> 
                            </asp:Panel>           
                        </td>
                    </tr>
        
                    </table>
                    <p><br />
                </p>
                </td>
              </tr>
              <tr>
                <td align="justify" valign="top"><p align="justify">&nbsp;</p>
                  <p><br>
                </p></td>
              </tr>
             
            </table>
            </td>
          </tr>

         
      
        </table></td>
      </tr>
   
 
</table>
 
             
                          
            
             

    

             
    
</div>    </div></section>

    
           
             
    
    
    
    



    <div >
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
