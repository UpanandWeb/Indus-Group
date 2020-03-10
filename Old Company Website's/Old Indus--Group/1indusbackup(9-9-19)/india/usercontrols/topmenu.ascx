<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopMenu.ascx.cs" Inherits="Usercontrols_TopMenu" %>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
      <tr>
        <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/home-icon.png" onclick="ImageButton1_Click" />
        </td>
        <%-- Welcome Username --%>
        
        <td id="tdlogin" runat ="server" width="20%" align="center">
            <asp:Label ID="lbllogin" Text="Welcome : " runat="server" CssClass="datap6"></asp:Label>
            <asp:Label ID="lblloginvalue" Text="" runat="server" CssClass="datap7"></asp:Label>
        </td>
        
        <%-- Company Code --%>
        
        <td align="center" id="tdclientid" runat="server" width="20%">
            <asp:Label ID="lblcompcode" Text="Company Code : " runat="server" CssClass="datap6"></asp:Label>
            <asp:Label ID="lblcompcodevalue" Text="" runat="server" CssClass="datap7"></asp:Label>
        </td>
        
        <%-- Country Code --%>
        
        <td align="center" id="td1" runat="server" width="20%">
            <asp:Label ID="lblcountry" Text="Country : " runat="server" CssClass="datap6"></asp:Label>
            <asp:Label ID="lblcountrycode" Text="" runat="server" CssClass="datap7"></asp:Label>
        </td>
        
        <%-- Last Login --%>
        
        <td align="center" id="tddttm" runat="server" width="20%">
            <asp:Label ID="lbllastlogin" Text="Last Login : " runat="server" CssClass="datap6"></asp:Label>
            <asp:Label ID="lbllastloginvalue" Text="" runat="server" CssClass="datap7"></asp:Label>
        </td>
        
        <%-- Login IP --%>
        
        <td id="ipadr" runat ="server" align="center" width="20%">
            <asp:Label ID="lblipaddr" Text="Login IP : " runat="server" CssClass="datap6"></asp:Label>
            <asp:Label ID="lblipaddrvalue" Text="" runat="server" CssClass="datap7"></asp:Label>
        </td>
        
        <td id="tdlogout" runat ="server" align="center" width="20%">
            <%--<a href="Logout.aspx" class="datap6">Logout</a>--%>
        </td>
      </tr>
   </table>