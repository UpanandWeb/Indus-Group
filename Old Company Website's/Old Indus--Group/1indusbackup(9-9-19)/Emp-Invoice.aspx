<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Invoice.aspx.cs" Inherits="Emp_Invoice" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Usercontrols/CommonControl.ascx" TagPrefix="uc2" TagName="CommonControl" %>


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
        <div >
            <%--<head:Header ID="Header1" runat="server"></head:Header>--%>
        </div>
        <hr />
                <%--<cc3:topmenu ID="top1" runat="server"></cc3:topmenu>--%>
              <uc2:CommonControl ID="common" runat="server" />

        <br />
        <center>
            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>
            <table width="90%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr>
                    <td height="30px"></td>
                </tr>
                <tr>
                    <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable">
                        <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td align='center' bgcolor='white' width='70%'><font color='#003399' size='6pt'><b><u>Clients/Vendors List</u></b></font> </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="20px"></td>
                </tr>
                <tr>
                    <td height="30px">
                        <table border="0" width="100%">
                            <tr>
                                <td height="20px"></td>
                            </tr>

                            <tr>
                                <td align="center" height="20px" width="20%">
                                    <asp:LinkButton ID="lnkbtncurrent" runat="server" OnClick="lnkbtncurrent_Click" Font-Size="20px"><b>Clients</b></asp:LinkButton>
                                </td>
                                <td align="center" height="20px" width="20%">
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Size="20px"><b>Vendors</b></asp:LinkButton>
                                </td>
                                <td align="center" height="20px" width="20%">
                                    <asp:LinkButton ID="lnkbtnpre" runat="server" OnClick="lnkbtnpre_Click" Font-Size="20px"><b>Previous Clients/Vendors</b></asp:LinkButton>
                                </td>
                                <td align="center" height="20px" width="20%">
                                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-Size="20px"><b>Add New Clients/Vendors</b></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td height="30px"></td>
                </tr>

                <tr>
                    <td align="right" bgcolor="white" width="100%" style="padding-right: 10px"><font color='#003399' size='2pt'></font></td>
                </tr>

                <tr id="trnew1" runat="server" visible="false">
                    <td>
                        <table width="100%" border='0' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" bgcolor='white' width='70%'><font color='#003399' size='5pt'><b>Current Vendors</b></font> </td>
                            </tr>
                            <tr>
                                <td align="right">
                                  <asp:LinkButton ID="lnkdownload" runat="server" Text="Export Vendors" Font-Underline="false" Font-Size="16px" OnClick="lnkdownload_Click" > </asp:LinkButton>&nbsp;&nbsp;

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trnew2" runat="server" visible="false">
                    <td id="td3" runat="server" valign="top" >
                        <table width="100%" align="center">
                            <tr>
                                <td width="5px">&nbsp;
                                </td>
                                <td width="100%" align="center" class="th">
                                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" AllowPaging="true" PageSize="25"
                                        PagerStyle-Mode="NumericPages" DataKeyNames="sno" PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound1" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        AllowSorting="true" OnSorting="gridviewSorting_Sorting1" OnRowCommand="GridView1_RowCommand">
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

                                            <asp:TemplateField HeaderText="Vendor" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                                HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                                                       <%#  DataBinder.Eval(Container.DataItem, "elname")%>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="timesheet">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatea9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
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

                                           <%-- <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="invoiceperiod">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName555" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>

                                             <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" >
                                                  <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="btnFamily12h" OnClick="btnFamily1_Clickp"  Text="Invoice Period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="btnFamilyh" OnClick="btnFamily_Clickp"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="btnFamily1h" OnClick="btnFamily1_Clickp"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName555" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                          <%--  <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="tspendingperiod">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName566" runat="server" Text='<%#Eval("tspendingperiod").ToString() +"- "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>

                                            <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%"
                                                HeaderText="Timesheet Pending period (From - To) Color / Date" SortExpression="tspc1" >
                                                <%--<HeaderTemplate>
                                                   <asp:LinkButton runat="server" ID="btnFamily12" OnClick="btnFamily1_Click"  Text="Timesheet Pending period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="btnFamily" OnClick="btnFamily_Click"  Text="Color"  ForeColor="#00277A"  /> /

                                                    <%--<asp:LinkButton runat="server" ID="btnFamily1" OnClick="btnFamily1_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 <%--</HeaderTemplate>--%>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName566" runat="server" Text='<%#Eval("tspendingperiod").ToString() +"- "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                               <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                   HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" >

                                                   <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="LinkButton3" OnClick="btnFamily1_Clickpp"  Text="Invoice Date" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="LinkButton4" OnClick="btnFamily_Clickpp"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="LinkButton5" OnClick="btnFamily1_Clickpp"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate9" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                               <asp:TemplateField HeaderText="Actual Hours" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblhourwww" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"actualhours")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblhour" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="OT Hours" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblhourwwwer" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"othours")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww8aaassss" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                           <%-- <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="14%" ItemStyle-Width="14%" >
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww9" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>

                                             <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="14%" ItemStyle-Width="14%" >
                                                   <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="LinkButton3p" OnClick="btnFamily1_Clickppp"  Text="Remarks" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="LinkButton4p" OnClick="btnFamily_Clickppp"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="LinkButton5p" OnClick="btnFamily1_Clickppp"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww9" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>


                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkactivate"  OnClientClick="return confirm('Are you sure you want to update status?');" runat="server" Text="Active" ForeColor="Green" CommandArgument='<%# Eval("sno") %>' CommandName="lnkactivatedata" ></asp:LinkButton>
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
                                                    <asp:ImageButton ID="imgedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgedit1_Click" />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>

                                          <%--  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
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
                                <td width="4px">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="2px">&nbsp;</td>
                </tr>

                <tr id="trcurr1" runat="server">
                    <td id="td2" runat="server" align="center" valign="top" width="100%" class="lable">
                        <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" bgcolor='white' width='70%'><font color='#003399' size='5pt'><b>Current Clients</b></font> </td>
                                 <td align="right">
                                  <asp:LinkButton ID="lnkdownload1" runat="server" Text="Export Clients" Font-Underline="false" Font-Size="16px" OnClick="lnkdownload1_Click"> </asp:LinkButton>&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="10px"></td>
                </tr>

                <tr id="trcurr2" runat="server">
                    <td id="tdcontent1" runat="server" align="left" valign="top" class="lable">
                        <table width="100%" align="center">
                            <tr>
                                <td width="5px">&nbsp;
                                </td>
                                <td width="100%">
                                    <asp:GridView ID="MyGrid" runat="server" Width="100%" DataKeyNames="sno" AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                        BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" OnPageIndexChanging="MyGrid_PageIndexChanging"
                                        Font-Underline="False" BackColor="White" AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="25" PagerStyle-BackColor="White" 
                                        OnRowDataBound="MyGrid_RowDataBound"  AllowSorting="true" OnSorting="gridviewSorting_Sorting" OnRowCommand="MyGrid_RowCommand">
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

                                            <asp:TemplateField HeaderText="Client" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                                                   <%#  DataBinder.Eval(Container.DataItem, "elname")%>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="6%" ItemStyle-Width="6%" 
                                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="timesheet">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatea" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%"
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoice">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateb" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" ItemStyle-Width="10%"
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="rinvoiceduration">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatebt" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" ItemStyle-Width="10%"
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoicedates">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatebf" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <%--<asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%" 
                                                ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoiceperiod">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName11" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>

                                            <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%" 
                                                ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >

                                                  <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="sbtnFamily122w" OnClick="sbtnFamily11_Click"  Text="Invoice Period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="sbtnFamily22" OnClick="sbtnFamily12_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="sbtnFamily122" OnClick="sbtnFamily11_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName11" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>


