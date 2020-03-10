<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateGridviewvalues.aspx.cs" Inherits="UpdateGridviewvalues" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Update Gridview Row Values</title>
  <script type="text/javascript">
    function Showalert(username)
    {
        alert(username + ' details updated successfully.');
        if (alert) 
        {
            window.location = 'Default.aspx';
        }
    }
  </script>
</head>
<body>
<form id="form1" runat="server">
<div>
<table>
    <tr>
        <td colspan="2" align="center">
         <b> Edit User Details</b>
        </td>
    </tr>
    <tr>
<td>
User Name:
</td>
<td>
<asp:Label ID="lblUsername" runat="server"/>
</td>
</tr>
<tr>
<td>
First Name:
</td>
<td>
<asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Last Name:
</td>
<td>
<asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
Email:
</td>
<td>
<asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
</td>
<td>
<asp:Button ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" />
<asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click"/>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>