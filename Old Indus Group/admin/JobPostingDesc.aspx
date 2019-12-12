<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobPostingDesc.aspx.cs" Inherits="JobPostingDesc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - JobPosting</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<link href="StyleSheet_new.css" rel="stylesheet" type="text/css" />
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
    <tr>
    <td>
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" Height="242px" ForeColor="#333333" GridLines="None" >
    
        <Columns>
        
            <asp:TemplateField >
               
                <ItemTemplate>
                
            <asp:Label ID="Label2" runat="server" Text="FunctionalArea" cssclass="lableb4"></asp:Label>
            
               <asp:Label ID="Label17" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("FunctionalArea") %>' align="right" cssclass="style1" ></asp:Label>
               
               <br />
               <br />
              
               
               <asp:Label ID="Label4" runat="server" Text="Specialization " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label18" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Specialization") %>' cssclass="style1" align="right"> </asp:Label> 
               
                <br />
                <br />
                
               <asp:Label ID="Label5" runat="server" Text="Industry" align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label19" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Industry") %>' cssclass="style1" align="right"></asp:Label> 
                
                <br />
                <br />
                
               <asp:Label ID="Label7" runat="server" Text="Qualification " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label20" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Qualification") %>' cssclass="style1" align="right"></asp:Label> 
                
                <br />
                <br />
               
               <asp:Label ID="Label9" runat="server" Text="Experience " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label21" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Experience") %>' cssclass="style1" align="right"></asp:Label> 
                
                <br />
                <br />
                
               <asp:Label ID="Label11" runat="server" Text="Position " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label22" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
               
                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Position") %>' cssclass="style1" align="right"></asp:Label> 
                
                <br />
                <br />
               <asp:Label ID="Label13" runat="server" Text="Location " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label23" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label14" runat="server" Text='<%# Bind("Location") %>' cssclass="style1" align="right"></asp:Label> 
                
                <br />
                <br />
                
               <asp:Label ID="Label15" runat="server" Text="Key Skills " align="left" cssclass="lableb4"></asp:Label>
               <asp:Label ID="Label24" runat="server" Text = ": " cssclass="lableb4"></asp:Label>
                <asp:Label ID="Label16" runat="server" Text='<%# Bind("KeySkills") %>' cssclass="style1" align="right"></asp:Label> 
                
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
                
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
                    
            
            
        </Columns>
        
      <RowStyle CssClass="datagrid-2" BackColor="#F7F6F3" ForeColor="#333333" />
        <HeaderStyle CssClass="label5" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        </td></tr></table>
    </div>
    </form>
</body>
</html>
