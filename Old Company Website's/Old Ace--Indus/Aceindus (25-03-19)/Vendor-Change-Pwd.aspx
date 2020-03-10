<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Vendor-Change-Pwd.aspx.cs" Inherits="Vendor_Change_Pwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .feed1 {
            width: 60%;
            border: 1px solid gray;
            border-radius: 4px;
            padding: 4px 0px 4px 10px;
            background-position: 10px 5px;
            background-repeat: no-repeat;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
            height: 30px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding: 10px;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Vendor Change Password</h2>
                <br />
                  <table align="center" width="90%">
        <tr>
          <td width="40%" align="right">
            <asp:Label ID="lblemail" runat="server" Text="Email ID *"></asp:Label>
          </td>
            <td width="10%" align="center"><strong>:</strong></td>
         <td width="40%" align="left">
            <asp:TextBox ID="email" runat="server" CssClass="feed1" Width="250px" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="email" ErrorMessage="Enter Email Id" ForeColor="Red" ValidationGroup="r1"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr><td height="4px"></td></tr>
        <tr>
          <td width="40%" align="right">
            <asp:Label ID="lbluname" runat="server" Text="username*"></asp:Label>
          </td>
          <td width="10%" align="center"><strong>:</strong></td>
           <td width="40%" align="left">
            <asp:TextBox ID="txtuname" runat="server" CssClass="feed1" Width="250px" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter User Name" ForeColor="Red" ValidationGroup="r1"></asp:RequiredFieldValidator>
          </td>
        </tr>
       <tr><td height="4px"></td></tr>
        <tr>
          <td width="40%" align="right">
              <asp:Label ID="lbloldpwd" runat="server" Text="Old Password *"></asp:Label>
          </td>
           <td width="10%" align="center"><strong>:</strong></td>
           <td width="40%" align="left">
            <asp:TextBox ID="oldpassword" runat="server" CssClass="feed1" Width="250px" TextMode="Password" ></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" 
                ControlToValidate="oldpassword" ErrorMessage="Enter Old Password" ForeColor="Red" ValidationGroup="r1"></asp:RequiredFieldValidator>
          </td>
        </tr>
       <tr><td height="4px"></td></tr>
       
        <tr>
          <td width="40%" align="right">
                <asp:Label ID="lblnewpwd" runat="server" Text="New Password *"></asp:Label>
            </td>
            <td width="10%" align="center"><strong>:</strong></td>
           <td width="40%" align="left">
              <asp:TextBox ID="newpassword" runat="server" CssClass="feed1" Width="250px" TextMode="Password" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="newpassword" ValidationGroup="r1"
              ErrorMessage="Enter New Password"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
       <tr><td height="4px"></td></tr>
       
        <tr>
            <td width="40%" align="right">
                <asp:Label ID="lblcnfpwd" runat="server" Text="Confirm Password *"></asp:Label>
            </td>
          <td width="10%" align="center"><strong>:</strong></td>
            <td width="40%" align="left">
                <asp:TextBox ID="confirmpassword" runat="server" CssClass="feed1" Width="250px" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpassword" ForeColor="Red"
                   ErrorMessage="Enter Confirm Password" ValidationGroup="r1"></asp:RequiredFieldValidator>
            </td>
        </tr>
       <tr><td height="4px"></td></tr>
      
        <tr>
          <td colspan="3" align="center"><label> </label>
              <div align="center">
                  <asp:Button ID="ImageButton1" runat="server" CssClass="btn btn-success" Text="Submit"   ValidationGroup="r1"
                      onclick="ImageButton1_Click"  />
                   <asp:Button ID="cancelbtn" runat="server"  Text="Cancel"  onclick="cancelbtn_Click"  CssClass="btn btn-danger" />
              </div>
          </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3"> 
                <asp:Label ID="lblmsg" runat="server" ></asp:Label><br>
                <asp:Label ID="lblerror" runat="server" Height="17px" Width="246px"></asp:Label>
            </td>
        </tr>
    </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>

