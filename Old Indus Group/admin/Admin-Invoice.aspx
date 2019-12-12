<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Invoice.aspx.cs" Inherits="admin_Admin_Invoice" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - India Employees</title>

    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">

        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }

        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
        }

    </script>
    <script language="javascript" type="text/javascript">

        function alertcanceldelete() {
            alert("You don't have rights to done this task !!!");
        }
    </script>

    <link rel="stylesheet" href="Styles/stylesheet.css" />
    <style type="text/css">
        .style24 {
            width: 965px;
        }

        #GridView1 td, #MyGrid td, #MyGridDeactivate td {
            border: 0.1px solid #CCCCCC;
        }

        #GridView1 th, #MyGrid th, #MyGridDeactivate th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>

    <script type="text/javascript">
        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete invoice record ');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <script language="javascript" type="text/javascript">

        function alertdelete12() {
            alert("You don't have rights to done this task !!!");
        }
    </script>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }
    </style>
    <script type="text/javascript">
        var popup;
        function Navigate(userid, emailid) {

            javascript: window.open("Admin_EmpView.aspx?userid=" + userid + "&emailid=" + emailid, "popup", "width=600,height=500");
        }
    </script>

</head>

<body topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
        <center>
      <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
     </cc1:ToolkitScriptManager>     
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
      <tr><td height="30px"></td></tr>
        <tr>
     <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
     <table width='100%' border='0' cellspacing='0' cellpadding='0'>     
     <tr> <td align='center' bgcolor='white' width='70%'><font color='#003399' size='6pt'><b><u>Clients/Vendors List</u></b></font> </td>
        </tr>
       </table>
      </td>
    </tr>
     <tr><td height="20px"></td></tr>
    <tr><td height="30px">
    <table border="0" width="100%">

 <%--        <tr><td align="center"  colspan="4">
    
       <asp:ImageButton ID="imgus" runat="server"  ImageUrl="~/admin/images/02.png" height="30px" OnClick="imgus_Click" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:ImageButton ID="imgind" runat="server"  ImageUrl="~/admin/images/01.png" height="20px" OnClick="imgind_Click" />
     </td>
     </tr>--%>
     <tr><td height="20px"></td></tr>

       <tr>
            <td align="center"  height="20px" width="20%">
                  <asp:LinkButton ID="lnkbtncurrent" runat="server" onclick="lnkbtncurrent_Click" ><b>Clients</b></asp:LinkButton>
           </td>   
            <td align="center"  height="20px" width="20%">
                  <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" ><b>Vendors</b></asp:LinkButton>
           </td>   
          <td align="center" height="20px" width="20%">
                <asp:LinkButton ID="lnkbtnpre" runat="server" onclick="lnkbtnpre_Click" ><b>Previous Clients/Vendors</b></asp:LinkButton>
          </td>
          <td  align="center" height="20px" width="20%">
            <a href="Admin-InvoiceCreate1.aspx"><b>Add New Clients/Vendors</b></a>
          </td>
     </tr>
    </table>
    </td></tr>
  
      <tr><td height="30px"></td></tr>
 
    <tr>
     <td align="right" bgcolor="white" width="100%" style="padding-right:10px"><font color='#003399' size='2pt'>
 </font></td>  
    </tr>

       <tr id="trnew1" runat="server" visible="false">
     <td>
       <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
        <tr><td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Current Vendors</b></font> </td></tr>
         <tr><td>&nbsp;</td></tr>         
       </table>
     </td>
    </tr>
    <tr id="trnew2" runat="server" visible="false">        
      <td id="td3" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"">
            <asp:GridView ID="GridView1" runat="server" Width="100%"  AutoGenerateColumns="False"  BorderColor="#CCCCCC"    BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  Font-Underline="False"   BackColor="White" AllowPaging="true" PageSize="25"
                 PagerStyle-Mode="NumericPages"  DataKeyNames="sno" PagerStyle-BackColor="White"   onrowdatabound="MyGrid_RowDataBound1"  onpageindexchanging="GridView1_PageIndexChanging"
                AllowSorting="true" OnSorting="gridviewSorting_Sorting1">
                   <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />     <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="4%" />
                        <HeaderStyle Width="4%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Vendor" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%"
                       SortExpression="cname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        

                  <asp:TemplateField HeaderText="Employee Name"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                       HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                      <%#  DataBinder.Eval(Container.DataItem, "elname")%>                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                           HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="timesheet">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatea9" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                   HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%" SortExpression="invoice">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateb9" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                    <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                         HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="rinvoiceduration">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebt9" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                          HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="invoicedates">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebf9" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC"  
                                           HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="invoiceperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                         <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                                                    <asp:Label ID="lblName555" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>

                <%--      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod1")%>  --%>                  
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="tspendingperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate >
                                                    <asp:Label ID="lblName566" runat="server" Text='<%#Eval("tspendingperiod").ToString() +"- "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>

                 <%--     <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod1")%>      --%>              
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
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
                                            </asp:TemplateField>

                       
                                               <asp:TemplateField HeaderText="Actual Hours" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                 HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblhourwww" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                      ></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                          <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                               HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
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
                                                        ></asp:Label>

                                             <%--       <asp:Label ID="lblhourwwwer" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"othours")%>'></asp:Label>--%>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Overtime" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                 HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                     

               <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8aaassss" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                               <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="14%" ItemStyle-Width="14%" >
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww9" ForeColor="gray" style="text-decoration:none" runat="server"  Width="200px" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

         <%--         <asp:TemplateField HeaderText="Create Date" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate9" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"pdate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate"  OnClientClick="return confirm('Are you sure you want to update status?');" runat="server" Text="Active"  ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle ></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord1" />                                 
                              </ItemTemplate>
                              <ItemStyle ></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle></ItemStyle>
                  </asp:TemplateField>

      <%--           <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("sno")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>--%>

                   <%--      <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord1" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle ></ItemStyle>
                 </asp:TemplateField>                
                   
                     </Columns>
                <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Left" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="#00277a" 
                    ForeColor="#00277a" Height="30px" />
         </asp:GridView>
        </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>




     <tr id="tr1" runat="server">
      <td id="td4" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
          <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Updated Vendors</b></font> </td>
        </tr>
       </table>
      </td>
    </tr>


      <tr><td height="10px"></td></tr>



     <tr id="tr2" runat="server">        
      <td id="td5" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"">
             <asp:GridView ID="GridView2" runat="server" Width="100%"  DataKeyNames="sno"  AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"   Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"    AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="25"   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 AllowSorting="true" OnSorting="gridviewSorting_Sorting" OnPageIndexChanging="GridView2_PageIndexChanging">
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server"  onclick="changeColor(this)"/>     <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="4%" />
                        <HeaderStyle Width="4%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Client" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                       HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        

                  <asp:TemplateField HeaderText="Employee Name"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center"
                       HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                      <%#  DataBinder.Eval(Container.DataItem, "elname")%>                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="6%" ItemStyle-Width="6%" 
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="timesheet">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatea" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%" 
                   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoice">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateb" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                    <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" 
                        ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="rinvoiceduration">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebt" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                    </ItemTemplate>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" ItemStyle-Width="10%" 
                                      HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoicedates">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebf" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%"
                                            ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoiceperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                         <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                                                    <asp:Label ID="lblName11" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>

               <%--       <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod1")%>  --%>                  
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" SortExpression="tspendingperiod"
                                            HeaderStyle-Width="11%" ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate >
                                                    <asp:Label ID="lblName112" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>

                  <%--    <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod1")%>    --%>                
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                             <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" 
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                     <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                         HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                 $   <asp:Label ID="lblhour1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                    

               <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                   HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8aaass" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="14%" ItemStyle-Width="14%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  
                    <ItemTemplate>
                        <asp:Label ID="lblJoindateww" ForeColor="gray" style="text-decoration:none" runat="server"  Width="200px" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                 <%-- <asp:TemplateField HeaderText="Create Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"pdate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>--%>

                  <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Deactive"  ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate2"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle ></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"    HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>
                              <ItemStyle ></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle ></ItemStyle>
                  </asp:TemplateField>

      <%--           <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("sno")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>--%>

                   <%--      <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle ></ItemStyle>
                 </asp:TemplateField>                
                   
                     </Columns>
                  <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="15px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" />
         </asp:GridView>
         </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>



    <tr id="trcurr1" runat="server">
      <td id="td2" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
          <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Current Clients</b></font> </td>
        </tr>
       </table>
      </td>
    </tr>
      <tr><td height="10px"></td></tr>

    <tr id="trcurr2" runat="server">        
      <td id="tdcontent1" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"">
             <asp:GridView ID="MyGrid" runat="server" Width="100%"  DataKeyNames="sno"  AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"   Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" onpageindexchanging="MyGrid_PageIndexChanging"
                Font-Underline="False"  BackColor="White"    AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="25"   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 AllowSorting="true" OnSorting="gridviewSorting_Sorting">
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server"  onclick="changeColor(this)"/>     <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="4%" />
                        <HeaderStyle Width="4%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Client" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                       HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        

                  <asp:TemplateField HeaderText="Employee Name"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center"
                       HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                      <%#  DataBinder.Eval(Container.DataItem, "elname")%>                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="6%" ItemStyle-Width="6%" 
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="timesheet">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatea" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%" 
                   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoice">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateb" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                    <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" 
                        ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="rinvoiceduration">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebt" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                    </ItemTemplate>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" ItemStyle-Width="10%" 
                                      HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoicedates">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebf" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%"
                                            ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoiceperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                         <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                                                    <asp:Label ID="lblName11" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>

               <%--       <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod1")%>  --%>                  
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" SortExpression="tspendingperiod"
                                            HeaderStyle-Width="11%" ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate >
                                                    <asp:Label ID="lblName112" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>

                  <%--    <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod1")%>    --%>                
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                             <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" 
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                     <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                         HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                 $   <asp:Label ID="lblhour1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                    

               <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                   HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8aaass" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="14%" ItemStyle-Width="14%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  
                    <ItemTemplate>
                        <asp:Label ID="lblJoindateww" ForeColor="gray" style="text-decoration:none" runat="server"  Width="200px" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                 <%-- <asp:TemplateField HeaderText="Create Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"pdate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>--%>

                  <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Active"  ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate1"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle ></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"    HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>
                              <ItemStyle ></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle ></ItemStyle>
                  </asp:TemplateField>

      <%--           <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("sno")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>--%>

                   <%--      <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle ></ItemStyle>
                 </asp:TemplateField>                
                   
                     </Columns>
                  <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="15px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" />
         </asp:GridView>
         </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr> 
  
      <tr id="tr3" runat="server">
      <td id="td6" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
          <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Updated Clients</b></font> </td>
        </tr>
       </table>
      </td>
    </tr>

       <tr><td height="10px"></td></tr>




     <tr id="tr4" runat="server">        
      <td id="td7" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"">
             <asp:GridView ID="GridView3" runat="server" Width="100%"  DataKeyNames="sno"  AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"   Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" onpageindexchanging="MyGrid_PageIndexChanging"
                Font-Underline="False"  BackColor="White"    AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="25"   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 AllowSorting="true" OnSorting="gridviewSorting_Sorting">
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server"  onclick="changeColor(this)"/>     <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="4%" />
                        <HeaderStyle Width="4%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Client" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                       HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        

                  <asp:TemplateField HeaderText="Employee Name"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center"
                       HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                      <%#  DataBinder.Eval(Container.DataItem, "elname")%>                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="6%" ItemStyle-Width="6%" 
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="timesheet">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatea" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%" 
                   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoice">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateb" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                    <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" 
                        ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="rinvoiceduration">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebt" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                    </ItemTemplate>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" ItemStyle-Width="10%" 
                                      HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoicedates">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebf" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="11%"
                                            ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="invoiceperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                         <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                                                    <asp:Label ID="lblName11" runat="server" Text='<%#Eval("invoiceperiod").ToString() +"- "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>

               <%--       <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod1")%>  --%>                  
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC" SortExpression="tspendingperiod"
                                            HeaderStyle-Width="11%" ItemStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate >
                                                    <asp:Label ID="lblName112" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>

                  <%--    <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "tspendingperiod1")%>    --%>                
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                             <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" 
                                                 HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                     <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                         HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                 $   <asp:Label ID="lblhour1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                  $  <asp:Label ID="lblot1" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                    

               <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                   HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8aaass" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="14%" ItemStyle-Width="14%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  
                    <ItemTemplate>
                        <asp:Label ID="lblJoindateww" ForeColor="gray" style="text-decoration:none" runat="server"  Width="200px" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                 <%-- <asp:TemplateField HeaderText="Create Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"pdate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>--%>

                  <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Deactive"  ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate3"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle ></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField HeaderStyle-Width="3%" ItemStyle-Width="3%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"    HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>
                              <ItemStyle ></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle ></ItemStyle>
                  </asp:TemplateField>

      <%--           <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("sno")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>--%>

                   <%--      <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle ></ItemStyle>
                 </asp:TemplateField>                
                   
                     </Columns>
                  <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="15px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" />
         </asp:GridView>
         </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>


    <tr id="trpre1" runat="server" visible="false">
     <td>
       <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
        <tr><td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Previous Clients/Vendors</b></font> </td></tr>
         <tr><td>&nbsp;</td></tr>
         
       </table>
     </td>
    </tr>

  <tr id="trpre2" runat="server" visible="false">        
      <td id="td1" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"">
            <asp:GridView ID="MyGridDeactivate" runat="server" Width="100%"   AllowPaging="true" PageSize="25"   DataKeyNames="sno" AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"  Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"   Font-Underline="False"  BackColor="White"
                 PagerStyle-Mode="NumericPages"  PagerStyle-BackColor="White"   OnRowDataBound="MyGridDeactivate_RowDataBound"   GridLines="Both" onpageindexchanging="MyGridDeactivate_PageIndexChanging"
                AllowSorting="true" OnSorting="gridviewSorting_Sorting2">
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />     <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="4%" />
                        <HeaderStyle Width="4%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>

                       <asp:TemplateField HeaderText="Client/Vendor" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                            HeaderStyle-Width="4%" ItemStyle-Width="4%" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "ctype")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                   <asp:TemplateField HeaderText="Company Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                        HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="cname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "cname")%>&nbsp;
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        

                  <asp:TemplateField HeaderText="Employee Name"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center" 
                      HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%" SortExpression="efname">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "efname")%>&nbsp;      
                      <%#  DataBinder.Eval(Container.DataItem, "elname")%>                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      <asp:TemplateField HeaderText="Timesheet" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                           HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="timesheet">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatea8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"timesheet")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

               <asp:TemplateField HeaderText="Invoice Required" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-Font-Bold="true" HeaderStyle-Width="4%" ItemStyle-Width="4%" SortExpression="invoice">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateb8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoice")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                    <asp:TemplateField HeaderText="Invoice Duration" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                         HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="rinvoiceduration">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebt8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rinvoiceduration")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoice Dates" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                                      HeaderStyle-Font-Bold="true" HeaderStyle-Width="10%" ItemStyle-Width="10%" SortExpression="invoicedates">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindatebf8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"invoicedates")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" ></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Invoice Period (From - To)" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="invoiceperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                         <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                                                    <asp:Label ID="lblName56621" runat="server" Text='<%#Eval("invoiceperiod").ToString() +" - "+ Eval("invoiceperiod1").ToString() %>'></asp:Label>

                   <%--   <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod")%>&nbsp; -      &nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "invoiceperiod1")%>    --%>                
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                 </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Timesheet Pending period (From - To)" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="11%" ItemStyle-Width="11%" SortExpression="tspendingperiod">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate >
                                                    <asp:Label ID="lblName56633" runat="server" Text='<%#Eval("tspendingperiod").ToString() +" - "+ Eval("tspendingperiod1").ToString() %>'></asp:Label>
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                 </asp:TemplateField>

                        <asp:TemplateField HeaderText="Invoice Date" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center"
                                                  HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="idate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoindate8" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"idate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                                            </asp:TemplateField>

                    <asp:TemplateField HeaderText="Hour Rate" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                        HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="hrate">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                 $   <asp:Label ID="lblhour2" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"hrate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OT" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" 
                                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%" SortExpression="ot">
                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                <ItemStyle Font-Size="11px" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                              $      <asp:Label ID="lblot3" ForeColor="gray" Style="text-decoration: none" runat="server"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"ot")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                                            </asp:TemplateField>

                                         

                                    <asp:TemplateField HeaderText="Consultant Email" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" 
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" ItemStyle-Width="6%" SortExpression="cemail">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8aaa" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"cemail")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                               <asp:TemplateField HeaderText="Remarks" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="12%" ItemStyle-Width="12%">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindateww8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"remarks")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                      

            <%--      <asp:TemplateField HeaderText="Removed Date" ItemStyle-BorderColor="#CCCCCC"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Font-Size="11px"   VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate8" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"rdate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                 </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Activate"  ForeColor="Green" CommandArgument='<%# Eval("sno") %>' OnCommand="lnkactivate2"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="8%"></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord2" />                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin-InvoiceCreate.aspx?sno=<%#  DataBinder.Eval(Container.DataItem,"sno")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle ></ItemStyle>
                  </asp:TemplateField>

      <%--           <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("sno")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>--%>

                   <%--      <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>--%>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord2" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle ></ItemStyle>
                 </asp:TemplateField>                
                   
                     </Columns>
                 <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" BorderColor="#00277a" 
                    ForeColor="#00277a" Height="30px" />
         </asp:GridView>
        </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>   
    <tr>
    <td align="center">
        <asp:Label ID="lblerror" runat="server" Text="Label"></asp:Label>
    </td>
    </tr>
    
    <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
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
 </center>
    </form>
</body>
</html>
