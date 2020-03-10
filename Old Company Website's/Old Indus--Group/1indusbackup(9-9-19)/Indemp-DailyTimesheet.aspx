<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Indemp-DailyTimesheet.aspx.cs" Inherits="Indemp_DailyTimesheet" %>

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
               
          <table width="100%" align="center">
             <tr>
                 <td align="center" width="100%" colspan="2">
                      <font color='#003399' size='6pt'><b>Employee Daily Timesheet</b></font>
                </td>
            </tr>
            <tr><td height="15px">&nbsp;</td></tr>

            <tr>
                 <td align="left">
                      <asp:Label ID="lbln1" runat="server" Text="Employee Name" Font-Size="20px" Font-Underline="false"></asp:Label>
                           &nbsp;&nbsp;<b>:</b>
                       <asp:Label ID="lbln2" runat="server"  Font-Size="20px" Font-Underline="false"></asp:Label>
                 </td>
                 <td align="right">
                    <asp:Label ID="lbli1" runat="server" Text="Employee Id" Font-Size="20px" Font-Underline="false"></asp:Label>
                        &nbsp;&nbsp;<b>:</b>
                    <asp:Label ID="lbli2" runat="server"  Font-Size="20px" Font-Underline="false"></asp:Label>
                </td>
            </tr>

            <tr><td height="15px">&nbsp;</td></tr>

           <tr>
               <td width="40%" align="left">
                   <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="140px" AutoPostBack="true" OnSelectedIndexChanged="ddemp_SelectedIndexChanged" Visible="false">
                   </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:DropDownList ID="ddyear" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="90px" >
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
                  </asp:DropDownList>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:DropDownList ID="ddmonth" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="90px"  OnSelectedIndexChanged="ddmonth_SelectedIndexChanged" AutoPostBack="true">
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
               <td align="right" width="60%" >
                   <asp:LinkButton ID="lnknew" runat="server" Text="Create TimeSheet" Font-Underline="false" Font-Size="20px" OnClick="lnknew_Click"> </asp:LinkButton>
                   <asp:LinkButton ID="lnkshow" runat="server" Text="Show Data" Font-Underline="false" Font-Size="20px" OnClick="lnkshow_Click" Visible="false"> </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:LinkButton ID="lnkleave" runat="server" Text="Leave Option" Font-Underline="false" Font-Size="20px" OnClick="lnkleave_Click" > </asp:LinkButton>
             </td>
        </tr>

        <tr><td height="10px">&nbsp;</td></tr>
        <tr> 
            <td align="center" width="100%" colspan="2">
                  <asp:GridView ID="empdata" runat="server" Width="100%"       AutoGenerateColumns="False"  BorderColor="#CCCCCC"  BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  Font-Underline="False"  BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="30" 
                  PagerStyle-BackColor="White"             onpageindexchanging="empdata_PageIndexChanging"   >             <%--OnDataBound="empdata_DataBound"--%>
                      <Columns> 
                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No">
                    <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>

