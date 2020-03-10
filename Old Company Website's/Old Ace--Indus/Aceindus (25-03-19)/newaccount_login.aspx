<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newaccount_login.aspx.cs" Inherits="newaccount_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="560" border="0" align="center">
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td><img src="images/logo.png" width="199" height="46" /></td>
      </tr>
      <tr>
        <td align="center">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="4">To apply to job       
          <asp:LinkButton ID="lnkbtn" runat="server"></asp:LinkButton>   
          <asp:Label ID="lblmsg" runat="server"></asp:Label>
             first <%--<a href="Registrationforjobseeker.aspx?" target="_blank" style="font-weight:normal">Register</a>--%>
             <asp:LinkButton ID="lnkreg" runat="server" Text="Register" 
                    PostBackUrl='<%# string.Format("Registrationforjobseeker.aspx?id=" + Eval("id")) %>' 
                    onclick="lnkreg_Click"></asp:LinkButton>
             <br />
              If you already have an account with us, then login here:<br /></td>
          </tr>
          <tr>
          <td align="left" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="lblMessage" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
          </td>
          </tr>
          <tr>
            <td colspan="2" align="right" nowrap="nowrap" height="30"> Email:</td>
            <td colspan="2" align="left" nowrap="nowrap">
             <asp:TextBox ID="txtuname" Width="140px" runat="server"></asp:TextBox>           
            
             <asp:RequiredFieldValidator ID="rfvuname" runat="server" 
                               ErrorMessage="Enter the UserName" ControlToValidate="txtuname" 
                               ValidationGroup="logingroup">*</asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                               ErrorMessage="Please enter valid email Id" ControlToValidate="txtuname" 
                               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                               ValidationGroup="logingroup">*</asp:RegularExpressionValidator> 
                               </td>
            
          </tr>
          <tr>
            <td colspan="2" align="right" nowrap="nowrap" height="30">Password:</td>
            <td colspan="2" align="left" nowrap="nowrap">
            <asp:TextBox ID="txtpwd" Width="140px" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvpwd" ControlToValidate="txtpwd" 
                               runat="server" ErrorMessage="Enter the Password" ValidationGroup="logingroup">*</asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" nowrap="nowrap">
                <asp:Button ID="btnsubmit" runat="server" Text="Login" 
                    ValidationGroup="logingroup" onclick="btnsubmit_Click"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                    ID="lnkpwd" runat="server" Text="Forget Password?" onclick="lnkpwd_Click"></asp:LinkButton>
            </td>
          </tr>
          <%--<tr>
            <td colspan="4" align="center" nowrap="nowrap">
                <a href="account_register.aspx" target="_blank" style="font-weight:normal">Register</a><br />
            </td>
          </tr>--%>
          <tr>
              <td class="style1" align="center">&nbsp;
               <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="logingroup" />
                        </td>
                    </tr>
        </table>
        </td>
      </tr>
      
    </table></td>
  </tr>
</table>

    </div>
    </form>
</body>
</html>
