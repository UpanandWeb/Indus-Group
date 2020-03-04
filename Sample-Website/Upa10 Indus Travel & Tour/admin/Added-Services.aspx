<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Added-Services.aspx.cs" Inherits="admin_Added_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table width="90%" align="center">
        <tr>
            <td align="Center">
                <h2>Value Added Services</h2>
            </td>
        </tr>
        <tr>
          
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" PageSize="20" ShowFooter="True"
                        EnableModelValidation="True"
                        HeaderStyle-HorizontalAlign="Center" CellPadding="4"
                        DataKeyNames="cid" Width="100%" AllowPaging="True" ForeColor="#333333" OnDataBound="gv_DataBound" OnPageIndexChanging="gv_PageIndexChanging"   OnRowDeleting="gv_RowDeleting"  >
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
                                                <asp:Label ID="lbltitle" runat="server" Text="Designation" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltitle1" runat="server" Text='<%#Eval("designation") %>' Font-Size="20px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblcate" runat="server" Text="Job Type" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblcate1" runat="server" Text='<%#Eval("jobtype") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <table width="80%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lblsubcate" runat="server" Text="Experience" Font-Size="24px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblsubcate1" runat="server" Text='<%#Eval("experience") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                            <asp:TemplateField ControlStyle-Width="150px" HeaderStyle-Width="150px" FooterStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
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
                                    <asp:Label ID="lbldate1" runat="server" Text='<%#Eval("posteddate") %>' Font-Size="20px"></asp:Label>
                                    <%--<asp:LinkButton ID="lnkmore" runat="server" Text='Readmore' Font-Size="20px" OnCommand="lnkview_Command1"  CommandArgument='<%# Eval("cid") %>' 
                                                                  CommandName="commandview1" ></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                                    <asp:LinkButton ID="lnkmore" runat="server" Text='<%#Eval("status") %>' Font-Size="20px" CommandName="status"   CommandArgument='<%# Eval("cid") %>' 
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
                                    <asp:ImageButton ID="lnkview" runat="server" ImageUrl="images/Edit.gif" CommandName="edit" CommandArgument='<%# Eval("cid") %>' 
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
                                    <asp:ImageButton ID="lnkdelete" runat="server" ImageUrl="images/delete.gif" CommandArgument='<%# Eval("cid") %>' CommandName="delete"
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
        <tr>
            <td>
               <br />

            </td>
        </tr>
        <tr id="sec" width="50%" runat="server" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                        <td align="center" colspan="2">
                            <table width=100%">
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" align="right">
                                        <asp:Label ID="Label3" runat="server" Text="Category :" ForeColor="Blue" Font-Size="22px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="24px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Inbound Tours</asp:ListItem>

                                            <asp:ListItem Value="2">Outbound Tours</asp:ListItem>
                                               <asp:ListItem Value="3">Hotel Booking</asp:ListItem>
                                               <asp:ListItem Value="4">Travel Services</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" InitialValue="0" ValidationGroup="val1" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" align="right">
                                        <asp:Label ID="Label6" runat="server" Text="Sub-Title :" ForeColor="Blue" Font-Size="22px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList5" runat="server" Font-Size="24px" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                        
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList5" InitialValue="0" ValidationGroup="val1" ErrorMessage="Add Subtitle" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label4" runat="server" Text="Page Name :" ForeColor="Blue" Font-Size="22px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Font-Size="24px"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"  ValidationGroup="val1" ErrorMessage="Add Page Name" ForeColor="Red">*</asp:RequiredFieldValidator>

                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="Button2" runat="server" Text="Submit" BackColor="#0b2e82" ValidationGroup="val1" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button2_Click" />

                                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="val1" ShowMessageBox="true" ShowSummary="false" runat="server" />

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
          </table>
    <br />
    <br />
    <br />

</asp:Content>

