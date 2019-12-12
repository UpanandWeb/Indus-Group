<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobOpenings.aspx.cs" Inherits="JobOpenings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - JobOpenings</title>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <table width="100%"> 
   <tr><td width="100%">
   </td></tr>
   <tr>
   <td>
   <asp:GridView ID="GridView1" runat="server" Width="50%" AutoGenerateColumns="False"  BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" Height="242px">
        <Columns>
            <asp:TemplateField HeaderText="JobDescription">
                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# FormatUrl( (int) Eval("id") )%>' runat="server" Text='<%# Bind("JobDesc") %>' CssClass ="headings" ></asp:HyperLink> 
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FunctionalArea" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FunctionalArea") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
            
            
                
            
        </Columns>
        <RowStyle CssClass="datagrid-2" />
        <HeaderStyle CssClass="label5" />
    </asp:GridView>
   </td>
   </tr>
   </table> 
    </div>
    </form>
</body>
</html>
