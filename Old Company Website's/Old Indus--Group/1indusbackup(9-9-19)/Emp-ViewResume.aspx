<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-ViewResume.aspx.cs" Inherits="Emp_ViewResume" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
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
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

    <script language="Javascript" type="text/javascript">
       <!--        Users_Information
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </script>
    <script type="text/javascript">
        function Validate(event) {
            var regex = new RegExp("^[0-9-]+$");
            var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }
    </script>

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
                 window.location = "Login.aspx";
             }, timeout);
         };
         function ResetSession() {
             //Redirect to refresh Session.
             window.location = window.location.href;
         }
            </script>

</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
        <div>
            <div>
                <head:Header ID="Header1" runat="server"></head:Header>
            </div>
            <hr />
            <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
            <br />

            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="25" width="90%" align="center">
                        <h3 style="color: #003399; font-size: 22px;">Update Resume</h3>
                        <br />
                    </td>
                    <td align="right" valign="bottom" style="font-family: Verdana; font-size: 18px;"><a href="Emp-Resumes.aspx">
                        <span style="font-size: 16px; font-weight: bold;">Back</span></a></td>
                </tr>
                <tr>
                    <td height="25" colspan="2">
                        <table width="100%" border="0" align="center" >
                            <tr>
                                <td>
                                      <div  width: 85%">
                                                                        <table id="Table1" width="100%" runat="server">
                                                                            <tr>
                                                                                <td style="width: 60%">
                                                                                    <table width="100%">

                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Consultant Name</td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtcname" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="1" runat="server"
                                                                                                    ControlToValidate="txtCName"
                                                                                                    ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                                                                            </td>
                                                                                        </tr>
                                                                                         <tr><td height="8px"></td></tr>
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Mobile</td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtmobile" runat="server" Height="35px" Font-Size="18px" Width="240px" MaxLength="12"  onkeypress="return Validate(event);"></asp:TextBox>
                                                                                     <%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtmobile"
                                                                                                    ValidationGroup="1" ValidationExpression="\d{12}" >*</asp:RegularExpressionValidator>--%>
                                                                                            </td>
                                                                                        </tr>
                                                                                          <tr><td height="8px"></td></tr>
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Email ID</td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtemail" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                         <tr><td height="8px"></td></tr>
                                                                                         <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Recruiter Name</td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtrec" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="width: 40%">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Location </td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td height="35" align="left" valign="middle">
                                                                                                <asp:TextBox ID="txtloc" MaxLength="12" runat="server" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr><td height="8px"></td></tr>
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">OpenTo </td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtopen" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr><td height="8px"></td></tr>
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Status</td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                              <asp:DropDownList ID="txtstatus" runat="server" Font-Size="18px" Width="242px" Height="35px">
                                                                                                  <asp:ListItem>New</asp:ListItem>
                                                                                                  <asp:ListItem>Process</asp:ListItem>
                                                                                                  <asp:ListItem>Complete</asp:ListItem>
                                                                                              </asp:DropDownList>
                                                                                                  <%--<asp:TextBox ID="txtstatus" runat="server" MaxLength="12" Height="35px" Font-Size="18px" Width="240px"></asp:TextBox>--%>
                                                                                            </td>
                                                                                        </tr>
                                                                                         <tr><td height="8px"></td></tr>
                                                                                        <tr>
                                                                                            <td style="font-family: Verdana; font-size: 18px" height="35" align="right" valign="middle">Upload Resume </td>
                                                                                            <td><strong>:</strong></td>
                                                                                            <td align="left">
                                                                                                <asp:FileUpload ID="resupload" runat="server" Font-Size="18px"  />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                </td>
                            </tr>
                            <tr><td height="10px"></td></tr>
                            <tr>

                                <td colspan="2" style="font-family: Verdana; font-size: 18px" height="35" align="center" valign="Middle">
                                    <span style="height: 100px;">Remarks </span><b>:</b>
                                    <asp:TextBox ID="txtremarks" runat="server" TextMode="MultiLine" Width="700px" Height="200px" Font-Size="18px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="100px" Height="40px" Text="Update" Font-Size="20px"
                                        OnClick="btnsubmit_Click" />
                                    <asp:ValidationSummary ID="val1" runat="server" ShowSummary="false" ValidationGroup="1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
