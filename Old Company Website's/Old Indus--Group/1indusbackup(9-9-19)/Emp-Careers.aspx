<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Careers.aspx.cs" Inherits="Emp_Careers" %>

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
       <tr><td align="center"  height="20px" runat="server" id="pj"><a href="Emp-Careers.aspx" style="font-size:17px;color:green;"><b>Posted Jobs</b></a>       </td>     
     <td align="center" runat="server" id="anj"><font><a href="Emp-Careers-Create.aspx" style="font-size:16px;color:black;"><b>Add New Job</b></a></font></td>
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
                        <asp:GridView ID="GridView1" runat="server" Width="96%"
                            AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Solid"
                            BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                            Font-Underline="False" Height="242px" BackColor="White" DataKeyNames="id"
                            AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="25"
                            PagerStyle-BackColor="White" PagerStyle-BorderWidth="0"
                            OnPageIndexChanging="GridView1_PageIndexChanging" >
                            <Columns>

                      <%--          <asp:TemplateField ControlStyle-Width="20px" HeaderStyle-Width="20px" FooterStyle-Width="20px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <table width="100%" align="center">
                                            <tr>
                                                <td align="center">
                                                    <asp:CheckBox ID="chkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_CheckedChanged" />
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkone" runat="server" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
                               <%-- <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("id") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="90" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("JobID") %>' ForeColor="Gray"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job Title">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" ForeColor="Gray" Text='<%# Bind("JobName") %>' CssClass="labledd"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="15%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Job Description">
                                    <ItemTemplate>
                                        <asp:Label ID="Labeljdate" runat="server" Text='<%# Bind("JobDesc") %>' ForeColor="Gray"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle Width="50%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="Labels2" runat="server" ForeColor="Gray" Text='<%# Bind("joblocation") %>' CssClass="labledd"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted On">

                                    <ItemTemplate>
                                        <asp:Label ID="Labelpost" runat="server" ForeColor="Gray" Text='<%# Bind("post") %>' CssClass="lable"></asp:Label>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="10%" />
                                </asp:TemplateField>
      
                            </Columns>

                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" BorderWidth="0" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt" HorizontalAlign="Center"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                BorderColor="#CCCCCC" BorderWidth="0" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Size="9pt"
                                Font-Underline="False" Height="20px" Wrap="True" />
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True"
                                ForeColor="#00277a" Height="30px" />
                        </asp:GridView>
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
                 <script type="text/javascript">
                     function changeColor(CheckBoxObj) {
                         if (CheckBoxObj.checked == true) {

                             CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                         }
                         else {
                             CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                         }
                     }
        </script>
        </center>
    </form>
</body>
</html>
