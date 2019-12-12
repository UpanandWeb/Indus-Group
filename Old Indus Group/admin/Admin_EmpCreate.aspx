<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpCreate.aspx.cs" Inherits="Admin_EmpCreate" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
 <title> : : Indus Group : : - Admin Control Panel - EmpCreate</title>

<link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/calendar.js"></script>


<script>
    
    function moveOnMax(field,nextFieldID){
  if(field.value.length >= field.maxLength){
    document.getElementById(nextFieldID).focus();
    //document.getElementById(nextFieldId1).focus();
  }
}
    
    </script>

<script language="javascript" type="text/javascript">
function skltest(field)
{
if(field.value != "" )
    {
        document.frmRegistration.hdnskl.value=field.value;
	    alert(document.frmRegistration.hdnskl.value)
    }
    else
    {
        
        document.frmRegistration.hdnskl.value="";
      //  alert(document.regForm.hidState.value)
    }
}


function exptest(field)
{
if(field.value != "" )
    {
        document.frmRegistration.hdnexp.value=field.value;
	    alert(document.frmRegistration.hdnexp.value)
    }
    else
    {
        
        document.frmRegistration.hdnexp.value="";
      //  alert(document.regForm.hidState.value)
    }
}



function yrstest(field)
{
if(field.value != "" )
    {
        document.frmRegistration.hdnyrs.value=field.value;
	    alert(document.frmRegistration.hdnyrs.value)
    }
    else
    {
        
        document.frmRegistration.hdnyrs.value="";
      //  alert(document.regForm.hidState.value)
    }
}


</script>

 <script language= "JavaScript" src="addrows.js" type="text/javascript"></script> 
<script language="JavaScript" src="Jscripts/regformvalidation.js" type="text/javascript"></script>
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
    </head>

<body topmargin="0" bottommargin="0" leftmargin="0">
<form id="regForm" name="regForm"  runat="server">
<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>


<tr>
<td  >
</td>

</tr>

<tr>

<td width="80%" valign="top">


  
<table width="99%" cellpadding="0" cellspacing="2" align="left">


<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          UserID & Password</span></td>
    </tr>
    
    <tr height="15">
    
    <td colspan="4">
    <table>
    
 <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * User ID (EmailID)</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="txtemail" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ErrorMessage="*" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
         
     </td>
     
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Conf. Mail ID
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="ctxtmail" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Password
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="txtpwd" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" TextMode="Password" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ErrorMessage="*" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
     </td>
     
    </tr>


</table>
</td>
</tr>





<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Contact Information</span></td>
    </tr>
    
    <tr height="15">
    
    <td colspan="4">
    <table>
    
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * First Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="fname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="fname"></asp:RequiredFieldValidator>
         
     </td>
     
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Middle Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="mname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Last Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="lname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="lname"></asp:RequiredFieldValidator>
     </td>
     
    </tr>
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Gender
     </td>
     <td width="2%">:</td>
<td width="26%" align="left">
    <asp:RadioButtonList ID="gend" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>

</td>



<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * S S No</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="FNssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>


</tr>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Spouse Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="mmname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         
     </td>
     
      <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <input id="Sbdate" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.Sbdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
                                    
                                    </td>
    
    
     
     
      <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * S S No</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="SNssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
     
     
     </tr>
     
     <tr>
      <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:RadioButtonList ID="spgen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
     
     
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Father Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="fatname" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="fatname"></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Mother Name
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="motname" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="motname"></asp:RequiredFieldValidator>
         
     </td>
     
    </tr>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;Child Name - 1
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k1name" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
         
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Child Name - 2
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k2name" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;Child Name - 3
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k3name" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       
     </td>
    </tr>
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-1 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k1gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    
   <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-2 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k2gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;K-3 Gender
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
      <asp:RadioButtonList ID="k3gen" runat="server" RepeatDirection="Horizontal" CssClass="headings2">
    <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
    <asp:ListItem Value="Female">Female</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    </tr>
     <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
             <input id="k1bd" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.k1bd');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
         
          </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     
     <input id="k2bd" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.k2bd');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
    
                                    </td>
 <td width="2%"></td>   
