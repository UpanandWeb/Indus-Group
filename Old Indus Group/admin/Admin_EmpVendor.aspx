<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpVendor.aspx.cs" Inherits="Admin_EmpVendor" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel -EmpVendor</title>

    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
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

    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <link href="includes/styles.css" type="text/css" rel="stylesheet" />
    <link href="includes/menu.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheet_new.css" rel="stylesheet" type="text/css" />

</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>

            <tr>
                <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable">



                    <table width="100%">
                        <tr height="19">
                            <td width="100%" align="left" class="toplft" height="15"></td>
                        </tr>
                        <tr height="190">
                            <td align="left" class="border" valign="top" width="100%" style="height: 190px;">
                                <table width="100%" height="229" border="0">
                                    <tr height="19">

                                        <td colspan="2" class="headings" width="100%" style="height: 15px">Current Vendor Details</td>

                                    </tr>

                                    <tr>
                                        <td width='33%' valign="top">
                                            <table>
                                                <tr>
                                                    <td colspan="2" class="headings">Company Information
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 24px; width: 73px;" class="lable5">Name</td>
                                                    <td style="height: 24px" class="lable6">
                                                        <asp:Label ID="txtname" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Industry </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="industry" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Address </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="addr" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 73px; height: 20px;" class="lable5">Location</td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="location" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 73px; height: 20px;" class="lable5">Country</td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="country" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Phono No. </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="phno" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Email-Id</td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="txtemail" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Website </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="website" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>







                                            </table>
                                        </td>

                                        <td width="1%"></td>

                                        <td width='33%' valign="top">

                                            <table>

                                                <tr>
                                                    <td colspan="2" class="headings">Accounts Manager Information&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 24px; width: 73px;" class="lable5">Name</td>
                                                    <td style="height: 24px" class="lable6">
                                                        <asp:Label ID="Label1" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Address </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label3" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Phone No </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label4" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Mobile No</td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label5" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Email-ID </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label6" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td style="width: 73px" class="lable5">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2" height="17" align="center" class="lable5"></td>
                                                </tr>


                                            </table>

                                        </td>

                                        <td width="2px"></td>


                                        <td width="33%" valign="top">
                                            <table>
                                                <tr>
                                                    <td colspan="2" class="headings">Recruiter Information
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="height: 24px; width: 73px;" class="lable5">Name</td>
                                                    <td style="height: 24px" class="lable6">
                                                        <asp:Label ID="Label14" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Address </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label16" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Phone No </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label17" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Mobile No</td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label18" runat="server" CssClass="lable6" Width="172px" Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">Email ID </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="Label19" runat="server" CssClass="lable6" Width="172px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td style="width: 73px" class="lable5">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2" height="17" align="center" class="lable5"></td>
                                                </tr>

                                            </table>
                                        </td>

                                    </tr>



                                    <tr>
                                        <td width='33%' valign="top" colspan="5">
                                            <table>
                                                <tr>
                                                    <td style="height: 20px; width: 73px;" class="lable5">About Company </td>
                                                    <td style="height: 20px" class="lable6">
                                                        <asp:Label ID="abtcomp" runat="server" CssClass="lable6" Width="646px"
                                                            Height="20px" BorderColor="Transparent" BorderStyle="None"></asp:Label>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>



                                    </tr>



                                </table>


                            </td>
                        </tr>

                        <tr>
                            <td></td>
                        </tr>

                        <tr>
                            <td class="headings">Previous Vendor Details</td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>

                                <asp:GridView ID="GridCysto" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" CssClass="headings">
                                    <Columns>


                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnedit" NavigateUrl='<%# ViewUrl ( (int) Eval("id") ) %>' Text="View" CssClass="data" runat="server"></asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="data" Width="30" HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnedit" NavigateUrl='<%# EditUrl ( (int) Eval("id") ) %>' Text="Edit" CssClass="data" runat="server"></asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="data" Width="30" HorizontalAlign="Left" />
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnedit" NavigateUrl='<%# DeleteUrl ( (int) Eval("id") ) %>' Text="Delete" CssClass="data" runat="server"></asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="data" Width="30" HorizontalAlign="Left" />
                                        </asp:TemplateField>


                                        <asp:BoundField HeaderText="Company Name" DataField="companyname" />
                                        <asp:BoundField HeaderText="WebSite" DataField="cwebsite" />
                                        <asp:BoundField HeaderText="Industry" DataField="indtype" />
                                        <asp:BoundField HeaderText="Manager Name" DataField="clientname" />
                                        <asp:BoundField HeaderText="EmailId" DataField="clemailid" />

                                        <asp:BoundField HeaderText="Recruiter Name" DataField="suname" />
                                        <asp:BoundField HeaderText="EmailId" DataField="suemailid" />

                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>

                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
            <tr>
                <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"></td>
            </tr>



        </table>


    </form>
</body>
</html>
