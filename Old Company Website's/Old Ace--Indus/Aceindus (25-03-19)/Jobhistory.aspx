<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jobhistory.aspx.cs" Inherits="Jobhistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job History Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
    <td><img src="images/logo.png" width="199" height="46" /></td>
    <td style="width:90px"> &nbsp</td>
     <td style="width:620px" align="right"><asp:Label ID="lblname" runat="server"></asp:Label></td>
    </tr>
    <tr>
    <td align="right">
        <asp:LinkButton ID="LinkButton1" runat="server" Text="My Jobs" OnClick="lnkjobs"></asp:LinkButton>
    </td>
    <td align="center"><asp:LinkButton ID="LinkButton2" runat="server" Text="My Profile" OnClick="lnkprof" ></asp:LinkButton>
    </td>
    <td>
    <asp:LinkButton ID="LinkButton3" runat="server" Text="Logout" OnClick="lnklog" ></asp:LinkButton>
   </td>
    </tr>
    </table>
    <table>
    <tr>
    <td style="width:1050px">
    <asp:GridView ID="MyGrid" runat="server" Width="100%" AutoGenerateColumns="False"
            AllowPaging="True"   PageIndex="3" PagerSettings-Mode="Numeric" 
            Height="100px" 
            BorderColor="#CCCCCC" 
            BorderWidth="1px" CellPadding="3" BackColor="White" BorderStyle="None" onpageindexchanging="MyGrid_PageIndexChanging"  
              >
         <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
         <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
         <HeaderStyle CssClass="lable" BackColor="#006699" Font-Bold="True" 
             ForeColor="White">
          </HeaderStyle>         

                <FooterStyle BackColor="White" ForeColor="#000066" />
         <RowStyle ForeColor="#000066" />

                <Columns>
                   <asp:TemplateField HeaderText="Date Applied" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">



            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>



                         <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "pdate")%>&nbsp;
                
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                 
             
                 <asp:TemplateField HeaderText="Job Title" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem,"jobtitle")%>
                               </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                 
                    <asp:TemplateField HeaderText="Company" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                  <ItemTemplate>
                        Ace Indus
                    </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                   <asp:TemplateField ItemStyle-Width="10%" HeaderText="Location" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>    

                         <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="15%" HorizontalAlign="Center"></ItemStyle>
                          <ItemTemplate >
                              <%#  DataBinder.Eval(Container.DataItem, "location")%>
                         <br />                                        
                        </ItemTemplate>

                        <ItemStyle Width="10%"></ItemStyle>
                        </asp:TemplateField>

                     </Columns>
        </asp:GridView>
    </td><td></td>
    </tr>
    <tr>
    <td>
    <asp:DataList ID="empdata" runat="server" Width="100%" Visible="true">
            <ItemTemplate>
            <columns>
            <table width="100%" border="0">
             <tr>
                <td height="30" style="background:url(images/regiterlinebg.png) repeat-x; color:Red"><b>Personal Details</b></td>
             </tr>
          <tr>
            <td width="30%"> <strong><asp:Label ID="Label3" runat="server" Text="Username"></asp:Label></strong></td>
           
            <td >
           <asp:Label ID="Label1" runat="server"   Text='<%#Eval("fname") %>'></asp:Label>&nbsp
            <asp:Label ID="Label6" runat="server"   Text='<%#Eval("lname") %>'></asp:Label>
             </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label4" runat="server" Text="Email id"></asp:Label></strong></td>
         <td><asp:Label ID="Label5" runat="server"  Text='<%#Eval("email") %>'></asp:Label>
            </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label7" runat="server" Text="Address"></asp:Label></strong></td>
        <td><asp:Label ID="Label8" runat="server"   Text='<%#Eval("addline1") %>'></asp:Label>&nbsp 
        <asp:Label ID="Label9" runat="server"   Text='<%#Eval("addline2") %>'></asp:Label>
        <asp:Label ID="Label10" runat="server"   Text='<%#Eval("city") %>'></asp:Label>
        <asp:Label ID="Label12" runat="server"   Text='<%#Eval("state") %>'></asp:Label>
        <asp:Label ID="Label13" runat="server"   Text='<%#Eval("country") %>'></asp:Label></td>
          <td align="left">
          <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="btnEdit"/>
        </td>
        </tr>
            </table>         
            </columns>
             </ItemTemplate>
                </asp:DataList>
    </td>
    </tr>
    <tr>
    <td>
    <asp:DataList ID="DataList1" runat="server" Width="100%" Visible="true">
            <ItemTemplate>
            <columns>
            <table width="100%" border="0">
             <tr>
            <td height="30" style="background:url(images/regiterlinebg.png) repeat-x; color:Red">
            <b>Education Details</b></td>
         </tr>
          <tr>
            <td width="30%"> <strong><asp:Label ID="Label3" runat="server" Text="Degree"></asp:Label></strong></td>
           
            <td >
           <asp:Label ID="Label1" runat="server"   Text='<%#Eval("degree") %>'></asp:Label>&nbsp
           
             </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label4" runat="server" Text="Year of Pass"></asp:Label></strong></td>
         <td><asp:Label ID="Label5" runat="server"  Text='<%#Eval("yearofpass") %>'></asp:Label>
            </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label7" runat="server" Text="School"></asp:Label></strong></td>
        <td><asp:Label ID="Label8" runat="server"   Text='<%#Eval("school") %>'></asp:Label>&nbsp 
        </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label2" runat="server" Text="Major in"></asp:Label></strong></td>
        <td><asp:Label ID="Label11" runat="server"   Text='<%#Eval("major") %>'></asp:Label>&nbsp 
        </td>
       </tr>
  
            </table>         
            </columns>
             </ItemTemplate>
                </asp:DataList>
    </td>
    </tr>
      <tr>
    <td>
    <asp:DataList ID="DataList2" runat="server" Width="100%" Visible="true">
            <ItemTemplate>
            <columns>
            <table width="100%" border="0">
             <tr>
            <td height="30" style="background:url(images/regiterlinebg.png) repeat-x; color:Red">
            <b>Work Experience</b></td>
         </tr>
          <tr>
            <td width="30%"> <strong><asp:Label ID="Label3" runat="server" Text="Worked As"></asp:Label></strong></td>
           
            <td>
           <asp:Label ID="Label1" runat="server"   Text='<%#Eval("title") %>'></asp:Label>&nbsp
           
             </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label4" runat="server" Text="Role and Responsibilities"></asp:Label></strong></td>
         <td><asp:Label ID="Label5" runat="server"  Text='<%#Eval("workexp") %>'></asp:Label>
            </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label7" runat="server" Text="from"></asp:Label></strong></td>
        <td><asp:Label ID="Label8" runat="server"   Text='<%#Eval("frommnth") %>'></asp:Label>&nbsp
        <asp:Label ID="Label14" runat="server"   Text='<%#Eval("fromyear") %>'></asp:Label> 
        </td>
        </tr>
        <tr>
        <td><strong><asp:Label ID="Label2" runat="server" Text="To"></asp:Label></strong></td>
        <td><asp:Label ID="Label11" runat="server"   Text='<%#Eval("tomonth") %>'></asp:Label>&nbsp 
                <asp:Label ID="Label15" runat="server"   Text='<%#Eval("toyear") %>'></asp:Label> 
        </td>
          <td align="center">
          <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="btnEdit1"/>
        </td>
        </tr>
            </table>         
            </columns>
             </ItemTemplate>
                </asp:DataList>
    </td>
    </tr>
    </table>
    <table id="tblper" runat="server">
    <tr><td><b>Personal Information</b></td></tr>
     <tr>
                            <td align="right">
                                <asp:Label ID="lblfname" runat="server" Text="First Name"></asp:Label>
                                <asp:Label ID="lblfnamestar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVfname" runat="server" 
                                    ErrorMessage="Please enter the first name" ControlToValidate="txtfname" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lbllname" runat="server" Text="Last Name"></asp:Label>
                                <asp:Label ID="lbllnamestar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVlname" runat="server" 
                                    ErrorMessage="Please enter the last name" ControlToValidate="txtlname" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lbladdline1" runat="server" Text="Address Line 1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadressline1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lbladdline2" runat="server" Text="Address Line 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadresline2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>                        
                            <td align="right">
                                <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                            </td>                         
                            <td>
                                <asp:TextBox ID="txtcity" runat="server" Width="121px" Height="20px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">                            
                               <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>                           
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" Width="150">
                                    <asp:ListItem Selected="True" Value="Select State">Select State </asp:ListItem>
                                    <asp:ListItem Value="Andra Pradesh">Andra Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Arunachal Pradesh">Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Assam">Assam</asp:ListItem>
                                    <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                                    <asp:ListItem Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                                    <asp:ListItem Value="Goa">Goa</asp:ListItem>
                                    <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                                    <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                                    <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Jammu and Kashmir">Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem Value="Jharkhand">Jharkhand</asp:ListItem>
                                    <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                    <asp:ListItem Value="Kerala">Kerala</asp:ListItem>
                                    <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                    <asp:ListItem Value="Manipur">Manipur</asp:ListItem>
                                    <asp:ListItem Value="Meghalaya">Meghalaya</asp:ListItem>
                                    <asp:ListItem Value="Mizoram">Mizoram</asp:ListItem> 
                                    <asp:ListItem Value="Nagaland">Nagaland</asp:ListItem> 
                                    <asp:ListItem Value="Orissa">Orissa</asp:ListItem> 
                                    <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                    <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                                    <asp:ListItem Value="Sikkim">Sikkim</asp:ListItem> 
                                    <asp:ListItem Value="Tamil Nadu">Tamil Nadu</asp:ListItem> 
                                    <asp:ListItem Value="Chennai">Chennai</asp:ListItem> 
                                    <asp:ListItem Value="Tripura">Tripura</asp:ListItem>
                                    <asp:ListItem Value="Uttaranchal">Uttaranchal</asp:ListItem>
                                    <asp:ListItem Value="Uttar Pradesh">Uttar Pradesh</asp:ListItem> 
                                    <asp:ListItem Value="West Bengal">West Bengal</asp:ListItem>                                  
                                </asp:DropDownList>
                             </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true">
                                    <asp:ListItem Value="Select County">Select Country</asp:ListItem>
                                    <asp:ListItem Value="India">India</asp:ListItem>
                                    <asp:ListItem Value="U.S">U.S</asp:ListItem>
                                </asp:DropDownList> </td>
                                </tr>  
                                <tr>
                                <td>&nbsp</td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Update" OnClick="btnUpdate" />
                                </td>
                                </tr>                    
    </table>
    <table id="tblwrk" runat="server">
    <tr><td><b>Work Experience</b></td></tr>
    <tr>
    <td>Worked As</td>
    <td><asp:TextBox ID="txttitle" runat="server" Width="200px"></asp:TextBox>                    
     </td>
    </tr>
    <tr>
    <td>Role & Responsibilities</td>
    <td><asp:TextBox ID="txtexp" runat="server" TextMode="MultiLine" Width="420px"></asp:TextBox>
     </td>
     </tr>
     <tr>
    <td>From </td>
    <td><asp:DropDownList ID="ddlfrom" runat="server" Width="50">
                        <asp:ListItem Value="Jan">Jan</asp:ListItem>
                        <asp:ListItem Value="Feb">Feb</asp:ListItem>
                        <asp:ListItem Value="Mar">Mar</asp:ListItem>
                        <asp:ListItem Value="Apr">Apr</asp:ListItem>
                        <asp:ListItem Value="May">May</asp:ListItem>
                        <asp:ListItem Value="Jun">Jun</asp:ListItem>
                        <asp:ListItem Value="Jul">Jul</asp:ListItem>
                        <asp:ListItem Value="Aug">Aug</asp:ListItem>
                        <asp:ListItem Value="Sep">Sep</asp:ListItem>
                        <asp:ListItem Value="Oct">Oct</asp:ListItem>
                        <asp:ListItem Value="Nov">Nov</asp:ListItem>
                        <asp:ListItem Value="Dec">Dec</asp:ListItem>                        
                       </asp:DropDownList>
                       <asp:TextBox ID="txtfromyr" runat="server" Width="50px" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtfromyr" EnableTheming="True" 
                        ErrorMessage="Please use the format yyyy" ValidationExpression="\d{4}" 
                        ValidationGroup="WorkExpGroup">*</asp:RegularExpressionValidator>
     </td>
     </tr>
      <tr>
    <td>To </td>
    <td><asp:DropDownList ID="DropDownList1" runat="server" Width="50">
                        <asp:ListItem Value="Jan">Jan</asp:ListItem>
                        <asp:ListItem Value="Feb">Feb</asp:ListItem>
                        <asp:ListItem Value="Mar">Mar</asp:ListItem>
                        <asp:ListItem Value="Apr">Apr</asp:ListItem>
                        <asp:ListItem Value="May">May</asp:ListItem>
                        <asp:ListItem Value="Jun">Jun</asp:ListItem>
                        <asp:ListItem Value="Jul">Jul</asp:ListItem>
                        <asp:ListItem Value="Aug">Aug</asp:ListItem>
                        <asp:ListItem Value="Sep">Sep</asp:ListItem>
                        <asp:ListItem Value="Oct">Oct</asp:ListItem>
                        <asp:ListItem Value="Nov">Nov</asp:ListItem>
                        <asp:ListItem Value="Dec">Dec</asp:ListItem>                        
                       </asp:DropDownList>
                       <asp:TextBox ID="txttoyear" runat="server" Width="50px" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txttoyear" EnableTheming="True" 
                        ErrorMessage="Please use the format yyyy" ValidationExpression="\d{4}" 
                        ValidationGroup="WorkExpGroup">*</asp:RegularExpressionValidator>
     </td>
     </tr>
     <tr><td>&nbsp</td>
     <td>
         <asp:Button ID="btnwork" runat="server" Text="Update" onclick="btnwork_Click" /></td></tr>
    </table>
   
    </div>
    </form>
</body>
</html>
