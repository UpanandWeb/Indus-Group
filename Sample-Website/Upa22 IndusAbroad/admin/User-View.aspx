<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="User-View.aspx.cs" Inherits="admin_User_View" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br /><br />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>

    <table border="0" width="100%">
        <tr>
            <td align="right" style="padding-right: 20px">
                <asp:LinkButton ID="lnkview" runat="server" ForeColor="Blue" Text="Back" Font-Size="Medium" OnClick="lnkview_Click"></asp:LinkButton>
            </td>
        </tr>

        
        <tr>
            <td>
                <table width="100%" border="0" >
                    <tr>
                        <td colspan="8" align="center">
                            <font size="5" color="#0e4860"><strong>View User Details</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 20px"></td>
                    </tr>
                    <tr>
                        <td align="right" width="15%">First Name
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtFName" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvFName" runat="server"
                                ErrorMessage="Please enter First Name" ControlToValidate="txtFName" ForeColor="Red"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td align="right" width="15%">Last Name
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtLName" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvLName" runat="server" ForeColor="Red"
                                ControlToValidate="txtLName" ErrorMessage="Please enter Last Name"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>

                    <tr>
                        <td align="right" width="15%">Designation
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:DropDownList ID="ddlUserType" runat="server" Width="91%" Enabled="false">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>Web Admin</asp:ListItem>
                                <asp:ListItem>Employee</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                ControlToValidate="ddlUserType" ErrorMessage="Please select designation"
                                ValidationGroup="UserIdCreation" InitialValue="Select"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td align="right" width="15%">Country
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:DropDownList ID="ddlCountry" runat="server" Width="91%" Enabled="false">
                                <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                <asp:ListItem Value="India">India</asp:ListItem>
                                <asp:ListItem Value="USA">USA</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                ControlToValidate="ddlCountry" ErrorMessage="Please select Country"
                                ValidationGroup="UserIdCreation" InitialValue="Select Country"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td height="5px"></td>
                    </tr>
                    <tr>
                        <td align="right">User Id
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" colspan="1">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtUserId" runat="server"  Width="90%" Enabled="false"></asp:TextBox>
                                    <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvtxtUserId" runat="server" ForeColor="Red"
                                ControlToValidate="txtUserId" ErrorMessage="Please enter User Id"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                       <tr>
                        <td height="5px"></td>
                    </tr>
                    <tr>
                        <td align="right">Password</td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtPwd" runat="server"  Width="90%" Enabled="false"></asp:TextBox>

                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvPwd" runat="server" ForeColor="Red"
                                ControlToValidate="txtPwd" ErrorMessage="Please enter password"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>

                        <td align="right">Confirm Password
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtconPwd" runat="server"  Width="90%" Enabled="false"></asp:TextBox>

                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rftxtconPwd" runat="server" ForeColor="Red" Display="Dynamic"
                                ControlToValidate="txtconPwd" ErrorMessage="Please Confirm Password"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%><%--<br />--%>
                            <%--<asp:CompareValidator ID="cmvalPwd" runat="server" ForeColor="Red" Display="Dynamic"
                                ErrorMessage="Please enter password correctly" ControlToCompare="txtPwd"
                                ControlToValidate="txtconPwd" ValidationGroup="UserIdCreation"></asp:CompareValidator>--%>
                        </td>
                    </tr>
                       <tr>
                        <td height="5px"></td>
                    </tr>
                    <tr>
                        <td align="right">Address
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtAddress" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvtxtAddress" runat="server" ForeColor="Red"
                                ControlToValidate="txtAddress" ErrorMessage="Please enter address"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td align="right">Mobile
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtMobile" runat="server" Width="90%" MaxLength="10" onkeypress="return isNumberKey(event)" Enabled="false"></asp:TextBox>&nbsp;&nbsp; Eg:9xxxxxxxxx                               
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                ControlToValidate="txtMobile" ErrorMessage="Please enter mobile number"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                       <tr>
                        <td height="5px"></td>
                    </tr>
                    <tr>
                        <td align="right">Contact Number
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">
                            <asp:TextBox ID="txtConNumber" runat="server" onkeypress="return isNumberKey(event)" MaxLength="10" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td align="left" width="15%">
                            <%--<asp:RequiredFieldValidator ID="rfvtxtConNumber" runat="server" ForeColor="Red"
                                ControlToValidate="txtConNumber" ErrorMessage="Please enter contact number"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>--%>
                        </td>

                        <td align="right">Email Id
                        </td>
                        <td width="5%" align="center">:</td>
                        <td align="left" width="15%">

                            <asp:TextBox ID="txtEmailId" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td align="left" width="15%">
                         <%--   <asp:RequiredFieldValidator ID="rfvtxtEmailId" runat="server" ForeColor="Red" Display="Dynamic"
                                ControlToValidate="txtEmailId" ErrorMessage="Please enter Email Id"
                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="rfvEmailid" runat="server" ForeColor="Red"
                                ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx" Display="Dynamic"
                                ControlToValidate="txtEmailId"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>--%>

                        </td>
                    </tr>
                    <tr><td><br /><br /></td></tr>

                    <tr>
                        <td colspan="8" align="center" width="100%">
                            <table align="center" width="100%">
                                <tr>
                                    <td width="18%" valign="top">
                                        <table id="Table1" border="0">
                                            <tr>
                                                <td style="width: 97px">Enquiry</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="rdempyes" runat="server" GroupName="employeelist" Text="Yes" Enabled="false"/>
                                                    <asp:RadioButton ID="rdempno"  runat="server" GroupName="employeelist" Text="No"  Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr1" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr8" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label3" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox1" runat="server"  Enabled="false"
                                                                    />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr9" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label4" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox2" runat="server"    Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr10" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label5" runat="server" Text="Reply"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox3" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                
                                                        <tr id="tr12" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label7" runat="server" Text="Delete"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox5" runat="server"    Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="18%" valign="top">
                                        <table id="Table2" border="0">
                                            <tr>
                                                <td style="width: 97px">Courses</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="rdh1byes" runat="server" GroupName="rdh1b" Text="Yes"  Enabled="false"/>
                                                    <asp:RadioButton ID="rdh1bno" runat="server" GroupName="rdh1b" Text="No"  Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr14" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr15" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label9" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox7" runat="server"
                                                                      Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr16" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label10" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox8" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>

                                                        <tr id="tr18" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label12" runat="server" Text="Post"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox10" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr19" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label13" runat="server" Text="Delete" ></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox11" runat="server"   Enabled="false"
                                                                     />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="18%" valign="top">
                                        <table id="Table21" border="0">
                                            <tr>
                                                <td style="width: 97px">Student Info</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="Profileyes" runat="server" GroupName="Profile" Text="Yes"  Enabled="false" />
                                                    <asp:RadioButton ID="Profileno" runat="server" GroupName="Profile" Text="No"   Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr126" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr127" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label56" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox54" runat="server"
                                                                     Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr128" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label62" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox60" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                  
                                                        <tr id="tr130" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label105" runat="server" Text="Edit"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox103" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr131" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label106" runat="server" Text="Delete"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox104" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>


                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="18%" valign="top">
                                        <table id="Table3" border="0">
                                            <tr>
                                                <td style="width: 97px">Support</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="Careersyes" runat="server" GroupName="Careers" Text="Yes"  Enabled="false"/>
                                                    <asp:RadioButton ID="Careersno"  runat="server" GroupName="Careers" Text="No"   Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr21" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr22" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label15" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox13" runat="server"
                                                                      Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr23" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label16" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox14" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr24" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label17" runat="server" Text="Reply"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox15" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr26" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label19" runat="server" Text="Delete"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox17" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>


                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="18%" valign="top">
                                        <table id="Table6" border="0">
                                            <tr>
                                                <td style="width: 97px">Users</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="Seminarsyes" runat="server" GroupName="Seminars" Text="Yes"  Enabled="false"/>
                                                    <asp:RadioButton ID="Seminarsno"  runat="server" GroupName="Seminars" Text="No"  Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr42" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr43" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label33" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox31" runat="server"
                                                                     Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr44" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label34" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox32" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr45" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label35" runat="server" Text="Create"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox33" runat="server"  Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr46" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label36" runat="server" Text="Edit"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox34" runat="server" Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr47" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label37" runat="server" Text="Delete"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox35" runat="server"  Enabled="false"/>
                                                            </td>
                                                        </tr>


                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="18%" valign="top">
                                        <table id="Table7" border="0">
                                            <tr>
                                                <td style="width: 97px">Feedback</td>
                                                <td class="style4" style="width: 100px">
                                                    <asp:RadioButton ID="Feedbackyes" runat="server" GroupName="Feedback" Text="Yes"   Enabled="false"/>
                                                    <asp:RadioButton ID="Feedbackno"  runat="server" GroupName="Feedback" Text="No"  Enabled="false"/>
                                                </td>
                                            </tr>
                                            <tr id="tr49" runat="server">
                                                <td colspan="2" style="padding-left: 10px">
                                                    <table border="0">
                                                        <tr id="tr50" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label39" runat="server" Text="Select All"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox37" runat="server"
                                                                      Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr51" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label40" runat="server" Text="Preview"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox38" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr2" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label1" runat="server" Text="Reply"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox4" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr54" runat="server">
                                                            <td class="datap5" align="left">
                                                                <asp:Label ID="Label43" runat="server" Text="Delete"></asp:Label>
                                                            </td>
                                                            <td class="style4" style="width: 100px">
                                                                <asp:CheckBox ID="CheckBox41" runat="server"   Enabled="false"/>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr><td><br /><br /></td></tr>
                    <tr>
                        <td colspan="8" style="height: 50px" align="center">
                            <asp:Button ID="btnCreate" runat="server" Text="Create User Id " Width="120px" Font-Bold="true"   Enabled="false" />
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

      <%--  <tr>
            <td>
                <asp:Label ID="checked_label" runat="server"></asp:Label>&nbsp; 
                                <asp:Label ID="lblId" runat="server"></asp:Label>
            </td>
        </tr>--%>
    </table>
</asp:Content>

