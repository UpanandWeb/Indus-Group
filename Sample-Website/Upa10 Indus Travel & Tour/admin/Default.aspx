<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Indus Tours &amp; Travels</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/aos.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/full-slider.css">
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<!--menu_links-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--menu_links-->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="admintot_outer">
        <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 m-auto">
                        <div class="row">
                            <div class="col-lg-3">	
                            </div>
                            <div class="col-lg-6 nopadding">
                                <div class="adminpadd">
                                    <div class="admin_heading">                                        
                                        <h1>Admin Login</h1>
                                     </div>
                                         <div class="row nopadding">
                                             <div class="col-lg-10 m-auto">
                                                <div class="topentry_outer">
                                                    <img src="images/avatar.jpg" width="100" height="100" alt="" /> 
                                                    <h1>Please Enter Login Details</h1>
                                                </div>
                                               <div class="form_outer">
                                               <%-- <form> --%>
                                                    <!--<input type="text" placeholder="User type*" required />-->

       <%--                                            <asp:TextBox ID="txt" runat="server" placeholder="User type*"></asp:TextBox>--%>
                                                     <asp:DropDownList ID="txt" runat="server" AppendDataBoundItems="true">
                                                         <asp:listitem Value="0">Select</asp:listitem>
                                                            <asp:listitem Value="1">Admin</asp:listitem>
                                                            <asp:listitem Value="2">Web Admin</asp:listitem>
                                                            <asp:listitem Value="3">Accounts</asp:listitem>
                                                     </asp:DropDownList>  
                                                   <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt" InitialValue="0" ValidationGroup="vl" ErrorMessage="Add usertype" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                <asp:TextBox ID="txt1" runat="server" placeholder="User Name*"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt1" ValidationGroup="vl" ErrorMessage="Add Username" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                      <asp:TextBox ID="txt2" runat="server" placeholder="Password*" TextMode="Password"></asp:TextBox>
                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2" ValidationGroup="vl" ErrorMessage="Enter Password" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                   <%-- <input type="text" placeholder="Username*" required />                                                                                                                                         
                                                    <input type="password" placeholder="Password*" required/>
                                                    <input type="email" placeholder="E-mail*" required/>                                               
                                                    <input type="submit" value="LOGIN" />--%>
                                                   <asp:Button ID="btn" runat="server" Text="SUBMIT" ValidationGroup="vl"  OnClick="btn_Click"/>
                                                   <asp:ValidationSummary ID="val" runat="server" ValidationGroup="vl" ShowMessageBox="true" ShowSummary="false" />
                                               <%-- </form>--%>
                                              <%--  <a href="Register.aspx" target="_self">Register</a>--%>
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
    </div>
    </form>
</body>
</html>
