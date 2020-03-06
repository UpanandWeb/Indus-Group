<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="pragma" content="no-cache">

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/full-slider.css">
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
<!--menu_links-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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



    <div class="container-fluid">
        	<div class="row">
            	<div class="col-lg-10 m-auto">
                	<div class="row">
                    	<div class="col-lg-3">	
                        </div>
                        <div class="col-lg-6 nopadding">
                        	<div class="loginadmin">
                                <div class="newadmin_heading">
                                	<!--<img src="images/neworphanlogo.png" width="180" height="80" alt=""/>-->
									<h1>Login</h1>
                                 </div>
                                     <div class="row nopadding">
                                         <div class="col-lg-10 m-auto">
                                            <div class="topentry_outer">
                                                <img src="images/avatar.jpg" width="100" height="100" alt="" /> 
                                                <h1>Please Enter Login Details</h1>
                                            </div>
                                           <div class="form_outer">
                                            <form> 

                                                <asp:TextBox ID="txt1" runat="server" placeholder="Username*" required ></asp:TextBox>
                                                <asp:TextBox ID="txt2" runat="server" placeholder="Password*" required ></asp:TextBox>

                                                <asp:Button ID="btn" runat="server" Text="LOGIN" OnClick="btn_Click" />

                                           <asp:Label ID="lb" runat="server" Text="Click Here"></asp:Label>     <asp:LinkButton ID="reg" runat="server" Text="REGISTER" OnClick="reg_Click"></asp:LinkButton> 
                                            <%--    <input type="text" placeholder="Username*" required />                                                                                                                                                                                         
                                                <input type="password" placeholder="Password*" required/>                                                                                              
                                                <input type="submit" value="LOGIN" />  --%>
                                                <%--<input type="submit" value="REGISTER" />                                           --%>
                                            </form>
                                            <!--<span>Click on</span><a href="#" target="_self">Register</a>-->
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

