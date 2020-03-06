<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Right.ascx.cs" Inherits="UControls_Right" %>
 
<table width="100%" align="center" > 
    <tr>
        <td align="center" colspan="3">
            <asp:Label ID="lbltit" runat="server" Text="Enquiry" Font-Size="24px" ForeColor="#2968fd" ></asp:Label>
        </td>
    </tr>
    <tr><td><br /></td></tr>
    <tr>
        <td align="left" width="30%">
            <label for="name">First Name:</label>
        </td>
        <td><b>:</b></td>
        <td align="left" width="60%">
            <asp:TextBox ID="txtname" runat="server"  placeholder="Enter Full Name" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtname" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>

        </td>
    </tr>
 
       <tr>
        <td align="left" width="30%">
            <label for="name">Email:</label>
        </td>
        <td><b>:</b></td>

        <td align="left" width="60%">
            <asp:TextBox ID="txtemail" runat="server"  placeholder="Enter Email" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>

        </td>
    </tr>

     <tr>
        <td align="left" width="30%">
            <label for="name">Phone:</label>
        </td>
        <td><b>:</b></td>

        <td align="left" width="60%">
            <asp:TextBox ID="txtmobile" runat="server"  placeholder="Enter Mobile Number" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmobile" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>

        </td>
    </tr>

     <tr>
        <td align="left" width="30%">
            <label for="name">Description:</label>
        </td>
        <td><b>:</b></td>

        <td align="left" width="60%">
            <asp:TextBox ID="txtcomments" runat="server"  placeholder="Enter Comments" CssClass="form-control" TextMode="MultiLine" Height="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcomments" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>

        </td>
    </tr>
  
     <tr>
        <td colspan="3" align="center">
            <asp:Button ID="btnsubmit" runat="server"  Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click"  ValidationGroup="submit1" />
            <asp:Button ID="btncancel" runat="server"  Text="Cancel" CssClass="btn btn-danger" OnClick="btncancel_Click" />
        </td>
    </tr>

</table>