<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp-Seminar.aspx.cs" Inherits="Emp_Seminar" %>

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
</style>
</head>
<body>
    <form id="form1" runat="server">
         <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>
        <header id="header">
            <div class="container-fluide header-inner-wrap">
                <head:Header ID="Header1" runat="server" />
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
                </div></section>

        <table width="100%" align="center">
             <tr>
        <td  id="Errmsg" align="right" class="lblog" runat="server">
        </td>
    </tr>
    <tr>
        <td id="crtopt" runat="server" align="right" style="padding-right:30px;" class="lblog">
        </td>
    </tr>
    <tr><td align="center" style="color:#00277a;font-size:22px;"><strong>Seminars</strong></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td align="center">
            <asp:GridView ID="GridView1" runat="server" Width="80%" 
    AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
           onpageindexchanging="GridView1_PageIndexChanging">
        <Columns>
        <%--   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="40px" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                    <%#Container.DataItemIndex + 1%>
                                                </ItemTemplate>
                                                <ItemStyle Width="4%" />
                                                <HeaderStyle Width="4%" />
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                             
                              </asp:TemplateField>--%>

             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="90" HorizontalAlign="Center" />
                                    </asp:TemplateField>

                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Course Name" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2111" runat="server" Text='<%# Bind("CourseName") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Left" />
                 <HeaderStyle Width="20%" HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Description" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CouserDes") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Left" />
                 <HeaderStyle Width="50%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Date of Seminar" >
                
                <ItemTemplate>
                    <asp:Label ID="Labeldate" runat="server" Text='<%# Bind("SeDate") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="14%" HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted On" >
                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("post") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
            
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="12%" />
            </asp:TemplateField>
            
            
        </Columns>
   
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt"  HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
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
