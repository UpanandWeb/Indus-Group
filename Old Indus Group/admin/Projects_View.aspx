<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Projects_View.aspx.cs" Inherits="Projects_View" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Projects_View</title>
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
            font-size: 13px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 30px;            
            width: 50%;           
            text-align:right;
            background-color: #ffffff;
            padding-right:40px;
        }
        
        .style4
        {
            text-align:left;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 30px;          
           
            background-color: #ffffff;
        }
        
       
    </style>
</head>
<body id="body1" runat="server">
 <form id="form1" runat="server">
 <center>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div>
   <table width="998px"> 
   <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
           
       
       <tr>
      <td>
      <br /><br />
      
       <table cellspacing="0" cellpadding="0" style="width: 998px;" align="center">
    <tr>
     <td style="color:Blue; font-size:medium"  align="center">
  <b> Project Information</b>
     </td>
     </tr>
    </table>
    
    <br />
    
    <table cellpadding="0" cellspacing="0" align="center" style="width: 998px">
     
     <tr>
     <td class="style2">Project Name :</td>
     <td class="style4">
     <asp:Label ID="lblprojname" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Project Owner :</td>
     <td class="style4">
     <asp:Label ID="lblprojowner" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
      <tr>
      <td class="style2">Company Type :</td>
      <td class="style4">
      <asp:Label ID="lblctype" runat="server" CssClass="LABEL1"></asp:Label>
      </td>
      </tr>
      
      <tr>
     <td class="style2">Company Name :</td>
     <td class="style4">
     <asp:Label ID="lblcompname" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Internal Division :</td>
     <td class="style4">
     <asp:Label ID="lblintdiv" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
      <tr>
     <td class="style2">Project Type :</td>
     <td class="style4">
     <asp:Label ID="lblprojtype" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Priority :</td>
     <td class="style4">
     <asp:Label ID="lblpriority" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Status :</td>
     <td class="style4">
     <asp:Label ID="lblstatus" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
      <tr>
     <td class="style2">Short Name :</td>
     <td class="style4">
     <asp:Label ID="lblshname" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Start Date :</td>
     <td class="style4">
     <asp:Label ID="lblstdate" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Target Finish Date :</td>
     <td class="style4">
     <asp:Label ID="lblenddt" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Actual Budget($) :</td>
     <td class="style4">
     <asp:Label ID="lblacbudget" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Target Budget($) :</td>
     <td class="style4">
     <asp:Label ID="lbltarbudget" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Actual URL :</td>
     <td class="style4">
     <asp:Label ID="lblacurl" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     
     <tr>
     <td class="style2">Staging URL :</td>
     <td class="style4">
     <asp:Label ID="lblsturl" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Project Description :</td>
     <td class="style4">
     <asp:Label ID="lbldesc" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     <tr>
     <td align="center" colspan="2"><br />
     <asp:Button id="btnback" runat="server" Text="Back" onclick="btnback_Click" />
     </td>
     </tr>
     
   </table>       
      </td>
      </tr>  
            
      </table>
      </div>
     </center>
 </form>
</body>
</html>