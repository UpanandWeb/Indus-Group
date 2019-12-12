<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Employee.aspx.cs" Inherits="admin_Admin_Employee" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - India Employees</title>
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
        .style24
        {
            width: 965px;
        }
        #GridView1 td,  #MyGrid td, #MyGridDeactivate td
        {
        	border:0.1px solid #CCCCCC;
        }
        #GridView1 th,#MyGrid th,#MyGridDeactivate th
        {
        	border-right:0.1px solid #CCCCCC;
        }
    </style>
     
     <script type="text/javascript">
         function ConfirmationBox(username) {

             var result = confirm('Are you sure you want to delete employee record ');
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
        .modalBackground
        {  
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

<body  topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
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
     <tr> <td align='center' bgcolor='white' width='70%'><font color='#003399' size='4pt'><b><u>Employees List</u></b></font> </td>
        </tr>
       </table>
      </td>
    </tr>
     <tr><td height="20px"></td></tr>
    <tr><td height="30px">
    <table border="0" width="100%">

         <tr><td align="center"  colspan="4">
    
       <asp:ImageButton ID="imgus" runat="server"  ImageUrl="~/admin/images/02.png" height="30px" OnClick="imgus_Click" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:ImageButton ID="imgind" runat="server"  ImageUrl="~/admin/images/01.png" height="20px" OnClick="imgind_Click" />
     </td>
     </tr>
     <tr><td height="20px"></td></tr>

       <tr>
            <td align="center"  height="20px">
                  <asp:LinkButton ID="lnkbtncurrent" runat="server" onclick="lnkbtncurrent_Click" ><b>Current Employees</b></asp:LinkButton>
           </td>   
            <td align="center"  height="20px">
                  <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" ><b>New Employees</b></asp:LinkButton>
           </td>   
          <td align="center">
                <asp:LinkButton ID="lnkbtnpre" runat="server" onclick="lnkbtnpre_Click" ><b>Previous Employees</b></asp:LinkButton>
          </td>
          <td  align="center">
            <a href="Admin_EmpID.aspx"><b>Add New Employee</b></a>
          </td>
     </tr>
    </table>
    </td></tr>
  
      <tr><td height="30px"></td></tr>
 
    <tr>
     <td align="right" bgcolor="white" width="100%" style="padding-right:10px"><font color='#003399' size='2pt'>
 </font></td>  
    </tr>
    <tr id="trcurr1" runat="server">
      <td id="td2" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
          <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Current Employees:</b></font> </td>
        </tr>
        
                <tr>
        <td align="right">
           <%-- <asp:LinkButton ID="lnkdetails" runat="server" Text="Details" Font-Size="18px" OnClick="lnkdetails_Click"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;--%>
            <asp:LinkButton ID="lnkall" runat="server" Text="All Records" Font-Size="18px" OnClick="lnkall_Click"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkreports" runat="server" Text="Reports" Font-Size="18px" OnClick="lnkreports_Click"></asp:LinkButton>

            </td>
        </tr>
       </table>
      </td>
    </tr>
    <tr id="trcurr2" runat="server">        
      <td id="tdcontent1" runat="server" align="left" valign="top" class="lable"> 
      <table width="90%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="991px"">
             <asp:GridView ID="MyGrid" runat="server" Width="100%"  DataKeyNames="userid"
          AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="25" 
                   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 onpageindexchanging="MyGrid_PageIndexChanging" >
              
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Width="5%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "middlename")%>                 
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
                  <asp:TemplateField HeaderText="Designation"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "functionalarea")%>&nbsp;                    
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
              
                  <asp:TemplateField HeaderText="Date Of Joining" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="13%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
  <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"joindate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                 </asp:TemplateField>

                  <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Activate"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkactivate"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="8%"></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <%--<a href="Admin_EmpEdit.aspx?cid=<%#  DataBinder.Eval(Container.DataItem,"userid")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />    --%>      
                            <asp:ImageButton ID="imgbtnedittt" width='20' height='20' runat="server"  ImageUrl="images/edit1.png" OnClick="imgbtnedittt_Click" />                                
                        </ItemTemplate>
                        <ItemStyle Width="3%"></ItemStyle>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("userid")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                         <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="5%"></ItemStyle>
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
    <tr id="trnew1" runat="server" visible="false">
     <td>
       <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
        <tr><td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Newly Registered Employees:</b></font> </td></tr>
         <tr><td>&nbsp;</td></tr>         
       </table>
     </td>
    </tr>
    <tr id="trnew2" runat="server" visible="false">        
      <td id="td3" runat="server" align="left" valign="top" class="lable"> 
      <table width="90%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="991px"">
            <asp:GridView ID="GridView1" runat="server" Width="100%" 
              AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="true" PageSize="25"
                 PagerStyle-Mode="NumericPages"  DataKeyNames="userid,username"
                   PagerStyle-BackColor="White"   onrowdatabound="GridView1_RowDataBound" 
                onpageindexchanging="GridView1_PageIndexChanging">
                  <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center" Width="20"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="20" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;                    
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
                
                   <asp:TemplateField HeaderText="Email" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle  ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "username")%>&nbsp;                     
                           
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField> 
                   
                   <asp:TemplateField HeaderText="Mobile" ItemStyle-BorderColor="#CCCCCC" ItemStyle-ForeColor="Gray" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "mobile")%>&nbsp;                     
                           
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>                     
                  <asp:TemplateField ItemStyle-Width="25%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Activate"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkactivatenew"></asp:LinkButton> &nbsp; 
                                   
                                    <%--<asp:LinkButton ID="lnknotact" runat="server" Text="Not Activated"  ForeColor="Black" CommandArgument='<%# Eval("userid") %>' OnCommand="lnknotactivate"></asp:LinkButton>--%>                                   
                                    
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="10%"></ItemStyle>
                   </asp:TemplateField>               
                  
                  <asp:TemplateField ItemStyle-Width="10%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                           
                       <ItemTemplate>
                       <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png"  OnClick="GridView1_lnkdelrecord" />

                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="7%"></ItemStyle>
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
    <tr id="trpre1" runat="server" visible="false">
     <td>
       <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
        <tr><td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Previous Employees:</b></font> </td></tr>
         <tr><td>&nbsp;</td></tr>
         
       </table>
     </td>
    </tr>

    <tr id="tr1" runat="server" visible="false">        
      <td id="td4" runat="server" align="left" valign="top" class="lable"> 
      <table width="90%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="991px"">
             <asp:GridView ID="GridView2" runat="server" Width="100%"  DataKeyNames="userid"
          AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  Visible="false"
                Font-Underline="False"  BackColor="White" 
                
                   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound1" 
                 onpageindexchanging="MyGrid_PageIndexChanging1" >
              
                <Columns>
                   <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Width="5%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Employee Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "middlename")%>                 
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
                  <asp:TemplateField HeaderText="Designation"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "functionalarea")%>&nbsp;                    
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
              
                  <asp:TemplateField HeaderText="Date Of Joining" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="13%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
  <ItemStyle Font-Size="11px"   VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate11" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"joindate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="13%"></FooterStyle>
                 </asp:TemplateField>
                  <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate11" runat="server" Text="Activate"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkactivate"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="8%"></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit11" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord1" />                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>
                   

                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin_EmpEdit.aspx?cid=<%#  DataBinder.Eval(Container.DataItem,"userid")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle Width="3%"></ItemStyle>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename11" CommandArgument='<%# Eval("userid")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload1" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>

                         <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Print" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedita11" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  
                                        OnClientClick=<%# "Navigate('" + Eval("userid") + "','"+ Eval("emailid") +"')" %>/>                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>

                  <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                       <ItemTemplate>                      
                      <asp:ImageButton ID="imgbtndel11" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="5%"></ItemStyle>
                 </asp:TemplateField>   
                    
                    <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Report" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate111" runat="server" Text="Report"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkactivate1"></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="8%"></ItemStyle>
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


  <tr id="trpre2" runat="server" visible="false">        
      <td id="td1" runat="server" align="left" valign="top" class="lable"> 
      <table width="90%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="991px"">
            <asp:GridView ID="MyGridDeactivate" runat="server" Width="100%" 
                AllowPaging="true" PageSize="25" 
           DataKeyNames="userid" AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                 PagerStyle-Mode="NumericPages"  
                   PagerStyle-BackColor="White"   OnRowDataBound="MyGridDeactivate_RowDataBound" 
             GridLines="Both" onpageindexchanging="MyGridDeactivate_PageIndexChanging">
                 

                <Columns>
                 <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Width="5%" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "middlename")%> 
                           
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Designation" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle  ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "functionalarea")%>&nbsp;                    
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Resume" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" HeaderStyle-Font-Bold="true">

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("userid")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'  OnCommand="lnkDownload" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Date Of Joining" HeaderStyle-Width="13%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
  <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblJoindate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"joindate")%>'></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial" Width="10%"></FooterStyle>
                 </asp:TemplateField>
                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Date Of Relieving" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
  <ItemStyle Font-Size="11px"  ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle" Width="13%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        <asp:Label ID="lblReleavedate" ForeColor="gray" style="text-decoration:none" runat="server" 
                              Text ='<%# DataBinder.Eval(Container.DataItem,"releavedate")%>' ></asp:Label>
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>  
                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="9%" HeaderText="Status" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle  ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="9%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%--<asp:LinkButton ID="lnkactivate" runat="server" Text="Activate"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkactivate"></asp:LinkButton>--%> &nbsp; 
                                    <asp:LinkButton ID="lnkdeactivate" runat="server" Text="Deactivate"  ForeColor="#00277a" CommandArgument='<%# Eval("userid") %>' OnCommand="lnkdeactivate"></asp:LinkButton>                                   
                                    <%--<asp:LinkButton ID="lnknotact" runat="server" Text="Not Activated"  ForeColor="Black" CommandArgument='<%# Eval("userid") %>' OnCommand="lnknotactivate"></asp:LinkButton>--%>                                   
                                    
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="9%"></ItemStyle>
                   </asp:TemplateField>               
                 <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >
                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>
                   
                   
                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                        <a href="Admin_EmpEdit.aspx?cid=<%#  DataBinder.Eval(Container.DataItem,"userid")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br />                                        
                        </ItemTemplate>
                        <ItemStyle Width="3%"></ItemStyle>
                        
                  </asp:TemplateField>

                  <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="10%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>

                       <ItemStyle  ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                           
                       <ItemTemplate>
                      
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png" OnClick="MyGridDeactivate_lnkdelrecord" />

                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="7%"></ItemStyle>
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
 </center>
  </form>
</body>
</html>