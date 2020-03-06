<%@ Page Title="Anandam Foundation" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 m-auto">
                <div class="row">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-6 nopadding">
                        <div class="registeradmin">
                            <div class="newadmin_heading">
                                <!--<img src="images/neworphanlogo.png" width="180" height="80" alt=""/>-->
                                <h1> Register</h1>
                            </div>
                            <div class="row nopadding">
                                <div class="col-lg-10 m-auto">
                                    <div class="topentry_outer">
                                        <img src="images/avatar.jpg" width="100" height="100" alt="" />
                                        <h1>Please Enter Details to Register</h1>
                                    </div>
                                    <div class="form_outer">
                                        <form>

                                            <asp:TextBox ID="txt1" runat="server" placeholder="Name*"  Width="610px" ValidationGroup="sub"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1" ErrorMessage="Add Name" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt2" runat="server" placeholder="E-mail" Width="610px"> </asp:TextBox>

                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2" ErrorMessage="Add Email" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt3" runat="server" placeholder="Password*" Width="610px"></asp:TextBox>

                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt3" ErrorMessage="Add Password" ForeColor="Red" ValidationGroup="sub" >*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt4" runat="server" placeholder="Confirm Password*" Width="580px" ></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt4" ErrorMessage="Add Confirm Password" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="txt3" ControlToValidate="txt4" ErrorMessage="Password Doesn't Match" ForeColor="Red">*</asp:CompareValidator>
                                            <asp:TextBox ID="txt5" runat="server" placeholder="Phone Number" Width="610px" ></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt5" ErrorMessage="Add Mobile No." ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddl1" runat="server">
                                                <asp:ListItem Value="0">City*</asp:ListItem>
                                                <asp:ListItem Value="1">Hyderbad</asp:ListItem>
                                                <asp:ListItem Value="2">Bangalore</asp:ListItem>
                                                <asp:ListItem Value="3">Chennai</asp:ListItem>
                                                <asp:ListItem Value="4">Mumbai</asp:ListItem>
                                                <asp:ListItem Value="5">Pune</asp:ListItem>
                                            </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl1" ErrorMessage="Add City" ForeColor="Red" InitialValue="0">*</asp:RequiredFieldValidator>
                                                <asp:Button ID="btn" runat="server" Text="REGISTER" OnClick="btn_Click" ValidationGroup="sub" />

                                            <asp:ValidationSummary ID="val" runat="server" ValidationGroup="sub" ShowMessageBox="true" ShowSummary="false"  />

                                           <asp:Label ID="lb" runat="server" Text="Click Here"></asp:Label>     <asp:LinkButton ID="reg" runat="server" Text="LOGIN" OnClick="reg_Click"></asp:LinkButton> 
                                            <%--<input type="text" placeholder="Name*" required />   
                                                <input type="email" placeholder="E-mail" required />                                                                                                                                                                                                                                      
                                                <input type="password" placeholder="Password*" required/>
                                                <input type="password" placeholder="Confirm Password*" required/> 
                                                <input type="tel" placeholder="Phone Number" required />
                                                 <select required>
                                                    <option value="City">City*</option>
                                                    <option value="Hyderbad">Hyderbad</option>
                                                    <option value="Bangalore">Bangalore</option>
                                                    <option value="Chennai">Chennai</option>
                                                    <option value="Mumbai">Mumbai</option>
                                                    <option value="Pune">Pune</option>
                                                </select>                                                                                                                                                                                                                                              
                                                <input type="submit" value="REGISTER" />
                                                <input type="submit" value="LOGIN" />            --%>
                                        </form>
                                        <!--<span>Click on</span><a href="#" target="_self">Login</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

