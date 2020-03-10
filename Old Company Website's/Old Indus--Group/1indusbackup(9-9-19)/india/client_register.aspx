<%@ Page Language="C#" AutoEventWireup="true" CodeFile="client_register.aspx.cs" Inherits="client_register" %>
<%@ Register Src="usercontrols/Indheader.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="../Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
    <script>        (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
   <title>:  : 1indus.com :  : </title>


  <style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/header.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />

    <link href="../css/styles1.css" rel="stylesheet" type="text/css" />
</head>
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
     <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
    </header>



  <section class="about text-left" id="about">
    <div class="container">
     <div class="row">

     <%--<tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/login-banner.jpg"/></td></tr>--%>

 
<table width="100%" border="0">
  <tr>
 <td align="left"   style="font-family: Tahoma, Geneva, sans-serif;
        font-size: 16px;
        font-weight: bold;
        color: #003366;
        padding-left:50px;
        background: url('../Images/innerbg.jpg') no-repeat;
        height: 32px;"> Client Register</td>
  </tr>
  <tr>

    <td align="center" colspan="3"><table width="100%" border="0">
 
      <tr>
        <td align="center">
        <table width="100%"  border="0" style=" width:400px; padding:5px; border:1px dotted #AFD2FA">
          <tr><td></td></tr>
          <tr>
            <td height="30" colspan="3" style="background:url(../Images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>User ID & Password</b></font></td>
          </tr>
          <tr><td colspan="3" height="15px"></td></tr>
          <tr>
            <td width="174" height="30">User Name</td>
            <td width="26"><strong>:</strong></td>
            <td width="186" height="30">
            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px" OnTextChanged="txtusername_TextChanged" AutoPostBack="true"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ForeColor="Red"
                        ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" 
                        Font-Size="Smaller" Display="Static" Font-Overline="False" SetFocusOnError="True" ValidationGroup="client">*</asp:RequiredFieldValidator>
                          <div id="checkusername" runat="server"  Visible="false">
                        <asp:Image ID="imgstatus" ImageUrl="../Images/check.gif" runat="server" Width="17px" Height="17px"/>
                        <asp:Label ID="CheckAvailability" runat="server">Check Availability</asp:Label>&nbsp;&nbsp;&nbsp;
                   </div>
          <%--  <input type="text" style="width:180px; height:20px" />--%></td>
          </tr>
          
          <tr>
            <td height="30">Password</td>
            <td><strong>:</strong></td>
            <td height="30">
            <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                    Font-Size="Smaller" ValidationGroup="client" ForeColor="Red">*</asp:RequiredFieldValidator></td>
          </tr>
          
          <tr>
            <td height="30">Confirm Password</td>
            <td><strong>:</strong></td>
            <td height="30">
             <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px" TextMode="Password" 
                   ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" ForeColor="Red" Font-Size="Smaller" ErrorMessage="Please Enter Re-Password" ValidationGroup="client">
                *</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="client">*</asp:CompareValidator>
             </td>
          </tr>
         
          <tr>
            <td height="30">Company Name</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
        
          <tr>
            <td height="30">Company Mail ID</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Font-Size="Smaller" ErrorMessage="Please enter mailid" ControlToValidate="txtcompanymailid"
                 ValidationGroup="client">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="Please Enter Valid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="client">*</asp:RegularExpressionValidator>
              </td>
          </tr>
            <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>  
          
                    
            </td>
        </tr>
          <tr>
            <td height="30" colspan="3" style="background:url(../Images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
          </tr>
          <tr>
            <td height="30">Industry Type</td>
            <td><strong>:</strong></td>
            <td>
            <asp:DropDownList ID="ddlindtype" runat="server" Width="200px" CssClass="lable4">
            <asp:ListItem Selected="True">Select Industry Type</asp:ListItem>
            <asp:ListItem value="Accounting/Taxation/Finance">Accounting/Taxation/Finance</asp:ListItem>
            <asp:ListItem value="Advertising/PR/MR/Events">Advertising/PR/MR/Events</asp:ListItem>
            <asp:ListItem value="Agriculture/Dairy">Agriculture/Dairy</asp:ListItem>
            <asp:ListItem value="Architecture/Interior Designing">Architecture/Interior Designing</asp:ListItem>
            <asp:ListItem value="Auto/Auto Ancillary">Auto/Auto Ancillary</asp:ListItem>
            <asp:ListItem value="Banking/Financial Services/Broking">Banking/Financial Services/Broking</asp:ListItem>
            <asp:ListItem value="BPO/ITES/CRM/Transcription">BPO/ITES/CRM/Transcription</asp:ListItem>
            <asp:ListItem value="Chemicals/PetroChemical/Plastic/Rubber">Chemicals/PetroChemical/Plastic/Rubber</asp:ListItem>
            <asp:ListItem value="Construction/Engineering/Cement/Metals">Construction/Engineering/Cement/Metals</asp:ListItem>
            <asp:ListItem value="Consumer Durables">Consumer Durables</asp:ListItem>
            <asp:ListItem value="Courier/Transportation/Freight">Courier/Transportation/Freight</asp:ListItem>
            <asp:ListItem value="Defence/Government">Defence/Government</asp:ListItem>
            <asp:ListItem value="Education/Teaching/Training">Education/Teaching/Training</asp:ListItem>
            <asp:ListItem value="Export/Import">Export/Import</asp:ListItem>
            <asp:ListItem value="Fertilizers/Pesticides">Fertilizers/Pesticides</asp:ListItem>
            <asp:ListItem value="FMCG/Foods/Beverage">FMCG/Foods/Beverage</asp:ListItem>
            <asp:ListItem value="Fresher/Trainee">Fresher/Trainee</asp:ListItem>
            <asp:ListItem value="Gems and Jewellery">Gems&amp; Jewellery</asp:ListItem>
            <asp:ListItem value="Hotels/Restaurants/Airlines/Travel">Hotels/Restaurants/Airlines/Travel</asp:ListItem>
            <asp:ListItem value="Industrial Products/Heavy Machinery">Industrial Products/Heavy Machinery</asp:ListItem>
            <asp:ListItem value="Insurance">Insurance</asp:ListItem>
            <asp:ListItem value="IT-Software/Software Services">IT-Software/Software Services</asp:ListItem>
            <asp:ListItem value="IT-Hardware and Networking">IT-Hardware&amp; Networking</asp:ListItem>
            <asp:ListItem value="Telcom/ISP">Telcom/ISP</asp:ListItem>
            <asp:ListItem value="Legal">Legal</asp:ListItem>
            <asp:ListItem value="Media/Dotcom/Entertainment">Media/Dotcom/Entertainment</asp:ListItem>
            <asp:ListItem value="Medical/Healthcare/Hospital">Medical/Healthcare/Hospital</asp:ListItem>
            <asp:ListItem value="NGO/Social Services">NGO/Social Services</asp:ListItem>
            <asp:ListItem value="Office Equipment/Automation">Office Equipment/Automation</asp:ListItem>
            <asp:ListItem value="Oil and Gas/Power/Infrastructure/Energy">Oil and Gas/Power/Infrastructure/Energy</asp:ListItem>
            <asp:ListItem value="Paper">Paper</asp:ListItem>
            <asp:ListItem value="Pharma/Biotech/Clinical Research">Pharma/Biotech/Clinical Research</asp:ListItem>
            <asp:ListItem value="Printing/Packaging">Printing/Packaging</asp:ListItem>
            <asp:ListItem value="Real Estate/Property">Real Estate/Property</asp:ListItem>
            <asp:ListItem value="Recruitment/Employment Firm">Recruitment/Employment Firm</asp:ListItem>
            <asp:ListItem value="Retailing">Retailing</asp:ListItem>
            <asp:ListItem value="Security/Law Enforcement">Security/Law Enforcement</asp:ListItem>
            <asp:ListItem value="Semiconductors/Electronics">Semiconductors/Electronics</asp:ListItem>
            <asp:ListItem value="Shipping/Marine">Shipping/Marine</asp:ListItem>
            <asp:ListItem value="Textiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
            <asp:ListItem value="Tyres">Tyres</asp:ListItem>
            <asp:ListItem value="Other">Other</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="ddlindtype" InitialValue="Select Industry Type" 
                        ErrorMessage="Please Select the Industry Type." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
          </td>
          </tr>
         
          <tr>
            <td height="30">Contact Person</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtcontactperson" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcontactperson" 
                    ErrorMessage="Please enter the Contact Person" Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
          
          <tr>
            <td height="30">Contact Person's Designation</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtcontactpersondesg" runat="server" Width="200px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtcontactpersondesg" 
                        ErrorMessage="Please enter the Designation." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
          
          <tr>
            <td height="30">URL</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtulr" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtulr" ErrorMessage="Please enter the URL." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtulr" ErrorMessage="Please enter valid URL"                          
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
              </td>
          </tr>
        
          <tr>
            <td height="30">Brief Description </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="100px" Width="200px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtdesc" ErrorMessage="Please enter the Description." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>         
          <tr>
            <td height="30" colspan="3" style="background:url(../Images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
          </tr>
          <tr>
            <td height="30"> Address for Communication</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtaddrforcommunication" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtaddrforcommunication" 
                    ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
         
          <tr>
            <td height="30">Street Address</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtstreetaddr" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtstreetaddr" 
                    ErrorMessage="Please enter the Street Address." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
        
          <tr>
            <td height="30">Country</td>
            <td><strong>:</strong></td>
            <td><span style="height:25px ">
             <asp:DropDownList ID="country" runat="server" CssClass="textfield" Width="190px"   AutoPostBack="true" OnSelectedIndexChanged="country_SelectedIndexChanged">             
              <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
            </asp:DropDownList>
            </span>
            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" 
                        ControlToValidate="country" InitialValue="Select Country" 
                        ErrorMessage="Please Select the Country." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
            <td height="30">State</td>
            <td><strong>:</strong></td>
            <td>
               <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"   OnSelectedIndexChanged="country_SelectedIndexChanged">
              <asp:ListItem Value="Select State">Select State</asp:ListItem>
              </asp:Dropdownlist>
               <asp:RequiredFieldValidator ID="rfvstate" runat="server" 
                    ControlToValidate="state" InitialValue="Select State" 
                    ErrorMessage="Please Select the State." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
          
          <tr>
            <td height="30">City </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                        Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
             
          <tr>
            <td height="30">Phone</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
       
          <tr>
            <td height="40">Fax</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtfax" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
          
     <%--     <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Terms &amp; Conditions</b></font></td>
          </tr>--%>
          <%--<tr>
            <td height="78" colspan="3" valign="top"><div align="justify" style="padding:10px">
               <asp:CheckBox ID="CheckBox1" runat="server" Text=" I have read and understood and agree to the Terms and Conditions governing the use of careersgen.com. You must agree to the terms and conditions before you can continue." />
           &nbsp;&nbsp;</div>
             <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                        ErrorMessage="Please select the checkbox." Text="Please select the checkbox." 
                                                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="client"></asp:CustomValidator>
                                               
           </td>
          </tr>--%>
          <tr>
            <td height="30" colspan="3" align="center">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"  ValidationGroup="client"/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" /></td>
          </tr>
          <tr>
          <td><asp:Label ID="lblerror" runat="server" Text="lblerror"></asp:Label></td>
          </tr>
        </table></td>
  
        <td valign="middle" align="left"><img src="../Images/regiter.jpg" width="322" height="307" /></td>           
        </tr>
    </table></td>
  </tr>
</table>
       
   
    
    </div></div></section>
    <div>
    <foot:footer ID="foot1" runat="server" />
    </div>
    </form>
</body>
</html>
