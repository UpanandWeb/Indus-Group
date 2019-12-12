<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-IndUserDetails.aspx.cs" Inherits="admin_Admin_IndUserDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - UserDetails</title>
     <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
        }

        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete ' + username + ' record Details');
            if (result) {

                return true;
            }
            else {
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
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <style type="text/css">
        .style24 {
            height: 15px;
        }
    </style>
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

        .style24 {
            color: #7a7a7b;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            text-decoration: none;
            height: 29px;
        }

        #empdata td {
            border: 0.1px solid #CCCCCC;
        }

        #empdata th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />
</head>
<body>
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" height="30px"><font color='#003399' size='5pt'><b>Employee Details</b></font></td>
                 
            </tr>
            
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>

            <tr>
                <td align="center">

                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="gv" runat="server" Width="1450px" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                DataKeyNames="userid"     Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="30"
                                    PagerStyle-BackColor="White" OnPageIndexChanging="empdata_PageIndexChanging" >
                                    <Columns>
                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" ForeColor="Gray" Text='<%# Bind("Empid") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl2" ForeColor="Gray" Text='<%# Bind("empname") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />

                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Join Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl3" ForeColor="Gray" Text='<%# Bind("joindate") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Ph. Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl4" ForeColor="Gray" Text='<%# Bind("mobile") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />

                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Email Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl5" ForeColor="Gray" Text='<%# Bind("emailid") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Hourly Rate">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl6" ForeColor="Gray" Text='<%# Bind("hrate") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl7" ForeColor="Gray" Text='<%# Bind("rdate") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl8" ForeColor="Gray" Text='<%# Bind("street") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>


                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Bank Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl9" ForeColor="Gray" Text='<%# Bind("bankname") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Routing Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl10" ForeColor="Gray" Text='<%# Bind("bankswift") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Account Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl11" ForeColor="Gray" Text='<%# Bind("bankacnumber") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>


                                        
        
      

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgbtnedit1_Click"  />
                                            </ItemTemplate>
                                            <ItemStyle Width="3%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="imgbtndel_Click"  />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>

                                    </Columns>
                                    <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                                    <RowStyle CssClass="datagrid-2" Font-Size="9pt" HorizontalAlign="Center"
                                        Font-Strikeout="False" Font-Underline="False" />
                                    <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                        Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                        Font-Underline="False" Height="20px" Wrap="True" />
                                    <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                    <HeaderStyle BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue"
                                        ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
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
    </form>
</body>
</html>
