<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-DailyReports.aspx.cs" Inherits="Emp_DailyReports" %>


<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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

        .AlgRgh {
            text-align: right;
            /*font-family:Verdana, Arial, Helvetica, sans-serif;*/
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

        th {
            text-align: center !important;
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
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

        <header id="header">
            <div class="container-fluide header-inner-wrap">
                <head:Header ID="Header1" runat="server"  />
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
                    </div>
                <br />
                <br />
               

                <table width="100%" align="center" >
                    <tr>
    <td align="center" width="100%" colspan="2"> 
        <font color='#003399' size='6pt'><b>Employee Daily Report</b></font>
    </td>
    </tr>
                           <tr><td height="15px">&nbsp;</td></tr>
                           <tr><td align="right">
                               <asp:LinkButton ID="lnkcreate" runat="server" Text="New Daily Report" Font-Size="16px" Font-Underline="false" OnClick="lnkcreate_Click"></asp:LinkButton>
                               &nbsp;&nbsp;
                               <asp:LinkButton ID="lnkshow" runat="server" Text="Show Data" Font-Size="16px" Font-Underline="false" OnClick="lnkshow_Click"></asp:LinkButton>
                               </td></tr>
                           <tr><td height="15px">&nbsp;</td></tr>


            <tr>
                <td align="center" valign="top" width="90%" class="lable" colspan="3" id="gview" runat="server">
                    <div >

                        <asp:GridView ID="MyGrid" runat="server" Width="100%" DataKeyNames="idr"
                            AutoGenerateColumns="False" BorderColor="#CCCCCC"
                            BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="14pt" Font-Strikeout="False" 
                            Font-Underline="False" BackColor="White" GridLines="Both"
                            PagerStyle-BackColor="White" 
                            OnPageIndexChanging="MyGrid_PageIndexChanging"
                          AllowPaging="true"  PageSize="25"  PagerSettings-Mode="Numeric" >
            <%--<SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />--%>

                            <Columns>
                                <asp:TemplateField HeaderText="Emp Id" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC"  >
                                    <ItemTemplate>
                                        <asp:Label ID="lb1" runat="server" Text='<%#Eval("empid") %>' Font-Size="18px" CssClass="datagrid-2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="First Name" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb2" runat="server" Text='<%#Eval("firstname") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Last Name" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb3" runat="server" Text='<%#Eval("lastname") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Email Id" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb4" runat="server" Text='<%#Eval("emailid") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb5" runat="server" Text='<%#Eval("mobile") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Subject" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb8" runat="server" Text='<%#Eval("Subject") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb6" runat="server" Text='<%#Eval("pdate") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC" >
                                    <ItemTemplate>
                                        <asp:Label ID="lb7" runat="server" Text='<%#Eval("discription") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                Font-Bold="True" Font-Italic="True" Font-Size="30px" 
                                Font-Underline="False" Height="35px"  CssClass="GVPager" /> <%--CssClass = "GridPager"--%> <%--CssClass="GVPager"--%>
                            <%--<PagerSettings Mode="NextPrevious"  NextPageText="Next" PreviousPageText="Previous" />--%>
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0"  BorderColor="Blue"
                                ForeColor="#00277a" Height="30px" />
                        </asp:GridView>
                    </div>

                </td>
            </tr>

                     <tr><td height="10px">&nbsp;</td></tr>
                </table>

                <table align="center" id="gview1" runat="server" visible="false" width="80%">
                      <tr>
                        <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="lblFirstName" runat="server" Text="First Name" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtFirstName" runat="server" Enabled="false" Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                       <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label1" runat="server" Text="Last Name" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtlast" runat="server" Enabled="false" Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                        <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label2" runat="server" Text="Emp ID" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtempid" runat="server" Enabled="false" Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                       <td>
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label3" runat="server" Text="Email Id" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtemailid" runat="server" Enabled="false" Width="200px" Font-Size="16px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                     <tr>
                        <td  colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label5" runat="server" Text="Mobile Number" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtmobile" runat="server"  Width="640px" Font-Size="16px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rv1" runat="server" ValidationGroup="report" ControlToValidate="txtmobile" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmobile"  ForeColor="Red" Display="dynamic"
                                            ErrorMessage="Enter Valid 10 digits number"  ValidationExpression="^[0-9]{10}$" ValidationGroup="report"></asp:RegularExpressionValidator>
                                                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars="~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="0123456789" TargetControlID="txtmobile"></cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>
                       <tr>
                        <td  colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label4" runat="server" Text="Subject" Font-Size="16px"></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtsubject" runat="server"  Width="640px" Font-Size="16px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="report" ControlToValidate="txtsubject" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                        <td colspan="2" align="center">
                            <table align="center"  width="90%">
                                <tr>
                                    <td width="50%" align="right">
                                          <asp:Label ID="Label6" runat="server" Text="Description" Font-Size="16px" ></asp:Label>
                                    </td>
                                    <td align="center"  width="10%"><b>:</b></td>
                                    <td width="50%" align="left">
                                           <asp:TextBox ID="txtdes" runat="server"  Width="640px" Font-Size="16px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="report" ControlToValidate="txtdes" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                            </table>
                        </td>
            </tr>
                    <tr><td><br /></td></tr>

                      <tr>
                <td  colspan="2" align="center">
                    &nbsp;<asp:Button ID ="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  Font-Size="16px" ValidationGroup="report"/>&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Font-Size="16px"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
               </table>

                <br />
                <br />
                                <br />
                <br />                <br />
                <br />
                </div>
        </section>
    </form>
</body>
</html>
