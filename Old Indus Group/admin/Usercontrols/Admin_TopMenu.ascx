<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Admin_TopMenu.ascx.cs" Inherits="Usercontrols_Admin_TopMenu" %>
<style>
.border
{
	border:none;
	color:#00277a;
	background-color:White;
}
</style>

<center>
    <table width="1500px"  cellpadding="0" cellspacing="0" bgcolor="#ffffff">
       <tr width="1500px">
         <td valign="top" align="center"  width="1500px">
            <img src="../admin.jpg" height="223" alt="" style="width: 1500px" id="imglogo" runat="server" />
        </td>
       </tr>
        <tr><td style="height:20px"></td></tr>

        <tr>
           <td align="left" valign="top" width='100%'>
               <table border="0" cellspacing="0" cellpadding="0" width="1500px">
                    <tr>
                        <td width='10%' align="left" valign="top">
                       <asp:LinkButton ID="lnkhome" runat="server" Text="Home" PostBackUrl="../Admin_Home.aspx" Font-Size="20px" Font-Names="arial" Font-Underline="false"></asp:LinkButton> 
                                                    </td> <td width='80%' align="center">
                               <asp:DataList ID="dlitems" runat="server" RepeatDirection="Horizontal" width="100%"  CellPadding="5" CellSpacing="12">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkitems" runat="server"  Font-Size="20px" Font-Underline="false" Text='<%#Eval("item") %>'
                                         OnCommand="lnkitems_Command" CommandArgument="itemlist"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:DataList>
                                                </td><td width='10%' align="right" valign="top">
                            <asp:LinkButton ID="lnkout" runat="server" Text="LogOut" OnClick="lnkALog_click" Font-Size="20px" Font-Underline="false" ></asp:LinkButton>
                        </td>
                    </tr>
               </table>
          </td>
        </tr>
         <tr><td style="height:10px"></td></tr>
    </table>
</center>