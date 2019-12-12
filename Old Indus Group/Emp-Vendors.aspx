<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Vendors.aspx.cs" Inherits="Emp_Vendors" %>

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
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <%--<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />--%>
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
        <cc1:ToolkitScriptManager ID="tt" runat="server"></cc1:ToolkitScriptManager>

        <div class="container-fluide header-inner-wrap">
            <head:Header ID="Header1" runat="server" />
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <br />
                <br />
                <br />
                <cc3:topmenu ID="top1" runat="server"></cc3:topmenu>
            </div>
            <br />
            <br />


            <table width="100%" align="center">
                <tr>
                    <td align="center" width="100%" colspan="2">
                        <font color='#003399' size='6pt'><b>Vendor List</b></font>
                    </td>
                </tr>


                <tr>
                    <td align="center" valign="top" width="1500px" class="lable">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtsrchven" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnVendor" runat="server" Text="Search" OnClick="btnVendor_Click" />
                                </td>

                                <td style="font-size: 22px;">&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton" runat="server" Text="A" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="B" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" Text="C" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" Text="D" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton4" runat="server" Text="E" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton5" runat="server" Text="F" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton6" runat="server" Text="G" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton7" runat="server" Text="H" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton8" runat="server" Text="I" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton9" runat="server" Text="J" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton10" runat="server" Text="K" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton11" runat="server" Text="L" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton12" runat="server" Text="M" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton13" runat="server" Text="N" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton14" runat="server" Text="O" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton15" runat="server" Text="P" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton16" runat="server" Text="Q" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton17" runat="server" Text="R" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton18" runat="server" Text="S" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton19" runat="server" Text="T" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton20" runat="server" Text="U" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton21" runat="server" Text="V" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton22" runat="server" Text="W" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton23" runat="server" Text="X" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton24" runat="server" Text="Y" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton25" runat="server" Text="Z" OnClick="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Letter")%>'></asp:LinkButton>&nbsp;&nbsp;&nbsp;

                                </td>
                                <td>
                                    <asp:LinkButton ID="create" runat="server" Text="Create New Vendor" Font-Bold="true" Font-Underline="false" PostBackUrl="Emp-CreateVendor.aspx" Font-Size="22px"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br />
                        <hr />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top" width="90%" class="lable" colspan="3">
                        <%--<div style="height: auto; width: 1500px; overflow: auto;">--%>
                        <div>

                            <asp:GridView ID="MyGrid" runat="server" Width="90%" DataKeyNames="vid"
                                AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="14pt" Font-Strikeout="False"
                                Font-Underline="False" BackColor="White"
                                PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound"
                                OnPageIndexChanging="MyGrid_PageIndexChanging"
                                AllowPaging="true" PageSize="25" PagerSettings-Mode="Numeric">

                                <Columns>
                                      <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                        <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("vid") %>' />
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
                                    <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="300px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%--<%#  DataBinder.Eval(Container.DataItem, "Firm_Name")%>--%>
                                            <asp:LinkButton ID="lbl1" runat="server" Text='<%# Eval("Firm_Name") %>' Font-Size="17px" Width="200px" CommandName="ss" CommandArgument='<%# Eval("vid") %>' OnCommand="lbl1_Command"></asp:LinkButton>
                                            <%--<asp:Label ID="lbl1" runat="server" Text='<%# Eval("Firm_Name") %>' Font-Size="17px" Width="200px"></asp:Label>--%>

                                            <%--<span class="glyphicon glyphicon-pencil" style="vertical-align: top;"></span>--%>
                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact Person" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="180px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%--<%#  DataBinder.Eval(Container.DataItem, "name")%>--%>
                                            <asp:Label ID="lbl333" runat="server" Text='<%# Eval("name") %>' Font-Size="17px" Width="180px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Designation" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%--<%#  DataBinder.Eval(Container.DataItem, "title")%>--%>
                                            <asp:Label ID="lbl3333" runat="server" Text='<%# Eval("title") %>' Font-Size="17px" Width="60px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="17px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="150px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%--<%#  DataBinder.Eval(Container.DataItem, "venmail")%>--%>
                                            <asp:Label ID="lbl33331" runat="server" Text='<%# Eval("venmail") %>' Font-Size="17px" Width="320px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Mobile" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Font-Size="18px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("mobile") %>' Font-Size="17px" Width="120px"></asp:Label>

                                        </ItemTemplate>
                                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                    </asp:TemplateField>



                                <%--    <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle ForeColor="Gray" Font-Size="18px" Font-Names="arial" VerticalAlign="Middle" Width="6%" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkactivate" runat="server" ForeColor="Green" CommandArgument='<%# Eval("vid") %>' OnCommand="lnkactivate" Width="80px"></asp:LinkButton>
                                            &nbsp; 
                                 <br />
                                        </ItemTemplate>
                                        <ItemStyle Width="8%"></ItemStyle>
                                    </asp:TemplateField>--%>




                                </Columns>
                                <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                    Font-Strikeout="False" Font-Underline="False" />
                                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                    Font-Bold="True" Font-Italic="True" Font-Size="X-Large"
                                    Font-Underline="False" />
                                <%--CssClass = "GridPager"--%> <%--CssClass="GVPager"--%>
                                <%--<PagerSettings Mode="NextPrevious"  NextPageText="Next" PreviousPageText="Previous" />--%>
                                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                    ForeColor="#00277a" Height="30px" />

                            </asp:GridView>
                        </div>

                    </td>
                </tr>


                <tr>
                    <td height="10px">&nbsp;</td>
                </tr>
            </table>



            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
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
