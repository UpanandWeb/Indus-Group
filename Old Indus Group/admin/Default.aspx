<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Login</title>
    
    
        <script language="javascript" type="text/javascript">
            function alertsubmit() {
                alert("Please enter correct Username or Password!");
            }
    </script>
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#ffffff">
    <form id="form1" runat="server">
    <center>
    <table width="1500px" height="708" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr height="12%" width="100%">
        <td valign="bottom" height="230px">
     <img src="images/admin.jpg" height="223" alt="" style="width: 1500px" />
    </td>
    </tr>
        <tr><td><br /><br /></td></tr>
   <tr>
    <td align="center" valign="top">
    <font size="8" color="#0e4860"><strong>Admin Control Panel </strong></font>
    </td>
    </tr>
    
     <tr>
            <td align="Right" valign="top">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
   <tr  width="1500px">
   <td valign="top">
   <table align="center" border="0" cellspacing="2" cellpadding="2" class="text" width="1500px">
     <tr height="38">
     <td colspan="2"></td>
     </tr>
     <tr height="38">
     <td colspan="2"></td>
     </tr>
      <tr class="text" valign="top">
        <td width="298" align="right" style="height: 40px">
           <font color="#FF3333" face="verdana" size="5pt" 
                style="font-family: 'libel Suit'">User Type: </font>
        </td>
        <td width="425" style="height: 40px" valign="top">
            <asp:DropDownList ID="ddlUserType" runat="server" Width="250px" Height="40px" Font-Size="18px">                
            </asp:DropDownList>
            
        </td>
   </tr>
   <tr>
   <td></td>
    <td>
        <asp:RequiredFieldValidator ID="rfvUserType" runat="server" 
                ErrorMessage="Please select user type" ControlToValidate="ddlUserType" 
                InitialValue="Select User Type" ValidationGroup="Login"></asp:RequiredFieldValidator>
    </td>
   </tr>
   <tr class="text" valign="top">
        <td width="298" align="right" style="height: 40px">
           <font color="#FF3333" face="verdana" size="5pt">Country: </font>
        </td>
        <td width="425" style="height: 40px" valign="top">
            <asp:DropDownList ID="ddlcountry" runat="server" Width="250px" Height="40px" Font-Size="18px">
                <asp:ListItem Selected="True">Select</asp:ListItem>
                <asp:ListItem>India</asp:ListItem>
                <asp:ListItem>USA</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>                
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Please select Country" ControlToValidate="ddlcountry" 
                InitialValue="Select" ValidationGroup="Login">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
   <tr class="text" valign="top">
        <td width="298" align="right">
          <font color="#FF3333" face="verdana" size="5pt" 
                style="font-family: 'libel Suit'">User ID: </font>
        </td>
        <td width="425">
           <asp:TextBox ID="emailLogin" CssClass="tbox" Width="250px" MaxLength="40" runat="server" Height="40px" Font-Size="18px"></asp:TextBox>
            
        </td>
   </tr>
   <tr>
   <td></td>
    <td>
        <asp:RequiredFieldValidator ID="rfuid" runat="server" 
                ErrorMessage="Please enter User ID" ControlToValidate="emailLogin" 
                ValidationGroup="Login"></asp:RequiredFieldValidator>
    </td>
   </tr>
   <tr class="text" valign="bottom">
        <td width="298" align="right" style="height: 40px">
           <font color="#FF3333" face="verdana" size="5pt" 
                style="font-family: 'libel Suit'">Password: </font>
        </td>
        <td width="425" style="height: 40px">
            <asp:TextBox ID="pass" CssClass="tbox" Width="250px" MaxLength="20" runat="server" Height="40px"
               TextMode="Password" Font-Size="18px"></asp:TextBox>
            
        </td>
   </tr>
   <tr>
   <td></td>
    <td>
    <asp:RequiredFieldValidator ID="rfpw" runat="server" 
                ErrorMessage="Please enter password" ControlToValidate="pass" 
                ValidationGroup="Login"></asp:RequiredFieldValidator>
    </td>
   </tr>
       <tr><td><br /></td></tr>
   <tr class="text">
       
        <td colspan="2" align="center" height="40">
            <asp:CheckBox ID="chkremember" CssClass="but" Text="Keep me signed in " runat="server"  Font-Size="20px"
              />
        </td>
   </tr>
       <tr><td><br /></td></tr>

   <tr class="text">
       
        <td colspan="2" align="center" height="40">
            <asp:Button ID="btnLogin" CssClass="but" Text="Login" runat="server" ValidationGroup="Login" Font-Size="20px"
            OnClick="btnLogin_Click"  Width="100px" Height="40px" />
        </td>
   </tr>
   <tr class="text">
       <td id="tdmsg" colspan="2" align="right" runat="server" style="height: 23px">
           
       </td>
   </tr>
    
    </table>
   </td>
   </tr> 
    </table>
    </center>
    
    </form>
</body>
</html>
