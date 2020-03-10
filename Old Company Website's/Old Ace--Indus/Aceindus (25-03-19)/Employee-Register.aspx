<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Employee-Register.aspx.cs" Inherits="Employee_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script type="text/javascript">

       function CheckNumericKeyInfo(char1, mozChar) {
           if (mozChar != null) { // Look for a Mozilla-compatible browser
               if ((mozChar >= 48 && mozChar <= 57) || char1 == 8)
                   RetVal = true;
               else {
                   RetVal = false;
               }
           }
           else { // Must be an IE-compatible Browser
               if ((char1 >= 48 && char1 <= 57) || char1 == 8) RetVal = true;
               else {
                   RetVal = false;
               }
           }
           return RetVal;
       }
</script>
     <style>
        .feed {
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding: 10px; " >
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Employee Register</h2>
                <br />
                                                    <table width="100%" border="0" align="center">
                                                        <tr>
                                                            <td align="center">
                                                                <table border="0" align="center">
                                                                    <%--<tr>
                           <td height="30" colspan="3" ><font class="crentopenings"><b>New Employee Register</b></font></td>
                          </tr>--%>
                                                                    <tr>

                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                                                        </td>
                                                                        <td valign="top" width="4px" class="style1"><strong>:</strong></td>
                                                                        <td valign="top" align="left" style="padding-left: 10px" width="300px"
                                                                            class="style1">
                                                                            <asp:TextBox ID="txtfname" runat="server" Width="200px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                                                ControlToValidate="txtfname" ErrorMessage="Please enter Name"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
                                                                        </td>
                                                                        <td valign="top" class="style1" width="4px"><strong>:</strong></td>
                                                                        <td valign="top" style="padding-left: 10px">
                                                                            <asp:TextBox ID="txtlname" runat="server" Width="200px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                                                ControlToValidate="txtlname" ErrorMessage="Please enter Lastname"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="padding-right: 15px" align="right">
                                                                            <asp:Label ID="lblusername" runat="server" Text="Email"></asp:Label>
                                                                        </td>
                                                                        <td class="style1" valign="top"><strong>:</strong></td>
                                                                        <td valign="top" style="padding-left: 10px">
                                                                            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px" AutoPostBack="true"
                                                                                OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                                ControlToValidate="txtusername" ErrorMessage="Please enter the User Name"
                                                                                Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="reg1" runat="server"
                                                                                ErrorMessage="Please Enter Valid Email Address"
                                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                                ControlToValidate="txtusername" 
                                                                                ValidationGroup="vendor" ForeColor="Red">*</asp:RegularExpressionValidator>
                                                                            <asp:Image ID="imgcheck1" ImageUrl="../Images/check.gif" runat="server" Width="17px" Height="17px" Visible="false" />
                                                                            <asp:Label ID="lblcheckavail" runat="server" Visible="false">Check Availability</asp:Label></td>
                                                                        </tr>
                                                           
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td valign="top" style="padding-left: 10px">
                                                                <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                                    ControlToValidate="txtpwd" ErrorMessage="Please enter the Password"
                                                                    Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td valign="top" style="padding-left: 10px">
                                                                <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px"
                                                                    TextMode="Password"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd"
                                                                    ErrorMessage="*" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red"
                                                                    ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd"
                                                                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="vendor">*</asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanyname" runat="server" Text="Company Name"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>

                                                        <%--<tr>
                                <td   valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcompanymailid" runat="server" Text="Company Mail ID"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Please Enter Valid Email Address" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="vendor">*</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtcompanymailid" ValidationGroup="vendor">*
                                    </asp:RequiredFieldValidator>    
                                </td>
                            </tr>--%>
                                                        <%--<tr>
                                <td  valign="top" style="padding-right:15px" align="right">
                                    <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                                </td>
                                <td  valign="top"><strong>:</strong></td>
                                <td style="padding-left:10px">
                                    <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                        ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                                        Font-Size="Smaller" ValidationGroup="vendor">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>

                                                        <tr>
                                                            <td valign="top" style="padding-right: 15px" align="right" class="style4">
                                                                <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                                                            </td>
                                                            <td class="style1" valign="top"><strong>:</strong></td>
                                                            <td style="padding-left: 10px" valign="top">
                                                                <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" OnKeyPress="return CheckNumericKeyInfo(event.keyCode, event.which)"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                                                    ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number."
                                                                    Font-Size="Smaller" ValidationGroup="vendor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                 <asp:RegularExpressionValidator ID="reg2" runat="server" ForeColor="Red" ControlToValidate="txtphone" ErrorMessage="invalid phone number" ValidationGroup="vendor"  ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                                 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style1" valign="top" style="padding-right: 15px" align="right" class="style4">&nbsp;
                                                            </td>
                                                            <td valign="top">&nbsp;</td>
                                                            <td align="left">
                                                                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success"
                                                                    OnClick="btnsubmit_Click" ValidationGroup="vendor" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="btn btn-danger"
                                         OnClick="btnreset_Click" />
                                                            </td>
                                                        </tr>

                                                            </table>
                                                                </td>
                                                            </tr>          
                                                        <tr>
                                                            <td class="style4">&nbsp;</td>
                                                        </tr>
                                                        <%--<tr>
                                                            <td class="style1" valign="top" style="padding-right: 15px" align="right" class="style4">&nbsp;
                                                            </td>
                                                            <td valign="top">&nbsp;</td>
                                                            <td align="left">
                                                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success"
                                                                    OnClick="btnsubmit_Click" ValidationGroup="vendor" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-danger"
                                         OnClick="btnreset_Click" />
                                                            </td>
                                                        </tr>--%>

                                                        <%--<tr>
                                                            <td align="center" class="style4">
                                                                <table border="0" align="center">
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td></td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td class="style4">
                                                                <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
                                                        </tr>
                                                                  
                                                    </table>

            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>
