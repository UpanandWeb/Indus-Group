<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departments_View.aspx.cs" Inherits="Departments_View" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Departments_View</title>
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
            height: 26px;
            vertical-align: baseline;
            width: 163px;
            text-align:right;
            
            padding-right:40px;
            background-color: #ffffff;
        }
        
        .style10
        {
            
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 26px;
            vertical-align: baseline;
            width: 163px;
            text-align:left;
            padding-left: 5px;
            background-color: #ffffff;
        }
        
    </style>
</head>


<body id="body1" runat="server">
    <form id="form1" runat="server">
    <center>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div>
   <table width="998px" align="center"> 
   <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
       
       
       
       <tr>
       <td>
       
       
    <table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
    <tr>
     <td style="color:Blue; font-size:medium;" class="header" align="center"><br /><br />
     Department Information
     <br /></td>
     </tr>
    </table>
    
    <br /><br />
    
    <table cellpadding="0" cellspacing="0" align="center" style="width: 78%">
     
     <tr>
     <td class="style2">Company Type :</td>
     <td class="style10">
     <asp:Label ID="lblctype" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td class="style2">Company Name :</td>
     <td class="style10">
     <asp:Label ID="lblcname" runat="server" CssClass="LABEL1"></asp:Label>
     </td>
     </tr>
     
      <tr>
      <td class="style2">Department Code :</td>
      <td class="style10">
      <asp:Label ID="lbldcode" runat="server" CssClass="LABEL1"></asp:Label>
      </td>
      </tr>
      
      <tr>
     <td class="style2">Department Name :</td>
     <td class="style10">
     <asp:Label ID="lbldname" runat="server" CssClass="LABEL1"></asp:Label>
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