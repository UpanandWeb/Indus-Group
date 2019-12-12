<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Account-Reports.aspx.cs" Inherits="admin_Admin_Account_Reports" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - India Employees</title>
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

<body topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="tl" runat="server"></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
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
                   <span style="color:red">*</span> Fields are Mandatory
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
                <td height="20px" align="center">Select Employee <span style="color:red">*</span>:
                    <asp:DropDownList ID="ddemp" runat="server" Width="150px" AutoPostBack="true" OnTextChanged="ddemp_TextChanged" >
                        <asp:ListItem>Select Employee</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
                <td height="20px" align="center">Select Report Type <span style="color:red">*</span>:
                    <asp:DropDownList ID="ddt" runat="server" Width="150px" AutoPostBack="true" OnTextChanged="ddt_TextChanged">
                        <%--AutoPostBack="true" OnSelectedIndexChanged="ddc_SelectedIndexChanged"--%>
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Billing Rate</asp:ListItem>
                    </asp:DropDownList> &nbsp; <asp:Label ID="lblerror" runat="server" ></asp:Label>
                </td>
                <%--<td>OR </td>
                <td align="center" id="ind" runat="server">Search Employee By First Name :  
                    <asp:TextBox ID="txtserch" runat="server" Height="25px" Width="200px" Font-Size="14px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtserch"
                        WatermarkText="Search Employees with First Name" />
                    <cc1:AutoCompleteExtender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"
                        CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="txtserch"
                        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                    </cc1:AutoCompleteExtender>
                    <asp:Button ID="btnsearch" runat="server" Text="Search" Height="25px" Width="60px" OnClick="btnsearch_Click" />
                </td>--%>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
                <td height="20px" align="center">
                    <asp:Button ID="btnsearch" runat="server" Text="Search" Width="80px" Font-Size="18px" OnClick="btnsearch_Click1"></asp:Button>
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
             <tr>
                <td height="20px" align="center">
                    <%--<asp:Label ID="lblerror" runat="server" ></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
                <td>
                    <table >
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                             <asp:LinkButton ID="active" runat="server" Text="Active Records" Font-Underline="false" Font-Size="18px" OnClick="active_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                             <asp:LinkButton ID="inactive" runat="server" Text="Inactive Records" Font-Underline="false" Font-Size="18px" OnClick="inactive_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                       
                                             <asp:LinkButton ID="actdownload" runat="server" Text="Download to Excel Sheet" Font-Underline="false" Font-Size="18px" OnClick="actdownload_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                              <asp:LinkButton ID="inactdownload" runat="server" Text="Download to Excel Sheet" Font-Underline="false" Font-Size="18px" OnClick="inactdownload_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                              <asp:LinkButton ID="empdownload" runat="server" Text="Download to Excel Sheet" Font-Underline="false" Font-Size="18px" OnClick="empdownload_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="20px"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" 
                                    PagerStyle-Mode="NumericPages" DataKeyNames="sno" PagerStyle-BackColor="White" 
                                    AllowSorting="true" OnSorting="gridviewSorting_Sorting1">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%--<asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />--%>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <ItemStyle Width="4%" />
                                            <HeaderStyle Width="4%" />
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                       

                                        <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                                                                 <%#  DataBinder.Eval(Container.DataItem, "elname")%>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                          <asp:TemplateField HeaderText="Employee Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindateww8aaassss" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Company" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%"
                                            SortExpression="cname">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Cycle" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="invoicecycle">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatea9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"invoicecycle")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                       <%-- <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%" SortExpression="invoice">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindateb9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="rinvoiceduration">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatebt9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="invoicedates">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatebf9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC"
                                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="invoiceperiod">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblName555" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="tspendingperiod">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblName566" runat="server" Text='<%#Eval("tspendingperiod").ToString() +"- "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="idate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindate9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="hrate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                $ 
                                                <asp:Label ID="lblhour" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <%-- <asp:TemplateField HeaderText="Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="timesheet">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatea9sss" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"invoicecycle")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>--%>

                                         <asp:TemplateField HeaderText="Net Period" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="netperiod">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatea9jkk" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"netperiod")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Overtime" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                $ 
                                                <asp:Label ID="lblot" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Start Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="14%" ItemStyle-Width="14%" SortExpression="startdate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatea9jkkss" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"startdate")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="End Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-Width="14%" ItemStyle-Width="14%" SortExpression="enddate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindatea9jkkssaa" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"enddate")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="Vendor_Remarks">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindateww9" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"Vendor_Remarks")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Remarks1" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="14%" ItemStyle-Width="14%" SortExpression="remarks11">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJoindateww9qq" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"remarks11")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                      <%--  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkactivate" runat="server" Text="Active" ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate"></asp:LinkButton>
                                                &nbsp; 
                                           <br />
                                            </ItemTemplate>
                                            <ItemStyle></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnedit" Width='20' Height='20' runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord1" />
                                            </ItemTemplate>
                                            <ItemStyle></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                                                    <img src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord1" />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle></ItemStyle>
                                        </asp:TemplateField>--%>

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
                        <tr>
                            <td>
                                <asp:GridView ID="MyGrid" runat="server" Width="100%" DataKeyNames="vid"
                                    AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="White"
                                    PagerStyle-BackColor="White"    PagerSettings-Mode="Numeric"  AllowSorting="true" OnSorting="gridviewSorting_Sorting2">
                                    <Columns>
                                               <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="60" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%--<asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />--%>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                            <ItemStyle Width="4%" />
                                            <HeaderStyle Width="4%" />
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                             HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                                            <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="200px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333" runat="server" Text='<%# Eval("cname") %>' Font-Size="11px" Width="200px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Email Id" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                                HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="cemail">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="80px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#  DataBinder.Eval(Container.DataItem, "cemail")%>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                             HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="firm_name">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="300px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Eval("Firm_Name") %>' Font-Size="11px" Width="200px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Cycle" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="9%" ItemStyle-Width="9%" SortExpression="invoicecycle">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="150px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#  DataBinder.Eval(Container.DataItem, "invoicecycle")%>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                             HeaderStyle-Width="2%" ItemStyle-Width="2%" SortExpression="hourrate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333m" runat="server" Text='<%# Eval("hourrate") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                       

                                         <asp:TemplateField HeaderText="Net Period" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                             HeaderStyle-Width="2%" ItemStyle-Width="2%" SortExpression="NetPeriod">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333maax" runat="server" Text='<%# Eval("NetPeriod") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="OT Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                              HeaderStyle-Width="2%" ItemStyle-Width="2%" SortExpression="otrate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333mdsfs" runat="server" Text='<%# Eval("otrate") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Start Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                              HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="StartDate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333maae" runat="server" Text='<%# Eval("StartDate") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="End Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                              HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="EndDate">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333maaw" runat="server" Text='<%# Eval("EndDate") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                             HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="Remarks">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333maaq" runat="server" Text='<%# Eval("Remarks") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Remarks1" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="Remarks1">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="100px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl333maaf" runat="server" Text='<%# Eval("Remarks1") %>' Font-Size="11px" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                        </asp:TemplateField>

<%--                                        <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkactivate" runat="server" ForeColor="Green" CommandArgument='<%# Eval("vid") %>' OnCommand="lnkactivate1" Width="100px"></asp:LinkButton>
                                                &nbsp; 
                                                  <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="8%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtneditc"  runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord" />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtneditb"  runat="server" ImageUrl="images/edit.gif" OnClick="lnkviewrecord121" />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndela"  runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                    <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                        Font-Strikeout="False" Font-Underline="False" />
                                    <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Left"
                                        Font-Bold="True" Font-Italic="True" Font-Size="30px" 
                                        Font-Underline="False" Height="35px" Wrap="True" CssClass="GVPager" />
                                    <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                    <HeaderStyle CssClass="label5" BackColor="#f0f0f0"  BorderColor="Blue"
                                        ForeColor="#00277a" Height="30px" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