<td width="13%" class="headings2" align="left">
        &nbsp; Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     
    <input id="k3bd" class="data" runat="server" style="width: 146px" readonly="true"/>
    <a href="javascript:show_calendar('regForm.k3bd');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
          </td>
    
    </tr>
    <tr>
     <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp; S S No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k1ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; S S No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k2ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
 <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; S S No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="k3ssn" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
    </tr>
    
    
    
    </table>
    </td>
    </tr>
    
 <%--Present Address--%>
 <tr height="15">
    
    <td colspan="4"></td>
    </tr>
   
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Present Address</span></td>
    </tr>
    
<tr height="15">
    
    <td colspan="4">
    <table>
    
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Country
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="country" runat="server" CssClass="textfield" Width="190px"  
             BorderWidth="1"  AutoPostBack="true" 
             onselectedindexchanged="country_SelectedIndexChanged">
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="country" InitialValue="Select Country" ></asp:RequiredFieldValidator>
        
     </td>
     
    
     <td width="2%"></td>
    <td width="13%" class="headings2" align="left" >
        Street</td>
     
     <td width="2%">:</td>
     <td width="26%" align="left" colspan="5">
     <asp:TextBox ID="street" runat="server" CssClass="textfield" Width="580px" 
             BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="street"></asp:RequiredFieldValidator>
     </td>
   <%-- <td width="2%"></td>
    <td width="13%" class="headings2" align="left" >
        Street2
     </td>
     
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="stret2" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
   </td>--%>
    
<%--<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
    * City
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox3" runat="server" CssClass="textfield" Width="190px" 
             BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="lname"></asp:RequiredFieldValidator>
     </td>
--%>     
    </tr>
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * State      </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select State</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="state" InitialValue="Select State"></asp:RequiredFieldValidator>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * City
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
   <asp:TextBox ID="city" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="city"></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Zip</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="zip" runat="server" CssClass="textfield" Width="199px" 
             BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="zip"></asp:RequiredFieldValidator>  
     </td>
    </tr>
    
    
    
    
     <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Work Ph
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <%--<asp:TextBox ID="wphone" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>     --%>
     <asp:TextBox ID="wp1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'wp2')"></asp:TextBox>   
     <asp:TextBox ID="wp2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'wp3')" ></asp:TextBox>   
     <asp:TextBox ID="wp3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4" ></asp:TextBox>   
     
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" ControlToValidate="wp1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="*" ControlToValidate="wp2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" ControlToValidate="wp3" ></asp:RequiredFieldValidator>
    
     </td>
     
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Home Ph
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left"> 
     <%--<asp:TextBox ID="hphone" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>--%>
     
     <asp:TextBox ID="hp1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'hp2')" ></asp:TextBox>   
     <asp:TextBox ID="hp2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'hp3')" ></asp:TextBox>   
     <asp:TextBox ID="hp3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4"  ></asp:TextBox>   
     
     
     
    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" ControlToValidate="hp1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*" ControlToValidate="hp2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" ControlToValidate="hp3" ></asp:RequiredFieldValidator>
     </td>
     
<td <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Mobile</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
    <%-- <asp:TextBox ID="mobile" runat="server" CssClass="textfield" Width="199px" BorderWidth="1" ></asp:TextBox>--%>
    
     <asp:TextBox ID="mb1" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'mb2')" ></asp:TextBox>   
     <asp:TextBox ID="mb2" runat="server" CssClass="textfield" Width="50px" 
             BorderWidth="1" MaxLength="3" onkeyup="moveOnMax(this,'mb3')" ></asp:TextBox>   
     <asp:TextBox ID="mb3" runat="server" CssClass="textfield" Width="59px" 
             BorderWidth="1" MaxLength="4" ></asp:TextBox>   
     
     <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="mb1" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="*" ControlToValidate="mb2" ></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="*" ControlToValidate="mb3" ></asp:RequiredFieldValidator>
    
     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" ControlToValidate="mobile"></asp:RequiredFieldValidator>  --%>
     
     </td>
    </tr>
    
    
    
    </table>
    </td>
    </tr>
    
<%--Birth Details    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Birth Details</span></td>
    </tr>

    

<tr height="15">
    <td colspan="4">
