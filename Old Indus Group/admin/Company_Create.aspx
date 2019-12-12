<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Company_Create.aspx.cs" Inherits="Company_Create" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Company_Create</title>
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
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
    <style type="text/css">
        .style1
        {
            width: 143px;
        }
        .style13
        {
            height: 330px;
        }
    </style>
    <script language="Javascript" type="text/javascript">
       <!--        Users_Information
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
       //-->
    </script>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript1.2" src="js/statesopt.js" type="text/javascript">
</script>
<script language="JavaScript1.2" src="Jscripts/empregvalidation.js" type="text/javascript"></script>
    
    <script type="text/javascript">
function allowonlynumbers() 
{
if(event.keyCode >= 48 && event.keyCode <= 57) 
{
return true; 
}
else
{
alert('Only numbers can be entered.');return false; 
} 
}

</script>
</head>


<body id="body1" runat="server">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div>
   <table width="100%"> 
   <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
       <tr>
           <td>
           </td>
       </tr>
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog">
        </td>
       </tr>
      <tr>
      <td>
      
        <table border="0" width="100%" style="height: 35px">
     <tr>
     <td class="style13">
     
       <table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
     <tr>
     <td style="color:Blue;font-weight:300;font-size:large" align="center">
    <b><u> Company Information </u></b>
     </td>
     </tr>
     </table>    
     <table width="40%"  border="0" align="center" style="background-color:#E5E0E0">
          
          <tr>
            <td height="30" colspan="3" ><font class="crentopenings"><b>User ID & Password</b></font></td>
          </tr>
          <tr>
            <td  width="35%" align="right">User Name</td>
            <td width="1%"><strong>:</strong></td>
            <td width="186" height="30">
            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" 
                        Font-Size="Smaller" Display="Static" Font-Overline="False" SetFocusOnError="True" ValidationGroup="client">*</asp:RequiredFieldValidator>
                         
          <%--  <input type="text" style="width:180px; height:20px" />--%></td>
          </tr>
          
          <tr>
            <td height="30" align="right">Password</td>
            <td><strong>:</strong></td>
            <td height="30">
            <asp:TextBox ID="txtpwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator></td>
          </tr>
          
          <tr>
            <td height="30" align="right">Confirm Password</td>
            <td><strong>:</strong></td>
            <td height="30">
             <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px" TextMode="Password" 
                   ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" Font-Size="Smaller" ErrorMessage="Please Enter Re-Password" ValidationGroup="client">
                *</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="client">*</asp:CompareValidator>
             </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Company Name</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"  OnTextChanged="txtcompanyname_TextChanged" AutoPostBack="true"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator> &nbsp;  <div id="checkusername" runat="server"  Visible="false">
                        <asp:Image ID="imgstatus" ImageUrl="images/check.gif" runat="server" Width="17px" Height="17px"/>
                        <asp:Label ID="CheckAvailability" runat="server">Check Availability</asp:Label>&nbsp;&nbsp;&nbsp;
                   </div>
             </td>
          </tr>
        
          <tr>
            <td height="30" align="right">Company Mail ID</td>
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
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right">Company Type</td>
            <td><strong>:</strong></td>
            <td>
            <asp:DropDownList ID="ddctype" runat="server" Width="205px" CssClass="lable4">
            <asp:ListItem Selected="True">Select Type</asp:ListItem>         
            <asp:ListItem Text="Client">Client</asp:ListItem>
            <asp:ListItem Text="Vendor">Vendor</asp:ListItem>
            <asp:ListItem Text="Company">Company</asp:ListItem>
            <asp:ListItem Text="Supplier">Supplier</asp:ListItem>
            <asp:ListItem Text="Government">Government</asp:ListItem>
            <asp:ListItem Text="Internal">Internal</asp:ListItem>
            <asp:ListItem Text="Not Applicable">Not Applicable</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="ddctype" InitialValue="Select Type" 
                        ErrorMessage="Please Select the Industry Type." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
          </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Contact Person</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtcontactperson" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcontactperson" 
                    ErrorMessage="Please enter the Contact Person" Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
          
          <tr>
            <td height="30" align="right">Contact Person's Designation</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtcontactpersondesg" runat="server" Width="200px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtcontactpersondesg" 
                        ErrorMessage="Please enter the Designation." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
          
          <tr>
            <td height="30" align="right">URL</td>
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
            <td height="30" align="right">Brief Description </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="100px" Width="200px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtdesc" ErrorMessage="Please enter the Description." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>         
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right"> Address for Communication</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtaddrforcommunication" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtaddrforcommunication" 
                    ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
         <%--
          <tr>
            <td height="30" align="right">Street Address</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtstreetaddr" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtstreetaddr" 
                    ErrorMessage="Please enter the Street Address." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
        --%>
          <tr>
            <td height="30" align="right">Country</td>
            <td><strong>:</strong></td>
            <td><span style="height:25px ">
             <asp:DropDownList ID="country" runat="server" CssClass="textfield" Width="205px"   AutoPostBack="true" OnSelectedIndexChanged="country_SelectedIndexChanged">             
              <asp:ListItem Text="Select Country" >Select Country</asp:ListItem>
            </asp:DropDownList>
            </span>
            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" 
                        ControlToValidate="country" InitialValue="Select Country" 
                        ErrorMessage="Please Select the Country." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
            <td height="30" align="right"> State</td>
            <td><strong>:</strong></td>
            <td>
               <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="205px"  >
              <asp:ListItem Text="Select State" >Select State</asp:ListItem>
              </asp:Dropdownlist>
               <asp:RequiredFieldValidator ID="rfvstate" runat="server" 
                    ControlToValidate="state" InitialValue="Select State" 
                    ErrorMessage="Please Select the State." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
          
          <tr>
            <td height="30" align="right">City </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>          
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="txtcity" ErrorMessage="Please Enter City." 
                        Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
             
          <tr>
            <td height="30" align="right">Phone</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
       
          <tr>
            <td height="40" align="right">Fax</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtfax" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
          
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Terms &amp; Conditions</b></font></td>
          </tr>
          <tr>
            <td height="78" colspan="3" valign="top"><div align="justify" style="padding:10px">
               <asp:CheckBox ID="CheckBox1" runat="server" Text=" I have read and understood and agree to the Terms and Conditions governing the use of careersgen.com. You must agree to the terms and conditions before you can continue." />
           &nbsp;&nbsp;</div>
             <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                        ErrorMessage="Please select the checkbox." Text="Please select the checkbox." 
                                                        onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="client"></asp:CustomValidator>
                                               
           </td>
          </tr>
          <tr>
            <td height="30" colspan="3" align="center">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"  ValidationGroup="client"/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" /></td>
          </tr>
          <tr>
          <td><asp:Label ID="lblerror" runat="server" Text="lblerror"></asp:Label></td>
          </tr>
        </table>
      <%--<table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
      
      <tr>
      <td class="datab"><span class="star">*</span>Company Type</td>
      <td width="150px">
      <asp:DropDownList ID="ddlctype" runat="server" CssClass="LABEL1" width="208px">
      <asp:ListItem Selected="True">----Select----</asp:ListItem>
      <asp:ListItem Value="1">Client</asp:ListItem>
      <asp:ListItem Value="2">Vendor</asp:ListItem>
      <asp:ListItem Value="3">Company</asp:ListItem>
      <asp:ListItem Value="4">Supplier</asp:ListItem>
      <asp:ListItem Value="5">Government</asp:ListItem>
      <asp:ListItem Value="6">Internal</asp:ListItem>
      <asp:ListItem Value="7">Not Applicable</asp:ListItem>
      </asp:DropDownList>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf13" runat="server" ControlToValidate="ddlctype" InitialValue="----Select----" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Company Name</td>
      <td width="150px">
      <asp:TextBox ID="txtcompname" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf1" runat="server" ControlToValidate="txtcompname" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Company Owner</td>
      <td>
      <asp:TextBox ID="txtcontact" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf2" runat="server" ControlToValidate="txtcontact" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Address1</td>
      <td>
      <asp:TextBox ID="txtaddr1" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf3" runat="server" ControlToValidate="txtaddr1" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Address2</td>
      <td>
      <asp:TextBox ID="txtaddr2" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf4" runat="server" ControlToValidate="txtaddr2" ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Country</td>
      <td>
      <asp:DropDownList ID="ddlcountry" runat="server" Width="213px" 
              onselectedindexchanged="ddlcountry_SelectedIndexChanged" 
              AutoPostBack="true" CssClass="LABEL1">
      </asp:DropDownList>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf5" runat="server" ControlToValidate="ddlcountry" ErrorMessage="*" ValidationGroup="submit" InitialValue="----Select----"></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>State</td>
      <td>
      <asp:UpdatePanel ID="update1" runat="server">
      <ContentTemplate>
      <asp:DropDownList ID="ddlstate" runat="server" Width="213px" 
              onselectedindexchanged="ddlstate_SelectedIndexChanged" AutoPostBack="true" CssClass="LABEL1">
      </asp:DropDownList>
      </ContentTemplate>
      <Triggers>
      <asp:AsyncPostBackTrigger ControlID="ddlcountry" EventName="SelectedIndexChanged" />
      </Triggers>
      </asp:UpdatePanel>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf6" runat="server" ControlToValidate="ddlstate" ErrorMessage="*" InitialValue="----Select----" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>City</td>
      <td>
      <asp:UpdatePanel ID="update2" runat="server">
      <ContentTemplate>
      <asp:DropDownList ID="ddlcity" runat="server" Width="213px" CssClass="LABEL1">
      </asp:DropDownList>
      </ContentTemplate>
      <Triggers>
      <asp:AsyncPostBackTrigger ControlID="ddlstate" EventName="SelectedIndexChanged" />
      </Triggers>
      </asp:UpdatePanel>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf7" runat="server" ControlToValidate="ddlcity" ErrorMessage="*" ValidationGroup="submit"  InitialValue="----Select----"></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Zip</td>
      <td>
      <asp:TextBox ID="txtzip" runat="server" Width="208px" CssClass="LABEL1" onkeypress="return allowonlynumbers();" MaxLength="6"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf8" runat="server" ControlToValidate="txtzip" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Website</td>
      <td>
      <asp:TextBox ID="txtwebsite" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf9" runat="server" ControlToValidate="txtwebsite" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="reg1" runat="server" 
              ControlToValidate="txtwebsite" ErrorMessage="Enter Valid Website" 
              ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>EmailID</td>
      <td>
      <asp:TextBox ID="txtemail" runat="server" Width="208px" CssClass="LABEL1"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf10" runat="server" ControlToValidate="txtemail" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="reg2" runat="server" 
              ControlToValidate="txtemail" ErrorMessage="Enter Valid Email" 
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>PhoneNo</td>
      <td>
      <asp:TextBox ID="txtphone" runat="server" Width="208px" CssClass="LABEL1" onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf11" runat="server" ControlToValidate="txtphone" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>MobileNo </td>
      <td>
      <asp:TextBox ID="txtmobile" CssClass="LABEL1" runat="server" Width="208px" onblur='javascript:chknum(this);'></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf12" runat="server" ControlToValidate="txtmobile" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab"><span class="star">*</span>Fax</td>
      <td>
      <asp:TextBox ID="txtfax" CssClass="LABEL1" runat="server" Width="208px" onkeypress="return allowonlynumbers();"></asp:TextBox>
      </td>
      <td>
      <asp:RequiredFieldValidator ID="reqf14" runat="server" ControlToValidate="txtfax" ErrorMessage="*" ValidationGroup="submit" ></asp:RequiredFieldValidator>
      </td>
      </tr>
      
      <tr>
      <td class="datab" valign="top"><span class="star" ></span>Description</td>
      <td>
      <asp:TextBox ID="txtdesc" CssClass="LABEL1" runat="server" Width="248px" 
              TextMode="MultiLine" Height="69px"></asp:TextBox>
      </td>
      <td>
      
      </td>
      </tr>
      
      
      </table>--%>     
      
      <%--<table style="width: 709px; height: 7px;">
      
      <tr>
      <td align="center">
      &nbsp;
      <asp:Button ID="btnsubmit" runat="server" Text="Submit" onclick="btnsubmit_Click" ValidationGroup="submit" CssClass="wr_login_title" Width="75px" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="Button1" runat="server" Text="Back" CssClass="wr_login_title" 
              Width="75px" onclick="Button1_Click" />
      </td>
      </tr>
      
      
     </table>--%>    
     
     </td>
     </tr>
     </table>
      
      </td>
      </tr>
      
      </table>
      </div>
     
 </form>
</body>
</html>