<%--            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Id" >
                <ItemTemplate>
                    <asp:Label ID="lblempid"  ForeColor="Gray" Text='<%# Bind("Empid") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Employee Name" >
                <ItemTemplate>
                    <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("empname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>--%>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Date">
                <ItemTemplate>
                    <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("ddate") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work In">
                <ItemTemplate>
                    <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("intime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch Out">
                <ItemTemplate>
                    <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("outtime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch In">
                <ItemTemplate>
                    <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("intime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Lunch Hours">
            <ItemTemplate>
            <asp:Label ID="lblwork" ForeColor="Gray" Text='<%# Bind("lunch") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Out">
                <ItemTemplate>
                    <asp:Label ID="lblout11" ForeColor="Gray" Text='<%# Bind("outtime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
          
                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Hours">
                <ItemTemplate>
                    <asp:Label ID="lbltotal" ForeColor="Gray" Text='<%# Bind("worktime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
  
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Monthly Salary">
                <ItemTemplate>
                                 <asp:Label ID="lblsymbol" ForeColor="Gray" Text='<%# Bind("rsymbol") %>' runat="server" CssClass="data"></asp:Label> &nbsp;
                    <asp:Label ID="lblamount" ForeColor="Gray" Text='<%# Bind("totalrate") %>' runat="server" CssClass="AlgRgh" Width="15px" ></asp:Label>

                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <%--    <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Monthly Salary">
                <ItemTemplate>
                 <asp:Label ID="lblrate" ForeColor="Gray" Text='<%# Bind("mrate") %>' runat="server" CssClass="AlgRgh" Width="50px"></asp:Label> 

                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>--%>

           <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Remarks">
                <ItemTemplate>
                    <asp:Label ID="lblremark" ForeColor="Gray" Text='<%# Bind("Remarks") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

               
           <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leave">
                <ItemTemplate>
                    <asp:Label ID="lblremark1" ForeColor="Gray" Text='<%# Bind("Remark1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leave Days">
                <ItemTemplate>
                    <asp:Label ID="lblremark1ss" ForeColor="Gray" Text='<%# Bind("Remark2") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            </Columns>
             <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
              <HeaderStyle  BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
            </asp:GridView>
             </td>
        </tr>

        <tr><td height="10px">&nbsp;</td></tr>

       <tr>
        <td align="right" width="18%" colspan="2">
              <asp:Label ID="lbltotalwork"  runat="server" Text="Total Work days of the Month :" Font-Size="16px"></asp:Label>
        
        &nbsp;      &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;  
                <asp:TextBox ID="txttotalwork" runat="server" Width="100px" Enabled="false"  Font-Size="16px"></asp:TextBox>
              <asp:Label ID="lblam" runat="server" Text="Total Leaves of the Month :" Font-Size="16px"></asp:Label>
                             &nbsp;    &nbsp;    
                <asp:TextBox ID="txtamount" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
            &nbsp;    &nbsp;   
             <asp:Label ID="lblsal" runat="server" Text="Total Salary of the Month :" Font-Size="16px"></asp:Label>
                             &nbsp;    &nbsp;    
                <asp:TextBox ID="txtsal" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
          </td>
         </tr>
    </table>
    <table width="100%" align="center" runat="server" id="createtime" visible="false">
                          <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="lblempname" runat="server" Text="Employee Name" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left">
                                  <asp:TextBox ID="txtempname" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>
                          <tr><td height="7px">&nbsp;</td></tr>
                             <tr>
                              <td width="40%" align="right">
                                  <asp:Label ID="lblid" runat="server" Text="Employee ID" Font-Size="18px"></asp:Label>
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
                              <td width="40%" align="right" >
                                  <asp:Label ID="lbldate" runat="server" Text="Today Date " Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left" >
                                  <asp:TextBox ID="txtdate" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>

                          <tr><td height="7px">&nbsp;</td></tr>
                            <tr>
                                <td colspan="7" width="100%" align="center">
                                    <table width="80%" align="center">
                                         <tr>
                                          <td width="20%" align="right">
                                              <asp:Label ID="lblin" runat="server" Text="Work In" Font-Size="18px"></asp:Label>
                                          </td>
                                          <td width="10%" align="center" id="out1" runat="server"><b style="font-size:18px;">:</b></td>
                                          <td width="20%" align="left">
                                              <asp:TextBox ID="txtin" runat="server" Font-Size="18px" Width="100px" Enabled="false"></asp:TextBox>
                                              <asp:Button ID="btnsavein" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="btnsavein_Click" />
                                          </td>
                                             <td width="20%" align="right">
                                              <asp:Label ID="lblout" runat="server" Text="Lunch Out" Font-Size="18px"></asp:Label>
                                          </td>
                                          <td width="10%" align="center" id="out2" runat="server"><b style="font-size:18px;">:</b></td>
                                          <td width="20%" align="left">
                                              <asp:TextBox ID="txtout" runat="server" Font-Size="18px" Width="100px" Enabled="false"></asp:TextBox>
                                              <asp:Button ID="btnsaveout" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="btnsaveout_Click" />
                                          </td>
                                      </tr>
                                    </table>
                                </td>
                            </tr>

                           <tr><td height="7px">&nbsp;</td></tr>

                             <tr>
                              <td width="40%" align="right" >
                                  <asp:Label ID="lbllunch" runat="server" Text="Lunch Hours" Font-Size="18px"></asp:Label>
                              </td>
                              <td width="20%" align="center"><b style="font-size:18px;">:</b></td>
                              <td width="40%" align="left" >
                                  <asp:TextBox ID="txtlunch" runat="server" Font-Size="18px" Width="320px" Enabled="false"></asp:TextBox>
                              </td>
                          </tr>
                            <tr><td height="7px">&nbsp;</td></tr>

                            <tr>
                                <td colspan="6" width="100%" align="center">
                                    <table width="80%" align="center">
                                         <tr>
                                          <td width="20%" align="right">
                                              <asp:Label ID="llblin" runat="server" Text="Lunch In" Font-Size="18px"></asp:Label>
                                          </td>
                                          <td width="10%" align="center" id="Td1" runat="server"><b style="font-size:18px;">:</b></td>
                                          <td width="20%" align="left">
                                              <asp:TextBox ID="ltxtin" runat="server" Font-Size="18px" Width="100px" Enabled="false"></asp:TextBox>
                                              <asp:Button ID="lbtnsave1" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="lbtnsave1_Click" />
                                          </td>
                                             <td width="20%" align="right">
                                              <asp:Label ID="llbnout" runat="server" Text="Work Out" Font-Size="18px"></asp:Label>
                                          </td>
                                          <td width="10%" align="center" id="Td2" runat="server"><b style="font-size:18px;">:</b></td>
                                          <td width="20%" align="left">
                                              <asp:TextBox ID="ltxtout" runat="server" Font-Size="18px" Width="100px" Enabled="false"></asp:TextBox>
                                              <asp:Button ID="lbtnsave2" runat="server" Text="Save" Font-Size="18px" Width="70px" Height="30px" OnClick="lbtnsave2_Click" />
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