<table>
<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Birth Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <input id="bdate" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.bdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="bdate" ></asp:RequiredFieldValidator>
         
         
         </td>
    
    <td width="1%" ></td>
    <td width="13%"  align="left" class="headings2">
        * Birth Country </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:Dropdownlist ID="bcountry" runat="server" CssClass="textfield" Width="190px"  
             BorderWidth="1" AutoPostBack="true" 
             onselectedindexchanged="bcountry_SelectedIndexChanged" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="bcountry" InitialValue="Select Country"></asp:RequiredFieldValidator>
    
     </td>
    
<td width="1%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Birth State
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="bstate" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select State">Select State</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="bstate" InitialValue="Select State"></asp:RequiredFieldValidator>  
     </td>
    </tr>
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Birth City
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="bcity" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="bcity" ></asp:RequiredFieldValidator>      
     </td>
    
    <td width="2%" ></td>
    <td width="13%"  align="left" class="headings2">
        * Citizenship </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:Dropdownlist ID="ccountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ccountry" InitialValue="Select Country"></asp:RequiredFieldValidator>
    
     </td>
    
<td width="1%" ></td>
    <td width="14%"  align="left"  class="headings2">
        * Passport No
     </td>
     <td width="2%">:</td>
     <td width="25%" align="left">
       <asp:TextBox ID="passno" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="passno"></asp:RequiredFieldValidator>  
     </td>
    </tr>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Issued at
     </td>
     <td width="2%">:</td>
     <td width="25%" align="left">
     <asp:Dropdownlist ID="pcountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="pcountry" InitialValue="Select Country"></asp:RequiredFieldValidator>      
     </td>
    
    
    <td width="2%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Issed at Place
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" >
       <asp:TextBox ID="pplace" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
             
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="pplace"></asp:RequiredFieldValidator>  
         </td>
    
    <td width="1%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Issue Date </td>
     <td width="2%">:</td>
     <td width="25%" align="left">
     <input id="issdate" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.issdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="issdate" ></asp:RequiredFieldValidator>
         </td>
    

    </tr>
    
    
    
    <tr>
    
    
    <td width="2%" ></td>
    <td width="13%"  align="left"  class="headings2">
        * Expiry Date
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" >
       <input id="expdate" class="data" runat="server" style="width: 146px" readonly="true"/>
             <a href="javascript:show_calendar('regForm.expdate');" onmouseover="window.status='Date Picker';return true;" onmouseout="window.status='';return true;"><img src="images/calender.gif" alt='Choose the Date' border="0" style="width: 17px; height: 13px" /></a>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="expdate"></asp:RequiredFieldValidator>  
         </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Nationality
     </td>
     <td width="1%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="ncountry" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" >
     <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
     </asp:Dropdownlist>
     
         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ControlToValidate="ncountry" InitialValue="Select Country"></asp:RequiredFieldValidator>      
     </td>
    
    <td width="1%" ></td>
    <td width="15%"  align="left"  class="headings2">
        &nbsp;</td>
     <td width="1%"></td>
     <td width="24%" align="left">
     <asp:TextBox ID="cpassport" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" Visible="false" ></asp:TextBox>
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="issdate" ></asp:RequiredFieldValidator>--%>
     </td>
    
<td width="1%" ></td>
    <td class="style20" align="left">
     
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     
     </td>
    </tr>
    
    </table>
    </td>
    </tr>

    
    
    <%--Emergency Details    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Emergency Contact Person Details</span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Cont Person-1
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpname1" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="*" ControlToValidate="cpname1" ></asp:RequiredFieldValidator>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpphone1" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="*" ControlToValidate="cpphone1" ></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Email ID
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpemail1" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="*" ControlToValidate="cpemail1" ></asp:RequiredFieldValidator>  
       
       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
             ErrorMessage="invalid" ControlToValidate="cpemail1" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       
     </td>
    </tr>
    

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Address
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" colspan="9">
     <asp:TextBox ID="cpaddr1" runat="server" CssClass="textfield" Width="530px"  
             BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="*" ControlToValidate="cpaddr1" ></asp:RequiredFieldValidator>  
     </td>
    </tr>

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Cont Person-2</td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpname2" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="*" ControlToValidate="cpname2" ></asp:RequiredFieldValidator>  
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpphone2" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="*" ControlToValidate="cpphone2" ></asp:RequiredFieldValidator>
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; * Email ID
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="cpemail2" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="*" ControlToValidate="cpemail2" ></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
             ErrorMessage="invalid" ControlToValidate="cpemail2" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </td>
    </tr>

