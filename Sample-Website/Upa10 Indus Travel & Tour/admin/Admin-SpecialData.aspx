<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-SpecialData.aspx.cs" Inherits="admin_Admin_SpecialData" %>

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
    <br />
    <table width="80%" align="center">


    <tr>
            <td id="frimg" runat="server" width="50%" runat="server" align="center" colspan="2" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;">
                <table >

                 <tr>
                     <td align="center" colspan="2">
                         <h1>Post Special Offers</h1>
                     </td>
                 </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server" Font-Size="20px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                              
                                   <asp:ListItem Value="1">Special Offers</asp:ListItem>
                             
                       
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="DropDownList3" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr id="tr1" runat="server">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Sub-Category :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <%--<asp:ListItem Value="1">Kulumanali</asp:ListItem>
                                <asp:ListItem Value="2">Agra</asp:ListItem>
                                <asp:ListItem Value="3">Kerala</asp:ListItem>
                                <asp:ListItem Value="4">Gujarath</asp:ListItem>
                                <asp:ListItem Value="5">Ooty</asp:ListItem>
                                <asp:ListItem Value="6"> Goa</asp:ListItem>
                                <asp:ListItem Value="7">Singapore</asp:ListItem>
                                <asp:ListItem Value="8">Australia</asp:ListItem>
                                <asp:ListItem Value="9">Thailand</asp:ListItem>
                                <asp:ListItem Value="10">Dubai</asp:ListItem>
                                <asp:ListItem Value="11">Malaysia</asp:ListItem>
                                <asp:ListItem Value="12">Russia</asp:ListItem>--%>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Sub Category" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                  <%--   <tr id="subtitle" runat="server">
                       
                            <td>
                            <asp:Label ID="Label5" runat="server" Text="Sub-Title :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" Font-Size="20px" AppendDataBoundItems="true" Width="250px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">8 Nights 9 Days Trip</asp:ListItem>
                                <asp:ListItem Value="2">2 Nights 3 Days Trip</asp:ListItem>
                                <asp:ListItem Value="3">6 Nights 7 Days Trip</asp:ListItem>
                          
                                <asp:ListItem Value="5">4 Nights 5 Days Trip</asp:ListItem>
                                <asp:ListItem Value="6">9 Nights 10 Days Trip</asp:ListItem>
                                <asp:ListItem Value="7">4 Nights 5 Days Trip</asp:ListItem>
                        
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList4" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Sub Title" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </td>

                       
                    </tr>--%>

                    <tr>
                        <td>
                           <br />
                        </td>
                    </tr>
                 
                  
                  

                    <tr id="tr2" runat="server">
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Upload Image :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="fd1" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fd1"  ValidationGroup="val" ErrorMessage="Add Image" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                                runat="server" ControlToValidate="fd1"
                                ErrorMessage=".jpg,.jpeg,png  formats are allowed." ForeColor="Red"
                                ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$"
                                ValidationGroup="val" SetFocusOnError="true"></asp:RegularExpressionValidator>



                        </td>
                    </tr>

                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr id="tr3" runat="server">
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Content :" ForeColor="Blue" Font-Size="24px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt4" runat="server" TextMode="MultiLine" Font-Size="24px" Width="500px" Height="300px"></asp:TextBox>

                            <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fd1" InitialValue="0" ValidationGroup="val" ErrorMessage="Add Image" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                                



                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#0b2e82" ValidationGroup="val" ForeColor="White" Width="100px" Font-Size="20px" Height="40px" OnClick="Button1_Click" />


                            <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                        </td>
                    </tr>
                       </table>
                </td>
            </tr>


            </table>
    <br />
    <br />
</asp:Content>

