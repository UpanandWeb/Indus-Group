<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Home.aspx.cs" Inherits="User_Home" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - User_Home</title>
    
    
        <script language="javascript" type="text/javascript">
	
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body>
    <form id="form1" runat="server">
   <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    </table>
     <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" border='0' height='100%'>
  <tr> <td colspan='2' align='center' bgcolor='#ffffff' width='100%' style="height: 33px"> <font size='4pt' color="#0e4860"><b> 
     
      About igiit Admin Control</b></font> 
      <br />
  </td></tr>
  
   <tr><td  colspan='2' align='left' valign='middle' bgcolor="#ffffff" width='100%' style="height: 22px"><font color='#0884ff' size='2pt'><b>  
       <br />
       Admin Control Panel helps administrator to control all the activities that relates to the igiit Website.<br />
   </b></font></td></tr>
   <tr><td colspan='2' align='left' valign='middle' bgcolor="#ffffff" width='100%' style="height: 29px" ><font color='#0884ff' size='2pt'><b> 
       <br />
       Following are the Functionalities implemented in the Admin control Panel : 
       <br />
   </b></font></td></tr>
  
   <tr><td align='left' valign='top' bgcolor="#ffffff" class="lblog" style="width: 783px; height: 41px;">
       <br />
       Client Form :
      
   </td>
  <td align='left' valign='top' bgcolor="#ffffff" width='75%' class="lblog" style="height: 41px">
      <br />
      Enrolling a Client for post their jobs</td></tr>
       <tr>
           <td align="left" bgcolor="#ffffff" class="lblog" style="width: 783px; height: 27px;" valign="top">
               Vendor Form:</td>
           <td align="left" bgcolor="#ffffff" class="lblog" valign="top" width="75%" style="height: 27px">
               Enrolling a Vendor for post their jobs</td>
       </tr>
       <tr>
           <td align="left" bgcolor="#ffffff" class="lblog" style="width: 783px; height: 23px;" valign="top">
               Employee Form:</td>
           <td align="left" bgcolor="#ffffff" class="lblog" valign="top" width="75%" style="height: 23px">
               Enrolling an Employee for getting job</td>
       </tr>

     <tr><td align='left' valign='top' bgcolor="#ffffff" class="lblog" style="width: 783px; height: 67px;">
         <br />
         Upload Forms :
     </td>
  <td align='left' valign='top' bgcolor="#ffffff" width='75%' class="lblog" style="height: 67px">  
      <br />
      Through this control we can upload a form for a new Employee as well as if there is any change in the form for an existing employee &nbsp;you should first select the employee and upload the corresponding forms.
           It will be automaticallly updated in the Website.</td></tr>

     <tr><td align='left' valign='top' bgcolor="#ffffff" class="lblog" style="height: 35px">
         Create Users:
        
     </td>
  <td align='left' valign='top' bgcolor="#ffffff" width='75%' class="lblog" style="height: 35px"> 
  
      Here we can create new users and give permissions to the users</td></tr>

    
     <tr><td align='left' valign='top' bgcolor="#ffffff" class="lblog" style="width: 783px; height: 76px;">
         <br />
         Feedback Administration :</td>
  <td align='left' valign='top' bgcolor="#ffffff" width='75%' class="lblog" style="height: 76px">
      <br />
      Here, the page will display all the feedbacks recieved in the order of the date it got submitted. The administrator can choose the feedbacks and accept it or if it is not good he can reject it. The feedback should be displayed in the website those which are accepted by the administrator.<br />
  </td></tr>

    
        <tr>
            <td align="left" class="lable" valign="top" style="width: 783px">
            </td>
        </tr>
    
    
    
  
    </table>
    
    
    </form>
</body>
</html>
