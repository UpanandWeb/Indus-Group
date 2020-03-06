<%@ Page Title="Admin-User" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-User.aspx.cs" Inherits="admin_Admin_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .lb {
            font-size:22px;
            color:#20b9f1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cent_content" style="margin-top:-40px;" >

        <h1>User Create</h1>
        <span style="margin-right:-1059px">
              <asp:Button ID="Button1" runat="server" Text="Add User" BackColor="#0b2e82" OnClick="Button1_Click" ForeColor="White" Width="100px" Font-Size="20px" Height="38px" />
        </span>
        <br />
        <br />
       
    <table width="70%" align="center" style="border: 1px solid;
    padding: 2px;
    box-shadow: 5px 10px 8px #888888;background-color: #E8F8F5 ;">
        <tr><td><br /></td></tr>

        <tr id="tr1" runat="server">
            <td style="padding-left:10px;" align="center">

                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                                       EnableModelValidation="True" 
                                       HeaderStyle-HorizontalAlign="Center" CellPadding="4"    
                                      DataKeyNames="id" Width="98%"   AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDeleting="gv_RowDeleting" OnRowDataBound="gv_RowDataBound"      >
         <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px"   />
                                     <Columns>
                                       <asp:TemplateField ControlStyle-Width="100px"  HeaderStyle-Width="100px" FooterStyle-Width="100px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr><td align="center">
                                                 <asp:Label ID="lbluser" runat="server" Text="Userid" Font-Size="24px"></asp:Label>
                                          </td></tr></table>       
                                          </HeaderTemplate>
                                           <ItemTemplate> 
                                          <table width="100%" align="center"><tr><td align="center">  
                                                <asp:Label ID="lbuser1" runat="server" Text='<%#Eval("userid") %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                          </td></tr></table>   
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                       </asp:TemplateField>

                                          <asp:TemplateField  ControlStyle-Width="250px"  HeaderStyle-Width="250px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblfname" runat="server" Text="Name" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate>
                                         <asp:Label ID="fname1" runat="server" Text='<%#Eval("fname") %>' Font-Size="20px"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateField>

                                             <asp:TemplateField  ControlStyle-Width="200px"  HeaderStyle-Width="200px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblemail" runat="server" Text="Email Id" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                         <asp:Label ID="emailid1" runat="server" Text='<%#Eval("emailid") %>' Font-Size="20px"></asp:Label>
                                             <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField  ControlStyle-Width="150px"  HeaderStyle-Width="150px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblmob" runat="server" Text="Mobile" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                         <asp:Label ID="mob1" runat="server" Text='<%#Eval("mobile") %>' Font-Size="20px"></asp:Label>
                                             <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField  ControlStyle-Width="50px"  HeaderStyle-Width="50px" FooterStyle-Width="300px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblsts" runat="server" Text="Status" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandArgument='<%#Eval("id") %>' CommandName="status"></asp:LinkButton>
                                            
                                    <%--     <asp:Label ID="arealbl311" runat="server" Text='<%#Eval("status") %>' Font-Size="20px"></asp:Label>--%>
                                             <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField  ControlStyle-Width="100px"  HeaderStyle-Width="100px" FooterStyle-Width="300px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lbladd" runat="server" Text="Address" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                         <asp:Label ID="add1" runat="server" Text='<%#Eval("address") %>' Font-Size="20px"></asp:Label>
                                             <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                        </ItemTemplate>
                                        </asp:TemplateField>

                                          <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                              ControlStyle-Width="30px"  HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                                <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Edit/View" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>  
                                        <ItemTemplate>
                                        &nbsp;    &nbsp;   <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandName="edit"  CommandArgument='<%# Eval("id") %>' 
                                                                AlternateText="Edit"   ></asp:ImageButton>
                                        </ItemTemplate>
                                         <FooterTemplate >
                                           </FooterTemplate>
                                        </asp:TemplateField>

                                    <asp:TemplateField   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                       ControlStyle-Width="30px"  HeaderStyle-Width="30px" FooterStyle-Width="30px">
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Delete" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>  
                                        <ItemTemplate>
                                  <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif"  CommandArgument='<%# Eval("id") %>' 
                                    OnClientClick="return confirm('Are you sure you want to delete this record?');"   AlternateText="Delete"  CommandName="delete"></asp:ImageButton>
                                        </ItemTemplate>
                                        <%-- <FooterTemplate >
                                           </FooterTemplate>--%>
                                        </asp:TemplateField>
                                    </Columns>

                                    <%--<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="15px" Height="30px" />--%> 
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Height="30px" Font-Size="16px" />
                                    <PagerStyle BackColor="#5D7B9D" HorizontalAlign="Center" ForeColor="White" Height="30px" CssClass="letterspace"/>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" Font-Size="16px" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Height="30px" />
                                    <FooterStyle ForeColor="White" Font-Bold="True" Height="30px" Font-Size="16px" />
                                </asp:GridView>
            </td>
        </tr>


        <tr><td><br /></td></tr>
                      <tr id="tr2" runat="server">
                          <td style="padding-left:10px;" align="center">
                              <asp:Panel ID="pnledit1" runat="server">
                                  <table>
                                      <tr>
                                           <td align="center" style="padding-left:10px;">
                                                <table width="100%">
                                                    <tr>
                        <td align="right" width="210px" height="30px" valign="top">
                         <asp:Label ID="lblfirstname"  runat="server" Text="First Name" CssClass="lb" ></asp:Label>
                        
                        </td>
                        <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                        
                        </td>
                     <td align="left" width="210px">
                      <asp:TextBox ID="txtfname" runat="server" Font-Size="20px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Please Enter Your Firstname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                     
                     </td>
                     <td align="right" width="210px" valign="top"> 
                     <asp:Label ID="lbllname"  runat="server" Text="Last Name" CssClass="lb"></asp:Label>
                     </td>
                     <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px">
                      <asp:TextBox ID="txtlname" runat="server" Font-Size="20px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredLname" runat="server" ControlToValidate="txtlname" ErrorMessage="Please Enter Your Lastname" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>

                      </td>
                      </tr>

                                                    <tr>
                       <td align="right" width="210px"valign="top">
                         <asp:Label ID="lbldesignation"  runat="server" Text="Designation" CssClass="lb"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>
                         <td align="left" width="210px" valign="top">
                      <asp:DropDownList ID="ddldesig" runat="server" Width="230px" AppendDataBoundItems="true" Font-Size="24px">
                     <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                           <asp:ListItem>Accounts</asp:ListItem>
                    <asp:ListItem>Web Admin</asp:ListItem>
                    <asp:ListItem>Developer</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="requireddesignation" runat="server" ControlToValidate="ddldesig" ErrorMessage="Please Enter Your designation" ValidationGroup="userform" InitialValue="Select" ForeColor="Red">*</asp:RequiredFieldValidator>

                     </td>
                                               

                      <td align="right" width="210px" valign="top">
                         <asp:Label ID="lblEmail"  runat="server" Text="EmailId" CssClass="lb"></asp:Label>
                        
                        </td>
                        <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>
                       <td align="left" width="210px" valign="top">
                      <asp:TextBox ID="txtemail" runat="server" Font-Size="20px" OnTextChanged="txtemail_TextChanged" AutoPostBack="true"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Enter Your EamilId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                    </tr>
                                                    <tr><td><br /></td></tr>

                                                    <tr>
                         <td align="right" width="210px" height="30px" valign="top">
                         <asp:Label ID="lbluserid"  runat="server" Text="UserId" CssClass="lb"></asp:Label>
                         </td> 
                         <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px"  valign="top">
                      <asp:TextBox ID="txtuserid" runat="server" Font-Size="20px" OnTextChanged="txtuserid_TextChanged" ></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredUserId" runat="server" ControlToValidate="txtuserid" ErrorMessage="Please Enter Your UserId" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      
                     
                      </td>
                       <td align="right" width="210px" valign="top">
                         <asp:Label ID="lblpassword"  runat="server" Text="Password" CssClass="lb"></asp:Label>
                       </td>
                         <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>
                      <td align="left" width="210px" valign="top" >
                      <asp:TextBox ID="txtpassword" runat="server" Font-Size="20px" TextMode="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="requiredpwd" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Enter  Password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                      </td>
                      </tr>

                                                    <tr>
                            <td colspan="5">
                                <br /> <asp:Label ID="lblstatus" runat="server"></asp:Label>
                            </td>
                        </tr>

                                                    <tr>

                         <td align="right" width="210px" height="30px" valign="top">
                         <asp:Label ID="lblcnfpwd"  runat="server" Text="ConfirmPassword" CssClass="lb"></asp:Label>
                         </td>

                         <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px" valign="top">
                         <asp:TextBox ID="txtcnfpwd" runat="server" Font-Size="20px" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredcnfpwd" runat="server" ControlToValidate="txtcnfpwd" ErrorMessage="Please Enter confirm password" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="comaparepasswd" runat="server" ControlToValidate="txtcnfpwd" ControlToCompare="txtpassword" ErrorMessage="Invalid Password" ValidationGroup="userform" ForeColor="red">*</asp:CompareValidator>
                         </td>

                         <td align="right" width="210px" valign="top">
                         <asp:Label ID="lbladdress"  runat="server" Text="Address"  CssClass="lb"> </asp:Label>
                         </td>

                         <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px" valign="top">
                         <asp:TextBox ID="txtaddress" runat="server" Font-Size="20px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Requiredaddress1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Please Enter your Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                      </tr>

                                                    <tr>
                         <td align="right" width="210px" height="30px" valign="top">
                         <asp:Label ID="lbladdress1"  runat="server" Text="Address2" CssClass="lb"> </asp:Label>
                         </td>

                         <td width="40px" align="center">
                         <strong>:</strong> 
                         </td>

                         <td align="left" width="210px">
                         <asp:TextBox ID="txtaddress1" runat="server" Font-Size="20px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="requiredAddress2" runat="server" ControlToValidate="txtaddress1" ErrorMessage="Please Enter your Second Address" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                         </td>

                         <td align="right" width="210px" valign="top">
                         <asp:Label ID="lblmobile"  runat="server" Text="Mobile" CssClass="lb"></asp:Label>
                         </td>

                         <td width="40px" align="center" valign="top">
                         <strong>:</strong> 
                         </td>

                        <td align="left" width="210px" valign="top">
                        <asp:TextBox ID="txtmobile" runat="server" Font-Size="20px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredMobile" runat="server" ControlToValidate="txtmobile" ErrorMessage="Please Enter your Mobile Number" ValidationGroup="userform" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "txtmobile" 
                   ID="Regularmobile" ValidationExpression = "^[\s\S]{10,}$" runat="server" 
                   ErrorMessage="Minimum 10 digits required." ValidationGroup="userform" ForeColor="red">*</asp:RegularExpressionValidator>
                        </td>

                      </tr>

                                                 <%--   <tr>

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

                      <td width="210px"></td>
                      <td width="40px"></td>
                      <td width="210px"></td>

                      </tr>--%>
                                               </table>
                                           </td>
                                     </tr>

                                     <tr>
                                        <td height="20px" colspan="3"></td>
                                     </tr>


                                     <tr>
                                       <td colspan="3" style="padding-left:10px;">
                                           <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="false">
                                                <ContentTemplate>
                                                     <table width="100%">
                                                         <tr>
                                                            <td width="30%" class="datab">
                                                                <table width="100%" id="tblGallery">
                                                                   <tr>
                                                                      <td width="50%" align="left">
                                                                         Gallery 
                                                                     </td>
                                                                     <td width="50%" align="right">
                                                                      <asp:RadioButton ID="rbGalleryYes" runat="server" Text="YES" GroupName="Gallary" AutoPostBack="true" OnCheckedChanged="rbGalleryYes_CheckedChanged"/>
                                                                      <asp:RadioButton ID="rbGalleryNo" runat="server" Text="NO" GroupName="Gallary" AutoPostBack="true" OnCheckedChanged="rbGalleryNo_CheckedChanged"/>
                                                                    </td>
                                                                   </tr>

                                                                   <tr id="trGalleryModule" runat="server">
                                                                      <td colspan="2">
                                                                          <table >
                                                                             <tr id="trgalleryAll" runat="server"> 
                                                                                <td class="datap5">
                                                                                    <asp:Label id="lblgalleryAll" runat="server" Text="Select All"></asp:Label> 
                                                                                </td>
                                                                                <td>
                                                                                     <asp:CheckBox ID="chkgallAll" runat="server"  AutoPostBack="true"
                                                                                          OnCheckedChanged="chkgallAll_CheckedChanged"/>
                                                                                </td>
                                                                             </tr>

                                                                             <tr id="trgalPost" runat="server"> 
                                                                                <td class="datap5">
                                                                                   <asp:Label id="lblgalPost" runat="server" Text="Post"></asp:Label> 
                                                                                </td>
                                                                                <td>
                                                                                  <asp:CheckBox ID="chkGalPost" runat="server" AutoPostBack="true" OnCheckedChanged="chkGalPost_CheckedChanged"/>
                                                                               </td>
                                                                            </tr>

                                                                            <tr id="trgalEdit" runat="server"> 
                                                                                <td class="datap5">
                                                                                   <asp:Label id="lblgalEdit" runat="server" Text="Edit"></asp:Label> 
                                                                                </td>
                                                                                <td>
                                                                                  <asp:CheckBox ID="chkgalEdit" runat="server" AutoPostBack="true" OnCheckedChanged="chkgalEdit_CheckedChanged"/>
                                                                              </td>
                                                                            </tr>

                                                                            <tr id="trgalDelete" runat="server"> 
                                                                               <td class="datap5">
                                                                                  <asp:Label id="lblgaldel" runat="server" Text="Delete"></asp:Label> 
                                                                              </td>
                                                                              <td>
                                                                                 <asp:CheckBox ID="chkgalDel" runat="server" AutoPostBack="true" OnCheckedChanged="chkgalDel_CheckedChanged"/>
                                                                              </td>
                                                                            </tr>

                                                                            <tr id="trgalpreview" runat="server"> 
                                                                              <td class="datap5">
                                                                              <asp:Label id="lblgalpreview" runat="server" Text="View" ></asp:Label> 
                                                                              </td>
                                                                              <td>
                                                                              <asp:CheckBox ID="chkgalpreview" runat="server" AutoPostBack="true" OnCheckedChanged="chkgalpreview_CheckedChanged"/>
                                                                              </td>
                                                                            </tr>
                                                                          </table>   
                                                                      </td>
                                                                   </tr>
                                                             </table>
                                                           </td>

                                                            <td width="30%" class="datab">
                                              <table width="100%" id="tblMOvieReview">
                                                 <tr>
                                                   <td width="50%" align="left">
                                                     Reviews & Videos
                                                    </td>
                                                    <td width="50%" align="right">
                                                      <asp:RadioButton ID="rbMvReviewYes" runat="server" Text="YES" GroupName="MR" AutoPostBack="true" OnCheckedChanged="rbMvReviewYes_CheckedChanged"/>
                                                      <asp:RadioButton ID="rbmvReviewNo" runat="server" Text="NO" GroupName="MR" AutoPostBack="true" OnCheckedChanged="rbmvReviewNo_CheckedChanged"/>
                                                   </td>
                                                   </tr>
                                                   <tr id="trMoviReviewModule" runat="server">
                                                    <td colspan="2">
                                                      <table width="tblMovieReview">

                                                         <tr id="trMNReviewAll" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblMvReviewAll" runat="server" Text="Select All"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkMvReviewAll" runat="server"  AutoPostBack="true"
                                                                  oncheckedchanged="chkMvReviewAll_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                         <tr id="trMvReviewPost" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblreviewPost" runat="server" Text="Post"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkMvReviewPost" runat="server" AutoPostBack="true" OnCheckedChanged="chkMvReviewPost_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trMvreviewEdit" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblMvReviewEdit" runat="server" Text="Edit"></asp:Label> 
                                                          </td>
                                                          <td> 
                                                          <asp:CheckBox ID="chkMvReviewEdit" runat="server" AutoPostBack="true" OnCheckedChanged="chkMvReviewEdit_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                        <tr id="trMvreviewDel" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblMvReviewDel" runat="server" Text="Delete" ></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkMvReviewDel" runat="server" AutoPostBack="true" OnCheckedChanged="chkMvReviewDel_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                        <tr id="trMvReviewPreview" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblMvreviewpreview" runat="server" Text="View"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkMvReviewpreview" runat="server" AutoPostBack="true" OnCheckedChanged="chkMvReviewpreview_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                      </table>   
                                                     </td>
                                                   </tr>
                                                </table>
                                               </td>

                                                            <td width="30%" class="datab">
                                              <table width="100%" id="tablevideos">
                                                 <tr>
                                                   <td width="50%" align="left">
                                                    Exceptions
                                                    </td>
                                                    <td width="50%" align="right">
                                                      <asp:RadioButton ID="rbVideosyes" runat="server" Text="YES" GroupName="Vd" AutoPostBack="true" OnCheckedChanged="rbVideosyes_CheckedChanged"/>
                                                      <asp:RadioButton ID="rbVideosNo" runat="server" Text="NO" GroupName="Vd" AutoPostBack="true" OnCheckedChanged="rbVideosNo_CheckedChanged"/>
                                                   </td>
                                                   </tr>

                                                   <tr id="trVideosModule" runat="server">
                                                    <td colspan="2">
                                                      <table width="tblVideos">

                                                         <tr id="trVideosAll" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblvideosAll" runat="server" Text="Select All"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkexcepall" runat="server" AutoPostBack="true"
                                                                  oncheckedchanged="chkvideosAll_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                         <tr id="trvideosPost" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblexcepsol" runat="server" Text="Solution"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkexcepsol" runat="server" AutoPostBack="true" OnCheckedChanged="chkexcepsol_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trvideosedit" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblexcepedit" runat="server" Text="Edit"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkexcepedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkexcepedit_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trvideosDelete" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblexcepdelete" runat="server" Text="Delete"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkexcepdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkexcepdelete_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trvideospreview" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblexcepview" runat="server" Text="View"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkexcepview" runat="server" AutoPostBack="true" OnCheckedChanged="chkexcepview_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                      </table>   
                                                     </td>
                                                   </tr>
                                                </table>
                                               </td>
                                                        </tr>

                                                         <tr>
                                                           <td width="30%" class="datab">
                                              <table width="100%" id="tableEvents">
                                                 <tr>
                                                   <td width="50%" align="left">
                                                    Gossips & interviews
                                                    </td>
                                                    <td width="50%" align="right">
                                                      <asp:RadioButton ID="rbEventsYes" runat="server" Text="YES" GroupName="Ev" AutoPostBack="true" OnCheckedChanged="rbEventsYes_CheckedChanged"/>
                                                      <asp:RadioButton ID="rbEventsNo" runat="server" Text="NO" GroupName="Ev" AutoPostBack="true" OnCheckedChanged="rbEventsNo_CheckedChanged"/>
                                                   </td>
                                                   </tr>
                                                   <tr id="trEventsModule" runat="server">
                                                    <td colspan="2">
                                                      <table width="100%" id="tblEventsModule">
                                                         <tr id="trEventsAll" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblgossipsall" runat="server" Text="Select All"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkgossipsall" runat="server" AutoPostBack="true"
                                                                  oncheckedchanged="ChkEventsAll_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                         <tr id="trEventsPost" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblgossipspost" runat="server" Text="Post"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkgossipspost" runat="server" AutoPostBack="true" OnCheckedChanged="chkgossipspost_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trEventsEdit" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblgossipsedit" runat="server" Text="Edit"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkgossipsedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkgossipsedit_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trEventsDelete" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblgossipsdelete" runat="server" Text="Delete"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkgossipsdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkgossipsdelete_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trEventspreview" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblgossipsview" runat="server" Text="View"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkgossipsview" runat="server" AutoPostBack="true" OnCheckedChanged="chkgossipsview_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                      </table>   
                                                     </td>
                                                   </tr>
                                                </table>

                                               </td>

                                                <td width="30%" class="datab">
                                                <table width="100%" id="tblCurrentNews">
                                                 <tr>
                                                   <td width="50%" align="left">
                                                    Users
                                                    </td>
                                                    <td width="50%" align="right">
                                                      <asp:RadioButton ID="rbCNNewsYes" runat="server" Text="YES" GroupName="CN" AutoPostBack="true" OnCheckedChanged="rbCNNewsYes_CheckedChanged"/>
                                                      <asp:RadioButton ID="rbCNNewsNo" runat="server" Text="NO" GroupName="CN" AutoPostBack="true" OnCheckedChanged="rbCNNewsNo_CheckedChanged"/>
                                                    </td>
                                                   </tr>
                                                   <tr id="trCNModule" runat="server">
                                                    <td colspan="2">
                                                      <table width="100%" id="Table2">

                                                        <tr id="trCNSelall" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblusersall" runat="server" Text="Select All"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkusersall" runat="server" oncheckedchanged="ChkCNselall_CheckedChanged"  AutoPostBack="true"
                                                                  />
                                                          </td>
                                                        </tr>

                                                         <tr id="trCNPost" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lbluserscreate" runat="server" Text="Create"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkuserscreate" runat="server" AutoPostBack="true" OnCheckedChanged="chkuserscreate_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                        <tr id="trCNEdit" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblusersedit" runat="server" Text="Edit"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkusersedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkusersedit_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                        <tr id="trCNDel" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblusersdelete" runat="server" Text="Delete" ></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkusersdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkusersdelete_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                        <tr id="trCNPreview" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblusersview" runat="server" Text="View"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkusersview" runat="server" AutoPostBack="true" OnCheckedChanged="chkusersview_CheckedChanged"/>
                                                          </td>
                                                        </tr>

                                                      </table>   
                                                     </td>
                                                   </tr>
                                                </table>
                                               </td>

                                               <td width="30%" class="datab">
                                              <table width="100%" id="tblAllNews">
                                                 <tr>
                                                   <td width="50%" align="left">
                                                    All News
                                                    </td>
                                                    <td width="50%" align="right">
                                                      <asp:RadioButton ID="rbANewsYes" runat="server" Text="YES" GroupName="AN" AutoPostBack="true" OnCheckedChanged="rbANewsYes_CheckedChanged"/>
                                                      <asp:RadioButton ID="rbANewsNo" runat="server" Text="NO" GroupName="AN" AutoPostBack="true" OnCheckedChanged="rbANewsNo_CheckedChanged"/>
                                                   </td>
                                                   </tr>
                                                   <tr id="trANModule" runat="server">
                                                    <td colspan="2">
                                                      <table width="100%" id="Table3">
                                                         <tr id="trANselAll" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblANselAll" runat="server" Text="Select All"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="ChkANSelall" runat="server" oncheckedchanged="ChkANSelall_CheckedChanged"  AutoPostBack="true"
                                                          />
                                                          </td>
                                                        </tr>
                                                         <tr id="trANPost" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblANPost" runat="server" Text="Post"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="ChkANpost" runat="server" AutoPostBack="true" OnCheckedChanged="ChkANpost_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trANEdit" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblANEdit" runat="server" Text="Edit"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="ChkANEdit" runat="server" AutoPostBack="true" OnCheckedChanged="ChkANEdit_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trANDel" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblANDel" runat="server" Text="Delete"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkAndel" runat="server" AutoPostBack="true" OnCheckedChanged="chkAndel_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                        <tr id="trAnpreview" runat="server"> 
                                                          <td class="datap5">
                                                          <asp:Label id="lblANpreview" runat="server" Text="View"></asp:Label> 
                                                          </td>
                                                          <td>
                                                          <asp:CheckBox ID="chkANPreview" runat="server" AutoPostBack="true" OnCheckedChanged="chkANPreview_CheckedChanged"/>
                                                          </td>
                                                        </tr>
                                                      </table>   
                                                     </td>
                                                   </tr>
                                                </table>
                                               </td>
                                             </tr>

                                                         <tr>
                                              <td colspan="3" align="center">
                                            
                                              </td>
                                            </tr>
                                                     </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>--%>
                                           <div align="center">
                                               <asp:Button ID="btnsub" runat="server" Text="Submit"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" ValidationGroup="userform" OnClick="btnsub_Click" /> &nbsp;

                                              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="userform" ShowMessageBox="true" ShowSummary="false"/>
                                          <asp:Button ID="Button2" runat="server" Text="Cancel"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click" />
                                         
                                               </div>
                                         </td>
                                      </tr>
                                      <tr><td><br /></td></tr>
                                   </table>
                              </asp:Panel>
                         </td>
                      </tr>
                  </table>
        </div>
</asp:Content>