<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        * Address
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left" colspan="9">
     <asp:TextBox ID="cpaddr2" runat="server" CssClass="textfield" Width="529px"  
             BorderWidth="1" ></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="*" ControlToValidate="cpaddr2" ></asp:RequiredFieldValidator>      
     </td>
    </tr>
   </table>
    </td>
    </tr>

<%--Professional Experience    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" >
          Professional Experience Details</td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="1%"></td>
    <td width="13%" class="headings2" align="left">
        * Total Exp.Yrs &amp; Months
     </td>
     <td width="3%">:  </td>
     <td width="3%">:</td>
     <td align="left" width="20%" class="heading2">
     <asp:TextBox ID="expyrs" runat="server" CssClass="textfield" Width="50px"  
             BorderWidth="1" ></asp:TextBox>
     <asp:TextBox ID="expmon" runat="server" CssClass="textfield" Width="50px"  
             BorderWidth="1" ></asp:TextBox>
             
         Number only
          <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="*" ControlToValidate="expyrs" ></asp:RequiredFieldValidator>
         </td>
    
    <td width="2%"></td>
    <td width="15%" class="headings2" align="left">
        &nbsp;Functional Area
     </td>
     <td width="2%">:</td>
     <td width="24%" align="left">
     <asp:TextBox ID="fnarea" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Current Industry
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="currind" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       
     </td>
    </tr> 
    
    </table>
    
</td>
</tr>



<%--Skills    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Skills</span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 1
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills1" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk1yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk1exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 2
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills2" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk2yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk2exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 3
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills3" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk3yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk3exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
   
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 4
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills4" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk4yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk4exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 5
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills5" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk5yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk5exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
    <tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        Skills - 6
     </td>
     <td width="2%">:</td>
     <td align="left" class="style19">
     <asp:TextBox ID="skills6" runat="server" CssClass="textfield" Width="59px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp;No. Years
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="sk6yrs" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
        &nbsp; Expert Level
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:Dropdownlist ID="sk6exp" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" >
     <asp:ListItem>Novice</asp:ListItem>
     <asp:ListItem>Advance</asp:ListItem>
     <asp:ListItem>Expert</asp:ListItem>
     </asp:Dropdownlist>      
     </td>
    </tr> 
  
    </table>
    
</td>
</tr>




<%--Education    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Education Details</span></td>
    </tr>
<tr height="15">
    <td colspan="4">
    <table>
   
    <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        PG
     </td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu1" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed1brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed1sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed1yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed1per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr> 
    

 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Graduation
     </td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu2" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed2brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed2sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed2yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed2per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr> 
      

 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        UG</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu3" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed3brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed3sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed3yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed3per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>     
    
   
   
   
    
    
  
 <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        SSC</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu4" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed4brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed4sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed4yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed4per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>     
    
   
   
   
   <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Other</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu5" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed5brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed5sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed5yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed5per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>  
    
     <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Other1</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu6" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed6brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed6sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed6yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed6per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>   
    
    <tr>
    <td width="1%"></td>
    <td align="left" width="5%" class="headings2">
        Othe2</td>
     <td width="1%">:</td>
     <td align="left"  width="9%">
     <asp:TextBox ID="edu7" runat="server" CssClass="textfield" Width="112px"  
             BorderWidth="1" ></asp:TextBox>
     </td>
    
    <td width="1%"></td>
    <td  align="left" class="headings2" width="8%">
        Boadr/University
     </td>
     <td width="1%">:</td>
     <td align="left" width="12%">
     <asp:TextBox ID="ed7brd" runat="server" CssClass="textfield" Width="137px" 
             BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="1%"></td>
    <td width="4%" class="headings2" align="left">
        Major in
     </td>
     <td width="1%">:</td>
     <td width="10%" align="left">
     <asp:TextBox ID="ed7sub" runat="server" CssClass="textfield" Width="120px" BorderWidth="1" ></asp:TextBox>
     </td>
     
<td width="1%"></td>
    <td width="7%" class="headings2" align="left">
        Year of Pass
     </td>
     <td width="1%">:</td>
     <td width="8%" align="left">
     <asp:TextBox ID="ed7yr" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>

