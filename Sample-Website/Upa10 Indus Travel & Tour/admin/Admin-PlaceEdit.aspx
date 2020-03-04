<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-PlaceEdit.aspx.cs" Inherits="admin_Admin_PlaceEdit" %>

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
    <table align="center">
    <tr id="sec" width="70%" runat="server" style="border: 1px solid; padding: 2px; box-shadow: 5px 10px 8px #888888; background-color: #E8F8F5;" align="center">
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
                                        <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="24px" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="2">Domestic Tours</asp:ListItem>

                                            <asp:ListItem Value="3">International Tours</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" InitialValue="0" ValidationGroup="val1" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                              <%--  <tr>
                                    <td width="50%" align="right">
                                        <asp:Label ID="Label6" runat="server" Text="Sub-Title :" ForeColor="Blue" Font-Size="22px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList5" runat="server" Font-Size="24px" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                         <asp:ListItem Value="1">8 Nights 9 Days Trip</asp:ListItem>
                                <asp:ListItem Value="2">2 Nights 3 Days Trip</asp:ListItem>
                                <asp:ListItem Value="3">6 Nights 7 Days Trip</asp:ListItem>
                                <asp:ListItem Value="4">Gujarath</asp:ListItem>
                                <asp:ListItem Value="5">4 Nights 5 Days Trip</asp:ListItem>
                                <asp:ListItem Value="6">9 Nights 10 Days Trip</asp:ListItem>
                                <asp:ListItem Value="7">4 Nights 5 Days Trip</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" InitialValue="0" ValidationGroup="val1" ErrorMessage="Add Category" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>--%>

                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label4" runat="server" Text="Place Name :" ForeColor="Blue" Font-Size="22px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Font-Size="24px"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"  ValidationGroup="val1" ErrorMessage="Add City" ForeColor="Red">*</asp:RequiredFieldValidator>

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
</asp:Content>

