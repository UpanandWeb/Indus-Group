<%@ Page Title="" Language="C#" MasterPageFile="MasterPage3.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="admintot_outer">
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
                                        <h1>Admin Register</h1>
                                     </div>
                                     <div class="row nopadding">
                                         <div class="col-lg-10 m-auto">
                                            <div class="topentry_outer">
                                                <img src="images/avatar.jpg" width="100" height="100" alt="" /> 
                                                <h1>Please Enter Details to Register</h1>
                                            </div>
                                           <div class="form_outer">
                                     <%--       <form> --%>
                                               <asp:TextBox ID="txt1" runat="server" placeholder="Name*"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txt1" ErrorMessage="Add name" ForeColor="Red" ValidationGroup="vl">*</asp:RequiredFieldValidator>

                                               <asp:TextBox ID="txt2" runat="server" placeholder="Email*"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txt2" ErrorMessage="Add Email" ForeColor="Red" ValidationGroup="vl">*</asp:RequiredFieldValidator>
                                               
                                               <asp:TextBox ID="txt3" runat="server" placeholder="Password*"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txt3" ErrorMessage="Add Password" ForeColor="Red" ValidationGroup="vl">*</asp:RequiredFieldValidator>
                                               <asp:TextBox ID="txt4" runat="server" placeholder="Cnf Password*"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt4" ErrorMessage="Add Cnf Password" ForeColor="Red" ValidationGroup="vl">*</asp:RequiredFieldValidator>
                                               <asp:CompareValidator ID="cam" runat="server" ControlToValidate="txt4" ControlToCompare="txt3" ValidationGroup="vl" ForeColor="Red" ErrorMessage="Confirm Password Should nbe same">s</asp:CompareValidator>
                                               <%-- <input type="text" placeholder="Name*" required />   
                                                <input type="email" placeholder="E-mail" required />                                                                                                                                                                                                                                      
                                                <input type="password" placeholder="Password*" required/>
                                                <input type="password" placeholder="Confirm Password*" required/> 
                                                <input type="tel" placeholder="Phone Number" required />--%>
                                               <asp:TextBox ID="txt5" runat="server" placeholder="Mobile*"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="reqph" runat="server" ControlToValidate="txt5" ValidationGroup="vl" ErrorMessage="Add mobile" ForeColor="Red">*</asp:RequiredFieldValidator> 
                                               <asp:DropDownList ID="ddl" runat="server" AppendDataBoundItems="true"> 
                                                   <asp:ListItem Value="0">Select City</asp:ListItem>
                                                   <asp:ListItem Value="1">Hyderabad</asp:ListItem>
                                                    <asp:ListItem Value="2">Bangalore</asp:ListItem>
                                                   <asp:ListItem Value="3">Chennai</asp:ListItem>
                                                   <asp:ListItem Value="4">Mumbai</asp:ListItem>
                                                    <asp:ListItem Value="5">Pune</asp:ListItem>
                                               </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="re5" runat="server" ControlToValidate="ddl" ErrorMessage="Select City" InitialValue="0" ValidationGroup="vl" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                 <%--<select required>
                                                    <option value="City">City*</option>
                                                    <option value="Hyderbad">Hyderbad</option>
                                                    <option value="Bangalore">Bangalore</option>
                                                    <option value="Chennai">Chennai</option>
                                                    <option value="Mumbai">Mumbai</option>
                                                    <option value="Pune">Pune</option>
                                                </select>                 --%>                                                                                                                                                                                                                             
                                            <%--    <input type="submit" value="REGISTER" />--%>

                                               <asp:Button ID="btn" runat="server" Text="SUBMIT" ValidationGroup="vl" OnClick="btn_Click" />
                                               <asp:ValidationSummary ID="val" runat="server" ValidationGroup="vl" ShowMessageBox="true" ShowSummary="false" />
                                                <a href="Login.aspx" target="_self">Login</a>                                              
                                           <%-- </form>--%>
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
       </div>
</asp:Content>

