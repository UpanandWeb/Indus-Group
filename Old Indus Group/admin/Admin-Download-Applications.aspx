<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Download-Applications.aspx.cs" Inherits="admin_Admin_Download_Applications" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .sign {
            border: 0;
            outline: 0;
            background: transparent;
            border-bottom: 1px solid black;
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
<body>
    <form id="form1" runat="server">
        <div>
            <table width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
                <tr width="100%">
                    <td valign="top" width="100%" class="lblog">
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="30px" align="center">
                        <hr />
                    </td>
                </tr>

                <tr>
                    <td height="30px" align="center">
                        <asp:RadioButton ID="h1checklist" runat="server" Text="H-1B PETITION CHECKLIST"  GroupName="h1b" OnCheckedChanged="h1checklist_CheckedChanged" AutoPostBack="true" />
                        <asp:RadioButton ID="h4application" runat="server" Text="H4 APPLICATION CHECKLIST" GroupName="h1b" OnCheckedChanged="h4application_CheckedChanged" AutoPostBack="true" />
                        <asp:RadioButton ID="h1information" runat="server" Text="H-1B INFORMATION SHEET" GroupName="h1b" OnCheckedChanged="h1information_CheckedChanged" AutoPostBack="true" />
                        <asp:RadioButton ID="downloadfile" runat="server" Text="Download Filled Applications" GroupName="h1b" OnCheckedChanged="downloadfile_CheckedChanged" AutoPostBack="true" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td height="30px" align="center"></td>
                </tr>
                <tr>
                    <td height="30px" align="center">
                        <h3>Download Filled Applications</h3>
                    </td>
                </tr>
                <tr>
                    <td height="10px" align="center"></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                            Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" AllowPaging="true" PageSize="25"
                            PagerStyle-Mode="NumericPages" DataKeyNames="aid" PagerStyle-BackColor="White"  OnPageIndexChanging="GridView1_PageIndexChanging"
                           >
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                    <ItemStyle Width="4%" />
                                    <HeaderStyle Width="4%" />
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                    HeaderStyle-Width="10%" ItemStyle-Width="10%"
                                    SortExpression="cname">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <%#  DataBinder.Eval(Container.DataItem, "fname")%>&nbsp;
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Email ID" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="invoice">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblJoindateb9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"emailid")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Application Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="20%" ItemStyle-Width="20%" >
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblJoindatebt9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"applicationname")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Posted Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblJoindateww9" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"date")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Download" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                    HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkactivate" runat="server" Text="Download" ForeColor="Green" CommandArgument='<%# Eval("aid") %>' OnCommand="lnkactivate_Command"></asp:LinkButton>
                                        &nbsp; 
                                   <br />
                                    </ItemTemplate>
                                    <ItemStyle></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="imgbtndel_Click" />
                                        <br />
                                    </ItemTemplate>
                                    <ItemStyle></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                            <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                Font-Strikeout="False" Font-Underline="False" />
                            <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Left"
                                Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                Font-Underline="False" Height="20px" Wrap="True" />
                            <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                            <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="#00277a"
                                ForeColor="#00277a" Height="30px" />
                        </asp:GridView>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
