<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>||Admin-Home||</title>

    <meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<meta http-equiv="pragma" content="no-cache" />

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/full-slider.css" />
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
 <div class="admintot_outer">
	<div class="container-fluid">
        	<div class="row">
            	<div class="col-lg-10 m-auto">
                	<div class="row">
                    	<div class="col-lg-3">	
                        </div>
                        <div class="col-lg-6 nopadding">
                        	<div class="adminpadd">
                                <div class="admin_heading">
                                	<img src="images/color_change_logoaf.png" width="180" height="80" alt=""/>
									<h1>Admin Login</h1>
                                 </div>
                                     <div class="row nopadding">
                                         <div class="col-lg-10 m-auto">
                                            <div class="topentry_outer">
                                                <img src="images/avatar.jpg" width="100" height="100" alt="" /> 
                                                <h1>Please Enter Login Details</h1>
                                            </div>
                                           <div class="form_outer">
                                            <form> 
                                                <asp:DropDownList ID="ddltype" runat="server" placeholder="User type*" >
                                                    <asp:ListItem Value="0" >Select User Type</asp:ListItem>
                                                     <asp:ListItem Value="1" >Admin</asp:ListItem>
                                                    <asp:ListItem Value="2" >Accounts</asp:ListItem>
                                                    <asp:ListItem Value="3" >Web Admin</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:TextBox ID="txt1" runat="server" placeholder="User Name*" required></asp:TextBox>  
                                               <%-- <input type="text" placeholder="User type*" required />
                                                <input type="text" placeholder="Username*" required />                                                                                                                                         
                                                <input type="password" placeholder="Password*" required/>
                                                <input type="email" placeholder="E-mail*" required/>                                               
                                                <input type="submit" value="LOGIN" />--%>
                                               <asp:TextBox ID="txt2" runat="server" placeholder="Password*" TextMode="Password" required></asp:TextBox> 
                                                
                                                <asp:Button ID="login"  runat="server" Text="LOGIN" OnClick="login_Click" /> 

                                            </form>
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



<!--footer-->
<%--<div class="container-fluid">
    	<div class="row">
        	<div class="col-lg-12 nopadding">
            	<div class="footer_outer">
                    <div class="footer">
                    	<div class="row">
                        	<div class="col-lg-6">
                            	<div class="left_copyright">
                                	<p>Orphan Care Copyright &copy; 1999-2018, All Rights reserved.</p>
                                </div>
                            </div>
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-4">
                            	<div class="rite_links">
                                	<ul>                 
                                        <li><a href="#">Terms &amp; Conditions</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="#" target="_blank">Disclaimer</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>   
  <!--footer-->

</form>
</body>
</html>
