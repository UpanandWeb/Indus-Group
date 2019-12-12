<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_UserEdit.aspx.cs" Inherits="Admin_UserEdit" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - userEdit</title>
    
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

    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertsubmit()
{
alert("User has been saved Successfully");
}

function chkcrs(field)
{
	var OthCrs=field.value;
	
	if(OthCrs == "" && document.getElementById("course").value == "New")
	{
	    alert("Please Enter a New Course Name")
		field.focus()
		return false
	}
	return true

}
function statechange()
{
   if(document.regForm.txtloc.selectedIndex=="0")
    {
        document.regForm.hidState.value="";
    }
    else
    {
        document.regForm.hidState.value=document.regForm.txtloc.value;
    }
}

    </script>
    
<script language="JavaScript1.2" src="statesopt.js" type="text/javascript"></script>
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
    <form id="regForm" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    
    <tr>
     <td align="center" valign="top" width="100%" class="lable">
    
    <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
    <td colspan='2' align="left" valign="bottom" style="height: 23px">
      <font size='4pt' color="#660000"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Edit User Details</b></font></td>
          </tr>
          <tr>
    
      <td colspan='2' style="width: 201px; height: 20px" class="lable" align="center" valign="middle">
              
                 
                   
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <asp:Label ID="lblerror" runat="server" Height="10px" Width="246px" Font-Bold="True" Font-Size="Small" ForeColor="#C00000"></asp:Label><br />
          </td>
          </tr>
            <tr>
       
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">
          User Name *</td>
       <td style="width: 451px; height: 20px;">
      
           <asp:TextBox ID="username" runat="server" CssClass="lable" Width="172px" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="username"
               ErrorMessage="Enter User Name" Font-Bold="True" Font-Size="XX-Small" Width="105px"></asp:RequiredFieldValidator></td>
                        
    
    </tr>
          <tr>
       
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">
          User ID *</td>
       <td style="width: 451px; height: 20px;">
      <asp:TextBox ID="userid" runat="server" CssClass="lable" Width="172px" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="userid"
               ErrorMessage="Enter User ID" Font-Bold="True" Font-Size="XX-Small" Width="105px"></asp:RequiredFieldValidator>
           </td>
                        
    
    </tr>
    <tr>
      <td style="width: 201px; height: 33px;" class="lable" align="left" valign="bottom">
          Password *
      </td>
       <td style="width: 451px; height: 33px;">
        <asp:TextBox ID="passwd" runat="server" CssClass="lable" Width="172px" TextMode="Password" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="passwd"
               ErrorMessage="Enter Password" Font-Bold="True" Font-Size="XX-Small" Width="105px"></asp:RequiredFieldValidator>  
          
          </td>
      
          
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">
          Conf. Password *</td>
      <td style="width: 451px; height: 20px;">

<asp:TextBox ID="cpasswd" runat="server" CssClass="lable" Width="172px" TextMode="Password"></asp:TextBox>
<asp:CompareValidator ID="cvalidator" runat="server" ControlToCompare="passwd" ControlToValidate="cpasswd" ErrorMessage="enter correct password" Font-Size="XX-Small"></asp:CompareValidator>
           

         </td>
    </tr>
             <tr>
           <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">
               Permissions *</td>
      <td style="width: 451px; height: 20px;" class="lable">
          &nbsp;<asp:CheckBox ID="cadd" Text="AddNew" runat="server" />
          <asp:CheckBox ID="cedit" Text="Edit" runat="server" />
          <asp:CheckBox ID="cdelete" Text="Delete" runat="server" />
          
      </td>
    </tr>
   
  
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div align="left">
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;<asp:Button ID="btnsubmit" runat="server" CssClass="labled" Height="22px"
                  Text="Submit" Width="49px" OnClick="btnsubmit_Click" />
              &nbsp;
              <asp:Button ID="reset" runat="server" CssClass="labled" Height="22px" Text="Cancel" /></div></td>
    </tr>
  </table>
    
    </td>
    </tr>
    
    
    
  
    </table>
    
    
    </form>
</body>
</html>