<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_viewclient.aspx.cs" Inherits="admin_Admin_viewclient" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
          .class123
        {
        font-family:Verdana;font-size:12px;
        } 
    </style>
    <style>
body{ margin:0px; padding:0px;}

.inpt{ font-family:Arial, Helvetica, sans-serif; font-size:12px;  width:210px; height:25px; border:#CCC solid 1px;}

.inpt1{font-family:Arial, Helvetica, sans-serif; font-size:12px; width:210px; height:35px; border:#CCC solid 1px;}

.inpt2{ font-family:Arial, Helvetica, sans-serif; font-size:12px; width:210px; height:25px; border:#CCC solid 1px;}

.inpt_EFL{width:80px; height:25px; border:#CCC solid 1px;}
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
     <tr><td>&nbsp;</td></tr>
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog">
       <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
        </td>
       </tr>
      <tr>
      <td align="center">
    <table width="80%" style="color:#00277a">
    <tr>
    <td height="25" align="center" style="width:90%"><b style="color:maroon">Company Setup</b></td>
    <td align="right" valign="bottom"><a href="Admin_clients.aspx" style="font-size:small" ><< Back</a></td>
  </tr>
    <tr>
    <td colspan="2">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#dcdddf solid 1px;">
    <tr>
    <td style="width:auto; padding-left:5px; padding-right:5px;" align="left">&nbsp;Company Information
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border:#dcdddf solid 1px;">
    <tr>
    <td>    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="35" class="class123"  align="right" valign="middle" style="width:25%" >Company name :</td>
                        <td height="35" style="padding-left:5px;">
                        <asp:TextBox ID="txtcname" runat="server" class="inpt" Enabled="false"></asp:TextBox>                  
                        </td>
                      </tr>
                      <tr>
                        <td height="35" class="class123" align="right" valign="middle">Address1 :</td>
                        <td height="35" style="padding-left:5px;">
                         <asp:TextBox ID="txtadd1" TextMode="MultiLine" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                        
                        </td>
                      </tr>
                      <tr>
                        <td height="35" class="class123" align="right" valign="middle">Address2 :</td>
                        <td height="35" style="padding-left:5px;">
                         <asp:TextBox ID="txtadd2"  TextMode="MultiLine" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                       
                        </td>
                      </tr>
                      <tr>
                        <td height="35" class="class123" align="right" valign="middle">Country :</td>
                                                <td height="35" style="padding-left:5px;">
                                               <asp:DropDownList ID="ddlCountry" runat="server" class="inpt"  Enabled="false">
                        <asp:ListItem >Select country</asp:ListItem>
                        </asp:DropDownList>
                        
                        </td>
                      </tr>                      
                      <tr>
                        <td height="35" class="class123" align="right" valign="middle">State :</td>
                        <td height="35" style="padding-left:5px;"> 
                        <asp:DropDownList ID="ddlstate" runat="server" class="inpt" Enabled="false" >
                         
                       <asp:ListItem >Select State</asp:ListItem>
                        </asp:DropDownList>
                       
                        </td>
                      </tr>
                      <tr>
                        <td class="class123" align="right" valign="top">City :</td>
                                                <td style="padding-left:5px;">
                                               <asp:DropDownList ID="ddlcity" runat="server" class="inpt"  Enabled="false">
                         
                       <asp:ListItem >Select City</asp:ListItem>
                        </asp:DropDownList>
                      
                        </td>
                      </tr>
                      
                      <tr>
                        <td height="35" class="class123" align="right" valign="middle">Zip :</td>
                        <td height="35" style="padding-left:5px;">
                         <asp:TextBox ID="txtzip" MaxLength="6" runat="server" class="inpt" Enabled="false"></asp:TextBox>
                      </td>
                      </tr>
                    </table>  
    
    </td>
    </tr>
    </table>
    </td>
    <td valign="top" align="left" style="padding-right:5px;">&nbsp;ID
     <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:#dcdddf solid 1px;">
              <tr>
              <td>
               <table width="100%" border="0" cellpadding="0" cellspacing="0">                
                <tr>
                        <td height="35" class="class123" align="right">Employer Tax ID (EIN) :</td>
                        <td height="35">&nbsp;<asp:TextBox ID="txtemptaxid" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                       
                        </td>
                      </tr>
                      <tr>
                        <td height="35" class="class123" align="right">State ID :</td>
                         <td height="35">&nbsp;<asp:TextBox ID="txtstateid" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                        
                        </td>
                      </tr>
                      <tr>
                        <td height="45" class="class123" align="right" valign="top">Social Security Number<br />
                          (if Applicable) :</td>
                          <td height="45">&nbsp;<asp:TextBox ID="txtssnumber" runat="server" class="inpt1" Enabled="false" ></asp:TextBox>
                        
                        </td>
                      </tr>
                      <tr>
                        <td height="35" class="class123" align="right" >Efile Name Control :</td>
                        <td height="35" style="padding-left:3px;">
                            <asp:TextBox ID="txtefilename" runat="server" class="inpt_EFL" Enabled="false" ></asp:TextBox>                            
                            
                        </td>
                      </tr>
                      <tr>
                        <td align="right" colspan="2">&nbsp;</td>
                      </tr>         
                     
                     
                </table>
              </td>
              </tr>
              </table>
    </td>
    </tr>
    
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
    <td colspan="2" align="left" style="padding:5px 5px 5px 5px;">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#dcdddf solid 1px;"> 
    <tr>
            <td colspan="2">&nbsp;1099 Filer</td>
          </tr>
          <tr>
          <td>
          <table width="100%">
           <tr>
          <td height="35" class="class123" align="right" valign="middle">FILTER's Name :</td>
           <td>
                <asp:TextBox ID="txtfiltersname" runat="server" class="inpt2" Enabled="false" ></asp:TextBox>
               
                </td>
          </tr>
          <tr>
                            <td height="35" class="class123" align="right" valign="middle">Contact name :</td>
                            <td height="35">
                            <asp:TextBox ID="txtcontactname" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                          
                            </td>
                            </tr>
                            <tr>
                            <td height="35" class="class123" align="right" valign="middle">URL :</td>
                             <td height="35">
                             <asp:TextBox ID="txturl" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                             
                            </td>
                          </tr>
          <tr>
                            <td height="35" class="class123" align="right" valign="middle">Telephone :</td>
                             <td height="35">
                             <asp:TextBox ID="txtmobile" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                             </td>
                          </tr>
                           
          </table>
          </td>
          <td align="left">
          <table width="100%">
          <tr>
                            <td height="35"  class="class123" align="right" valign="middle">Work :</td>
                            <td height="35">
                            <asp:TextBox ID="txtWork" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                              </td>
                            </tr>
                          <tr>
                            <td height="35" class="class123" align="right" valign="middle">Direct Phone :</td>
                            <td height="35">
                            <asp:TextBox ID="txtDirect" runat="server" class="inpt" Enabled="false"></asp:TextBox>
                              </td>
                            </tr>
          <tr>
                            <td height="35"  class="class123" align="right" valign="middle">Fax :</td>
                            <td height="35">
                            <asp:TextBox ID="txtfax" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                              </td>
                            </tr>
                          <tr>
                            <td height="35" class="class123" align="right" valign="middle">Email :</td>
                            <td height="35">
                            <asp:TextBox ID="txtemail" runat="server" class="inpt" Enabled="false" ></asp:TextBox>
                              </td>
                            </tr>
          </table>
          </td>
          </tr>
         
          <tr>
          <td colspan="2" align="right" style="font-size:12px;">
          <asp:CheckBox ID="chk1" runat="server" Text="Final Returns"  Enabled="false"/>&nbsp;
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
      
      </table>
      </div>
     
 </form>
</body>
</html>