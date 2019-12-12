<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpView.aspx.cs" Inherits="Admin_EmpView" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
 <title> : : Indus Group : : - Admin Control Panel - EmpView</title>
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
<link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
<link href="Styles/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    
  function moveOnMax(field,nextFieldID){
  if(field.value.length >= field.maxLength){
    document.getElementById(nextFieldID).focus();
  }
}
    
    </script>
 <style type="text/css">
        .style24
        {
            height: 20px;
        }
        .style25
     {
         height: 26px;
     }
        .style26
     {
         height: 46px;
     }
     .style27
     {
         width: 30px;
         height: 46px;
     }
        </style>   

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

 <%--<script language= "JavaScript" src="addrows.js" type="text/javascript"></script> 
<script language="JavaScript" src="Jscripts/regformvalidation.js" type="text/javascript"></script>
--%>
    </head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" rightmargin="0" style="background-color:white">
<form id="frmRegistration" name="frmRegistration"  runat="server">
<center>
<table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr>
                                <td>
                                    <br /><hr />
                                </td>
                            </tr>

                             <tr>
                                <td align="right">
                                   <asp:LinkButton ID="lnkback" runat="server" Text="Back" OnClick="lnkback_Click" Font-Size="17px"></asp:LinkButton>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
    <tr>
        <td width="80%" valign="top">
            <table width="100%">
                <tr height="19">
                    <td width="100%" align="center" class="headings4" height="15" colspan="2">&nbsp;Employee Details</td>
                </tr>
                <tr height="190">
                    <td  align="center" class="border"  valign="top" width="90%"  style="height: 190px;">
                        <table border="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="imgdisplay" runat="server" 
                                        ImageUrl='<%#Eval("Logpath","../Emp_photos\\{0}") %>'  Width="250px" Height="250px"  />
                                </td>
                            </tr>
                           <%-- <tr><td style="height:15px"></td></tr>--%>
                           
                            <tr>
                                <td align="left" class="border"  valign="top" width="80%"  style="height: 190px;">
                                    <table class="employee" border="0" cellpadding="6" cellspacing="10">
                                    <tr>
                                    <td class="headings01" colspan="3"> Login Details </td>
                                    </tr>
                                        <tr>
                                            <td style="height: 21px;" align="right">Email ID</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 183px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="txtemail" runat="server" 
                                                    BorderStyle="None"></asp:Label>       
                                            </td>
                                            <td style="height: 21px;" align="right">Alternate Email</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="conemail" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td style="height: 21px;" align="right">Emp ID</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="txtempid" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td style="height: 21px;" align="right">Password</td><td>&nbsp;:</td>
                                        <td align="left"> <asp:Label CssClass="employee1" ID="lblpwd" runat="server" BorderStyle="None"></asp:Label></td></td>
                                        </tr>
                                        <tr>
                                        <td class="headings01" colspan="3">Employee Information</td>
                                        </tr>
                                        <tr>
                                            <td align="right">First Name</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="fname" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td align="right">Middle Name&nbsp;</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="mname" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td align="right">Last Name</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="lname" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Gender</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="gend" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                            <td align="right">Mobile</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="mb1" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="mb2" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="mb3" runat="server" MaxLength="4"></asp:Label>
                                             </td>
                                             <td align="right">
                                                 Marital Status
                                             </td>
                                             <td>&nbsp;:</td>
                                             <td align="left"><asp:Label CssClass="employee1" ID="lblmaritalstatus" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                           
                                        </tr>
                                        <tr>
                                         <td align="right">SS No</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="fssn" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        
                                           <tr>
                                       <td class="headings01" colspan="3">Birth Details</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="bdate" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Birth Country</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="bcountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Birth State</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="bstate" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                         <tr>
                                            <td align="right">
                                                Birth City</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="bcity" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Citizenship</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="ccountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Passport No</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="passno" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                          <tr>
                                            <td align="right">
                                                Issued at</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="pcountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Issued Date</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="issdate" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Expiry Date</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="expdate" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>
                                        <tr>
                                        <td align="right">Nationality</td>
                                        <td>&nbsp;:&nbsp;</td>
                                        <td align="left">
                                                <asp:Label CssClass="employee1" ID="ncountry" runat="server" 
                                                    BorderStyle="None" Height="18px"></asp:Label></td>
                                        <td>&nbsp;</td><td>&nbsp;&nbsp;</td><td>
                                                    &nbsp;</td>
                                        </tr>
                                        <tr>
                                       <td class="headings01" colspan="3">Family Information</td>
                                        </tr>
                                        <tr>
                                        <td align="right">Father Name</td>
                                        <td>&nbsp;:</td>
                                        <td align="left">
                                            <asp:Label ID="fatname" runat="server" BorderStyle="None" CssClass="employee1"></asp:Label>
                                            </td>
                                            <td align="right">
                                            
                                                Mother Name</td>
                                           <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="motname" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>
                                        
                                        <tr id="kid1" runat="server">
                                    
                                            <td align="right">
                                                Spouse Name</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="mmname" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                            <td align="right">Spouse Gender</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                             <asp:Label CssClass="employee1" ID="spgen" runat="server" BorderStyle="None"></asp:Label>
                                                    </td>
                                            <td align="right">Spouse Birth Date</td>
                                            <td>&nbsp;:&nbsp;</td>
                                            <td align="left">
                                            <asp:Label CssClass="employee1" ID="sbd" runat="server" BorderStyle="None"></asp:Label>
                                    
                                                    </td>
                                            </tr>
                                    
                                          <tr id="kid2" runat="server">
                                    
                                            <td align="right">
                                                Chid Name-1</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="k1name" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td align="right">
                                                Child Name-2</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="k2name" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td align="right">
                                                Child Name-3</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="k3name" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                      
                                        <tr id="kid3" runat="server">
                                    
                                            <td align="right">
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td align="left">
                                                  <asp:Label CssClass="employee1" ID="k1gen" runat="server" BorderStyle="None"></asp:Label>

                                            </td>
                                    
                                            <td align="right">
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td align="left">
                                                  <asp:Label CssClass="employee1" ID="k2gen" runat="server" BorderStyle="None"></asp:Label>

                                              </td>
                                      
                                            <td align="right">
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td style="width: 201px" align="left">
                                                 <asp:Label CssClass="employee1" ID="k3gen" runat="server" BorderStyle="None"></asp:Label>

                                              </td>
                                        </tr>
                                         <tr id="kid4" runat="server">
                                    
                                            <td align="right">
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                            <asp:Label CssClass="employee1" ID="k1bd" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td align="right">
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td align="left"> 
                                            <asp:Label CssClass="employee1" ID="k2bd" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td align="right">
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                                 <td style="width: 201px" align="left">
                                                  <asp:Label CssClass="employee1" ID="k3bd" runat="server" BorderStyle="None" ></asp:Label>
                                            </td>
                                        </tr>
                                     
                                        <tr>
                                        <td class="headings01" colspan="3">Present Address</td>
                                        </tr>
                                      
                                       <%-- <tr>
                                    
                                            <td>
                                            Gender</td>
                                            <td style="width: 8px">
                                            &nbsp;:
                                            </td>
                                             <td>
                                                 &nbsp;</td>
                                     
                                            <td>
                                                Father Name</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                </td>
                                    
                                            <td>
                                                Mother Name</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px">
                                                &nbsp;</td>
                                        </tr>--%>
                                       <%-- <tr>
                                    
                                            <td>
                                                Chid Name1</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="k1name" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td>
                                                Child Name2</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="k2name" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td>
                                                Child Name3</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px">
                                                <asp:Label CssClass="employee1" ID="k3name" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>--%>
                                      
                                       
                                      <%--  <tr>
                                
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                            <asp:Label CssClass="employee1" ID="k1ssn" runat="server" BorderStyle="None" ></asp:Label>
                                            </td>
                                    
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                                 <td>
                                                 <asp:Label CssClass="employee1" ID="k2ssn" runat="server" BorderStyle="None" 
                                                         Width="42px" ></asp:Label>
                                                 </td>
                                          
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                                 <td style="width: 201px">
                                                 <asp:Label CssClass="employee1" ID="k3ssn" runat="server" BorderStyle="None" ></asp:Label>
                                                 </td>
                                        </tr>--%>
                                
                                        <tr>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Country</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="country" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                    
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;" colspan="4" align="left">
                                                <asp:Label CssClass="employee1" ID="street" runat="server"
                                                    Width="444px" BorderStyle="None"></asp:Label></td>
                                            <%--
                                            </td>
                                            <td style="width: 110px; height: 21px;">
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;">
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                State
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="state" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                City</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="city" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Zip</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="zip" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                      <%--  <tr>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Ph:Work</td>
                                            <td style="width: 8px; height: 21px;">
                                                &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="wp1" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="wp2" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="wp3" runat="server" MaxLength="4"></asp:Label></td>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Ph:Home</td>
                                            <td style="width: 8px; height: 21px;"> &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="hp1" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp2" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp3" runat="server" MaxLength="4"></asp:Label></td>
                                    
                                            <td style="width: 110px; height: 21px;">
                                                &nbsp;</td>
                                            <td style="width: 8px; height: 21px;">
                                                &nbsp;&nbsp;</td>
                                            
                                        </tr>
                                        --%>
                                       
                                      
                                        <tr>
                                           <td class="headings01" colspan="3">Permanent Address</td>
                                           
                                          
                                        </tr>
                                        <%-- <tr>
                                
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                            <asp:Label CssClass="employee1" ID="Label3" runat="server" BorderStyle="None" ></asp:Label>
                                            </td>
                                    
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                                 <td>
                                                 <asp:Label CssClass="employee1" ID="Label4" runat="server" BorderStyle="None" 
                                                         Width="42px" ></asp:Label>
                                                 </td>
                                          
                                            <td>
                                                SS No</td>
                                            <td>&nbsp;:</td>
                                                 <td style="width: 201px">
                                                 <asp:Label CssClass="employee1" ID="Label5" runat="server" BorderStyle="None" ></asp:Label>
                                                 </td>
                                        </tr>
                                --%>
                                        <tr>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Country</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="birthcountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                    
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;" colspan="4">
                                                <asp:Label CssClass="employee1" ID="birthaddress" runat="server"
                                                    Width="444px" BorderStyle="None"></asp:Label></td>
                                            <%--
                                            </td>
                                            <td style="width: 110px; height: 21px;">
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;">
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                State
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="prstate" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                City</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="prcity" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td align="right">
                                                Zip</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="przip" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Ph:Work</td>
                                            <td style="width: 8px; height: 21px;">
                                                &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="prph1" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="prph2" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="prph3" runat="server" MaxLength="4"></asp:Label></td>
                                            <td style="width: 110px; height: 21px;" align="right">
                                                Ph:Home</td>
                                            <td style="width: 8px; height: 21px;"> &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;" align="left">
                                                <asp:Label CssClass="employee1" ID="hp11" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp21" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp31" runat="server" MaxLength="4"></asp:Label></td>
                                    
                                            <td style="width: 110px; height: 21px;">
                                                &nbsp;</td>
                                            <td style="width: 8px; height: 21px;">
                                                &nbsp;&nbsp;</td>
                                            
                                        </tr>
                                        <tr>
                                        <td class="headings01" colspan="6">Emergency Contact Person Details</td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="right">
                                                Cont.Person-1</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="cpname1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td align="right">
                                                Phone Number<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="cpphone1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td align="right">
                                                Email ID<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="cpemail1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px" colspan="5" align="left">
                                                <asp:Label CssClass="employee1" ID="cpaddr1" runat="server" Width="450px" 
                                                    BorderStyle="None"></asp:Label></td>
                                           <%-- <td style="width: 6px"></td>
                                            <td>
                                            </td>
                                            <td style="width: 8px">
                                            </td>
                                            <td>
                                            </td>--%>
                                            <td style="width: 6px"></td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Cont.Person-2</td>
                                            <td style="width: 8px">
                                            </td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="cpname2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td align="right">
                                                Phone Number<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="cpphone2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td align="right">
                                                Email ID<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="cpemail2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 293px" colspan="5" align="left">
                                                <asp:Label CssClass="employee1" ID="cpaddr2" runat="server" Width="449px" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <%--<td style="width: 6px"></td>
                                            <td>
                                            </td>
                                            <td style="width: 8px">
                                            </td>
                                            <td>
                                            </td>--%>
                                            <td style="width: 6px"></td>
                                            <td>
                                            </td>
                                        </tr>
                                       <tr>
                                          <td class="headings01" colspan="3">Professional Experience Details</td>
                                          </tr>
                                          <tr id="yearsmonths" runat="server">
                                          <td align="right">Exp.Yrs &amp; Months </td>
                                          <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="expyrs1" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon1" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                                <td align="right">Designation</td>
                                            <td>&nbsp;:&nbsp;</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="fnarea1" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td align="right">Current Company</td>
                                            <td></td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="currind1" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                                    </td>
                                          </tr>
                                        <tr id="yearsmonths1" runat="server">
                                            <td align="right">Exp Yrs &amp; Months</td>
                                            
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="expyrs" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                            <td align="right">
                                                Designation</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="fnarea" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td align="right">
                                                Previous Company</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="currind" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        
                                         <tr id="Tr2" runat="server">
                                            <td align="right">Exp Yrs &amp; Months</td>
                                            
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="expyrs2" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon2" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                            <td align="right">
                                                Designation</td>
                                            <td>&nbsp;:</td>
                                            <td align="left">
                                                <asp:Label CssClass="employee1" ID="lbldes2" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td align="right">
                                                Previous Company</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px" align="left">
                                                <asp:Label CssClass="employee1" ID="lblcompany2" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        
                                        
                                        <tr><td colspan="9" class="headings01"> Skills </td></tr>
                                        <tr>
                                            <td colspan="9">
                                                <table width="100%" class="employee" cellpadding="6" cellspacing="10">
                                                    <tr id="trskills1" runat="server">
                                                        <td align="right">Skills-1</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left"><asp:Label CssClass="employee1" ID="skills1" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk1yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            <td align="right">No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk1m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk1exp" runat="server"  Width="156px" CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills2" runat="server">
                                                        <td align="right">
                                                            Skills-2</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="skills2" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk2yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            
                                                            <td align="right">No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk2m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk2exp" runat="server" Width="156px" 
                                                                CssClass="employee1" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills3" runat="server">
                                                        <td align="right">
                                                            Skills-3</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="skills3" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk3yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            <td align="right">No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk3m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk3exp" runat="server" Width="156px" CssClass="employee1">
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills4" runat="server">
                                                        <td align="right">
                                                            Skills-4</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="skills4" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk4yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                             
                                                            <td align="right">No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk4m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk4exp" runat="server"  Width="156px" 
                                                                CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills5" runat="server">
                                                        <td align="right">
                                                            Skills-5</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="skills5" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            No of Years</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk5yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                          
                                                            <td align="right">No of Months</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk5m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk5exp" runat="server"  Width="156px" 
                                                                CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills6" runat="server">
                                                        <td align="right">
                                                            Skills-6</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="skills6" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="sk6yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px" align="left">
                                                            <asp:Label CssClass="employee1" ID="sk6m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td align="right">
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label ID="sk6exp" runat="server"  Width="156px" 
                                                                CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" align="left" class="headings">
                                                            <asp:Label ID="lblskills" Visible="false" runat="server"></asp:Label>
                                                        </td>
                                                        <td colspan="5">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr> 
                                        <tr>  
                                            <td colspan="9">
                                                <table class="employee" border="0" cellpadding="6" cellspacing="8" width="80%">
                                                    <tr><td colspan="20" class="headings01"> Education Details </td></tr>
                                                    <tr id="tredu1" runat="server">
                                                        <td></td>
                                                        <td align="right">PG</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="edu1" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td></td>
                                                        <td align="right">Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed1brd" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td></td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed1sub" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed1yr" runat="server"></asp:Label></td>
                                                        <td>
                                                        </td>
                                                        <td align="right">(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed1per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                            </td>
                                                    </tr>
                                                    <tr id="tredu2" runat="server">
                                                        <td>&nbsp;</td>
                                                        <td align="right">Graduation</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="edu2" runat="server" BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td align="right">Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed2brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed2sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed2yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed2per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu3" runat="server">
                                                        <td></td>
                                                        <td align="right">UG</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="edu3" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed3brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed3sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed3yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">(%)</td>
                                                        <td>&nbsp; :</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed3per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu4" runat="server">
                                                        <td></td>
                                                        <td align="right">SSC</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="edu4" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td align="right">Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed4brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed4sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed4yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed4per" runat="server" 
                                                                BorderStyle="None" Height="18px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu5" runat="server">
                                                        <td  ></td>
                                                        <td align="right">Other</td>
                                                        <td ></td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="edu5" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td align="right">Board/University</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed5brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td ></td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed5sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed5yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td align="right">(%)</td>
                                                        <td >&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed5per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu6" runat="server">
                                                        <td></td>
                                                        <td align="right">Other1</td>
                                                        <td style="width: 5px">
                                                        &nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="edu6" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Board/University</t>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed6brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed6sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed6yr" runat="server" Width="66px" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">
                                                            (%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed6per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                
                                                    <tr id="tredu7" runat="server">
                                                        <td></td>
                                                        <td align="right">Other2</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="edu7" runat="server" BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td align="right">
                                                            Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed7brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">
                                                            Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed7sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">
                                                            Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                        <asp:Label CssClass="employee1" ID="ed7yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td align="right">
                                                            (%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td align="left">
                                                            <asp:Label CssClass="employee1" ID="ed7per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="12" align="left" class="headings">
                                                            <asp:Label ID="lbledudet" Visible="false" runat="server"></asp:Label>
                                                        </td>
                                                        <td colspan="8">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                              <tr >
                                <td align="right"  colspan="5">
                                    <input type="button" onclick="window.print()" value="Print" style="width:60px;height:30px;" />
                                </td>
                            </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                 </tr>
              </table>
                                  
</center>
</form>
</body>
</html>