<td width="1%"></td>
    <td width="3%" class="headings2" align="left">
        (%)
     </td>
     <td width="1%">:</td>
     <td width="7%" align="left">
     <asp:TextBox ID="ed7per" runat="server" CssClass="textfield" Width="60px" BorderWidth="1" ></asp:TextBox>
     </td>
    </tr>  
    
    
    
      
       
   
    </table>
    
</td>
</tr>



<%--Upload Resume    --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Upload Resumepan&gt;</td>
    </tr>
<tr height="15">
    <td colspan="4" width="100%" align="left">
    <table>
    <tr>
    <td width="1%">
    
    </td>
    
    <td width="8%" class="headings2">
        Resume Title
    </td>
    <td width="1%">:</td>
    <td width="20%" align="left">
     <asp:TextBox ID="restitle" runat="server" CssClass="textfield" Width="160px" BorderWidth="1" ></asp:TextBox>
    </td>
    
    <td width="2%"></td>
    <td width="8%" class="headings2">
        Upload Resume
    </td>
    <td width="20%" align="left">
    <asp:FileUpload ID="rfile" runat="server" />
    </td>
    <td width="2%"></td>
    <td width="8%" class="headings2"></td>
    
    </tr>
    
</table>
</td>
</tr>

<tr height="15">
    
    <td class="headings2">Resume in Text:
        <br />
        (Cut &amp; Paste Your Resume Here) </td>
    <td colspan="3" align="left">
        <asp:TextBox ID="txtres" runat="server" TextMode="MultiLine" Height="188px" 
            Width="725px"></asp:TextBox>  </td>
    </tr>



<%--Mail Alert   --%>
<tr height="15">
    
    <td colspan="4"></td>
    </tr>
    
<tr height="15" class="headings2">
      <td colspan="4" align="left" valign="top" bgcolor="#336699" style="height: 15px" ><span class="headings3">
          Mail &amp; Privacy Settings</span></td>
    </tr>
<tr height="15">
    <td colspan="4" width="100%" align="left">
<table>

<%--<tr>
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     Cont. Person-2
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox17" runat="server" CssClass="textfield" Width="190px"  BorderWidth="1" ></asp:TextBox>
         
     </td>
    
    <td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     &nbsp;
     Phone No
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox18" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
    
     </td>
    
<td width="2%"></td>
    <td width="13%" class="headings2" align="left">
     &nbsp;
     Email ID
     </td>
     <td width="2%">:</td>
     <td width="26%" align="left">
     <asp:TextBox ID="TextBox19" runat="server" CssClass="textfield" Width="190px" BorderWidth="1" ></asp:TextBox>
       
     </td>
    </tr>
--%>

 <tr height="39">
      <td width="950" align="left" valign="top" class="lable4" style="height: 30px">
          <table class="headings2" border="0" width="950">
          <tr>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox1" type="checkbox" name=" chkjobalerts" value="RS" checked="checked" />Job 
                Alerts and InduGroup products.</td>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox2" type="checkbox" name="mailers[]" value="RS" checked="checked" />Training 
                Programs.</td>
            <td width="33%" class="headings2">
                &nbsp;<input id="Checkbox3" type="checkbox" name="mailers[]" value="RS" checked="checked" />News 
                Letters</td>
          </tr>
   
</table></td>
</tr>
</table>
</td>
</tr>


<tr height="15">
    <td colspan="4" align="center" class="headings2">
    </td>
</tr>
 
   

    



<tr height="15">
    <td colspan="4" align="center" class="headings2">
    </td>
</tr>

    <tr>
    <td colspan="4" align="center" class="headings2">
    <asp:Button ID="btn_submit" runat="server" Text="Submit" Width="101px"  
            OnClick ="btn_submit_Click" />
    </td>
    </tr>
    
    <tr height="15">
    <td colspan="4">
    <asp:Label ID="lblmail" runat="server" Text=""></asp:Label>
    </td>
    </tr>
    
</table>
  
  
  
  
  
  
  
  
  
  
  

</td>
</tr>

</table>    
 </td>
 </tr>   
 
 <tr>
 <td align="center">
 
 </td>
 </tr>
 </table>
    
</form>
</body>
</html>