<%--                                            <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%"
                                                 ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="tspendingperiod">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName112" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>
                                            
                                            
                                          <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%"
                                                 ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >
                                               <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="btnFamily122w" OnClick="btnFamily11_Click"  Text="Timesheet Pending period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="btnFamily22" OnClick="btnFamily12_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="btnFamily122" OnClick="btnFamily11_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName112" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                                

                                        <%--     <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%"
                                                  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>


                                                 <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%"
                                                  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >
                                                     <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="asbtnFamily122w" OnClick="asbtnFamily11_Click"  Text="Invoice Date" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="asbtnFamily22" OnClick="asbtnFamily12_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="asbtnFamily122" OnClick="asbtnFamily11_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                             

                                            <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                   $ <asp:Label ID="lblhour1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Overtime" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww8aaass" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                        <%--    <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="14%" ItemStyle-Width="14%" 
                                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                              
                                                  <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>


                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="14%" ItemStyle-Width="14%" 
                                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" >

                                                     <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="rasbtnFamily122w" OnClick="rasbtnFamily11_Click"  Text="Remarks" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="rasbtnFamily22" OnClick="rasbtnFamily12_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="rasbtnFamily122" OnClick="rasbtnFamily11_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                  <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww" ForeColor="gray" Style="text-decoration: none" runat="server" Width="200px"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                             
                                            <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkactivateclient" OnClientClick="return confirm('Are you sure you want to update status?');" runat="server" Text="Active" ForeColor="Green" CommandArgument='<%# Eval("sno") %>' CommandName="client" ></asp:LinkButton>
                                                    &nbsp; 
                                   <br />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnedit" Width='20' Height='20' runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord" />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgedit2" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgedit2_Click" />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>

                                         <%--   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                                                    <br />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>--%>

                                        </Columns>
                                        <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                        <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                            Font-Strikeout="False" Font-Underline="False" />
                                        <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                            Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                            Font-Underline="False" Height="15px" Wrap="True" />
                                        <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                        <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue"
                                            ForeColor="#00277a" Height="30px" />
                                    </asp:GridView>
                                </td>
                                <td width="4px">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="2px">&nbsp;</td>
                </tr>


                <tr id="trpre1" runat="server" visible="false">
                    <td>
                        <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" bgcolor='white' width='70%'><font color='#003399' size='5pt'><b>Previous Clients/Vendors</b></font> </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>

                        </table>
                    </td>
                </tr>

                <tr id="trpre2" runat="server" visible="false">
                    <td id="td1" runat="server" align="left" valign="top" class="lable">
                        <table width="100%" align="center">
                            <tr>
                                <td width="5px">&nbsp;
                                </td>
                                <td width="100%">
                                    <asp:GridView ID="MyGridDeactivate" runat="server" Width="100%" AllowPaging="true" PageSize="25" DataKeyNames="sno" AutoGenerateColumns="False" BorderColor="#CCCCCC"
                                        BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White"
                                        PagerStyle-Mode="NumericPages" PagerStyle-BackColor="White" OnRowDataBound="MyGridDeactivate_RowDataBound" GridLines="Both" 
                                        OnPageIndexChanging="MyGridDeactivate_PageIndexChanging" AllowSorting="true" OnSorting="gridviewSorting_Sorting2" OnRowCommand="MyGridDeactivate_RowCommand">
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

                                            <asp:TemplateField HeaderText="Client/Vendor" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "ctype")%>&nbsp;
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                                                    <%#  DataBinder.Eval(Container.DataItem, "elname")%>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="timesheet">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatea8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%" SortExpression="invoice">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateb8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="rinvoiceduration">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatebt8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="invoicedates">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindatebf8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <%--<asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="invoiceperiod">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName56621" runat="server" Text='<%#Eval("invoiceperiod").ToString() +" - "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>--%>

                                            <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" >
                                                <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="dbtnFamily122w1" OnClick="dbtnFamily111_Click"  Text="Invoice Period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="dbtnFamily221" OnClick="dbtnFamily121_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="dbtnFamily1221" OnClick="dbtnFamily111_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName56621" runat="server" Text='<%#Eval("invoiceperiod").ToString() +" - "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>

                                         <%--   <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC"  SortExpression="tspendingperiod"
                                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName56633" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>--%>
                                               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%">
                                                     <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="btnFamily122w1" OnClick="btnFamily111_Click"  Text="Timesheet Pending period (From - To)" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="btnFamily221" OnClick="btnFamily121_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="btnFamily1221" OnClick="btnFamily111_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName56633" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>

                                            
                                              <%--   <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                  HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>--%>

                                               <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                  HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" >
                                                     <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="edbtnFamily122w1" OnClick="edbtnFamily111_Click"  Text="Invoice Date" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="edbtnFamily221" OnClick="edbtnFamily121_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="edbtnFamily1221" OnClick="edbtnFamily111_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>
                                                 </HeaderTemplate>

                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                   $ <asp:Label ID="lblhour2" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                   $ <asp:Label ID="lblot3" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww8aaa" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                        <%--    <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                                HeaderStyle-Width="12%" ItemStyle-Width="12%" >
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>--%>
                                                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                                                HeaderStyle-Width="12%" ItemStyle-Width="12%" >
                                                     <HeaderTemplate>
                                                     <asp:LinkButton runat="server" ID="fedbtnFamily122w1" OnClick="fedbtnFamily111_Click"  Text="Remarks" ForeColor="#00277A" /> &nbsp;
                                                     <asp:LinkButton runat="server" ID="fedbtnFamily221" OnClick="fedbtnFamily121_Click"  Text="Color"  ForeColor="#00277A" /> /
                                                    <asp:LinkButton runat="server" ID="fedbtnFamily1221" OnClick="fedbtnFamily111_Click"  Text="Date"  ForeColor="#00277A"></asp:LinkButton>

                                                 </HeaderTemplate>
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindateww8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdeactivate" OnClientClick="return confirm('Are you sure you want to update status?');" runat="server" Text="Deactive" ForeColor="Green" CommandName="deactiv" CommandArgument='<%# Eval("sno") %>' ></asp:LinkButton>
                                                    &nbsp; 
                                   <br />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnedit" Width='20' Height='20' runat="server" ImageUrl="images/preview.png" OnClick="lnkviewrecord2" />
                                                </ItemTemplate>
                                                <ItemStyle Width="5%"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgedit3" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="imgedit3_Click" />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>

                                          <%--  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord2" />
                                                    <br />
                                                </ItemTemplate>
                                                <ItemStyle></ItemStyle>
                                            </asp:TemplateField>--%>

                                        </Columns>
                                        <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                                        <RowStyle CssClass="datagrid-2" Font-Size="8pt"
                                            Font-Strikeout="False" Font-Underline="False" />
                                        <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="right"
                                            Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                            Font-Underline="False" Height="20px" Wrap="True" />
                                        <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                        <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="#00277a"
                                            ForeColor="#00277a" Height="30px" />
                                    </asp:GridView>
                                </td>
                                <td width="4px">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="2px">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="lblerror" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>

                <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
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

