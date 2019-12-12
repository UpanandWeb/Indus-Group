<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Careers-Create.aspx.cs" Inherits="Emp_Careers_Create" %>


<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
        <div>
            <head:Header ID="Header1" runat="server"></head:Header>
        </div>
        <hr />
        <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
        <br />
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>

            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                             <tr>
                    <td align="center" width="100%">
            <table width="80%" align="center">
                <tr>
                    <td id="crtopt" runat="server" align="right" class="lblog"></td>
                </tr>
                  <tr>
                    <td height="30px">
                     <table border="0" width="100%">
       <tr><td align="center"  height="20px" runat="server" id="pj"><a href="Emp-Careers.aspx" style="font-size:16px;color:black;"><b>Posted Jobs</b></a>       </td>     
     <td align="center" runat="server" id="anj"><font><a href="Emp-Careers-Create.aspx" style="font-size:17px;color:green;"><b>Add New Job</b></a></font></td>
     <td  align="center" runat="server" id="pr"><font><a href="Emp-NewResumes.aspx" style="font-size:16px;color:black;"><b>Posted Resumes</b></a></font></td>
     <td  align="center" runat="server" id="ar"><font><a href="Emp-Appresumes.aspx" style="font-size:16px;color:black;"><b>Applied Resumes</b></a></font></td>
     </tr>
    </table>
                    </td>
                </tr>

                <tr>
                    <td><hr /></td>
                </tr>
                <tr>
                    <td style="height: 30px"></td>
                </tr>
                <tr>
                    <td id="Errmsg" align="right" class="lblog" runat="server"></td>
                </tr>


                <tr>
                    <td align="center">
                             <table width="100%" border="0">
                            <tr>
                                <td style="height: 19px; width: 132px;" class="lable" align="right"><font size="2pt">Select Country </font><strong>&nbsp;:&nbsp;</strong></td>
                                <td style="height: 19px; width: 286px;" class="lable5" align="left">
                                    <asp:DropDownList ID="ddcountry" runat="server" CssClass="lable4" Width="238px" Height="25px" ForeColor="Black" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddcountry" 
      ErrorMessage="Select Country" InitialValue="Select Country" ValidationGroup="create" >*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="height: 19px; width: 132px;" class="lable" align="right"><font size="2pt">Select State </font><strong>&nbsp;:&nbsp;</strong></td>
                                <td style="height: 19px; width: 286px;" class="lable5" align="left">
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="lable4" Width="238px" Height="25px" ForeColor="Black" AutoPostBack="true"
                                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" 
      ErrorMessage="Select State" InitialValue="Select State" ValidationGroup="create" >*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="height: 19px; width: 132px;" class="lable" align="right"><font size="2pt">Select City </font><strong>&nbsp;:&nbsp;</strong></td>
                                <td style="height: 19px; width: 286px;" class="lable5" align="left">
                                    <asp:DropDownList ID="ddcity" runat="server" CssClass="lable4" Width="238px" Height="25px" ForeColor="Black"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddcity" 
      ErrorMessage="Select city" InitialValue="Select City" ValidationGroup="create" >*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lable" style="height: 19px; width: 132px;" align="right"><font size="2pt">Job ID </font><strong>&nbsp;:&nbsp;</strong></td>
                                <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
                                    <asp:TextBox ID="txtjobid" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="25px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtjobid" 
      ErrorMessage="Enter Jobid" ValidationGroup="create" > *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="lable" style="height: 19px; width: 132px;" align="right"><font size="2pt">Job Name </font><strong>&nbsp;:&nbsp;</strong></td>
                                <td width="515" class="lable5" style="height: 19px; width: 286px;" align="left">
                                    <asp:TextBox ID="txtjname" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="238px" Height="25px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="refv1" runat="server" ControlToValidate="txtjname" 
      ErrorMessage="Enter Job name" ValidationGroup="create" >*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="6" align="center"></td>
                            </tr>
                            <tr>
                                <td style="height: 19px; width: 132px;" class="lable" align="right"><font size="2pt">Job Description</font> <strong>&nbsp;:&nbsp;</strong></td>
                                <td style="height: 19px; width: 286px;" class="lable5" align="left">
                                    <asp:TextBox ID="txtjdesc" runat="server" TextMode="MultiLine" CssClass="lable4" Width="546px" Height="188px" ForeColor="Black" onblur='javascript:chknum(this);'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtjdesc" 
      ErrorMessage="Enter Job description" ValidationGroup="create" >*</asp:RequiredFieldValidator>
                                </td>
                            </tr>


                            <tr>
                                <td colspan="2" height="17" align="center" class="lable5">
                                    <asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#000040"
                                        Height="30px" Text=" Save" Width="100px" OnClick="btnsubmit_Click" ValidationGroup="create"  />
                                     <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#000040"
                                        Height="30px" Text="Cancel" Width="100px" OnClick="Button1_Click" idationGroup="create"  />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

                    </td>
                </tr>

                <tr>
                    <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
                </tr>
                <tr>
                    <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
                </tr>
            </table>
            <br />
        </center>
    </form>
</body>
</html>
