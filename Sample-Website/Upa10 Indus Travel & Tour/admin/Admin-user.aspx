<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-user.aspx.cs" Inherits="admin_Admin_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="80%" align="center">

        <tr>
          <td align="center">
                  <br />
                 <h2>User Information</h2>
          </td>
            
          
        </tr>
      <tr >
            <td align="right" >
                                    
                               <asp:Button ID="Button4" runat="server" Text="Add" Height="40px"  Font-Size="24px" Width="70px"  OnClick="Button4_Click" />  <br /><br />
            </td>
        </tr>
<%--<tr>
    <td>
        <br />
    </td>
</tr>--%>
      
        <tr>
            <td>

         
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="5" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="Id" Width="100%" AllowPaging="True" ForeColor="#333333" OnDataBound="gv_DataBound" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDataBound="gv_RowDataBound" OnRowDeleting="gv_RowDeleting"  >
                        <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="50px" HeaderStyle-Width="50px" FooterStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                               <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblarea" runat="server" Text="ID" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                              <ItemTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblid" runat="server" Text= '<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbltitle" runat="server" Text="Login ID" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltitle1" runat="server" Text='<%#Eval("u_loginId") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblcate" runat="server" Text="First Name" Font-Size="23px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblcate1" runat="server" Text='<%#Eval("u_F_name") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblsubcate" runat="server" Text="Last Name" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblsubcate1" runat="server" Text='<%#Eval("u_L_name") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                           <%-- <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbldate" runat="server" Text="Date" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbldate1" runat="server" Text='<%#Eval("createdate") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                               <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbldatest" runat="server" Text="Status" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <%--    <asp:Label ID="lbldate1st1" runat="server" Text=c Font-Size="20px"></asp:Label>--%>
                                    <asp:LinkButton ID="lnkmore" runat="server" Text='<%#Eval("U_status") %>' Font-Size="20px" CommandName="status"   CommandArgument='<%# Eval("Id") %>' 
                                                               ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbledit" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    &nbsp;    &nbsp;  
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandName="edit" CommandArgument='<%# Eval("Id") %>' 
                                        AlternateText="Edit"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                ControlStyle-Width="30px" HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                <HeaderTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbdel" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("Id") %>' CommandName="delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" AlternateText="Delete" ></asp:ImageButton>
                                </ItemTemplate>
                                <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                            </asp:TemplateField>
                        </Columns>

                        <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                        <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                        <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                    </asp:GridView>
                   </td>
        </tr>
    </table>
    <br />
    <br />

      <%-- <table width="80%" align="center" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                      <tr>
                          <td style="padding-left:10px;">
                              <asp:Panel ID="pnledit1" runat="server">
                                 <table>
                                      <br />
                                      <tr>
                                           <td colspan="3" style="padding-left:10px;">
                                                <table width="100%">
                                                    <tr>
                        <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblfirstname"  runat="server" Text="First Name"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                        
                        </td>
                     <td align="left" width="210px">
                      <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Please Enter Your Firstname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                     
                     </td>
                     <td align="right" width="210px"> 
                     <asp:Label ID="lbllname"  runat="server" Text="Last Name"></asp:Label>
                     </td>
                     <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px">
                      <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredLname" runat="server" ControlToValidate="txtlname" ErrorMessage="Please Enter Your Lastname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>

                      </td>
                      </tr>

                       <tr>
                       <td align="right" width="210px">
                         <asp:Label ID="lbldesignation"  runat="server" Text="Designation"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                         <td align="left" width="210px">
                      <asp:DropDownList ID="ddldesig" runat="server" Width="130px">
                     <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Web Admin</asp:ListItem>
                    <asp:ListItem>Developer</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="requireddesignation" runat="server" ControlToValidate="ddldesig" ErrorMessage="Please Enter Your designation" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>

                     </td>

                      <td align="right" width="210px">
                         <asp:Label ID="lblEmail"  runat="server" Text="EmailId"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                       <td align="left" width="210px">
                      <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Enter Your EamilId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>

                                                    <tr>
                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblloginid"  runat="server" Text="LoginId"></asp:Label>
                         </td> 
                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px" >
                      <asp:TextBox ID="txtloginid" runat="server" ></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredUserId" runat="server" ControlToValidate="txtloginid" ErrorMessage="Please Enter Your UserId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      
                     
                      </td>
                       <td align="right" width="210px">
                         <asp:Label ID="lblpassword"  runat="server" Text="Password"></asp:Label>
                       </td>
                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px">
                      <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredpwd" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Enter  Password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                      </tr>

                                                    <tr>
                            <td colspan="5">
                                <br /> <asp:Label ID="lblstatus" runat="server"></asp:Label>
                            </td>
                        </tr>

                                                    <tr>

                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblcnfpwd"  runat="server" Text="ConfirmPassword"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtcnfpwd" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredcnfpwd" runat="server" ControlToValidate="txtcnfpwd" ErrorMessage="Please Enter confirm password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="comaparepasswd" runat="server" ControlToValidate="txtcnfpwd" ControlToCompare="txtpassword" ErrorMessage="Invalid Password" ValidationGroup="userform" ForeColor="red">*</asp:CompareValidator>
                         </td>

                         <td align="right" width="210px">
                         <asp:Label ID="lbladdress"  runat="server" Text="Address"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Requiredaddress1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Please Enter your Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                      </tr>

                      <tr>
                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lbladdress1"  runat="server" Text="Address2"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtaddress1" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredAddress2" runat="server" ControlToValidate="txtaddress1" ErrorMessage="Please Enter your Second Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                         <td align="right" width="210px">
                         <asp:Label ID="lblmobile"  runat="server" Text="Mobile"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredMobile" runat="server" ControlToValidate="txtmobile" ErrorMessage="Please Enter your Mobile Number" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "txtmobile" 
                   ID="Regularmobile" ValidationExpression = "^[\s\S]{10,}$" runat="server" 
                   ErrorMessage="Minimum 10 digits required for Mobile." ValidationGroup="userform" ForeColor="red">*</asp:RegularExpressionValidator>
                        </td>

                      </tr>

                      <tr>

                         <td align="right" width="210px" height="30px">
                         <asp:Label ID="lblcontact"  runat="server" Text="Contact"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredContact" runat="server" ControlToValidate="txtcontact" ErrorMessage="Please Enter your contactnumber" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "txtcontact" 
                         ID="RegularExpcontact" ValidationExpression = "^[\s\S]{10,}$" runat="server" 
                         ErrorMessage="Minimum 10 digits required." ValidationGroup="userform" ForeColor="red">*</asp:RegularExpressionValidator>
                        </td>
                          <td align="right" width="210px">
                         <asp:Label ID="Label1"  runat="server" Text="Country"></asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px">
                        <asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcountry" ErrorMessage="Please Enter your Country Name" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>

                      <td width="210px"></td>
                      <td width="40px"></td>
                      <td width="210px"></td>

                      </tr>
                                               </table>
                                           </td>
                                     </tr>

                                     <tr>
                                        <td height="20px" colspan="3"></td>
                                     </tr>
                                     </table>
                                       </asp:Panel>
                               <div align="center">
                                             <asp:Button ID="Button2" runat="server" Text="Submit" onclick="btnsave_Click" />
                                                  <asp:Button ID="Button3" runat="server" Text="Cancel" OnClick="Button1_Click"/>
                                               </div>
                              <br />
                         </td>
                         
                      </tr>
                  </table>--%>
    <br />
   
    </asp:Content>    