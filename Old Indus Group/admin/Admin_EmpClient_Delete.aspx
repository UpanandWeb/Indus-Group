<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpClient_Delete.aspx.cs" Inherits="Admin_EmpClient_Delete" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Empclient_delete</title>
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Employee Details has been edited Successfully");
}
function alertdelete()
{
alert("Employee Details has been deleted Successfully");
}
    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
<link rel="stylesheet" href="Styles/stylesheet.css" />   
<LINK href="includes/styles.css" type="text/css" rel="stylesheet" />
<LINK href="includes/menu.css" type="text/css" rel="stylesheet" />
<link href="StyleSheet_new.css" rel="stylesheet" type="text/css" />
  
       <script language="javascript">
       function length_textfield_validator1()
       {
         if(form1.cphccode.value.length>2)
         { 
           form1.cphacode.focus();
           return(false);
         }
         return true;
       }
       function length_textfield_validator2()
       {
         if(form1.cphacode.value.length>2)
         { 
           form1.cphnum.focus();
           return(false);
         }
         return true;
       }
       function length_textfield_validator3()
       {
         if(form1.cldccode.value.length>2)
         { 
           form1.cldacode.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator4()
       {
         if(form1.cldacode.value.length>2)
         { 
           form1.cldnum.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator5()
       {
         if(form1.clmccode.value.length>2)
         { 
           form1.clmacode.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator6()
       {
         if(form1.clmacode.value.length>2)
         { 
           form1.clmnum.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator7()
       {
         if(form1.sdccode.value.length>2)
         { 
           form1.sdacode.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator8()
       {
         if(form1.sdacode.value.length>2)
         { 
           form1.sdnum.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator9()
       {
         if(form1.smccode.value.length>2)
         { 
           form1.smacode.focus();
           return(false);
         }
         return true;
       }
       
       function length_textfield_validator10()
       {
         if(form1.smacode.value.length>2)
         { 
           form1.smnum.focus();
           return(false);
         }
         return true;
       }
       
    </script>

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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
      
      
      <table border="0" style="width: 100%">
   <tr>
   <td align="center" style="height: 21px;"> &nbsp;CLIENT INFORMATION FORM </td>
   </tr>
   </table>
         
      
<table style="width: 100%">
            <tr>
                
                <td class="headings"> Company Information</td>
            </tr>
        </table>
    
    
    </div>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px; height: 21px">
                </td>
            </tr>
        </table>
        <table style="width: 100%; height: 192px">
            <tr>
                <td style="width: 103px; height: 14px;">
                    Name</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="cname" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Industry Type</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:DropDownList ID="indtype" runat="server" Width="176px" Enabled="False">
                        <asp:ListItem Selected="True">Select Industry Type</asp:ListItem>
            <asp:ListItem value="Accounting/Taxation/Finance">Accounting/Taxation/Finance</asp:ListItem>
            <asp:ListItem value="Advertising/PR/MR/Events">Advertising/PR/MR/Events</asp:ListItem>
            <asp:ListItem value="Agriculture/Dairy">Agriculture/Dairy</asp:ListItem>
            <asp:ListItem value="Architecture/Interior Designing">Architecture/Interior Designing</asp:ListItem>
            <asp:ListItem value="Auto/Auto Ancillary">Auto/Auto Ancillary</asp:ListItem>
            <asp:ListItem value="Banking/Financial Services/Broking">Banking/Financial Services/Broking</asp:ListItem>
            <asp:ListItem value="BPO/ITES/CRM/Transcription">BPO/ITES/CRM/Transcription</asp:ListItem>
            <asp:ListItem value="Chemicals/PetroChemical/Plastic/Rubber">Chemicals/PetroChemical/Plastic/Rubber</asp:ListItem>
            <asp:ListItem value="Construction/Engineering/Cement/Metals">Construction/Engineering/Cement/Metals</asp:ListItem>
            <asp:ListItem value="Consumer Durables">Consumer Durables</asp:ListItem>
            <asp:ListItem value="Courier/Transportation/Freight">Courier/Transportation/Freight</asp:ListItem>
            <asp:ListItem value="Defence/Government">Defence/Government</asp:ListItem>
            <asp:ListItem value="Education/Teaching/Training">Education/Teaching/Training</asp:ListItem>
            <asp:ListItem value="Export/Import">Export/Import</asp:ListItem>
            <asp:ListItem value="Fertilizers/Pesticides">Fertilizers/Pesticides</asp:ListItem>
            <asp:ListItem value="FMCG/Foods/Beverage">FMCG/Foods/Beverage</asp:ListItem>
            <asp:ListItem value="Fresher/Trainee">Fresher/Trainee</asp:ListItem>
            <asp:ListItem value="Gems and Jewellery">Gems&amp; Jewellery</asp:ListItem>
            <asp:ListItem value="Hotels/Restaurants/Airlines/Travel">Hotels/Restaurants/Airlines/Travel</asp:ListItem>
            <asp:ListItem value="Industrial Products/Heavy Machinery">Industrial Products/Heavy Machinery</asp:ListItem>
            <asp:ListItem value="Insurance">Insurance</asp:ListItem>
            <asp:ListItem value="IT-Software/Software Services">IT-Software/Software Services</asp:ListItem>
            <asp:ListItem value="IT-Hardware and Networking">IT-Hardware&amp; Networking</asp:ListItem>
            <asp:ListItem value="Telcom/ISP">Telcom/ISP</asp:ListItem>
            <asp:ListItem value="Legal">Legal</asp:ListItem>
            <asp:ListItem value="Media/Dotcom/Entertainment">Media/Dotcom/Entertainment</asp:ListItem>
            <asp:ListItem value="Medical/Healthcare/Hospital">Medical/Healthcare/Hospital</asp:ListItem>
            <asp:ListItem value="NGO/Social Services">NGO/Social Services</asp:ListItem>
            <asp:ListItem value="Office Equipment/Automation">Office Equipment/Automation</asp:ListItem>
            <asp:ListItem value="Oil and Gas/Power/Infrastructure/Energy">Oil and Gas/Power/Infrastructure/Energy</asp:ListItem>
            <asp:ListItem value="Paper">Paper</asp:ListItem>
            <asp:ListItem value="Pharma/Biotech/Clinical Research">Pharma/Biotech/Clinical Research</asp:ListItem>
            <asp:ListItem value="Printing/Packaging">Printing/Packaging</asp:ListItem>
            <asp:ListItem value="Real Estate/Property">Real Estate/Property</asp:ListItem>
            <asp:ListItem value="Recruitment/Employment Firm">Recruitment/Employment Firm</asp:ListItem>
            <asp:ListItem value="Retailing">Retailing</asp:ListItem>
            <asp:ListItem value="Security/Law Enforcement">Security/Law Enforcement</asp:ListItem>
            <asp:ListItem value="Semiconductors/Electronics">Semiconductors/Electronics</asp:ListItem>
            <asp:ListItem value="Shipping/Marine">Shipping/Marine</asp:ListItem>
            <asp:ListItem value="extiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
            <asp:ListItem value="Tyres">Tyres</asp:ListItem>
            <asp:ListItem value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Address</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="caddr" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            
             <tr>
                <td style="width: 103px">
                    City</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="ddlcity" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            
            
            <tr>
                <td style="width: 103px">
                    State</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="ddlstate" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            
            
            
            <tr>
                <td style="width: 103px">
                    Country</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="ddlcountry" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            
            
            
            <tr>
                <td style="width: 103px; height:14px">
                    Phone No</td>
                <td style="width: 1px">
                    :</td>
                
                    <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="cphccode" runat="server" MaxLength="3" Width="42px" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="cphacode" runat="server" MaxLength="3" Width="40px" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="cphnum" runat="server" MaxLength="4"  Width="68px" Enabled="False"></asp:TextBox>
                            
                            </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Email id</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="cemail" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Website</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px">
                    <asp:TextBox ID="cwebsite" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px; height: 14px;">
                    Brief Description</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                    <td style="width:191px">
                    <asp:TextBox ID="desc" runat="server" Width="172px" TextMode="MultiLine" 
                            Height="113px" Enabled="False"></asp:TextBox>
                    
                
                         </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td class="headings"> Client Information </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px; height: 21px;">
                </td>
            </tr>
        </table>
        <table style="width: 100%; height: 192px">
            <tr>
                <td style="width: 103px; height: 14px;">
                    Name</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="clname" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px; height: 14px;">
                    Address</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="claddr" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px; height: 14px;">
                    Email id</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="clemail" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Mobile No</td>
                <td style="width: 1px">
                    :</td>
                
                    <td style="width: 191px; height: 21px;">
                        <asp:TextBox ID="cldccode" runat="server" Width="41px" MaxLength="3" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="cldacode" runat="server" MaxLength="3"  Width="40px" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="cldnum" runat="server" MaxLength="4"  Width="68px" Enabled="False"></asp:TextBox>
                            
                            </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Desk Phone</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px; height: 21px;">
                    <asp:TextBox ID="clmccode" runat="server" MaxLength="3"  Width="42px" 
                        Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="clmacode" runat="server" MaxLength="3"  Width="40px" 
                        Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="clmnum" runat="server" MaxLength="4" Width="68px" 
                        Enabled="False"></asp:TextBox>
                        
                    </td>
            </tr>
       </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td class="headings"> Supervisor Information </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px; height: 21px;">
                </td>
            </tr>
        </table>
        <table style="width: 100%; height: 192px">
            <tr>
                <td style="width: 103px; height: 14px;">
                    Name</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="sname" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px; height: 14px;">
                    Address</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="saddr" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td style="width: 103px; height: 14px;">
                    Email id</td>
                <td style="width: 1px; height: 14px;">
                    :</td>
                <td style="width: 191px; height: 14px;">
                    <asp:TextBox ID="semail" runat="server" Width="172px" Enabled="False"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Desk Phone</td>
                <td style="width: 1px">
                    :</td>
                
                    <td style="width: 191px; height: 21px;">
                    <asp:TextBox ID="sdccode" runat="server" MaxLength="3"  Width="42px" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="sdacode" runat="server" MaxLength="3"  Width="40px" 
                            Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="sdnum" runat="server" MaxLength="4"  Width="68px" Enabled="False"></asp:TextBox>
                            
                            </td>
            </tr>
            <tr>
                <td style="width: 103px">
                    Mobile No</td>
                <td style="width: 1px">
                    :</td>
                <td style="width: 191px; height: 21px;">
                    <asp:TextBox ID="smccode" runat="server" MaxLength="3"  Width="42px" 
                        Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="smacode" runat="server" MaxLength="3"  Width="40px" 
                        Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="smnum" runat="server" MaxLength="4"  Width="68px" 
                        Enabled="False"></asp:TextBox>
                        
                        </td>
            </tr>
       </table>
        <table style="width: 100%">
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
        
        
        <table style="width: 100%">
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
         Fields Marked with * are Mandatory<br />
                    <br />
        
        
        <asp:Button ID="Button1" runat="server" Text="Delete" Width="110px" OnClick="Button1_Click" /><br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <br />
        <br />
 
      
      
      
      </td>
    </tr>
    
    
  
    </table>
    
    
    </form>
</body>
</html>