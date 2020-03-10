<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sendattachementtoemail.aspx.cs" Inherits="admin_sendattachementtoemail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        #message
        {
            width: 313px;
            height: 183px;
        }
        #frm
        {
            width: 218px;
        }
        #subject
        {
            width: 291px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 294px">
          <table cellspacing="0" cellpadding="0" align="center">
            <tbody>
              <tr>
                <td colspan="2" align="middle">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>
                </td>
              </tr>
              <tr>
                <td width="34%" align="right">From </td>
                <td width="66%">
                <asp:TextBox ID="txtfrom" runat="server" Width="300px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" 
                      ControlToValidate="txtfrom" ErrorMessage="Please enter Email Id" ValidationGroup="sendmailgrp"
                      >*</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                      ControlToValidate="txtfrom"  ValidationGroup="mailgrp"
                      ErrorMessage="Please enter a valid email id Eg:mak@yahoo.com" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                      >*</asp:RegularExpressionValidator>
                </td>
              </tr>
              <tr>
                <td align="right">Subject </td>
                <td width="66%" >
                <asp:TextBox ID="txtsubject" runat="server" Height="25px" Width="450px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvsubject" runat="server" ValidationGroup="sendmailgrp" ControlToValidate="txtsubject"
                            ErrorMessage="Please Enter Subject" >*</asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr>
                <td align="right">Attach Resume </td>
                <td width="66%">
                    <asp:FileUpload ID="uploadresume" runat="server" />
                </td>
              </tr>
              <tr>
                <td align="right">Message</td>
                <td>
                <asp:TextBox ID="txtmessage" runat="server" TextMode="MultiLine" Height="200px" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvmsge" runat="server" ValidationGroup="sendmailgrp"
                            ErrorMessage="Please Type Message Here" ControlToValidate="txtmessage">*</asp:RequiredFieldValidator>
                </td>
              </tr>
              <tr> 
              <td></td>               
                <td>
                   <div align="center">
                     <asp:Button ID="btnsubmit" runat="server" Text="Submit" onclick="btnsubmit_Click"  ValidationGroup="sendmailgrp"/>
                  </div>
               </td>
              </tr>
            </tbody>
          </table>
    </div>
    </form>
</body>
</html>
