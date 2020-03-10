<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Vendor-Forget-Pwd.aspx.cs" Inherits="Vendor_Forget_Pwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .feed {
            width: 80%;
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding: 10px;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Vendor Forget Password</h2>
                <br />
                  <table height="" border="0" width="100%" align="center" >

         <tr bgcolor="f5f5f5">
             <td align="right" width="40%">
                 <b>User Id:</b>&nbsp;&nbsp;&nbsp;&nbsp;
             </td>
             <td width="60%">
                <asp:TextBox ID="txtmail" runat="server" MaxLength="40" placeholder="Enter your Email Id." CssClass="feed" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email Id" ValidationGroup="vendor" ForeColor="Red"
                    ControlToValidate="txtmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"  ValidationGroup="vendor" ForeColor="Red"
                    ErrorMessage="Invalid EmailID" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">

                </asp:RegularExpressionValidator><!--<input type="text" name="ELID" maxlength="40">-->
             </td>
         </tr>
         <tr bgcolor="f5f5f5">
             <td>
                 <b>&nbsp;</b></td>
             <td>
                 Ex:<b>xxxx@xxxx.com</b>
             </td>
        </tr>
        <tr>
             <td colspan="2"><label> </label>
               <div align="center">
                  <asp:Button ID="submitbtn" runat="server"  onclick="submitbtn_Click"  ValidationGroup="vendor" CssClass="btn btn-success" Text="Submit" />
                    &nbsp;&nbsp;
                  <asp:Button ID="cancelbtn" runat="server"   CssClass="btn btn-danger"  onclick="cancelbtn_Click"  Text="Cancel" />
                    &nbsp; &nbsp; &nbsp; &nbsp;
               </div>
             </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="f5f5f5">
                    <asp:Label ID="lblMsg" runat="server" CssClass="ErrMsg"></asp:Label>
            </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
      </table>

            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>



