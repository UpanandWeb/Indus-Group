<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Enroll.aspx.cs" Inherits="Admin_Enroll" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Enroll</title>
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
alert("Enrollment has been saved Successfully");
}

/*---------------------------Phone Number Validation---------------*/

var digits = "0123456789";

var phoneNumberDelimiters = "()- ";

var validWorldPhoneChars = phoneNumberDelimiters + "+";

var minDigitsInIPhoneNumber = 10;

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
       
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
  
    return true;
}

function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
 
    for (i = 0; i < s.length; i++)
    {   
       
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}

function validatePhone(field)
{
	var Phone=field.value;
	
	if(Phone!="")
	{
	if (checkInternationalPhone(Phone)==false)
	{
		alert("Please Enter a Valid Phone Number")
		field.value=""
		field.focus()
		return false
	}
	}
	return true
 }

/*-------------End Of Phone Number Validation------------------------*/


   function chknum(field)
{
if (isNaN(field.value)) {
            alert("Only Numeric Values are allowed")
           field.select();
        return false }
        }
             
function echeck() {
        
        var str=document.getElementById("email").value;
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
		      document.getElementById("email").select();
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("email").select();
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		   document.getElementById("email").select();
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
	   document.getElementById("email").select();
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		   document.getElementById("email").select();
		    return false
		 }

 		 return true	
 		 }				
	}




    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
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
    <td colspan='2' align="center" valign="bottom" style="height: 30px">
          <br /><br />
      <font size='4pt' color="#660000"><b>Enrollment Form</b></font></td>
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
          First Name *</td>
      <td style="width: 451px; height: 20px;">
          
          <asp:TextBox ID="fname" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Last Name * </td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="lname" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lname"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Address *</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="address" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="address"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator>
          &nbsp;</td>
    </tr>
    <tr>
      <td style="width: 201px; height: 11px" class="lable" align="left" valign="bottom">City * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 451px; height: 11px;">
          <asp:TextBox ID="city" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="city"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 33px;" class="lable" align="left" valign="bottom">State * &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
       <td style="width: 451px; height: 33px;">
          <asp:TextBox ID="state" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="state"
               ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
      
          
    </tr>
    <tr>
      <td style="width: 201px" class="lable" align="left" valign="bottom">Country * &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 451px">
          <asp:TextBox ID="country" runat="server" CssClass="lable" Width="164px"></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 19px" class="lable" align="left" valign="bottom">Zip *</td>
      <td style="width: 451px; height: 19px;">
          <asp:TextBox ID="zip" runat="server" CssClass="lable" Width="164px" onblur='javascript:chknum(this);'></asp:TextBox> 
          <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="zip" ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px" class="lable" align="left" valign="bottom">Work </td>
      <td style="width: 451px">
          <asp:TextBox ID="work" runat="server" CssClass="lable" Width="164px" onblur='javascript:validatePhone(this);'></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px" class="lable" align="left" valign="bottom">Home </td>
      <td style="width: 451px">
          <asp:TextBox ID="home" runat="server" CssClass="lable" Width="164px" onblur='javascript:validatePhone(this);'></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px" class="lable" align="left" valign="bottom">Mobile * &nbsp;&nbsp; &nbsp;
      </td>
      <td style="width: 451px">
          <asp:TextBox ID="mobile" runat="server" CssClass="lable" Width="164px" onblur='javascript:validatePhone(this);'></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="mobile"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Fax #</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="fax" runat="server" CssClass="lable" Width="164px" onblur='javascript:validatePhone(this);'></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px" class="lable" align="left" valign="bottom">E-Mail * &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 451px">
          <asp:TextBox ID="email" runat="server" CssClass="lable" Width="164px" onblur='javascript:echeck();'></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="email"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="height: 20px; width: 201px;" class="lable" align="left" valign="bottom">Education Qualification *</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="education" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="education"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Currently Working On</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="workingon" runat="server" CssClass="lable" Width="164px"></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Course Enrolling for *</td>
       <td style="width: 451px; height: 20px;">
       <asp:DropDownList ID="course" runat="server" AppendDataBoundItems="True" AutoPostBack="true" CssClass="lable" Width="173px" OnSelectedIndexChanged="course_SelectedIndexChanged">
                    
                     <asp:ListItem Selected="true">Choose a Course</asp:ListItem>
                    <asp:ListItem Value="DWH/BO/COGNOS/Crystal Reports">DWH/BO/COGNOS/Crystal Reports</asp:ListItem>
                    <asp:ListItem Value="INFORMATICA">INFORMATICA</asp:ListItem>
                    <asp:ListItem Value="BUSINESS ANALYST">BUSINESS ANALYST</asp:ListItem>
                    <asp:ListItem Value="QA Manual and Automated Testing">QA Manual and Automated Testing</asp:ListItem>
                    <asp:ListItem Value="ORACLE DBA">ORACLE DBA</asp:ListItem>
                    <asp:ListItem Value="ORACLE APPS">ORACLE APPS</asp:ListItem>
                    <asp:ListItem Value="ORACLE 10g RAC / DATA GUARD">ORACLE 10g RAC / DATA GUARD</asp:ListItem>
                    <asp:ListItem Value="SAP - FICO">SAP - FICO</asp:ListItem>
                    <asp:ListItem Value=".NET / C# / ASP.NET / VB.NET">.NET / C# / ASP.NET / VB.NET</asp:ListItem>
                    <asp:ListItem Value="SAP - HR">SAP - HR</asp:ListItem>
                    <asp:ListItem Value="SAP - CRM">SAP - CRM</asp:ListItem>
                    <asp:ListItem Value="People Soft - Technical and Functional">People Soft - Technical and Functional</asp:ListItem>
                    <asp:ListItem Value="Web Development">Web Development</asp:ListItem>
                    <asp:ListItem Value="JAVA / J2EE Training">JAVA / J2EE Training</asp:ListItem>
                    <asp:ListItem Value="UNIX ADMIN">UNIX ADMIN</asp:ListItem>
                    <asp:ListItem Value="PMP Certification">PMP Certification</asp:ListItem>
                    <asp:ListItem Value="DB2 - UDB 9">DB2 - UDB 9</asp:ListItem>
                    <asp:ListItem Value="SAP BW">SAP BW</asp:ListItem>
                    <asp:ListItem Value="SAP MM">SAP MM</asp:ListItem>
                    <asp:ListItem Value="Hyperion Essbase">Hyperion Essbase</asp:ListItem>
                    <asp:ListItem Value="SAP SD">SAP SD</asp:ListItem>
                    </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="course"
               ErrorMessage="*" Font-Bold="True" Font-Size="Large" Width="7px" InitialValue="Choose a Course"></asp:RequiredFieldValidator></td>
                        
    
    </tr>
     <tr>
      <td style="width: 201px; height: 20px" class="lable" align="left" valign="bottom">Admission No.</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="admno" runat="server" CssClass="lable" Width="164px"></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" valign="bottom" class="lable" align="left">
          Upload resume </td>
      <td style="width: 451px; height: 20px;">
          <asp:FileUpload ID="resume" runat="server" CssClass="lable" Width="213px" />
          </td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" valign="bottom" class="lable" align="left">
          Course Starting From 
      </td>
      <td style="width: 451px; height: 20px;">
         
           <input type="text" id="c_startfrom" readonly="readonly" value="" runat="server" style="width: 172px; height: 20px" class="lable" />
      
         <a href="javascript:show_calendar('form1.c_startfrom');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;">
          <img src="calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a> 
          
          &nbsp;&nbsp;
      </td>
    </tr>
    <tr>
      <td style="height: 20px; width: 201px;" class="lable" valign="bottom">
          How do you hear about us *</td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="hear" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="hear"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td style="width: 201px; height: 20px" class="lable" valign="bottom">If Referred Name </td>
      <td style="width: 451px; height: 20px;">
          <asp:TextBox ID="referral" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
         </td>
    </tr>
    <tr>
      <td style="width: 201px" class="lable" valign="bottom">Current Immigration Status *</td>
      <td style="width: 451px">
          <asp:TextBox ID="imm_status" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="imm_status"
              ErrorMessage="*" Font-Bold="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td valign="top" style="width: 201px" class="lable">Additional Information if any </td>
      <td style="width: 451px">
          <asp:TextBox ID="add_infm" runat="server" CssClass="lable" Height="69px" TextMode="MultiLine"
              Width="200px"></asp:TextBox></td>
    </tr>
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div align="center">
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