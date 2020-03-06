<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin-Student-Register.aspx.cs" Inherits="admin_Student_Info" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .feed {
            width: 40%;
            border: 1px solid gray;
            border-radius: 4px;
            padding: 4px 0px 4px 10px;
            background-position: 10px 5px;
            background-repeat: no-repeat;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
            height: 30px;
        }

        .headings3 {
            color: white;
            padding-left: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="dd" runat="server"></cc1:ToolkitScriptManager>

    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        <tr>
            <td align="center">
                <h3>Student Registration Form</h3>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>

        <tr>
            <td align="center" width="80%">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="90%" align="center">
                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 18px">
                                    <span class="headings3">User ID & Password</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="15%" class="headings2">Course :<span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">
                                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                            </td>

                                            <td align="right" width="15%" class="headings2">College :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">&nbsp;&nbsp;   
                                                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                            </td>

                                            <td align="right" width="15%" class="headings2">University :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">&nbsp;&nbsp;  
                                                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Width="180px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="5px">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="15%" class="headings2">Location :<span style="color: red">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">
                                                <asp:TextBox ID="TextBox4" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                            </td>

                                            <td align="right" width="15%" class="headings2">Title1 :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">&nbsp;&nbsp;   
                                                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                            </td>

                                            <td align="right" width="15%" class="headings2">Title2 :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="18%">&nbsp;&nbsp;  
                                                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="10" Width="180px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="5px">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td width="15%" class="headings2" align="right">User ID (EmailID) : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="18%" align="left">  
                                                <asp:TextBox ID="txtemail" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtemail" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="15%" class="headings2" align="right">Conf. Mail ID : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="18%" align="left">   
                                                <asp:TextBox ID="ctxtmail" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td width="15%" class="headings2" align="right">Password :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="18%" align="left">  
                                                <asp:TextBox ID="txtpwd" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtpwd" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="5px">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Joining Date : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="txtjoin" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtjoin"></cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtjoin" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Designation :  <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;    
                                                <asp:TextBox ID="txtdesg" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtdesg" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 18px">
                                    <span class="headings3">Personal Details</span>
                                </td>
                            </tr>

                            <tr>
                                <td height="2px">&nbsp; </td>
                            </tr>

                            <tr height="17">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">First Name : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="fname" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ErrorMessage="*" ControlToValidate="fname" ValidationGroup="empcreate"></asp:RequiredFieldValidator>

                                            </td>

                                            <td width="13%" class="headings2" align="right">Middle Name :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="mname" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Last Name :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="lname" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                    ErrorMessage="*" ControlToValidate="lname" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Gender :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;         
                                                <asp:RadioButtonList ID="gend" runat="server" RepeatDirection="Horizontal" Width="200px">
                                                    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>

                                            <td width="13%" align="right" class="headings2">Citizenship : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:DropDownList ID="ccountry" runat="server" Width="180px">
                                                    <asp:ListItem>Select Country</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ccountry" InitialValue="Select Country" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Nationality : <span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;    
                                                <asp:DropDownList ID="ncountry" runat="server" Width="180px">
                                                    <asp:ListItem>Select Country</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ControlToValidate="ncountry" InitialValue="Select Country" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Birth Date : <span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="bdate" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="bdate"></cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="bdate" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" align="right" class="headings2">Birth Country : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:DropDownList ID="bcountry" runat="server" Width="180px"
                                                    AutoPostBack="true"
                                                    OnSelectedIndexChanged="bcountry_SelectedIndexChanged">
                                                    <asp:ListItem>Select Country</asp:ListItem>

                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                                    ControlToValidate="bcountry" InitialValue="Select Country" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" align="right" class="headings2">Birth State :<span style="color: red">*</span> &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:DropDownList ID="bstate" runat="server" Width="180px" AutoPostBack="true"
                                                    OnSelectedIndexChanged="bstate_SelectedIndexChanged">
                                                    <asp:ListItem>Select State</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="bstate" InitialValue="Select State" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Birth City :<span style="color: red">*</span> &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   <%--<asp:TextBox ID="bcity" runat="server"   Width="180px"    ></asp:TextBox>--%>
                                                <asp:DropDownList ID="bcity" runat="server" Width="180px">
                                                    <asp:ListItem Value="Select State">Select city</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="bcity" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" align="right" class="headings2">Passport No : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="passno" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="passno" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Issued at : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:DropDownList ID="pcountry" runat="server" Width="180px">
                                                    <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="pcountry" InitialValue="Select Country" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" align="right" class="headings2">Issed at Place : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="pplace" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="pplace"
                                                    ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" align="right" class="headings2">Issue Date  : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;      
                                                <asp:TextBox ID="issdate" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="issdate"></cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="issdate" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" align="right" class="headings2">Expiry Date : &nbsp;&nbsp; 
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="expdate" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="expdate"></cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="expdate" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="5px">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>

                                            <td width="13%" class="headings2" align="right">Pasport Location :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="TextBox7" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server"
                                                    ErrorMessage="*" ControlToValidate="fatname" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Father Name :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="fatname" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                    ErrorMessage="*" ControlToValidate="fatname" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Mother Name :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="motname" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                    ErrorMessage="*" ControlToValidate="motname" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Family Details</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>


                                        <tr>
                                            <td width="13%" class="headings2" align="right">Spouse Name  :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="mmname" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Gender :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:RadioButtonList ID="spgen" runat="server" RepeatDirection="Horizontal" Width="200px">
                                                    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Birth Date :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="sbdate" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="spousebob" runat="server" TargetControlID="sbdate"></cc1:CalendarExtender>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Child Name - 1 :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="k1name" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Child Name - 2 :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;       
                                                <asp:TextBox ID="k2name" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Child Name - 3 :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="k3name" runat="server" Width="180px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">K-1 Gender :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:RadioButtonList ID="k1gen" runat="server" RepeatDirection="Horizontal" Width="180px">
                                                    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>

                                            <td width="13%" class="headings2" align="right">K-2 Gender :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:RadioButtonList ID="k2gen" runat="server" RepeatDirection="Horizontal" Width="180px">
                                                    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>

                                            <td width="13%" class="headings2" align="right">K-3 Gender :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:RadioButtonList ID="k3gen" runat="server" RepeatDirection="Horizontal" Width="180px">
                                                    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px">&nbsp;
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Birth Date : &nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;      
                                                <asp:TextBox ID="k1bd" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="k1bd"></cc1:CalendarExtender>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Birth Date :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="k2bd" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="k2bd"></cc1:CalendarExtender>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Birth Date :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;     
                                                <asp:TextBox ID="k3bd" runat="server" Width="180px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="k3bd"></cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Communication Details</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Country  : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;
                                                <asp:DropDownList ID="country" runat="server" Width="180px"
                                                    AutoPostBack="true"
                                                    OnSelectedIndexChanged="country_SelectedIndexChanged">
                                                    <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="country" InitialValue="Select Country" ValidationGroup="empcreate"></asp:RequiredFieldValidator>

                                            </td>
                                            <td width="13%" class="headings2" align="right">State   :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:DropDownList ID="state" runat="server" Width="180px" AutoPostBack="true"
                                                    OnSelectedIndexChanged="state_SelectedIndexChanged">
                                                    <asp:ListItem>Select State</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="state" InitialValue="Select State" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">City :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  <%--<asp:TextBox ID="city" runat="server"   Width="180px"    ></asp:TextBox>--%>
                                                <asp:DropDownList ID="city" runat="server" Width="180px">
                                                    <asp:ListItem>Select City</asp:ListItem>

                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="city" ValidationGroup="empcreate"
                                                    InitialValue="Select City"></asp:RequiredFieldValidator>
                                            </td>

                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>


                                            <td width="13%" class="headings2" align="right">Street   :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="street" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="street" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Door NUmber :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="txtdoor" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ErrorMessage="*" ControlToValidate="txtdoor" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Zip :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="zip" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="zip" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Contact Details</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Work Phone : &nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">
                                                <asp:TextBox ID="wp1" runat="server" Width="50px" MaxLength="3" onkeyup="moveOnMax(this,'wp2')"></asp:TextBox>
                                                <asp:TextBox ID="wp2" runat="server" Width="50px" MaxLength="3" onkeyup="moveOnMax(this,'wp3')"></asp:TextBox>
                                                <asp:TextBox ID="wp3" runat="server" Width="59px" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" ControlToValidate="wp1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="*" ControlToValidate="wp2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" ControlToValidate="wp3" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Home Phone :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="hp1" runat="server" Width="50px"
                                                    MaxLength="3" onkeyup="moveOnMax(this,'hp2')"></asp:TextBox>
                                                <asp:TextBox ID="hp2" runat="server" Width="50px"
                                                    MaxLength="3" onkeyup="moveOnMax(this,'hp3')"></asp:TextBox>
                                                <asp:TextBox ID="hp3" runat="server" Width="59px"
                                                    MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" ControlToValidate="hp1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*" ControlToValidate="hp2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" ControlToValidate="hp3" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Mobile:<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="mb1" runat="server" Width="50px"
                                                    MaxLength="3" onkeyup="moveOnMax(this,'mb2')"></asp:TextBox>
                                                <asp:TextBox ID="mb2" runat="server" Width="50px"
                                                    MaxLength="3" onkeyup="moveOnMax(this,'mb3')"></asp:TextBox>
                                                <asp:TextBox ID="mb3" runat="server" Width="59px"
                                                    MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="mb1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="*" ControlToValidate="mb2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="*" ControlToValidate="mb3" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Emergency Contact Person Details</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Cont Person-1 :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="cpname1" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="*" ControlToValidate="cpname1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Phone No :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="cpphone1" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="*" ControlToValidate="cpphone1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Email ID :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="cpemail1" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="*" ControlToValidate="cpemail1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                    ErrorMessage="invalid" ControlToValidate="cpemail1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Address :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="cpaddr1" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="*" ControlToValidate="cpaddr1" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Cont Person-2 :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="cpname2" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="*" ControlToValidate="cpname2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Phone No :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;    
                                                <asp:TextBox ID="cpphone2" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="*" ControlToValidate="cpphone2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Email ID :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="cpemail2" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="*" ControlToValidate="cpemail2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                    ErrorMessage="invalid" ControlToValidate="cpemail2"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td width="13%" class="headings2" align="right">Address : &nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="cpaddr2" runat="server" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="*" ControlToValidate="cpaddr2" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Professional Experience Details </span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Total Exp.Yrs &amp; Months : <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%" class="heading2">&nbsp;&nbsp; 
                                                <asp:TextBox ID="expyrs" runat="server" Width="50px"></asp:TextBox>
                                                <asp:TextBox ID="expmon" runat="server" Width="50px"></asp:TextBox>
                                                <span class="headings2">Number only</span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="*" ControlToValidate="expyrs" ValidationGroup="empcreate"></asp:RequiredFieldValidator>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Functional Area :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="lef">&nbsp;&nbsp;  
                                                <asp:TextBox ID="fnarea" runat="server" Width="180px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="13%">Current Industry :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;     
                                                <asp:TextBox ID="currind" runat="server" Width="180px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td heigh="2px">&nbsp;</td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Bank Account Details</span>
                                </td>
                            </tr>

                            <tr>
                                <td heigh="2px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">
                                        <tr>
                                            <td align="right" class="headings2" width="13%">Account Name :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;   
                                                <asp:TextBox ID="txtacname" runat="server" MaxLength="50" Width="180px" TabIndex="43"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator51" runat="server" ControlToValidate="txtacname" Display="Dynamic"
                                                    ErrorMessage="Provide Name in Account" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender116" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtacname">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Account Number :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;      
                                                <asp:TextBox ID="txtacnum" runat="server" MaxLength="20" Width="180px" TabIndex="44"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator52" runat="server" ControlToValidate="txtacnum" Display="Dynamic"
                                                    ErrorMessage="Provide Account Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender37" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="1234567890" TargetControlID="txtacnum">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Bank Name  :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;  
                                                <asp:TextBox ID="txtbankname" runat="server" MaxLength="50" Width="180px" TabIndex="45"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator53" runat="server" ControlToValidate="txtbankname" Display="Dynamic"
                                                    ErrorMessage="Provide Bank Name" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender40" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,."
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtbankname">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td heigh="2px">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td align="right" class="headings2" width="13%">Branch Address :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;   
                                                <asp:TextBox ID="txtbankadd" runat="server" MaxLength="200" Width="180px" TabIndex="46"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator54" runat="server" ControlToValidate="txtbankadd" Display="Dynamic"
                                                    ErrorMessage="Provide Brnach Address" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender39" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,."
                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy-/z " TargetControlID="txtbankadd">
                                                </cc1:FilteredTextBoxExtender>

                                            </td>
                                            <td align="right" class="headings2" width="13%">IFSC CODE :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;      
                                                <asp:TextBox ID="txtifsc" runat="server" MaxLength="11" Width="180px" TabIndex="47"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator55" runat="server" ControlToValidate="txtifsc" Display="Dynamic"
                                                    ErrorMessage="Provide Ifsc Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender38" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" TargetControlID="txtifsc">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Swift Code :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;     
                                                <asp:TextBox ID="txtswift" runat="server" MaxLength="20" Width="180px" TabIndex="48"> </asp:TextBox>
                                                <%--  <asp:RequiredFieldValidator ID="Requiredfieldvalidator56" runat="server" ControlToValidate="txtswift" Display="Dynamic"
                                           ErrorMessage="Provide Home Number" ValidationGroup="emp" ForeColor="Red"  SetFocusOnError="true" >*</asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td heigh="2px">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="headings2" width="13%">Address In Your Bank Account : <span style="color: red">*</span>&nbsp;&nbsp; 

                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;     
                                                <asp:TextBox ID="txtbranchacaddress" runat="server" Width="180px" MaxLength="200" TabIndex="49"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator57" runat="server" ControlToValidate="txtbranchacaddress" Display="Dynamic"
                                                    ErrorMessage="Provide address in Bank Account" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender41" runat="server" InvalidChars="~`!@#$%^&*()_=+<>.-/"
                                                    ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -/," TargetControlID="txtbranchacaddress">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td heigh="2px">&nbsp;</td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Identification Details</span>
                                </td>
                            </tr>

                            <tr>
                                <td heigh="2px">&nbsp;</td>
                            </tr>

                            <tr height="17">
                                <td colspan="2" align="center" width="100%">
                                    <table align="center" width="100%">


                                        <tr>
                                            <td align="right" class="headings2" width="13%">Adhar Number :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;     
                                                <asp:TextBox ID="txtaadhar" runat="server" MaxLength="12" Width="180px" TabIndex="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator56" runat="server" ControlToValidate="txtaadhar" Display="Dynamic"
                                                    ErrorMessage="Provide Aadhar Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="1234567890" TargetControlID="txtaadhar">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Adhar Issue Place :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;  
                                                <asp:TextBox ID="txtadharplace" runat="server" MaxLength="50" Width="180px" TabIndex="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator44" runat="server" ControlToValidate="txtadharplace" Display="Dynamic"
                                                    ErrorMessage="Provide Aadhar Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender117" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtadharplace">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Adhar Issue City :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;    
                                                <asp:TextBox ID="txtadharcity" runat="server" MaxLength="50" Width="180px" TabIndex="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator45" runat="server" ControlToValidate="txtadharcity" Display="Dynamic"
                                                    ErrorMessage="Provide Aadhar Number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender118" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtadharcity">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td heigh="2px" colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="headings2" width="13%">Pan Number :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;    
                                                <asp:TextBox ID="txtpan" runat="server" MaxLength="10" Width="180px" TabIndex="51"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator58" runat="server" ControlToValidate="txtpan" Display="Dynamic"
                                                    ErrorMessage="Provide pan number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender43" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890" TargetControlID="txtpan">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Pan issue Place :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;        
                                                <asp:TextBox ID="txtpanplace" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator46" runat="server" ControlToValidate="txtpanplace" Display="Dynamic"
                                                    ErrorMessage="Provide pan number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender119" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/1234567890"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtpanplace">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Pan issue cit :y<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;        
                                                <asp:TextBox ID="txtpancity" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator47" runat="server" ControlToValidate="txtpancity" Display="Dynamic"
                                                    ErrorMessage="Provide pan number" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender120" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/1234567890"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtpancity">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="2px" colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="headings2" width="13%">Driving Licence Number<%--<span style="color: red">*</span>--%>: 
                                                                &nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;       
                                                <asp:TextBox ID="txtdrivenumber" runat="server" MaxLength="16" TabIndex="52" Width="180px"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender44" runat="server" InvalidChars="~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890" TargetControlID="txtdrivenumber">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Issue Place : &nbsp;&nbsp; <%--<span style="color: red">*</span>--%>
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;    
                                                <asp:TextBox ID="txtdriveplace" runat="server" MaxLength="50" TabIndex="53" Width="180px"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender45" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtdriveplace">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" class="headings2" width="13%">Issue city : <%--<span style="color: red">*</span>--%>
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;     
                                                <asp:TextBox ID="txtdrivecity" runat="server" MaxLength="50" TabIndex="54" Width="180px"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender46" runat="server" InvalidChars="1234567890~`!@#$%^&*()_=+<>,.-/"
                                                    ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " TargetControlID="txtdrivecity">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td heigh="10px" colspan="2">&nbsp;</td>
                                        </tr>


                                    </table>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Skills</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" width="100%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 1 :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="skills1" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years: <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;    
                                                <asp:TextBox ID="sk1yrs" runat="server" Width="100"></asp:TextBox>
                                            </td>
                                            <td class="headings2" width="6%" align="right">No Of Months: <span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="sk1mnts" runat="server" Width="100px" MaxLength="2" TabIndex="69"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator71" runat="server" ControlToValidate="sk1mnts" Display="Dynamic"
                                                    ErrorMessage="Provide Number of Months" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender58" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk1mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Expert Level :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;
                                                <asp:DropDownList ID="sk1exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 2 :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;
                                                <asp:TextBox ID="skills2" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="sk2yrs" runat="server" Width="100px"></asp:TextBox>

                                            </td>
                                            <td class="headings2" width="6%" align="right">No of Months :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>

                                            <td width="10%" align="left">&nbsp;&nbsp;      
                                                <asp:TextBox ID="sk2mnts" runat="server" Width="100px" MaxLength="2" TabIndex="73"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator76" runat="server" ControlToValidate="sk2mnts" Display="Dynamic"
                                                    ErrorMessage="Provide Experience in Months" ValidationGroup="emp" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender60" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk2mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Expert Level :<span style="color: red">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:DropDownList ID="sk2exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 3 :&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="skills3" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;    
                                                <asp:TextBox ID="sk3yrs" runat="server" Width="100px"></asp:TextBox>
                                            </td>

                                            <td class="headings2" width="6%" align="right">No of Months  :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="sk3mnts" runat="server" Width="100px" MaxLength="2" TabIndex="77"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender62" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk3mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Expert Level :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;  
                                                <asp:DropDownList ID="sk3exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 4 :&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="skills4" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;      
                                                <asp:TextBox ID="sk4yrs" runat="server" Width="100px"></asp:TextBox>
                                            </td>
                                            <td width="6%" class="headings2" align="right">No of Months :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="sk4mnts" runat="server" Width="100px" MaxLength="2" TabIndex="81"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender64" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk4mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Expert Level :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:DropDownList ID="sk4exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 5 :&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;
                                                <asp:TextBox ID="skills5" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="sk5yrs" runat="server" Width="100px"></asp:TextBox>

                                            </td>

                                            <td width="6%" class="headings2" align="right">No of Months :&nbsp;&nbsp;
                                            </td>

                                            <td width="10%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="sk5mnts" runat="server" Width="100px" MaxLength="2" TabIndex="85"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender66" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk5mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Expert Level :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:DropDownList ID="sk5exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Skills - 6 :&nbsp;&nbsp;
                                            </td>
                                            <td align="left" width="20%">&nbsp;&nbsp;   
                                                <asp:TextBox ID="skills6" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">No. Years :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="sk6yrs" runat="server" Width="100px"></asp:TextBox>
                                            </td>

                                            <td width="6%" align="right" class="headings2">No of Months :&nbsp;&nbsp;
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;    
                                                <asp:TextBox ID="sk6mnts" runat="server" Width="100px" MaxLength="2" TabIndex="89"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender68" runat="server" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_=+<>,./-"
                                                    ValidChars="1234567890" TargetControlID="sk6mnts">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td width="13%" class="headings2" align="right">Expert Level :&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp; 
                                                <asp:DropDownList ID="sk6exp" runat="server" Width="100px">
                                                    <asp:ListItem>Novice</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Advance</asp:ListItem>
                                                    <asp:ListItem>Expert</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                    </table>

                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Education Details</span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>
                            <tr height="15">
                                <td colspan="2" width="100%" align="center">
                                    <table width="100%" align="center">

                                        <tr>
                                            <td align="right" width="5%" class="headings2">PG :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu1" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed1brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="ed1sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed1yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed1per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td align="right" width="5%" class="headings2">Graduation :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu2" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed2brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed2sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed2yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="ed2per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td align="right" width="5%" class="headings2">UG :<span style="color: red">*</span>&nbsp;&nbsp; 

                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu3" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed3brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed3sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="ed3yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed3per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td align="right" width="5%" class="headings2">SSC :<span style="color: red">*</span>&nbsp;&nbsp; 

                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu4" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp;  
                                                <asp:TextBox ID="ed4brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="ed4sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed4yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :<span style="color: red">*</span>&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed4per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>


                                        <tr>
                                            <td align="right" width="5%" class="headings2">Other :&nbsp;&nbsp; 

                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu5" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed5brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed5sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed5yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed5per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="5%" class="headings2">Other1 :&nbsp;&nbsp; 

                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu6" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed6brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed6sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="ed6yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed6per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr height="15">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="5%" class="headings2">Other2 :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="9%">&nbsp;&nbsp; 
                                                <asp:TextBox ID="edu7" runat="server" Width="112px"></asp:TextBox>
                                            </td>

                                            <td align="right" class="headings2" width="8%">Boadr/University :&nbsp;&nbsp; 
                                            </td>
                                            <td align="left" width="12%">&nbsp;&nbsp;   
                                                <asp:TextBox ID="ed7brd" runat="server" Width="137px"></asp:TextBox>

                                            </td>

                                            <td width="4%" class="headings2" align="right">Major in :&nbsp;&nbsp; 
                                            </td>
                                            <td width="10%" align="left">&nbsp;&nbsp;   
                                                <asp:TextBox ID="ed7sub" runat="server" Width="120px"></asp:TextBox>
                                            </td>

                                            <td width="7%" class="headings2" align="right">Year of Pass :&nbsp;&nbsp; 
                                            </td>
                                            <td width="8%" align="left">&nbsp;&nbsp;  
                                                <asp:TextBox ID="ed7yr" runat="server" Width="60px"></asp:TextBox>
                                            </td>

                                            <td width="3%" class="headings2" align="right">(%) :&nbsp;&nbsp; 
                                            </td>
                                            <td width="7%" align="left">&nbsp;&nbsp; 
                                                <asp:TextBox ID="ed7per" runat="server" Width="60px"></asp:TextBox>
                                            </td>
                                        </tr>






                                    </table>

                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="17" class="headings2">
                                <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 17px">
                                    <span class="headings3">Upload Documents </span>
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2"></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" width="100%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">Resume Title : <span style="color: red;">*</span>&nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left" align="left">&nbsp;&nbsp;
                                                <asp:TextBox ID="restitle" runat="server" Width="160px"></asp:TextBox>
                                            </td>

                                            <td width="13%" class="headings2" align="right">Upload Resume : <span style="color: red;">*</span> &nbsp;&nbsp;
                                            </td>
                                            <td width="20%" align="left">&nbsp;&nbsp;<asp:FileUpload ID="rfile" runat="server" />
                                            </td>

                                        </tr>

                                    </table>
                                </td>
                            </tr>

                             <tr height="15">
                                <td ></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" width="100%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td width="13%" class="headings2" align="right">
                                                Documents Upload :     
                                            </td>

                                            <td width="20%" align="left" align="left">
                                                <asp:DropDownList ID="ddc" runat="server">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>SSC</asp:ListItem>
                                                    <asp:ListItem>Intermediate</asp:ListItem>
                                                    <asp:ListItem>Graduation</asp:ListItem>
                                                    <asp:ListItem>PG</asp:ListItem>
                                                    <asp:ListItem>Other1</asp:ListItem>
                                                    <asp:ListItem>Other2</asp:ListItem>

                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator48" runat="server" ControlToValidate="ddc" Display="Dynamic"
                                                    InitialValue="Select" ErrorMessage="Select Course" ValidationGroup="emp2" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                       
                                                  <asp:FileUpload ID="filedoc" runat="server" TabIndex="140"></asp:FileUpload>
                                                                <%--AllowMultiple="true"--%>
                                           
                                                  <asp:Button ID="upload" runat="server" Text="Upload" Width="70px" Height="30px" TabIndex="141" OnClick="upload_Click" ValidationGroup="emp2" />
                                             </td>

                                            <td width="13%" class="headings2" align="right">Latest Image Upload :     
                                            </td>

                                            <td width="20%" align="left">
                                                <asp:FileUpload ID="txtimgfupload" runat="server" TabIndex="138"></asp:FileUpload>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr height="15">

                                <td colspan="2"></td>
                            </tr>

                            <tr height="15">
                                <td colspan="2" width="100%" align="center">
                                    <table width="100%" align="center">
                                        <tr>
                                            <td class="headings2" width="20%" align="right">Comments
        <br />
                                               <%-- (Cut &amp; Paste Your Resume Here)   &nbsp;  &nbsp;--%> </td>
                                            <td align="left" width="60%">&nbsp;  &nbsp;   
                                                <asp:TextBox ID="txtres" runat="server" TextMode="MultiLine" Height="108px"
                                                    Width="80%"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>



                            <%--Mail Alert   --%>
                            <%--<tr height="15">
    
    <td colspan="2"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="2" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Mail &amp; Privacy Settings</span></td>
    </tr>
<tr height="15">
    <td colspan="2" width="100%" align="center">
<table width="100%" align="center">


 <tr height="39">
      <td width="100%" align="center" valign="top" class="lable4" style="height: 30px">
          <table  border="0" width="100%" align="center">
          <tr>
            <td width="33%" >
                &nbsp;<input id="Checkbox1" type="checkbox" name=" chkjobalerts" value="RS" checked="checked" />Job 
                Alerts and InduGroup products.</td>
            <td width="33%" >
                &nbsp;<input id="Checkbox2" type="checkbox" name="mailers[]" value="RS" checked="checked" />Training 
                Programs.</td>
            <td width="33%" >
                &nbsp;<input id="Checkbox3" type="checkbox" name="mailers[]" value="RS" checked="checked" />News 
                Letters</td>
          </tr>
   
</table></td>
</tr>
</table>--%>
</td>
</tr>


                            <tr height="15">
                                <td colspan="2" align="center" class="headings2"></td>
                            </tr>
                            <tr height="15">
                                <td colspan="2" align="center" class="headings2"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="headings2">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" Width="101px"
                                        OnClick="btn_submit_Click" ValidationGroup="empcreate" />
                                </td>
                            </tr>

                            <tr height="15">
                                <td colspan="2">
                                    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>

                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>

