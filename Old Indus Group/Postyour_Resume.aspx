<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Postyour_Resume.aspx.cs" Inherits="Postyour_Resume" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



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
    <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
  
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
            <td  width="180" valign="top" bgcolor="#EFEFEF" align="left">
                 <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                  <tr><td><br /><br /></td></tr>

              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead">
                    <span class="head-black">&nbsp;&nbsp;</span><span style="color:black;font-size: 18px">Overview</span></span></td>
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
                    <td align="left" valign="top" class="mainhead" ><a href="Careers.aspx" style="color:black;font-size: 15px">Careers</a></td>
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
                    <td align="left" valign="top" class="hd1"><a href="Benefits.aspx" style="color:black;font-size: 15px">Benefits</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" style="color:black;font-size: 15px">Fulltime Jobs</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="seminar.aspx" style="color:black;font-size: 15px">Seminars</a></td>
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
                    <td align="left" valign="top" class="mainhead"><a href="Postyour_Resume.aspx" style="color:black;font-size: 15px">Post your Resume</a></td>
                  </tr>
                </table></td>
              </tr>
         
           
            </table>

            </td>
            <td width="5" align="right" valign="top">&nbsp;</td>
            <td width="863" align="right" valign="top" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            
              <tr>
                <td align="center" valign="top" class="head-black" width="100%" ><h3 style="color:#2471a3;">Post Your Resume</h3></td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" ><h4>So, you've made the smart choice to post your resume! Now, your posted resume puts you only a click away from building your career.&nbsp;<br>
                  <br>
Posting your resume with IGI offers many great benefits. You can post and manage up to 2 different resumes that highlight your diverse skill sets. You can quickly apply online when you find the right job. And, you can be assured that your resume can be read and filtered conveniently by today's online hiring software... making it even easier for your next employer to find you!</h4></td>
              </tr>
              <tr>
                <td align="justify" valign="top"><table width="100%" border="0">
      <tr>
        <td width="22%" align="center"><img src="Images/post_resume.png" width="200" height="209" /></td>
        <td width="5%">&nbsp;</td>
        <td width="53%">
            <table width="75%" cellpadding="3" cellspacing="5" style="background:#F4F4F4; border:1px solid #666;">
              <tbody>
                <tr>
                  <td height="30" colspan="3" align="center" valign="top" class="heading"  style=" background-image:url(Images/yellowmenubg_1.jpg); background-repeat:repeat-x; height:30px; padding-top:6px; color:#fff"><strong>Post your Resume</strong></font></td>
                </tr>
                <tr>
                  <td height="18">&nbsp;</td>
                  <td align="center">&nbsp;</td>
                  <td height="18">&nbsp;</td>
                </tr>
                <tr>
                  <td width="29%" align="center">Full Name </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield32" id="fname" runat="server" />--%>
                      <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtfname" Text="*"></asp:RequiredFieldValidator>
                   <cc1:FilteredTextBoxExtender  ID="FilteredTextBoxExtender13" runat="server" TargetControlID="txtfname" FilterType="LowercaseLetters, UppercaseLetters" FilterMode="ValidChars" ></cc1:FilteredTextBoxExtender>     
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Phone Number </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="phno" runat="server"  />--%>
                    <asp:TextBox ID="txtphno" runat="server" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Phone Number" ControlToValidate="txtphno">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">E-Mail</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<input name="textfield222" id="email" runat="server"  />--%>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email Address" ControlToValidate="txtemail" >*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Please Enter Valid Email Address" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="txtemail" Font-Size="10px">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Submit Resume </td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <asp:FileUpload ID="uploadresume" runat="server" />
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select File" ControlToValidate="uploadresume" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td width="29%" align="center">Comments</td>
                  <td><strong>:</strong></td>
                  <td align="left">
                    <%--<textarea rows="6" name="textfield222"  id="comments" runat="server" ></textarea>--%>
                      <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Width="200px" Height="150px"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Comments" ControlToValidate="txtcomment" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td align="center" colspan="3"><asp:Button ID="btnsubmit" runat="server" Text="Submit" onclick="btnsubmit_Click" /></td>
                </tr>
                 <tr>
                    <td colspan="3" align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" ShowSummary="false" ForeColor="Maroon" Font-Size="12px" runat="server" />
                    </td>
                </tr>
                <tr><td colspan="4"><asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label></td></tr>
              </tbody>
            </table>
        </td>
      </tr>
    </table></td>
              </tr>
             
            </table></td>
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
