<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopHeader.ascx.cs" Inherits="admin_Usercontrols_TopHeader" %>



<table align="center" valign="top" width="100%">
    <tr>
        <td align="center" valign="top" width="100%">
            <table width="100%" align="center">
                <tr>
                    <td align="left" width="20%">
                        <a href="Admin-Home.aspx">
                            <img src="images/indusabroad.png" alt="Logo" /></a>
                    </td>
                    <td align="right" width="80%">
                        <img src="images/banneradmin.png" />
                    </td>
                </tr>
                <tr style="background-color:#005d76;">
                    <td align="left">
                        <img src="images/admin.png" alt="0" />
                        <span style="color: White; text-align: left">User:
                            <asp:Label ID="lbluser" runat="server" ForeColor="White"></asp:Label>
                        </span>
                    </td>
                    <td align="right">
                        <img src="images/logout.jpg" alt="0" />
                        <asp:LinkButton ID="lnklogout" runat="server" Text="Logout" Font-Underline="false" ForeColor="White" OnClick="lnklogout_Click"></asp:LinkButton>
                    </td>
                </tr>
           
            </table>
            <table width="100%" align="center" id="menu-bar" > 
                <tr id="tr1" runat="server">
                    <td align="center" valign="middle" id="td1" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Admin-Home.aspx">Home</a></td>
                    <td align="center" id="td2" runat="server">|</td>

                    <td align="center" valign="middle" id="td3" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Admin-Enquiry.aspx">Enquiry</a></td>
                    <td align="center" id="td4" runat="server">|</td>

                    <td align="center" valign="middle" id="td5" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Admin-Courses.aspx">Courses</a></td>
                    <td align="center" id="td6" runat="server">|</td>

                        <td align="center" valign="middle" id="td12" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Admin-University.aspx">University</a></td>
                    <td align="center" id="td13" runat="server">|</td>

                    <td align="center" valign="middle" id="td8" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Admin-Student-Info.aspx">Student Info</a></td>
                    <td align="center" valign="middle" id="Td9" runat="server">|</td>

                    <td align="center" valign="middle" id="td7" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Support.aspx">Support</a></td>
                    <td align="center" valign="middle" id="empindia1" runat="server">|</td>

                    <td align="center" valign="middle" id="td10" runat="server" style="font-size: 19px; font-weight: lighter;font-weight:bold;" width="13%"><a href="Users.aspx">Users</a></td>
                    <td align="center" valign="middle" id="Td11" runat="server">|</td>

                    <td align="center" valign="middle" id="empUs" style="font-size: 19px; font-weight: lighter;font-weight:bold;" runat="server" width="13%"><a href="Feedback.aspx">Feedback</a></td>
                    <td align="center" id="empUs1" runat="server">|</td>
                </tr>
            <tr><td><br /></td></tr>
            </table>
        </td>
    </tr>
</table>

