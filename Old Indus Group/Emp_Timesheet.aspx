<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_Timesheet.aspx.cs" Inherits="Emp_Timesheet" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Src="usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Usercontrols/CommonControl.ascx" TagPrefix="uc2" TagName="CommonControl" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

               .AlgRgh
{
  text-align:right;
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
        <%--<cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>--%>
        <header id="header">
            <div class="container-fluide header-inner-wrap">
                <%--<head:Header ID="Header1" runat="server"  />--%>
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
                    <%--<cc3:topmenu ID="top1" runat="server"></cc3:topmenu>--%>
              <uc2:CommonControl ID="common" runat="server" />

                    </div>
                <br />
                <br />
               

                <table width="100%" align="center">
                    <tr>
    <td align="center" width="100%" colspan="2"> 
        <font color='#003399' size='6pt'><b>Employee Daily Timesheet</b></font>
    </td>
    </tr>
                           <tr><td height="15px">&nbsp;</td></tr>

       <tr>
           <td align="center" width="50%" >
               <table align="center" width="100%">
                   <tr>
                       <td width="25%">
                           <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="160px" AutoPostBack="true" 
                               OnSelectedIndexChanged="ddemp_SelectedIndexChanged" Visible="false">
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:DropDownList ID="ddyear" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="70px" AutoPostBack="true" OnSelectedIndexChanged="ddyear_SelectedIndexChanged" >
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
                  <asp:DropDownList ID="ddmonth" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="120px"  
                      OnSelectedIndexChanged="ddmonth_SelectedIndexChanged" AutoPostBack="true">
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
                    <%--   </td>
                       <td width="75%">
                           <asp:LinkButton runat="server"  ID="lnkjan" Text="January" Font-Bold="true" Font-Size="15px"  OnClick="lnkjan_Click" ToolTip="January"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkfeb" Text="February" Font-Bold="true" Font-Size="15px" OnClick="lnkfeb_Click" ToolTip="February"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkmar" Text="March" Font-Bold="true" Font-Size="15px" OnClick="lnkmar_Click" ToolTip="March"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkapr" Text="April" Font-Bold="true" Font-Size="15px" OnClick="lnkapr_Click" ToolTip="April"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkmay" Text="May" Font-Bold="true" Font-Size="15px" OnClick="lnkmay_Click" ToolTip="May"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkjun" Text="June" Font-Bold="true" Font-Size="15px" OnClick="lnkjun_Click" ToolTip="June"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkjul" Text="July" Font-Bold="true" Font-Size="15px" OnClick="lnkjul_Click" ToolTip="July"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkaug" Text="August" Font-Bold="true" Font-Size="15px" OnClick="lnkaug_Click" ToolTip="August"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnksep" Text="September" Font-Bold="true" Font-Size="15px" OnClick="lnksep_Click" ToolTip="September"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkoct" Text="October" Font-Bold="true" Font-Size="15px" OnClick="lnkoct_Click" ToolTip="October"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnknov" Text="November" Font-Bold="true" Font-Size="15px" OnClick="lnknov_Click" ToolTip="November"></asp:LinkButton> &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton runat="server"  ID="lnkdec" Text="December" Font-Bold="true" Font-Size="15px" OnClick="lnkdec_Click" ToolTip="December"></asp:LinkButton> &nbsp;&nbsp;&nbsp;--%>
                       </td>
                   </tr>
               </table>
          </td>
       <%--</tr>

                    <tr><td height="15px">&nbsp;</td></tr>
 
      <tr>--%>
           <td  align="center"  width="70%">
               <asp:LinkButton ID="lnkdownload" runat="server" Text="Download" Font-Underline="false" Font-Size="20px" OnClick="lnkdownload_Click" > </asp:LinkButton>&nbsp;&nbsp;
               &nbsp;&nbsp;
               <asp:LinkButton ID="lnknew" runat="server" Text="Create TimeSheet" Font-Underline="false" Font-Size="20px" OnClick="lnknew_Click"> </asp:LinkButton>
                <asp:LinkButton ID="lnkshow" runat="server" Text="Show Data" Font-Underline="false" Font-Size="20px" OnClick="lnkshow_Click" Visible="false"> </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkleave" runat="server" Text="Leave Option" Font-Underline="false" Font-Size="20px" OnClick="lnkleave_Click" > </asp:LinkButton>

           </td>
      </tr>

   <tr>
    <td height="10px">&nbsp;</td>
    </tr>
    <tr> 
    <td align="center" width="100%" colspan="2">
       <asp:GridView ID="empdata" runat="server" Width="100%"       AutoGenerateColumns="False"  BorderColor="#CCCCCC"  BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  Font-Underline="False"  BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="31" 
                  PagerStyle-BackColor="White"             onpageindexchanging="empdata_PageIndexChanging"   >             <%--OnDataBound="empdata_DataBound"--%>
           <Columns> 
                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="S.No" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                    <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Id" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                <ItemTemplate>
                    <asp:Label ID="lblempid"  ForeColor="Gray" Text='<%# Bind("Empid") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Employee Name" HeaderStyle-Width="14%" ItemStyle-Width="14%" >
                <ItemTemplate>
                    <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("empname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Date" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                <ItemTemplate>
                    <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("ddate") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work In" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("intime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch Out" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label ID="lblout1" ForeColor="Gray" Text='<%# Bind("outtime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Lunch In" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("intime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Lunch Hours" HeaderStyle-Width="10%" ItemStyle-Width="10%">
            <ItemTemplate>
            <asp:Label ID="lblwork" ForeColor="Gray" Text='<%# Bind("lunch") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

               
                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Reason" HeaderStyle-Width="6%" ItemStyle-Width="6%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblworkqqqqq" ForeColor="Gray" Text='<%# Bind("reason") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>


             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Work Out" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label ID="lblout11" ForeColor="Gray" Text='<%# Bind("outtime1") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
          
                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Hours" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:Label ID="lbltotal" ForeColor="Gray" Text='<%# Bind("worktime") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Extra Time" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblextra" ForeColor="Gray" Text='<%# Bind("worktime1") %>' runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
  
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Hour Rate" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                <ItemTemplate>
                                 <asp:Label ID="lblsymbol" ForeColor="Gray" Text='<%# Bind("rsymbol") %>' runat="server" CssClass="data"></asp:Label> &nbsp;
                    <asp:Label ID="lblamount" ForeColor="Gray" Text='<%# Bind("totalrate") %>' runat="server" CssClass="AlgRgh" Width="15px"></asp:Label>

                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Amount" HeaderStyle-Width="6%" ItemStyle-Width="6%">
                <ItemTemplate>
                 <asp:Label ID="lblrate" ForeColor="Gray" Text='<%# Bind("hrate") %>' runat="server" CssClass="AlgRgh" Width="50px"></asp:Label> 

                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

           <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Remarks" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label ID="lblremark" ForeColor="Gray" Text='<%# Bind("Remarks") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

               
           <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leave" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                <ItemTemplate>
                    <asp:Label ID="lblremark1" ForeColor="Gray" Text='<%# Bind("Remark1") %>' runat="server" CssClass="data"></asp:Label>
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

                    <tr id="Tr1" runat="server" visible="false">
                            <td align="center" width="94%" colspan="2">
                              <%--  <asp:Label ID="Label1" runat="server" Text="Total Work Hours of the Month :" Font-Size="16px"></asp:Label>
                                &nbsp;    &nbsp;   
                                <asp:TextBox ID="TextBox1" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>--%>
                                &nbsp;    &nbsp;   
                                <asp:Label ID="Label7" runat="server" Text="Total Extra Hours of the Month :" Font-Size="16px"></asp:Label>
                                &nbsp;    &nbsp;    
                                <asp:TextBox ID="txtextratime" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
                            </td>
                        </tr>
                    <tr><td height="10px">&nbsp;</td></tr>
      <tr>
        <td align="right" width="100%" colspan="2">
              <asp:Label ID="lbltotalwork"  runat="server" Text="Total Work Hours of the Month :" Font-Size="16px"></asp:Label>
        
        &nbsp;      &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;    &nbsp;  
                <asp:TextBox ID="txttotalwork" runat="server" Width="100px" Enabled="false"  Font-Size="16px"></asp:TextBox>
              <asp:Label ID="lblam" runat="server" Text="Total Amount of the Month :" Font-Size="16px"></asp:Label>
                             &nbsp;    &nbsp;    
                <asp:TextBox ID="txtamount" runat="server" Width="100px" Enabled="false" Font-Size="16px"></asp:TextBox>
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
                           
                        <tr id="lunchreason" runat="server">
                            <td width="40%" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Permission Reason" Font-Size="18px"></asp:Label>
                            </td>
                            <td width="20%" align="center"><b style="font-size: 18px;">:</b></td>
                            <td width="40%" align="left">
                                <asp:TextBox ID="txtreason" runat="server" Font-Size="18px" Width="320px" ></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td height="7px">&nbsp;</td>
                        </tr>
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
