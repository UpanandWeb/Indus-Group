<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndTimesheet-Remarks.aspx.cs" Inherits="IndTimesheet_Remarks" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <%--<cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>--%>
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
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>
               

                <table width="100%" align="center">
                    <tr>
                        <td align="center">
                            <font color='#003399' size='6pt'><b>Employee Leave Details</b></font>
                        </td>
                    </tr>

                    <tr><td height="30px">&nbsp;</td></tr>

                    <tr>
                        <td width="100%" align="center">
                            <table width="100%" align="center">
                                 <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="Label1" runat="server" Text="Employee Name" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:TextBox ID="txtempname" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>
                          <tr><td height="7px">&nbsp;</td></tr>
                             <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="Label2" runat="server" Text="Employee ID" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:TextBox ID="txtid" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>
                          <tr><td height="7px">&nbsp;</td></tr>

                             <tr>
                              <td width="40%" align="right" >
                                  <asp:Label ID="lblemail" runat="server" Text="Employee Email" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left" >
                                  <asp:TextBox ID="txtemail" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>
                          <tr><td height="7px">&nbsp;</td></tr>

                                <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="lblempname" runat="server" Text="Leave Type" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:DropDownList ID="ddtype" runat="server" Width="320px" Font-Size="18px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="ddtype_SelectedIndexChanged">
                                      <asp:ListItem>Select</asp:ListItem>
                                      <asp:ListItem>Holiday</asp:ListItem>
                                      <asp:ListItem>Leave</asp:ListItem>
                                      <asp:ListItem>Sunday</asp:ListItem>
                                      <asp:ListItem>Saturday</asp:ListItem>

                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr><td height="7px">&nbsp;</td></tr>
                             <tr runat="server" id="leave1" visible="false" >
                              <td width="40%" align="right">
                                  <asp:Label ID="lblid" runat="server" Text="Leave Date" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:TextBox ID="txtdate" runat="server" Font-Size="18px" Width="320px"  AutoCompleteType="Disabled"></asp:TextBox>
                                  <cc1:CalendarExtender ID="ccal" runat="server" TargetControlID="txtdate" Format="MM-dd-yyyy" ></cc1:CalendarExtender>
                              </td>
                          </tr>
                                <tr><td height="7px">&nbsp;</td></tr>
                                
                         <tr runat="server" id="leave" visible="false" >
                             <td colspan="3" width="100%" align="center">
                                 <table width="100%" align="center">
                                     <tr>
                            <td width="20%" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Leave From Date " Font-Size="18px"></asp:Label>
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtfrom" runat="server" Font-Size="18px" Width="160px" AutoCompleteType="Disabled" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfrom" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                            </td>
                              <td width="20%" align="right">
                                <asp:Label ID="Label4" runat="server" Text="TO Date " Font-Size="18px"></asp:Label>
                            </td>
                            <td width="10%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="20%" align="left">
                                <asp:TextBox ID="txtto" runat="server" Font-Size="18px" Width="160px" AutoCompleteType="Disabled" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtto" Format="MM-dd-yyyy"></cc1:CalendarExtender>
                            </td>
                              </tr>
                                 </table>
                             </td>
                        </tr>
                                <tr><td height="10px">&nbsp;</td></tr>
                             <tr>
                              <td colspan="3" align="center">
                                              <asp:Button ID="btnsaveout" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="btnsaveout_Click" />
                                              <asp:Button ID="Button1" runat="server" Text="Cancel" Font-Size="18px" Width="70px" Height="30px" OnClick="Button1_Click" />

                              </td>
                          </tr>

                            </table>
                        </td>
                    </tr>

                </table>
                <br />
                <br />
                </div>
        </section>
    </form>
</body>
</html>
