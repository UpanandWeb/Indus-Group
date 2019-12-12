<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Careers_Create.aspx.cs" Inherits="igiit_Admin_Admin_Careers_Create" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Careers</title>

    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Job Details has been edited Successfully");
        }

        //function alertdelete()
        //{
        //    alert("Client Details has been deleted Successfully");
        //}

        function alertcreate() {
            alert("Job Details has been Created Successfully");
            location.replace('Admin_Careers.aspx');
        }
    </script>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }

        .updateProgress {
            border-width: 1px;
            border-style: solid;
            background-color: White;
            position: absolute;
            width: 180px;
            height: 65px;
        }
    </style>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1000px;
            height: 600px;
            background-color: #333;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 350px;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 200px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <center>
            <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr width="100%">
                    <td valign="top" width='100%' class="lblog">
                        <table width="998px">
                            <tr>
                                <td>
                                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px"></td>
                </tr>
                <%--  <tr>
           <td id="crtopt" runat="server" align="center"  class="lblog" width=" 90%">
           </td>
       </tr>--%>

                <tr>
                    <td height="30px">
                        <table border="0" width="100%">
                            <tr>
                                <td align="center" height="20px" runat="server" id="pj"><a href="Admin_Careers.aspx"><b>Posted Jobs</b></a>  </td>
                                <td align="center" runat="server" id="anj"><font><a href="Admin_Careers_Create.aspx"><b>Add New Job</b></a></font></td>
                                <td align="center" runat="server" id="pr"><font><a href="Admin_resumes.aspx"><b>Posted Resumes</b></a></font></td>
                                <td align="center" runat="server" id="ar"><font><a href="Admin_appresumes.aspx"><b>Applied Resumes</b></a></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <%--  <tr>
           <td style="height:30px" align="center">
           <b  style="color:#00277a">New Job Postings</b>
           </td>
       </tr> --%>
                <tr>
                    <td id="Errmsg" align="right" class="lblog" runat="server"></td>
                </tr>


                <tr>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>
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

        </center>
        </div>
    </form>
</body>
</html>

