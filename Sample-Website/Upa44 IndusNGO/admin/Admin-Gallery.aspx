<%@ Page Title="Admin-Gallery" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Gallery.aspx.cs" Inherits="admin_Admin_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="js/jquery.MultiFile.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        debugger
        function validate() {

            var inp = document.getElementById('FileUpload1');
            if (inp.files.length === 0) {
                alert("Attachment Required");
                inp.focus();

                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <div class="cent_content" style="margin-top:-56px;"  >
      <h1>Gallery </h1>


        <table align="center" width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        <tr><td align="right">
            
            <asp:Button ID="post" runat="server" Text="Post" BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="30px" OnClick="post_Click" /></td></tr>
        <tr><td><br /></td></tr>
        <tr>
            <td id="data1" runat="server">
             <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                                       EnableModelValidation="True" 
                                       HeaderStyle-HorizontalAlign="Center" CellPadding="4"    
                                      DataKeyNames="id" Width="100%"   AllowPaging="True" ForeColor="#333333" OnPageIndexChanging="gv_PageIndexChanging" OnRowCommand="gv_RowCommand" OnRowDeleting="gv_RowDeleting"     >
         <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px"   />
                                     <Columns>
                                       <asp:TemplateField ControlStyle-Width="50px"  HeaderStyle-Width="50px" FooterStyle-Width="50px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr><td align="center">
                                                 <asp:Label ID="lblarea" runat="server" Text="ID" Font-Size="24px"></asp:Label>
                                          </td></tr></table>       
                                          </HeaderTemplate>
                                           <ItemTemplate> 
                                          <table width="100%" align="center"><tr><td align="center">  
                                                <asp:Label ID="lblnamec" runat="server" Text= '<%# Container.DataItemIndex + 1 %>' ToolTip="URL" Font-Size="20px"></asp:Label>
                                          </td></tr></table>   
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                       </asp:TemplateField>

                                          <asp:TemplateField  ControlStyle-Width="150px"  HeaderStyle-Width="150px" FooterStyle-Width="150px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="100%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Category" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate>
                                         <asp:Label ID="arealbl2" runat="server" Text='<%#Eval("category") %>' Font-Size="20px"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateField>

                                             <asp:TemplateField  ControlStyle-Width="300px"  HeaderStyle-Width="300px" FooterStyle-Width="300px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                          <HeaderTemplate>
                                          <table width="80%" align="center"><tr> <td align="center">
                                               <asp:Label ID="lblarea" runat="server" Text="Imagename" Font-Size="24px"></asp:Label>
                                              </td></tr></table>
                                          </HeaderTemplate>    
                                        <ItemTemplate> 
                                         <asp:Label ID="arealbl311" runat="server" Text='<%#Eval("imagename") %>' Font-Size="20px"></asp:Label>
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
                                        &nbsp;    &nbsp;  
                                      <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif"  CommandArgument='<%# Eval("id") %>' 
                                                                AlternateText="Edit" CommandName="Edit"  ></asp:ImageButton>
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

        <tr id="data" runat="server">
            <td id="fr" runat="server" align="center" colspan="2" style="border: 1px solid;
    padding: 2px;
    box-shadow: 5px 10px 8px #888888;background-color: #E8F8F5 ;">

                <table width="700px" align="center" >
                    <tr><td><br /></td></tr>
                    <tr>
                        <td align="left" width="20%"><asp:Label ID="lb" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label></td><td><asp:TextBox ID="txt1" runat="server"  Width="250px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1" ErrorMessage="Add Title" ForeColor="Red" ValidationGroup="val">*</asp:RequiredFieldValidator>

                                                                                                                                                         </td>

                   
                    </tr>
                    <tr><td><br /></td></tr>

     <tr>
                     
                    <td><asp:Label ID="lb2" runat="server" Text="Category:" ForeColor="Blue" Font-Size="24px" ></asp:Label></td><td><asp:DropDownList ID="ddl" runat="server" Height="30px" AutoPostBack="true" AppendDataBoundItems="true" required ont-Size="24px" Width="150px" OnSelectedIndexChanged="ddl_SelectedIndexChanged1">
                             <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">Multiple Images</asp:ListItem>
                           <asp:ListItem Value="2">Home Images</asp:ListItem>

                                                  </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl" ErrorMessage="Add Type" ForeColor="Red" ValidationGroup="val" InitialValue="0">*</asp:RequiredFieldValidator>
                                                                                                                                </td></tr>

                    <tr><td>
                        <br />
                        </td></tr>
                      <tr id="txt12" runat="server">
                 <td valign="top"> 
                    <asp:Label ID="lbldis" runat="server" Text="Front-Image:" ForeColor="Blue" Font-Size="24px"></asp:Label>
                </td> 
                        
                <td>
                     <%--<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" required Width="500px" Height="300px" Font-Size="22px"></asp:TextBox>--%>
                       <asp:FileUpload ID="FileUpload1" runat="server"/>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator7"

                     runat="server" ControlToValidate="FileUpload1"

                     ErrorMessage=".jpg,.jpeg,png  formats are allowed." ForeColor="Red"

                   
                  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$"

                     ValidationGroup="val" SetFocusOnError="true"></asp:RegularExpressionValidator>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Add image" ForeColor="Red" ValidationGroup="val">*</asp:RequiredFieldValidator>
                    
                     <br />   <asp:Button ID="Button1" runat="server" Text="upload" OnClick="Button1_Click" OnClientClick="javascript:return validate();"/>

                  
                  
                </td>
             </tr>
                <tr>
                    <td>
                    
                        <br />
                    </td>
                </tr>
                    <%--<tr id="Tr1" runat="server">
                 <td valign="top"> 
                    <asp:Label ID="Label1" runat="server" Text="Image Content :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                </td> 
                        
                <td>
                     <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" required Width="500px" Height="300px" Font-Size="22px"></asp:TextBox>
                   
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt1" ValidationGroup="ad" ErrorMessage="please add description" ForeColor="Red" ></asp:RequiredFieldValidator><br />
                </td>
    </tr>--%>
                      <tr id="Tr2" runat="server">
                 <td valign="top"> 
                    <asp:Label ID="Label2" runat="server" Text="Album Image :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                </td> 
                        
                <td>
                     <%--<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" required Width="500px" Height="300px" Font-Size="22px"></asp:TextBox>--%>
                       <asp:FileUpload ID="FileUpload2"  class="multi" runat="server"  AllowMultiple="true"    />
                    
                   <asp:RegularExpressionValidator Visible="false" ID="RegularExpressionValidator1"

                     runat="server" ControlToValidate="FileUpload2"

                     ErrorMessage=".jpg,.jpeg,png  formats are allowed." ForeColor="Red"

                   
                  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$"

                     ValidationGroup="val" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </td>
             </tr>
                      <tr><td align="center" colspan="2"><asp:Button ID="btnsub" runat="server" Text="Submit"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" ValidationGroup="val" OnClick="btnsub_Click"/>

                          <asp:Button ID="Button2" runat="server" Text="Cancel"  BackColor="#0b2e82" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click" />

                          <asp:ValidationSummary ID="vl" runat="server" ValidationGroup="val" ShowMessageBox="true" ShowSummary="false" />
                          </td></tr>
                    </table></td>

            


             </tr>
           
                </table>
            
        </div>


</asp:Content>

