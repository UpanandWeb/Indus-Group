<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="admin_menu" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <center>
    <asp:ScriptManager ID="scrp" runat="server"></asp:ScriptManager>
    <table width="998px" cellpadding="0" cellspacing="0">
       <tr width="998px">
          <td valign="top" align="center" width='100%' class="lblog" >
                <uc1:TopMenu ID="Topmenu1" runat="server" />
         </td>
       </tr>
    </table>

        <table width="998px" cellpadding="0"cellspacing="0" bgcolor="#ffffff" >

           <tr>
                    <td align="center" height="30px" colspan="2">
                        <font color='#003399' size='5pt'><b>Create Menu Items</b></font>

                    </td>
           </tr>
            <tr><td><br /></td></tr>
            <tr><td><br /></td></tr>

            <tr>
                 <td width="30%" align="right">
                     Country &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td>
                    <asp:DropDownList ID="ddc" runat="server" AutoPostBack="true" Width="200px">
                       <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>USA</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>UK</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>
              <tr>
                  <td width="30%" align="right">
                     Role &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td> 
                <td width="70%" align="left">
                    <asp:DropDownList ID="ddrole" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="ddrole_SelectedIndexChanged">
                       
                    </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>

            <tr>
                  <td width="30%" align="right">
                     Name  &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp; 
                 </td>
                <td width="70%" align="left">
                    <asp:DropDownList ID="ddname" runat="server" AutoPostBack="true" Width="200px">
                       
                    </asp:DropDownList>
                </td>
            </tr>

            <tr><td><br /></td></tr>
              <tr>
                 <td valign="top" width="30%" align="right">
                     Permissions &nbsp;&nbsp;&nbsp;&nbsp; <b>:</b> &nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
                <td width="70%" align="left">
                    <asp:DataList ID="dlitems" runat="server" RepeatDirection="Horizontal"  >
                                <ItemTemplate>
                                    <asp:CheckBox ID="lnkitems" Text='<%# Eval("item") %>' runat="server"  Font-Size="18px" ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:DataList>
                </td>
            </tr>
             <tr><td><br /></td></tr>
            <tr>
                <td >
                    
                </td>
                <td align="left">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                      <asp:Button ID="Button1" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
             </center>
    </div>
    </form>
</body>
</html>
