<%@ Page Title="Anandam Foundation" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script>
         $(function () {
             $('#txt1').keydown(function (e) {
                 if (e.shiftKey || e.ctrlKey || e.altKey) {
                     e.preventDefault();
                 } else {
                     var key = e.keyCode;
                     if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
                         e.preventDefault();
                     }
                 }
             });
         });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Please enter only Numbers.");
                return false;
            }

            return true;
        }

        function ValidateNo() {
            var phoneNo = document.getElementById('txtPhoneNo');

            if (phoneNo.value == "" || phoneNo.value == null) {
                alert("Please enter your Mobile No.");
                return false;
            }
            if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
                alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
                return false;
            }

            alert("Success ");
            return true;
        }
    </script>
    <script>
        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false) {
                alert('Invalid Email Address');
                return false;
            }

            return true;

        }
    </script>
           <script type="text/javascript">
               function SessionExpireAlert(timeout) {
                   var seconds = timeout / 1000;
                   document.getElementsByName("secondsIdle").innerHTML = seconds;
                   document.getElementsByName("seconds").innerHTML = seconds;
                   setInterval(function () {
                       seconds--;
                       document.getElementById("seconds").innerHTML = seconds;
                       document.getElementById("secondsIdle").innerHTML = seconds;
                   }, 1000);
                   setTimeout(function () {
                       //Show Popup before 20 seconds of timeout.
                       $find("mpeTimeout").show();
                   }, timeout + 1 * 1000);
                   setTimeout(function () {
                       window.location = "Default.aspx";
                   }, timeout);
               };
               function ResetSession() {
                   //Redirect to refresh Session.
                   window.location = window.location.href;
               }
            </script>    
           
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

                                            <asp:TextBox ID="txt1" runat="server" placeholder="Name*" ValidationGroup="sub"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1" ErrorMessage="Add Name" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt2" runat="server" placeholder="E-mail" onblur="validateEmail(this);"> </asp:TextBox>

                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2" ErrorMessage="Add Email" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt3" runat="server" placeholder="Password*"></asp:TextBox>

                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt3" ErrorMessage="Add Password" ForeColor="Red" ValidationGroup="sub" >*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txt4" runat="server" placeholder="Confirm Password*"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt4" ErrorMessage="Add Confirm Password" ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="txt3" ControlToValidate="txt4" ErrorMessage="Password Doesn't Match" ForeColor="Red">*</asp:CompareValidator>
                                            <asp:TextBox ID="txt5" runat="server" placeholder="Phone Number" onkeypress="return isNumber(event)" ></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt5" ErrorMessage="Add Mobile No." ForeColor="Red" ValidationGroup="sub">*</asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddl1" runat="server">
                                                <asp:ListItem Value="0">City*</asp:ListItem>
                                                <asp:ListItem Value="1">Hyderbad</asp:ListItem>
                                                <asp:ListItem Value="2">Bangalore</asp:ListItem>
                                                <asp:ListItem Value="3">Chennai</asp:ListItem>
                                                <asp:ListItem Value="4">Mumbai</asp:ListItem>
                                                <asp:ListItem Value="5">Pune</asp:ListItem>
                                            </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl1" ErrorMessage="Add City" ForeColor="Red" InitialValue="0" ValidationGroup="sub">*</asp:RequiredFieldValidator>
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

