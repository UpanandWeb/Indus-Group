<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-DailyReports.aspx.cs" Inherits="admin_Admin_DailyReports" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Reports</title>
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
    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <style type="text/css">
        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            font-size: 25px;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }

        .GVPager {
            /*width: 1500px;*/
            border-right-style: solid;
            position: absolute;
            height: 35px;
            font-size: 25px;
            text-align: center;
            border-right-color: navy;
        }
    </style>
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD" oncontextmenu="return false;" onselectstart="return false">
    <form id="form1" runat="server">

        <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr ="100%">
                <td valign="top" width='90%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td align="center" valign="top" width="90%" class="lable">
                    <table>
                        <tr>
                            <td>
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>

            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lbltitle" runat="server" Text="Daily Reports" Font-Bold="true" Font-Size="26px"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <br />
                    <hr />
                    <br />
                </td>
            </tr>

            <tr>
                <td align="center" colspan="2" width="90%">
                    <table align="center" width="90%">
                        <tr>
                            <td align="left">
                                <table align="left" width="80%">
                                    <tr>
                                        <td width="47%" align="left">
                                            <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="160px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddemp_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      
                                            <asp:DropDownList ID="ddyear" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="100px">
                                                <asp:ListItem>Year</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                                <asp:ListItem>2021</asp:ListItem>
                                                <asp:ListItem>2022</asp:ListItem>
                                                <asp:ListItem>2023</asp:ListItem>
                                                <asp:ListItem>2024</asp:ListItem>
                                                <asp:ListItem>2025</asp:ListItem>
                                                <asp:ListItem>2026</asp:ListItem>
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                            <asp:DropDownList ID="ddmonth" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="120px"
                                                OnSelectedIndexChanged="ddmonth_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem>Month</asp:ListItem>
                                                <asp:ListItem Value="1">January</asp:ListItem>
                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                <asp:ListItem Value="8">August</asp:ListItem>
                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">December</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                    <br />

                </td>
            </tr>
            <tr>
                <td align="center" valign="top" width="90%" class="lable" colspan="3">
                        <asp:GridView ID="MyGrid" runat="server" Width="90%" DataKeyNames="idr"
                            AutoGenerateColumns="False" BorderColor="#CCCCCC"
                            BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                            Font-Underline="False" BackColor="White" GridLines="Both"
                            PagerStyle-BackColor="White"
                            OnPageIndexChanging="MyGrid_PageIndexChanging"
                            AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric">
                            <Columns>
                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("idr") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="90" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Emp-Id" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb1" runat="server" Text='<%#Eval("empid") %>' Font-Size="18px" CssClass="datagrid-2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First-Name" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb2" runat="server" Text='<%#Eval("firstname") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last-Name" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb3" runat="server" Text='<%#Eval("lastname") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email-Id" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb4" runat="server" Text='<%#Eval("emailid") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb5" runat="server" Text='<%#Eval("mobile") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb6" runat="server" Text='<%#Eval("pdate") %>' Font-Size="18px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#CCCCCC">
                                    <ItemTemplate>
                                        <asp:Label ID="lb7" runat="server" Text='<%#Eval("discription") %>' Font-Size="18px" Width="300px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtneditc" Width='35' Height='35' runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtneditb" Width='35' Height='35' runat="server" ImageUrl="images/edit.gif" OnClick="lnkviewrecord1" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtndela" Width='35' Height='35' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord"
                                            OnClientClick="return confirm('Are you sure to delete this record?');" />
                                        <br />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Left"
                                Font-Bold="True" Font-Italic="True" Font-Size="30px"
                                Font-Underline="False" Height="35px" Wrap="True" CssClass="GVPager" />
                            <%--CssClass = "GridPager"--%> <%--CssClass="GVPager"--%>
                            <%--<PagerSettings Mode="NextPrevious"  NextPageText="Next" PreviousPageText="Previous" />--%>
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                ForeColor="#00277a" Height="30px" />

                        </asp:GridView>
                </td>
            </tr>
        </table>
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
    </form>
</body>
</html>

