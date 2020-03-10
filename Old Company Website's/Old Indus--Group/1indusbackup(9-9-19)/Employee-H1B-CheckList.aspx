<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee-H1B-CheckList.aspx.cs" Inherits="Employee_H1B_CheckList" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

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
    
 <%--        <script type="text/javascript">
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
                     window.location = "Login.aspx";
                 }, timeout);
             };
             function ResetSession() {
                 //Redirect to refresh Session.
                 window.location = window.location.href;
             }
            </script> --%>
</head>

<body>
    <form id="form1" runat="server">
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

                    <div>
                        <table width="100%" align="center">
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>

                            <tr height="19">
                                <td width="100%" align="center" colspan="3">
                                    <table width="100%">
                                        <tr>
                                            <td class="style1" align="center" style="font-size: 24px">H1B Checklist </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td width="100%" align="center">
                                    <table width="70%" align="center">
                                        <tr><td><br /><br /></td></tr>
                                        <tr>
                                            <td>
                                                  <asp:Label ID="lblfile" runat="server" Text="Please Select File to download" Font-Size="18px"></asp:Label>
                                            </td>
                                            <td><b>:</b></td>
                                            <td>
                                            &nbsp; &nbsp;   <asp:DropDownList ID="dddownloadfile" runat="server" Font-Size="18px" Width="360px" Height="30px">
                                                    <%--<asp:ListItem>H-1B Application CheckList  2019</asp:ListItem>
                                                    <asp:ListItem>H-4 Application CheckList 2019</asp:ListItem>
                                                    <asp:ListItem>H1-B Information Sheet for New Emp  2019</asp:ListItem>--%>
                                                </asp:DropDownList>
                                               
                                            </td>
                                        </tr>
                                         <tr><td><br /></td></tr>
                                        <tr>
                                            <td>
                                               <asp:Label ID="Label1" runat="server" Text="Upload File" Font-Size="18px"></asp:Label>
                                            </td>
                                            <td><b>:</b></td>
                                            <td>
                                        &nbsp;&nbsp;     <asp:FileUpload ID="File1" runat="server" Font-Size="18px" Width="360px" Height="30px" />
                                                <%-- <asp:RequiredFieldValidator ID="re1" runat="server" ControlToValidate="ddemp" InitialValue="Select Employee"
                                                    ErrorMessage="Please Select Employee" ForeColor="Red" ValidationGroup="permission">
                                                </asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                         <tr><td><br /></td></tr>
                                        <tr> 
                                            <td colspan="3" align="center">
                                            <asp:Button ID="btndownload" runat="server" Text="Download" Font-Size="18px" Width="100px" Height="30px" OnClick="btndownload_Click"/>
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" Font-Size="18px" Width="100px" Height="30px" OnClick="btnupload_Click"/>
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Size="18px" Width="80px" Height="30px"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                          </table>
                        <asp:Label ID="resp" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>