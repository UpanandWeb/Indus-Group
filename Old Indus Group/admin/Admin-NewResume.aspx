<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-NewResume.aspx.cs" Inherits="admin_Admin_NewResume" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - Resumes</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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
                window.location = "Default.aspx";
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
            <table width="80%" align="center">
                <tr width="100%">
                    <td valign="top" width='100%' class="lblog">
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td id="crtopt" runat="server" align="right" class="lblog"></td>
                </tr>
                <tr>
                    <td>
                        <table width="1500px" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="25" align="center" colspan="2"></td>
                            </tr>
                            <tr>
                                <td height="25" width="90%" align="center">
                                    <h3 style="color: #003399; font-size: 22px;">Post New Resume</h3>
                                    <br />
                                </td>
                                <td align="right" valign="bottom" style="font-family: Verdana; font-size: 18px;"><a href="Admin-Resumes.aspx">Back</a></td>
                            </tr>
                            <tr>
                                <td height="25" colspan="2">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border: #dcdddf solid 1px;">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <td align="left" colspan="2">
                                                        <center>
                                                                    <div style="border: 1px dotted Gray; width: 85%">
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
                                                                </center>
                                                    </td>
                                        </tr>
                                        <tr>
                                           
                                                        <td  colspan="2" style="font-family: Verdana; font-size: 18px" height="35" align="center" valign="Middle">
                                                <span style="height:100px;">Remarks </span>       <b>:</b>     <asp:TextBox ID="txtremarks" runat="server" TextMode="MultiLine" Width="700px" Height="200px" Font-Size="18px"></asp:TextBox>
                                                        </td>
                                           </tr>
                                     
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="120px" Height="60px" Text="Save" Font-Size="20px"
                                                    OnClick="btnsubmit_Click" />
                                                <asp:ValidationSummary ID="val1" runat="server" ShowSummary="false" ValidationGroup="1" />
                                            </td>
                                        </tr>
                                    </table>
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
