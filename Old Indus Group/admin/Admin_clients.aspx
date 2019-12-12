<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_clients.aspx.cs" Inherits="admin_Admin_clients" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Clients</title>
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
    <script language="javascript" type="text/javascript">
        function Sample() {
            var n = document.getElementById("GridView1").rows.length;
            var i;
            var j = 0;
            for (i = 2; i <= n; i++) {
                if (i < 10) {
                    if (document.getElementById("GridView1_ctl0" + i + "_chkselect").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("GridView1_ctl0" + i + "_chkselect").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
                else {
                    if (document.getElementById("GridView1_ctl" + i + "_chkselect").checked == true) {
                        if (j > 0) {
                            alert('you can select only one...');
                            document.getElementById("GridView1_ctl0" + i + "_chkselect").checked = false;
                        }
                        else {
                            j++;
                        }
                    }
                }
            }
        }
    </script>

    <script language="javascript" type="text/javascript">

        function alertdelete() {
            alert("You don't have rights to done this task !!!");
        }
    </script>

    <script type="text/javascript" language="javascript">
        function confirmMessageDelete(frm) {
            for (i = 0; i < frm.length; i++) {
                if (frm.elements[i].checked) {
                    return confirm("Are you sure you want to delete the selected record?");
                    return true;
                }
            }
            alert('select atleast one Checkbox for Delete!');
            return false;
        }
    </script>

    <script type="text/javascript" language="javascript">
        function selectOne(frm) {
            for (i = 0; i < frm.length; i++) {
                if (frm.elements[i].checked) {
                    return true;
                }
            }
            alert('select atleast one Checkbox for Edit!');
            return false;
        }
    </script>

    <script type="text/javascript" language="javascript">
        function selectOneView(frm) {
            for (i = 0; i < frm.length; i++) {
                if (frm.elements[i].checked) {
                    return true;
                }
            }
            alert('select atleast one Checkbox to View the details!');
            return false;
        }
    </script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/grdiviewScroll.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=GridView1.ClientID%>').gridviewScroll({

            width: 1000,
            freezesize: 2
        });
    }
    </script>

  <%--  <style>
        .pnlbg {
            border: 1px solid Gray;
        }

        #GridView1 {
            border: 1px solid Gray;
            padding: 2px;
        }

        .GridviewScrollHeader TH, .GridviewScrollHeader TD {
            color: #00277a;
            padding: 5px;
            font-weight: bold;
            white-space: nowrap;
            border-right: 1px solid #CCCCCC;
            border-bottom: 1px solid #CCCCCC;
            background-color: #EFEFEF;
            text-align: center;
            vertical-align: bottom;
        }

        .GridviewScrollItem TD {
            padding: 5px;
            white-space: nowrap;
            border-right: 1px solid #CCCCCC;
            border-bottom: 1px solid #CCCCCC;
            background-color: White;
        }

        .GridviewScrollPager {
            border-top: 1px solid #AAAAAA;
            background-color: #FFFFFF;
        }

            .GridviewScrollPager TD {
                padding-top: 3px;
                font-size: 14px;
                padding-left: 5px;
                padding-right: 5px;
            }

            .GridviewScrollPager A {
                color: #00277a;
            }

            .GridviewScrollPager SPAN {
                font-size: 16px;
                font-weight: bold;
            }
    </style>--%>

    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <%-- <link rel="stylesheet" href="Styles/normalize.css" />  --%>
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <center>
            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
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
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td id="Td1" runat="server" align="center" style="height: 30px" class="style24" width="90%">
                        <asp:Label ID="lblseminnartitle" runat="server" ForeColor="#00277a" Text="Clients List" Font-Bold="true" Font-Size="Large"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px; padding-right: 100px;" align="right">
                        <table style="width: 99px">
                            <tr id="trbuttons" runat="server">
                                <td>
                                    <asp:ImageButton ID="imgnew" runat="server" ToolTip="New Client" AlternateText="New" Height="20px" ImageUrl="images/new.jpg"
                                        Width="17px" OnClick="imgnew_Click" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="imgedit" runat="server" ToolTip="Edit"
                                        OnClientClick="return selectOne(this.form)" AlternateText="Edit" Height="20px" ImageUrl="images/edit.jpg"
                                        Width="17px" OnClick="imgedit_Click" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="imgdelete" runat="server" ToolTip="Delete"
                                        OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete"
                                        Height="20px" ImageUrl="images/1371_normalDelete_20_n_g.gif"
                                        Width="17px" OnClick="imgdelete_Click" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="imgview" runat="server" ToolTip="View"
                                        OnClientClick="return selectOneView(this.form)" AlternateText="View"
                                        ImageUrl="images/view.jpg" Height="20px" Width="21px"
                                        OnClick="imgview_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="Errmsg" align="right" class="lblog" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <%--<asp:Panel ID="pnlGrid" runat="server" Width="100%" CssClass="pnlbg oFlow">--%>
                            <asp:GridView ID="GridView1" runat="server" Width="100%"
                                AutoGenerateColumns="False" BorderColor="#E0E0E2" BorderStyle="None"
                                BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"
                                Font-Underline="False" BackColor="White"
                                AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="10"
                                PagerStyle-BackColor="White" DataKeyNames="cid"
                                OnPageIndexChanging="GridView1_PageIndexChanging">
                                <Columns>

                                    <asp:TemplateField ItemStyle-ForeColor="Gray" HeaderText="" ItemStyle-BorderColor="#CCCCCC">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle ForeColor="Gray" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Company">
                                        <ItemTemplate>
                                            <asp:Label ID="lbcompany" runat="server" Text='<%# Bind("companyname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" BorderColor="#CCCCCC" />

                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Supervisor Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("contactname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfiler" runat="server" Text='<%#Bind("filersname") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="E-mail">
                                        <ItemTemplate>
                                            <asp:Label ID="lblema" runat="server" Text='<%#Bind("email") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Font-Italic="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Website">
                                        <ItemTemplate>
                                            <a href='<%#Eval("URL") %>' target="_blank" style="color: Gray">
                                                <asp:Label ID="lblurl" runat="server" Text='<%#Bind("URL") %>' ForeColor="Gray"></asp:Label></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Tax ID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("emptaxid") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("telephone") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Work">
                                        <ItemTemplate>
                                            <asp:Label ID="lblwork" runat="server" Text='<%#Bind("work_phone") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Direct">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldirect" runat="server" Text='<%#Bind("direct_phone") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Fax">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfax" runat="server" Text='<%# Bind("fax") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" runat="server" Text='<%# Bind("address1") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="Labeldate" runat="server" Text='<%# Bind("city") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="State">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("state") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Zip">
                                        <ItemTemplate>
                                            <asp:Label ID="lblzip" runat="server" Text='<%# Bind("zip") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcountry" runat="server" Text='<%#Bind("country") %>' ForeColor="Gray"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" />
                                <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" />
                                <PagerStyle CssClass="GridviewScrollPager" />

                            </asp:GridView>
                        <%--</asp:Panel>--%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </center>
        <asp:Label ID="lbldid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
