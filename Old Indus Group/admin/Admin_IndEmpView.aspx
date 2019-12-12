<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_IndEmpView.aspx.cs" Inherits="admin_Admin_IndEmpView" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%--<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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

    function moveOnMax(field, nextFieldID) {
        if (field.value.length >= field.maxLength) {w
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
    function skltest(field) {
        if (field.value != "") {
            document.frmRegistration.hdnskl.value = field.value;
            alert(document.frmRegistration.hdnskl.value)
        }
        else {

            document.frmRegistration.hdnskl.value = "";
            //  alert(document.regForm.hidState.value)
        }
    }



    function exptest(field) {
        if (field.value != "") {
            document.frmRegistration.hdnexp.value = field.value;
            alert(document.frmRegistration.hdnexp.value)
        }
        else {

            document.frmRegistration.hdnexp.value = "";
        }
    }



    function yrstest(field) {
        if (field.value != "") {
            document.frmRegistration.hdnyrs.value = field.value;
            alert(document.frmRegistration.hdnyrs.value)
        }
        else {

            document.frmRegistration.hdnyrs.value = "";
        }
    }
</script>

 <script language="javascript" type="text/javascript">
            if (window.print) {
                document.write('<form><input type=button name=print value="Print" onClick="window.print()"></form>');
            }
</script>

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
                                    <asp:Image ID="imgdisplay" runat="server" ImageUrl='<%#Eval("photo") %>' Width="250px" Height="250px"  />
                                </td>
                            </tr>
                           
                            <tr>
                                <td align="left" class="border"  valign="top" width="80%"  style="height: 190px;">
                                    <table class="employee" border="0" cellpadding="6" cellspacing="10">
                                    <tr>
                                    <td class="headings01" colspan="3"> Login Details </td>
                                    </tr>
                                        <tr>
                                            <td style="height: 21px;">Email ID</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 183px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="txtemail" runat="server" 
                                                    BorderStyle="None"></asp:Label>       
                                            </td>
                                            <td style="height: 21px;">Alternate Email</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="conemail" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td style="height: 21px;">Emp ID</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="txtempid" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                        <td style="height: 21px;">Password</td><td>&nbsp;:</td>
                                        <td> <asp:Label CssClass="employee1" ID="lblpwd" runat="server" BorderStyle="None"></asp:Label></td></td>
                                        </tr>

                            <tr>
                                <td class="headings01" colspan="3">Personal Details</td>
                            </tr>

                            <tr>
                                            <td>First Name</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="fname" runat="server" BorderStyle="None"></asp:Label></td>
                                    
                                            <td>Middle Name&nbsp;</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="mname" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td>Last Name</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="lname" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label>
                                            </td>
                                        </tr>

                            <tr>
                                            <td>Gender</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="gend" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                           <td>Nationality</td>
                                        <td>&nbsp;:&nbsp;</td>
                                        <td>
                                                <asp:Label CssClass="employee1" ID="ncountry" runat="server" 
                                                    BorderStyle="None" Height="18px"></asp:Label></td>
                                             <td>
                                                 Marital Status
                                             </td>
                                             <td>&nbsp;:</td>
                                             <td><asp:Label CssClass="employee1" ID="lblmaritalstatus" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                           
                             </tr>
                                        
                            <tr>
                                            <td>
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="bdate" runat="server" BorderStyle="None"></asp:Label></td>
                                              <td>
                                                Birth City</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="bcity" runat="server" BorderStyle="None">

                                                </asp:Label></td>
                                            <td>
                                                Birth State</td>
                                            <td>&nbsp;:</td>
                                            <td >
                                                <asp:Label CssClass="employee1" ID="bstate" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>

                            <tr>
                                         
                                     <td>
                                                Birth Country</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="bcountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>      
                                  <td>
                                                Citizenship</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="ccountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Passport No</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="passno" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>

                            <tr>
                                            <td>
                                                Issued at</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="pcountry" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Issued Date</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="issdate" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Expiry Date</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="expdate" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>

                            <tr>
                                        
                                        <td>&nbsp;</td><td>&nbsp;&nbsp;</td><td>
                                                    &nbsp;</td>
                                        </tr>

                                        <tr>
                                             <td class="headings01" colspan="3">Family Details</td>
                                        </tr>

                                        <tr>
                                        <td>Father Name</td>
                                        <td>&nbsp;:</td>
                                        <td>
                                            <asp:Label ID="fatname" runat="server" BorderStyle="None" CssClass="employee1"></asp:Label>
                                            </td>
                                            <td>
                                            
                                                Mother Name</td>
                                           <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="motname" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>
                                        
                                        <tr id="kid1" runat="server">
                                            <td>
                                                Spouse Name</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="mmname" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                            <td>Birth Date</td>
                                            <td>&nbsp;:&nbsp;</td>
                                            <td>
                                            <asp:Label CssClass="employee1" ID="sbd" runat="server" BorderStyle="None"></asp:Label>
                                    
                                                    </td>
                                             <td>Gender</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                              <asp:Label CssClass="employee1" ID="spgen" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                            </tr>
                                    
                                        <tr id="kid2" runat="server">
                                            <td>
                                                Chid Name-1</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="k1name" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Child Name-2</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="k2name" runat="server" BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Child Name-3</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="k3name" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                      
                                        <tr id="kid3" runat="server">
                                            <td>
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td>
                                                  <asp:Label CssClass="employee1" ID="k1gen" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td>
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td>
                                                  <asp:Label CssClass="employee1" ID="k2gen" runat="server" BorderStyle="None"></asp:Label>
                                              </td>
                                      
                                            <td>
                                                Gender</td>
                                            <td>&nbsp;:</td>
                                                 <td  >
                                                 <asp:Label CssClass="employee1" ID="k3gen" runat="server" BorderStyle="None"></asp:Label>
                                              </td>
                                        </tr>

                                        <tr id="kid4" runat="server">
                                            <td>
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                            <asp:Label CssClass="employee1" ID="k1bd" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td>
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                            <asp:Label CssClass="employee1" ID="k2bd" runat="server" BorderStyle="None"></asp:Label>
                                            </td>
                                    
                                            <td>
                                                Birth Date</td>
                                            <td>&nbsp;:</td>
                                                 <td  >
                                                  <asp:Label CssClass="employee1" ID="k3bd" runat="server" BorderStyle="None" ></asp:Label>
                                            </td>
                                        </tr>
                                     
                                        <tr>
                                            <td class="headings01" colspan="3">Communication Details</td>
                                        </tr>
                                
                                        <tr>
                                               <td  >
                                                Door No</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="lbldoor" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td  >
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td   >
                                                <asp:Label CssClass="employee1" ID="street" runat="server"
                                                    Width="200px" BorderStyle="None"></asp:Label></td>
                                                 <td>
                                                City</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="city" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td>
                                                State
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="state" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                               <td  >
                                                Country</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="country" runat="server" 
                                                    BorderStyle="None"></asp:Label></td>
                                            <td>
                                                Zip</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="zip" runat="server" BorderStyle="None"></asp:Label></td>
                                        </tr>
                                        
                                        <tr>
                                           <td class="headings01" colspan="3">Contact Details</td>
                                        </tr>

                                         <tr>
                                            <td  >
                                                Ph:Work</td>
                                            <td style="width: 8px; height: 21px;">
                                                &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="wp1" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="wp2" runat="server" MaxLength="3"></asp:Label>
                                                - <asp:Label CssClass="employee1" ID="wp3" runat="server" MaxLength="4"></asp:Label></td>
                                            <td>
                                                Ph:Home</td>
                                            <td style="width: 8px; height: 21px;"> &nbsp;:&nbsp;</td>
                                            <td style="width: 193px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="hp1" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp2" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="hp3" runat="server" MaxLength="4"></asp:Label></td>
                                    
                                             <td>Mobile</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 201px; height: 21px;">
                                                <asp:Label CssClass="employee1" ID="mb1" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="mb2" runat="server" MaxLength="3"></asp:Label>
                                                -<asp:Label CssClass="employee1" ID="mb3" runat="server" MaxLength="4"></asp:Label>
                                             </td>
                                        </tr>

                                      

                                        <tr>
                                            <td heigh="10px">&nbsp;</td>
                                        </tr>

                                        <tr>
                                           <td class="headings01" colspan="3">  Bank Account Details</td>
                                        </tr>

                                        <tr>
                                                            <td width="15%">Account Name
                                                            </td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td width="15%">
                                                                <asp:Label ID="txtacname" runat="server" MaxLength="50" Width="180px" CssClass="employee1"
                                                                   ></asp:Label>
                                                            </td>
                                                            <td width="15%" >Account Number
                                                            </td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td width="15%">
                                                                <asp:Label ID="txtacnum" runat="server" MaxLength="20" Width="180px" CssClass="employee1"></asp:Label>
                                                            </td>
                                                            <td width="15%">Bank Name
                                                            </td>
                                                            <td width="2%">&nbsp;:</td>
                                                            <td  width="15%">
                                                                <asp:Label ID="txtbankname" runat="server" MaxLength="30" Width="180px" CssClass="employee1"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    
                                        <tr>
                                                            <td >Branch Address
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtbankadd" runat="server"  CssClass="employee1"
                                                                    MaxLength="200" Width="180px" ></asp:Label>

                                                            </td>
                                                            <td >IFSC CODE
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtifsc" runat="server" CssClass="employee1"
                                                                     MaxLength="11" Width="180px" ></asp:Label>
                                                            </td>
                                                            <td >Swift Code
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtswift" runat="server" MaxLength="20"
                                                                    CssClass="employee1" Width="180px" > </asp:Label>
                                                            </td>
                                                        </tr>

                                        <tr>
                                                            <td >Address In Your Bank Account </td>
                                                            <td>&nbsp;:</td>
                                                            <td style="width: 193px" colspan="5">
                                                                <asp:Label ID="txtbranchacaddress" CssClass="employee1"
                                                                     runat="server" Width="450px" MaxLength="200" ></asp:Label>
                                                            </td>

                                                            <td style="width: 6px"></td>
                                                            <td></td>
                                                        </tr>

                                        <tr>
                                           <td class="headings01" colspan="3"> Identification Details </td>
                                        </tr>

                                        <tr>
                                                            <td >Adhar Number
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtaadhar" CssClass="employee1" runat="server" MaxLength="12" Width="180px" ></asp:Label>
                                                            </td>
                                                            <td>Issue Place 
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="aadharplce" CssClass="employee1" runat="server" MaxLength="10" Width="180px" ></asp:Label>
                                                            </td>
                                                            <td>Issue City 
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="adharcity" CssClass="employee1" runat="server" MaxLength="10" Width="180px" ></asp:Label>
                                                            </td>
                                                        </tr>

                                         <tr>
                                                            <td >Pan Number
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtpan" CssClass="employee1" runat="server" MaxLength="12" Width="180px" ></asp:Label>
                                                            </td>
                                                            <td>Issue Place 
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="panplace" CssClass="employee1" runat="server" MaxLength="10" Width="180px" ></asp:Label>
                                                            </td>
                                                           <td>Issue City 
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="pancity" CssClass="employee1" runat="server" MaxLength="10" Width="180px" ></asp:Label>
                                                            </td>
                                                        </tr>

                                        <tr>
                                                            <td >Driving Licence Number
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtdrivenumber" CssClass="employee1" runat="server" MaxLength="16" ></asp:Label>
                                                            </td>
                                                            <td >Issue Place
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td>
                                                                <asp:Label ID="txtdriveplace" CssClass="employee1" runat="server" MaxLength="20" ></asp:Label>
                                                            </td>
                                                            <td >Issue city
                                                            </td>
                                                            <td>&nbsp;:</td>
                                                            <td  >
                                                                <asp:Label ID="txtdrivecity" CssClass="employee1" runat="server" MaxLength="20" ></asp:Label>
                                                            </td>
                                                        </tr>
                                     
                                        <tr>
                                              <td class="headings01" colspan="6">Emergency Contact  Details</td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                Cont.Person-1</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="cpname1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td>
                                                Phone Number<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="cpphone1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td>
                                                Email ID<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="cpemail1" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 193px" colspan="5">
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
                                            <td>
                                                Cont.Person-2</td>
                                            <td style="width: 8px">
                                            </td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="cpname2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td>
                                                Phone Number<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="cpphone2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                            <td>
                                                Email ID<br />
                                            </td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="cpemail2" runat="server" 
                                                    BorderStyle="None"></asp:Label><br />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                Address</td>
                                            <td>&nbsp;:</td>
                                            <td style="width: 293px" colspan="5">
                                                <asp:Label CssClass="employee1" ID="cpaddr2" runat="server" Width="449px" 
                                                    BorderStyle="None"></asp:Label></td>
                                       
                                            <td style="width: 6px"></td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td class="headings01" colspan="3"> Experience Details</td>
                                        </tr>

                                        <tr id="yearsmonths" runat="server">
                                          <td>Exp.Yrs &amp; Months </td>
                                          <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="expyrs1" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon1" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                                <td>Designation</td>
                                            <td>&nbsp;:&nbsp;</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="fnarea1" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td>Current Company</td>
                                            <td></td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="currind1" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                                    </td>
                                          </tr>

                                        <tr id="yearsmonths1" runat="server">
                                            <td>Exp Yrs &amp; Months</td>
                                            
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="expyrs" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                            <td>
                                                Designation</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="fnarea" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td>
                                                Previous Company</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="currind" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        
                                        <tr id="Tr2" runat="server">
                                            <td>Exp Yrs &amp; Months</td>
                                            
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="expyrs2" runat="server" MaxLength="3"></asp:Label>Years
                                                &nbsp;-
                                                <asp:Label CssClass="employee1" ID="expmon2" runat="server" MaxLength="3"></asp:Label>Months
                                                </td>
                                            <td>
                                                Designation</td>
                                            <td>&nbsp;:</td>
                                            <td>
                                                <asp:Label CssClass="employee1" ID="lbldes2" runat="server" BorderStyle="None" 
                                                    Height="18px"></asp:Label></td>
                                            <td>
                                                Previous Company</td>
                                            <td>&nbsp;:</td>
                                            <td  >
                                                <asp:Label CssClass="employee1" ID="lblcompany2" runat="server" 
                                                    BorderStyle="None"></asp:Label>
                                            </td>
                                        </tr>
                                        
                                        <tr><td colspan="9" class="headings01">Technical Skills </td></tr>

                                        <tr>
                                            <td colspan="9">
                                                <table width="100%" class="employee" cellpadding="6" cellspacing="10">
                                                    <tr id="trskills1" runat="server">
                                                        <td>Skills-1</td>
                                                        <td>&nbsp;:</td>
                                                        <td><asp:Label CssClass="employee1" ID="skills1" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk1yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk1m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label ID="sk1exp" runat="server"  Width="156px" CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills2" runat="server">
                                                        <td>
                                                            Skills-2</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="skills2" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="sk2yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk2m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label ID="sk2exp" runat="server" Width="156px" 
                                                                CssClass="employee1" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills3" runat="server">
                                                        <td>
                                                            Skills-3</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="skills3" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="sk3yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk3m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label ID="sk3exp" runat="server" Width="156px" CssClass="employee1">
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills4" runat="server">
                                                        <td>
                                                            Skills-4</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="skills4" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="sk4yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                             
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk4m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label ID="sk4exp" runat="server"  Width="156px" 
                                                                CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills5" runat="server">
                                                        <td >
                                                            Skills-5</td>
                                                        <td >&nbsp;:</td>
                                                        <td >
                                                            <asp:Label CssClass="employee1" ID="skills5" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td >
                                                            No of Years</td>
                                                        <td >&nbsp;:</td>
                                                        <td >
                                                            <asp:Label CssClass="employee1" ID="sk5yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                          
                                                            <td >No of Months</td>
                                                        <td >&nbsp;:</td>
                                                        <td >
                                                            <asp:Label CssClass="employee1" ID="sk5m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td >
                                                            Expert Level</td>
                                                        <td >&nbsp;:</td>
                                                        <td >
                                                            <asp:Label ID="sk5exp" runat="server"  Width="156px" 
                                                                CssClass="employee1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="trskills6" runat="server">
                                                        <td>
                                                            Skills-6</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="skills6" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            No of Years</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="sk6yrs" runat="server" BorderStyle="None"></asp:Label></td>
                                                            
                                                            <td>No of Months</td>
                                                        <td>&nbsp;:</td>
                                                        <td style="width:30px">
                                                            <asp:Label CssClass="employee1" ID="sk6m" runat="server" BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                            Expert Level</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
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
                                                        <td>PG</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="edu1" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td></td>
                                                        <td>Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed1brd" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td></td>
                                                        <td>Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed1sub" runat="server" 
                                                                BorderStyle="None"></asp:Label></td>
                                                        <td>
                                                        </td>
                                                        <td>Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed1yr" runat="server"></asp:Label></td>
                                                        <td>
                                                        </td>
                                                        <td>(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed1per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                            </td>
                                                    </tr>
                                                    <tr id="tredu2" runat="server">
                                                        <td>&nbsp;</td>
                                                        <td>Graduation</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="edu2" runat="server" BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed2brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td>Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed2sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed2yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed2per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu3" runat="server">
                                                        <td></td>
                                                        <td>UG</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="edu3" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed3brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed3sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed3yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>(%)</td>
                                                        <td>&nbsp; :</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed3per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu4" runat="server">
                                                        <td></td>
                                                        <td>SSC</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="edu4" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td>Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed4brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed4sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed4yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>(%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed4per" runat="server" 
                                                                BorderStyle="None" Height="18px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu5" runat="server">
                                                        <td  ></td>
                                                        <td >Other</td>
                                                        <td ></td>
                                                        <td >
                                                        <asp:Label CssClass="employee1" ID="edu5" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td >Board/University</td>
                                                        <td >&nbsp;:</td>
                                                        <td >
                                                        <asp:Label CssClass="employee1" ID="ed5brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td ></td>
                                                        <td >Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td >
                                                        <asp:Label CssClass="employee1" ID="ed5sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td >Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td >
                                                        <asp:Label CssClass="employee1" ID="ed5yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td >
                                                        </td>
                                                        <td >(%)</td>
                                                        <td >&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed5per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="tredu6" runat="server">
                                                        <td></td>
                                                        <td>Other1</td>
                                                        <td style="width: 5px">
                                                        &nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="edu6" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed6brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed6sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed6yr" runat="server" Width="66px" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            (%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="ed6per" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                    </tr>
                                
                                                    <tr id="tredu7" runat="server">
                                                        <td></td>
                                                        <td>Other2</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                            <asp:Label CssClass="employee1" ID="edu7" runat="server" BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            Board/University</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed7brd" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            Major in</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed7sub" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            Year Of&nbsp; Pass</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
                                                        <asp:Label CssClass="employee1" ID="ed7yr" runat="server" 
                                                                BorderStyle="None"></asp:Label>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            (%)</td>
                                                        <td>&nbsp;:</td>
                                                        <td>
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

                                        <tr>
                                <td>
                                    <asp:DataList ID="docs" runat="server" >
                                        <ItemTemplate>
                                            <asp:HyperLink ID="lbl1" runat="server"  Text='<%# Eval("imgname") %>' 
                                                NavigateUrl='<%# string.Format("~/admin/emp_photos/{0}", Eval("imgname")) %>'   target="_blank"  ></asp:HyperLink>
                                           
                                           <%-- ImageUrl='<%# Eval("imgname", "~/admin/employee_docs/\\{0}") %>' --%>

<%--                                              <a id="A1" href='<%# string.Format("Details.aspx?Pid={0}", Eval("Pid")) %>' runat="server">
                                                       <asp:Label ID="lbltitle" runat="server" Text='<%#Eval("News_Title") %>' ></asp:Label>--%>
                                                  </a>
                                        </ItemTemplate>
                                    </asp:DataList> 
                                    <%--<asp:Label ID="pathfile" runat="server"></asp:Label>--%>
                                </td>
                            </tr>

                                        <tr>
                                <td colspan="12">
                                    <asp:TextBox ID="txtresume" runat="server"  Width="100%" Height="500px" Enabled="false" 
                                         TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>

                                        <tr>
                                            <td colspan="9" runat="server" visible="false">
                                                <%-- Folder Permissions --%>
                                                <table style="width: 986px">
                                                    <tr id="tr1" runat="server">
                                                        <td colspan="2">
                                                            <font size="4" color="#0e4860">
                                                                <strong>
                                                                    Please click on the below folders to view the respective Documents present in it
                                                                </strong>
                                                            </font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style24"></td>
                                                    </tr>
                                                    <tr>
                                                        <td id="td1" runat="server" align="center" valign="top" width="100%" class="lable"> 
                                                            <%-- Start the Folder Permissions --%>
                                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <table width="100%" class="" style="font-size:12px;">
                                                                <tr>
                                                                    <td style="width:12%" id="tdlnkAccDos" runat="server">
                                                                    <asp:LinkButton ID="lnkAccDos" runat="server" onclick="lnkAccDos_Click">
                                                                        <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                        Accounting Documents
                                                                    </asp:LinkButton>
                                                                    </td>
                                                                    <td style="width:10%" id="tdlnkARPDocs" runat="server">
                                                                        <asp:LinkButton ID="lnkARPDocs" runat="server" onclick="lnkARPDocs_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            ARP Documents
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                    <td style="width:10%" id="tdlnkDR" runat="server">
                                                                        <asp:LinkButton ID="lnkDR" runat="server" onclick="lnkDR_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            Daily Reports
                                                                        </asp:LinkButton>
                                                                    </td>
                    
                                                                    <td style="width:12%" id="tdlnkEmpDocs" runat="server">
                                                                        <asp:LinkButton ID="lnkEmpDocs" runat="server" onclick="lnkEmpDocs_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            Employee Documents
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                        <td style="width:10%" id="tdlnkExcel" runat="server">
                                                                        <asp:LinkButton ID="lnkExcel" runat="server" onclick="lnkExcel_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                                            Excel Documents
                                                                        </asp:LinkButton>
                                                                    </td>
                    
                                                                    <td style="width:10%" id="tdlnkHRDocs" runat="server">
                                                                        <asp:LinkButton ID="lnkHRDocs" runat="server" onclick="lnkHRDocs_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            HR Documents
                                                                        </asp:LinkButton>
                                                                    </td>
                   
                                                                    <td style="width:12%" id="tdlnkImmigDocs" runat="server">
                                                                        <asp:LinkButton ID="lnkImmigDocs" runat="server" onclick="lnkImmigDocs_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            Immigration Documents
                                                                        </asp:LinkButton>
                                                                    </td>    
                                                                    <td style="width:10%" id="tdlnkLeaves" runat="server">
                                                                        <asp:LinkButton ID="lnkLeaves" runat="server" OnClick="lnkLeaves_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt="" /><br />
                                                                            Time & Attendence
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                        <td style="width:10%" id="tdlnkWord" runat="server">
                                                                        <asp:LinkButton ID="lnkWord" runat="server" OnClick="lnkWord_Click">
                                                                            <img src='images/folder-icon.jpg' width='40' height='50' border='0' alt=""/><br />
                                                                            Word Documents
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trEmployeeDocs" runat="server">
                                                                    <td style="height:20px" colspan="9"> 
                                                                        <span style="font-size:14px">
                                                                            <asp:Label ID="lblDoc" runat="server"></asp:Label>
                                                                        </span>    
                                                                    </td>
                                                                </tr>
                                                                <tr id="trdlEmpDocs" runat="server">
                                                                    <td colspan="9">                           
                                                                        <asp:DataList ID="dlEmpDocs" runat="server" Width="100%" 
                                                                                AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal" 
                                                                            RepeatColumns="3" onitemdatabound="dlEmpDocs_ItemDataBound">
                                                                            <ItemTemplate>
                                                                                <table width="100%" border="0" class="labled">
                                                                                    <tr>                                             
                                                                                        <td align="left">
                                                                                            <asp:Label ID="lblSubFolder" runat="server" Text='<%#Eval("SubFolder")%>' Visible="false"></asp:Label>
                                                                                            <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("FileDocName") %>' Visible="false"></asp:Label>
                                                                                            <asp:Label ID="lblFilePath" runat="server" Text='<%#Eval("FileContentType") %>' Visible="false"></asp:Label>                                            
                                            
                                                                                            <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkDownload" ForeColor="Red">
                                                                                            </asp:LinkButton>
                                            
                                                                                            <asp:LinkButton ID="lnkBtnDeleteFile" runat="server" CommandArgument='<%#Eval("Id") %>'>
                                                                                            </asp:LinkButton>
                                            
                                                                                            <asp:LinkButton ID="lnkFolderName" runat="server" CommandArgument='<%#Eval("Folder") + ";" +Eval("SubFolder") +";"+Eval("DocType")%>' OnCommand="lnkView" ForeColor="Red">
                                                                                                <img src='images/folder-icon.jpg' width='40' height='50' border='0'/><br />
                                                                                                 <asp:Label ID="Label2" runat="server" Text='<%#Eval("SubFolder")%>'></asp:Label>
                                                                                            </asp:LinkButton>                                               
                                                
                                                                                        &nbsp;&nbsp; 
                                                                                                                                
                                                                                            <asp:LinkButton ID="lnkBtnDeleteFolder" runat="server"  CommandArgument='<%#Eval("Folder") + ";" +Eval("SubFolder") +";"+Eval("DocType")%>'>
                                                                                            
                                                                                            </asp:LinkButton>
                                                                                        </td>
                                                                                        <td style="width:25px"></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:DataList>                            
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height:20px" colspan="2"></td>
                                                                </tr>
                                                                <tr id="trSubFiles" runat="server" visible="false">
                                                                    <td align="left" style="padding-left:20px" class="style24" colspan="9">
                                                                        <span style="font-size:14px">
                                                                        <asp:Label ID="lblFolder" runat="server"></asp:Label>&nbsp;<b>></b>&nbsp;<asp:Label ID="lblSubFolder" runat="server"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height:20px" colspan="9"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="9">
                                                                            <asp:DataList ID="dlSubFolderFiles" runat="server" Width="100%" 
                                                                                AlternatingItemStyle-BackColor="#FBEFF8" BackColor="#EFEFFB" RepeatDirection="Horizontal" 
                                                                            RepeatColumns="3" >
                                                                            <ItemTemplate>
                                                                                <table width="100%" border="0" class="labled">
                                                                                    <tr>                                             
                                                                                        <td align="left">
                                                                                            <asp:LinkButton ID="lnkBtnDownload" runat="server" CommandArgument='<%#Eval("Id") %>' OnCommand="lnkDownload" ForeColor="Red">
                                                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("FileDocName")%>'></asp:Label>
                                                                                            </asp:LinkButton>
                                                                                            
                                                                                            &nbsp;&nbsp;                                           
                                                                                            
                                                                                            <asp:LinkButton ID="lnlBtnDelete" runat="server" CommandArgument='<%#Eval("Id") %>'>
                                                                                            </asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                    </td>
                                                                </tr> 
                                                                <tr>
                                                                    <td colspan="9">                        
                                                                        <asp:Label ID="lbllMsg" runat="server" Font-Bold="true" Font-Size="13px"></asp:Label>
                                                                    </td>
                                                                </tr> 
                                                            </table>
                                                        </ContentTemplate>
                                                            <%--<Triggers>
                                                            <asp:PostBackTrigger ControlID="UploadDocs" />
                                                            </Triggers>--%>
                                                        </asp:UpdatePanel>
                                                        <%-- End the Folder Permissions --%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr id="trViewFolders" runat="server">
                                            <td colspan="2">
                                                &nbsp;</td>
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
