<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Company_View.aspx.cs" Inherits="Company_View" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Company_overView</title>
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
        .style2
        {
            color: #174eb4;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            vertical-align: baseline;
            width: 98px;
           
            padding-left: 5px;
            background-color: #ffffff;
        }
    </style>
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
      
       <table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
    <tr>
     <td style="color:Blue;font-weight:bold;text-align:center" class="header">
        Company Information</b>
     </td>
     </tr>
    </table>
    
      <table width="40%"  border="0" align="center" style="background-color:#E5E0E0">
          
          <tr>
            <td height="30" colspan="3" ><font class="crentopenings"><b>User ID & Password</b></font></td>
          </tr>
          <tr>
            <td  width="35%" align="right" >User Name</td>
            <td width="4%"><strong>:</strong></td>
            <td width="186" height="30">
            <asp:Label ID="lbluname" runat="server" CssClass="LABEL1" Width="208px"></asp:Label></td>
          </tr>
          
          <tr>
            <td height="30" align="right">Password</td>
            <td><strong>:</strong></td>
            <td height="30">
                  <asp:Label ID="lblpwd" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
</td>
          </tr>
          
          <tr>
            <td height="30" align="right">Confirm Password</td>
            <td><strong>:</strong></td>
            <td height="30">
                   <asp:Label ID="lblcpwd" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

             </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Company Name</td>
            <td><strong>:</strong></td>
            <td>
      <asp:Label ID="lblcname" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
             
             </td>
          </tr>
        
          <tr>
            <td height="30" align="right">Company Mail ID</td>
            <td><strong>:</strong></td>
            <td>
                    <asp:Label ID="lblemail" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

              </td>
          </tr>
          
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right">Company Type</td>
            <td><strong>:</strong></td>
            <td>
      <asp:Label ID="lblctype" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
            
      
          </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Contact Person</td>
            <td><strong>:</strong></td>
            <td>
      <asp:Label ID="lblcntname" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
               
               </td>
          </tr>
          
          <tr>
            <td height="30" align="right">Contact Person's Designation</td>
            <td><strong>:</strong></td>
            <td>
                    <asp:Label ID="lbldesig" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

              </td>
          </tr>
          
          <tr>
            <td height="30" align="right">URL</td>
            <td><strong>:</strong></td>
            <td>
                    <asp:Label ID="lblwebsite" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

              </td>
          </tr>
        
          <tr>
            <td height="30" align="right">Brief Description </td>
            <td><strong>:</strong></td>
            <td>
                   <asp:Label ID="lbldesc" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

             </td>
          </tr>         
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right"> Address for Communication</td>
            <td><strong>:</strong></td>
            <td>
      <asp:Label ID="lbladdr1" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
              
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
      <asp:Label ID="lblcountry" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
             
            </td>
          </tr>
           
            <tr>
            <td height="30" align="right"> State</td>
            <td><strong>:</strong></td>
            <td>
                     <asp:Label ID="lblstate" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

            </td>
          </tr>
          
          <tr>
            <td height="30" align="right">City </td>
            <td><strong>:</strong></td>
            <td>
                  <asp:Label ID="lblcity" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

             </td>
          </tr>
             
          <tr>
            <td height="30" align="right">Phone</td>
            <td><strong>:</strong></td>
            <td>
                     <asp:Label ID="lblphone" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>

               </td>
          </tr>
       
          <tr>
            <td height="40" align="right">Fax</td>
            <td><strong>:</strong></td>
            <td>
                 <asp:Label ID="lblfax" runat="server" CssClass="LABEL1" Width="208px"></asp:Label>
    
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
