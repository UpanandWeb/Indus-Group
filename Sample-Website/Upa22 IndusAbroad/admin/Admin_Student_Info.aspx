<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Student_Info.aspx.cs" Inherits="admin_Student_Info" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



   
    <section class="container_add">
          <table width="998px" cellpadding="0" cellspacing="0" >
               <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
 
    </td>
    </tr>

            <%--   <tr><td height="30px"><hr /></td></tr>--%>

               <tr>
     <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
     <table width='100%' border='0' cellspacing='0' cellpadding='0'>     
     <tr> <td align='center' bgcolor='white' width='70%'><font color='#003399' size='4pt'><b><u> Student List</u></b></font> </td>
        </tr>
       </table>
      </td>
    </tr>

               <tr><td height="30px">
    <table border="0" width="100%">


       <%--  <tr><td align="center"  colspan="4">
    
       <asp:ImageButton ID="imgus" runat="server"  ImageUrl="~/admin/images/02.png" height="20px" OnClick="imgus_Click" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:ImageButton ID="imgind" runat="server"  ImageUrl="~/admin/images/01.png" height="30px" OnClick="imgind_Click" />
     </td>
     </tr>--%>

       <tr><%--<td align="center"  height="20px">
    
       <asp:LinkButton ID="lnkbtncurrent" runat="server" onclick="lnkbtncurrent_Click" ><b>Current Employees</b></asp:LinkButton>
       </td>   --%>  
           <%--  <td align="center"  height="20px">
                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ><b>New Employees</b></asp:LinkButton>
           </td> --%>
  <%--   <td align="center">

      <asp:LinkButton ID="lnkbtnpre" runat="server" onclick="lnkbtnpre_Click" ><b>Previous Employees</b></asp:LinkButton>
     </td>--%>
     <td  align="right"><a href="Admin_IndEmpID.aspx"><b>Add New Student</b></a></font></td>
     </tr>
    </table>
    </td></tr>
  
               <tr><td height="30px"></td></tr>

               <tr id="trcurr1" runat="server">
      <td id="td2" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
         <%-- <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Current Employees:</b></font> </td>
        </tr>--%>
         <tr>
        <td align="right">
         <%--   <asp:LinkButton ID="lnkdetails" runat="server" Text="Details" Font-Size="18px" OnClick="lnkdetails_Click"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;--%>
            <asp:LinkButton ID="lnkall" runat="server" Text="All Records" Font-Size="18px" ></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkreports" runat="server" Text="Reports" Font-Size="18px" ></asp:LinkButton>

            </td>
        </tr>
       </table>
      </td>
    </tr>

               <tr id="trcurr2" runat="server">        
                    <td id="tdcontent1" runat="server" align="left" valign="top" class="lable"> 
      <table>
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="991px"">
             <asp:GridView ID="MyGrid" runat="server" Width="100%"  DataKeyNames="userid"
          AutoGenerateColumns="False"   BorderColor="#CCCCCC" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="25" 
                   PagerStyle-BackColor="White" OnRowDeleting="MyGrid_RowDeleting"
                  >
               <HeaderStyle BackColor="#E1a84f" Font-Bold="True" ForeColor="#FFFFFF" Height="30px" BorderColor="Black"
                            BorderStyle="Solid" BorderWidth="1px" />
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
                   <asp:TemplateField HeaderText=" Name" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                     <%#  DataBinder.Eval(Container.DataItem, "lastname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "firstname")%>&nbsp;
                      <%#  DataBinder.Eval(Container.DataItem, "middlename")%>                 
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
                  <asp:TemplateField HeaderText="Email"  ItemStyle-BorderColor="#CCCCCC"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px"  ForeColor="Gray" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "emailid")%>&nbsp;                    
                          
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
                                    <asp:LinkButton ID="lnkactivate" runat="server" Text="Active"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' ></asp:LinkButton> &nbsp; 
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="8%"></ItemStyle>
                   </asp:TemplateField>      
                             
                 <asp:TemplateField ItemStyle-Width="5%" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="5%" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png"  />                                 
                              </ItemTemplate>
                              <ItemStyle Width="5%"></ItemStyle>
                   </asp:TemplateField>
                   
            <%--       <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="9%" HeaderText="Add EmpId" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="9%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <a href="Admin_IndEmpID.aspx">
                                        <img src='images/edit.jpg' alt='Add EmpId' width='16' height='16' border='0' /></a>
                                   <br />                                        
                               </ItemTemplate>
                               <ItemStyle Width="9%"></ItemStyle>
                   </asp:TemplateField>
                   --%>

                   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                       <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnedit1" width='20' height='20' runat="server"  ImageUrl="images/edit1.png"  />
                       <%-- <a href="Admin_IndEmpEdit.aspx?cid=<%#  DataBinder.Eval(Container.DataItem,"userid")%>">
                           <img  src='images/edit1.png' alt='Edit' width='16' height='16' border='0' /></a>
                        <br /> --%>                                       
                        </ItemTemplate>
                        <ItemStyle Width="3%"></ItemStyle>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Download" ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" ForeColor="Gray"  VerticalAlign="Middle" Width="10%" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("userid")%>' ForeColor="#00277a" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"filename1")%>'   ></asp:LinkButton>
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
                      <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.gif"  />
                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="5%"></ItemStyle>
                 </asp:TemplateField>   
                    
                    <asp:TemplateField ItemStyle-Width="8%" ItemStyle-BorderColor="#CCCCCC" HeaderText="Report" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="8%" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkactivate1" runat="server" Text="Report"  ForeColor="Green" CommandArgument='<%# Eval("userid") %>' ></asp:LinkButton> &nbsp; 
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

             

               

               

                

                  

               <tr>
    <td align="center">
        <asp:Label ID="lblerror" runat="server" Text="Label" Visible="false"></asp:Label>
    </td>
    </tr>

               <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
            </table>
      </section>



</asp:Content>

