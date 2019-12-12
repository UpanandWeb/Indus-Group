<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="admin_news" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - News</title>
    <style type="text/css">
             #GridView1 td
        {
        	border:0.1px solid #CCCCCC;
        }
        #GridView1 th
        {
        	border-right:0.1px solid #CCCCCC;
        }
        </style>
     <script language="javascript" type="text/javascript">
         function alertedit() {
             alert("Client Details has been edited Successfully");
         }
         function alertdelete() {
             alert("Client Details has been deleted Successfully");
         }
    </script>
    <script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>
    <script type="text/javascript">
        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete job Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
</script>

<link rel="stylesheet" href="Styles/stylesheet.css" />

</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
             <table width="100%">
                <tr>
                    <td>                                    
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>
            </table>       
        </td>
    </tr>   
    <tr>
        <td height="40px"></td>
    </tr>
    <tr>
        <td  id="Errmsg" align="right" class="lblog" runat="server">
        </td>
    </tr>
    <tr>
        <td id="crtopt" runat="server" align="right" style="padding-right:30px;" class="lblog">
        </td>
    </tr>
    <tr><td align="center" style="color:#00277a"><strong>News & Events</strong></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td align="center">
           <asp:GridView ID="GridView1" runat="server" Width="950px"   OnRowDataBound="GridView1_rowdatabound" DataKeyNames="id"
          AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White"  onpageindexchanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Event Name">
                        <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" ForeColor="Gray"  NavigateUrl='<%# FormatUrl( (int) Eval("id") )%>' runat="server" Text='<%# Bind("jobtitle") %>' CssClass ="labledd" ></asp:HyperLink> 
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemStyle CssClass="" />
                         <HeaderStyle Width="20%" />
                    </asp:TemplateField>
            
                    <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Event Description" >
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" ForeColor="Gray" Text='<%# Bind("jobdesc") %>' CssClass="lable"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                         <HeaderStyle Width="50%" />
                    </asp:TemplateField>
             <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Event Date" >
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" ForeColor="Gray" Text='<%# Bind("sdate") %>' CssClass="lable"></asp:Label>
                        </ItemTemplate>
            
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Posted On" >
                        <ItemTemplate>
                            <asp:Label ID="Labelpost" runat="server" ForeColor="Gray" Text='<%# Bind("pdate") %>' CssClass="lable"></asp:Label>
                        </ItemTemplate>
            
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="10%" />
                    </asp:TemplateField>
            
            
                    <asp:TemplateField   ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" >  
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" ForeColor="Gray" NavigateUrl='<%# FormatUrlEd( (int) Eval("id") )%>' runat="server" Text='Edit' CssClass ="headings" ></asp:HyperLink> 
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="8%" />
                    </asp:TemplateField>
              
                    <asp:TemplateField  ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" >  
                         <ItemTemplate>
                   <%-- <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# FormatUrlDl( (int) Eval("id") )%>' runat="server" Text='Delete' CssClass ="headings" ></asp:HyperLink> --%>
                         <asp:LinkButton ID="lnkDelete" ForeColor="Gray" OnClick="lnkDelete_Click" runat="server" Text='Delete' CssClass ="headings" ></asp:LinkButton> 
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="8%" />
                        </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
                    ForeColor="#00277a" Height="20px" />
                <RowStyle  />
                <HeaderStyle CssClass="label5" />
            </asp:GridView>
        </td>
   </tr>
   </table>
       <asp:Label ID="lblAcess" runat="server" Visible="false" />
    
    </form>
</body>
</html>
