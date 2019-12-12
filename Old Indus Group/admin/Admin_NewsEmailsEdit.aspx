<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_NewsEmailsEdit.aspx.cs" Inherits="Admin_NewsEmailsEdit" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - NewEmailsEdit</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertsubmit()
{
alert("Course Schedule has been saved Successfully");
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
	   // alert(document.regForm.hidState.value)
    }
    else
    {
        
        document.regForm.hidState.value=document.regForm.txtloc.value;
       // alert(document.regForm.hidState.value)
    }
}


function echeck() {
        
        var str=document.getElementById("emailid").value;
        if(str!="")
        {
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   document.getElementById("email").select();
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		      document.getElementById("emailid").select();
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("emailid").select();
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		   document.getElementById("emailid").select();
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
	   document.getElementById("emailid").select();
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		   document.getElementById("emailid").select();
		    return false
		 }

 		 return true	
 		 }				
	}

function chknewsmail()
{

 var email = document.getElementById("emailid").value;
        //alert(email)
        if(email!="")
        {
  		    url = "newssub.aspx?email=" + email +" ";
		    //msgWindow. = window.open(url);
		    location.href(url);
		}
		else
		{
		    alert("Enter Email");
		}

}




    </script>
    
<script language="JavaScript1.2" src="statesopt.js" type="text/javascript"></script>
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
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
    <td colspan='2' align="left" valign="bottom" style="height: 30px">
          <br /><br />
      <font size='4pt' color="#660000"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Subscribe for Newsletter</b></font></td>
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
      <td style="width: 201px; height: 33px;" class="lable" align="left" valign="bottom">
          Email ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
       <td style="width: 451px; height: 33px;">
          <asp:TextBox ID="emailid" runat="server" CssClass="lable" Width="172px" onblur='javascript:echeck();'></asp:TextBox>
          
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailid"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="2px"></asp:RequiredFieldValidator></td>
      
          
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