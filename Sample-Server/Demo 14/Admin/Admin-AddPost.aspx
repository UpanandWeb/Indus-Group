<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin-AddPost.aspx.cs" Inherits="Admin_Admin_AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%-- <script type="text/javascript">
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
            </script>    --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table align="center" width="90%">
        <tr>
            <td>
                <table align="center" width="90%">
                    <tr>
                        <td height="8px"></td>
                    </tr>

                    <tr>
                        <td align="center" colspan="3">
                            <h2>Add Post</h2>
                        </td>
                    </tr>
                    <tr>
                        <td height="20px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="lbltype" runat="server" Text="Select Type" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:DropDownList ID="ddtype" runat="server" Font-Size="16px" Width="242px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="ddtype_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Work</asp:ListItem>
                                <asp:ListItem>Events</asp:ListItem>
                                <asp:ListItem>Gallery</asp:ListItem>
                                <asp:ListItem>News</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="lbltitle" runat="server" Text="Title" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txttitle" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr runat="server" id="des">
                        <td width="45%" align="right">
                            <asp:Label ID="lbldis" runat="server" Text="Description" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txtdis" runat="server" Font-Size="16px" Width="240px" TextMode="MultiLine" Height="70px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="Label2" runat="server" Text="Keywords" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txtkeywords" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" width="90%" align="center">
                            <table width="90%" align="center">
                                <tr>
                                    <td width="45%" align="right">
                                        <asp:Label ID="Label1" runat="server" Text="Upload Main Image" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="10%" align="center">
                                        <b>:</b>
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:FileUpload ID="mainupload" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:FileUpload>
                                        <%-- <asp:Button ID="Btnmainupload" runat="server" Font-Size="16px" Height="30px" Width="40px" Text="Upload" />--%>
                                    </td>
                                    <td width="15%" align="left">
                                        <asp:Button ID="Btnmainupload1" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Upload" OnClick="Btnmainupload1_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8px"></td>
                                </tr>
                                <tr id="lblmsg" runat="server" visible="false">
                                    <td width="45%" align="right"></td>
                                    <td width="10%" align="center">
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:Label ID="lblmain" runat="server" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="15%" align="left"></td>
                                </tr>
                                <tr>
                                    <td height="8px"></td>
                                </tr>
                                <tr id="otherimages" runat="server">
                                    <td width="45%" align="right">
                                        <asp:Label ID="Label3" runat="server" Text="Upload Other Images" Font-Size="16px" Height="30px"></asp:Label>
                                    </td>
                                    <td width="10%" align="center">
                                        <b>:</b>
                                    </td>
                                    <td width="30%" align="left">
                                        <asp:FileUpload ID="otherupload" runat="server" Font-Size="16px" Width="240px" Height="30px" AllowMultiple="true" ></asp:FileUpload>
                                    </td>
                                    <td width="15%" align="left"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
            <%--         <tr>
                        <td height="8px"></td>
                    </tr>
                    <tr>
                        <td width="45%" align="right">
                            <asp:Label ID="Label4" runat="server" Text="Uploded By" Font-Size="16px" Height="30px"></asp:Label>
                        </td>
                        <td width="10%" align="center">
                            <b>:</b>
                        </td>
                        <td width="45%" align="left">
                            <asp:TextBox ID="txtuploaddedby" runat="server" Font-Size="16px" Width="240px" Height="30px"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td height="20px"></td>
                    </tr>
                    <tr>
                        <td  align="center" colspan="3">
                            <asp:Button ID="btnsave" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Submit" OnClick="btnsave_Click" />
                             <asp:Button ID="Btnmainupload" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Submit" OnClick="Btnmainupload_Click" Visible="false" />
                            <asp:Button ID="btncancel" runat="server" Font-Size="16px" Height="30px" Width="80px" Text="Cancel"  OnClick="btncancel_Click"/>

                        </td>
                    </tr>
                    <tr>
                        <td height="8px"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

