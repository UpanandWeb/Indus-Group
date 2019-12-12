<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_certifcte.aspx.cs" Inherits="Admin_certifcte" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - Cirtificate</title>
    
      <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertexist()
{
alert("Details already Existing!");
}
	
	function alertsubmit()
{
alert("Certificate Details has been saved Successfully");
}
function alertfield()
{
var val=document.getElementById("admno").value;
if(val=="")
{
alert("Please enter the Admission Number!");
return false;
}
}
function validatefields()
{
var messg="";

if((document.getElementById("expyear").value=="")||(document.getElementById("expmonths").value=="")||(document.getElementById("txtskill").value=="")||
(document.getElementById("fnarea").value=="")||(document.getElementById("edu").value=="")||(document.getElementById("edu_major").value==""))
{

if(document.getElementById("expyear").value=="")

messg=messg + "Enter Experience in Years \n" ;


if(document.getElementById("expmonths").value=="")

messg=messg + "Enter Experience in months \n" ;

if(document.getElementById("txtskill").value=="")
messg=messg + "Enter the key Skills \n";

if(document.getElementById("fnarea").value=="")
messg=messg + "Enter Functional Area \n";

if(document.getElementById("edu").value=="")
messg=messg + "Enter the Basic Qualification \n" ;

if(document.getElementById("edu_major").value=="")
messg=messg + "Enter major Subject \n" ;

alert(messg);
return false;
}
else
{
return true;
}
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
     <td align="center" valign="top" width="100%" class="lable">
    
    <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
    <td colspan='2' align="center" valign="bottom" style="height: 30px">
          <br /><br />
      <font size='4pt' color="#660000"><b>Upload Certificates </b></font></td>
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
      <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">Admission No.<span style="color: #ff0000">*</span></td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="admno" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
          &nbsp; &nbsp;<asp:Button ID="getdetails" runat="server" Height="21px" Text="Get Details"
              Width="77px" OnClick="getdetails_Click" /></td>
    </tr>
          
          <tr>
           <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">
          First Name </td>
      <td style="width: 390px; height: 20px;">
          
          <asp:TextBox ID="fname" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          </td>
    </tr>
    <tr>
      <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">Last Name </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="lname" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          &nbsp; &nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtid" runat="server" ReadOnly="True"
              Visible="False" Width="171px"></asp:TextBox></td>
    </tr>
    <tr>
      <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">Address </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="address" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          &nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td style="width: 202px; height: 11px" class="lable" align="left" valign="bottom">City &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 390px; height: 11px;">
          <asp:TextBox ID="city" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          </td>
    </tr>
    <tr>
      <td style="width: 202px; height: 33px;" class="lable" align="left" valign="bottom">State &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
       <td style="width: 390px; height: 33px;">
          <asp:TextBox ID="state" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
           </td>
      
          
    </tr>
    <tr>
      <td style="width: 202px" class="lable" align="left" valign="bottom">Country &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 390px">
          <asp:TextBox ID="country" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox></td>
    </tr>
  
    <tr>
      <td style="width: 202px" class="lable" align="left" valign="bottom">Mobile &nbsp;&nbsp;&nbsp;&nbsp;
      </td>
      <td style="width: 390px">
          <asp:TextBox ID="mobile" runat="server" CssClass="lable" Width="164px"  ReadOnly="True"></asp:TextBox>
          </td>
    </tr>
    
    <tr>
      <td style="width: 202px; height: 26px;" class="lable" align="left" valign="bottom">E-Mail &nbsp; &nbsp; &nbsp;&nbsp;
      </td>
      <td style="width: 390px; height: 26px;">
          <asp:TextBox ID="email" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          </td>
    </tr>
    <tr>
      <td style="height: 20px; width: 202px;" class="lable" align="left" valign="bottom">Education Qualification </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="education" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
          </td>
    </tr>
    <tr>
      <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">Currently Working On</td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="workingon" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox></td>
    </tr>
     <tr>
      <td style="width: 202px; height: 20px" class="lable" align="left" valign="bottom">Course Enrolled for </td>
       <td style="width: 390px; height: 20px;">
       
            <asp:TextBox ID="course" runat="server" CssClass="lable" Width="164px" ReadOnly="True"></asp:TextBox>
     
               </td>
                        
    
    </tr>
    <!--------------------------------------------------------------------------------------------->
    
    
            <tr height="15">
              <td height="2" align="right" valign="middle" style="width: 202px"></td>
              <td align="left" valign="top" style="width: 390px"></td>
            </tr>
            <tr height="15">
              <td align="left" valign="middle" style="height: 11px; width: 202px;" class="lable">Total Experience <font color="red"> * </font> :</td>
              <td align="left" valign="middle" style="height: 11px; width: 390px;" class="lable">
                 <asp:DropDownList ID="expyear" runat="server" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Years</asp:ListItem>
                    <asp:ListItem Value="0">0</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="14">14</asp:ListItem>
                    <asp:ListItem Value="15">15</asp:ListItem>
                    <asp:ListItem Value="16">16</asp:ListItem>
                    <asp:ListItem Value="17">17</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                    <asp:ListItem Value="19">19</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="21">21</asp:ListItem>
                    <asp:ListItem Value="22">22</asp:ListItem>
                    <asp:ListItem Value="23">23</asp:ListItem>
                    <asp:ListItem Value="24">24</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="26">26</asp:ListItem>
                    <asp:ListItem Value="27">27</asp:ListItem>
                    <asp:ListItem Value="28">28</asp:ListItem>
                    <asp:ListItem Value="29">29</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="31">30+ years</asp:ListItem>
                   
                </asp:DropDownList>
                    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:DropDownList ID="expmonths" runat="server" CssClass="lable">
                   
                    <asp:ListItem selected="True">Months</asp:ListItem>
                  
                   <asp:ListItem value=".00">0</asp:ListItem>
                   <asp:ListItem value=".08">1</asp:ListItem>
                   <asp:ListItem value=".17">2</asp:ListItem>
                  <asp:ListItem value=".25">3</asp:ListItem>
                  <asp:ListItem value=".33">4</asp:ListItem>
                   <asp:ListItem value=".42">5</asp:ListItem>
                  <asp:ListItem value=".50">6</asp:ListItem>
                  <asp:ListItem value=".58">7</asp:ListItem>
                  <asp:ListItem value=".67">8</asp:ListItem>
                   <asp:ListItem value=".75">9</asp:ListItem>
                  <asp:ListItem value=".83">10</asp:ListItem>
                 <asp:ListItem value=".92">11 mths</asp:ListItem>
                 </asp:DropDownList>
                  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                      
                      </td>
            </tr>
            <tr height="9">
              <td align="right" valign="middle" style="width: 202px; height: 9px;"></td>
              <td align="left" valign="top" style="height: 9px; width: 390px;"></td>
            </tr>
            <tr height="15">
              <td align="left" valign="top" style="width: 202px; height: 15px" class="lable4"><span class="lable" >Key Skills <font color="red"> * </font> :</span><br />
                  <span class="labled">Do not enter soft skills like &quot;loyal&quot;, or &quot;hard-worker&quot; or &quot;strive for perfection&quot;.</span></td>
              <td align="left" valign="top" style="height: 15px; width: 390px;" class="lable4"><table width="81%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="right" valign="top" style="width: 186px; height: 75px" class="lable4">
                        <asp:TextBox ID="txtskill" runat="server" Height="68px" TextMode="MultiLine" Width="186px" CssClass="lable"></asp:TextBox>
                        &nbsp;
                  &nbsp; &nbsp;&nbsp;
                    </td>
                    <td class="labled" valign="top" style="height: 75px">&nbsp;&nbsp;&nbsp;&nbsp;&bull; Non-IT Professionals<br />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Eg: Institutional Sales, Direct Marketing etc.<br />
                      &nbsp;&nbsp;&nbsp;&nbsp;&bull; IT Professionals<br />
                      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Eg: Oracle, Unix, TIBCO, Java, PHP etc.</td>
                  </tr>
              </table>
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
              </td>
            </tr>
           
           
            
            <tr height="15">
              <td align="left" valign="middle" style="width: 202px; height: 15px;" class="lable">Functional Area <span style="color: #ff0000">*</span><font color="red"> </font> :</td>
              <td align="left" valign="middle" class="lable4" style="height: 15px; width: 390px;">
                 
                  <asp:DropDownList ID="fnarea" runat="server" Width="364px" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Select</asp:ListItem>
                  
                    <asp:ListItem value="Accounts / Finance / Tax / CS / Audit">Accounts / Finance / Tax / CS / Audit</asp:ListItem>
                   <asp:ListItem value="Agent">Agent</asp:ListItem>
                    <asp:ListItem value="Architecture / Interior Design">Architecture / Interior Design</asp:ListItem>
                    <asp:ListItem value="Banking / Insurance">Banking / Insurance</asp:ListItem>
                    <asp:ListItem value="Content / Journalism">Content / Journalism</asp:ListItem>
                    <asp:ListItem value="Corporate Planning / Consulting">Corporate Planning / Consulting</asp:ListItem>
                    <asp:ListItem value="Engineering Design / R and D">Engineering Design / R&amp; D</asp:ListItem>
                    <asp:ListItem value="Export / Import / Merchandising">Export / Import / Merchandising</asp:ListItem>
                    <asp:ListItem value="Fashion / Garments / Merchandising">Fashion / Garments / Merchandising</asp:ListItem>
                    <asp:ListItem value="Guards / Security Services">Guards / Security Services</asp:ListItem>
                    <asp:ListItem value="Hotels / Restaurants">Hotels / Restaurants</asp:ListItem>
                    <asp:ListItem value="HR / Administration / IR">HR / Administration / IR</asp:ListItem>
                    <asp:ListItem value="IT Software - Client Server">IT Software - Client Server</asp:ListItem>
                   <asp:ListItem value="IT Software - Mainframe">IT Software - Mainframe</asp:ListItem>
                   <asp:ListItem value="IT Software - Middleware">IT Software - Middleware</asp:ListItem>
                    <asp:ListItem value="IT Software - Mobile">IT Software - Mobile</asp:ListItem>
                    <asp:ListItem value="IT Software - Other">IT Software - Other</asp:ListItem>
                    <asp:ListItem value="IT Software - System Programming">IT Software - System Programming</asp:ListItem>
                    <asp:ListItem value="IT Software - Telecom Software">IT Software - Telecom Software</asp:ListItem>
                    <asp:ListItem value="IT Software- Application Programming / Maintenance">IT Software- Application Programming / Maintenance</asp:ListItem>
                    <asp:ListItem value="IT Software- DBA / Datawarehousing">IT Software- DBA / Datawarehousing</asp:ListItem>
                    <asp:ListItem value="IT Software- E-Commerce / Internet Technologies">IT Software- E-Commerce / Internet Technologies</asp:ListItem>
                    <asp:ListItem value="IT Software- Embedded / EDA / VLSI / ASIC / Chip Design">IT Software- Embedded / EDA / VLSI / ASIC / Chip Design</asp:ListItem>
                    <asp:ListItem value="IT Software- ERP / CRM">IT Software- ERP / CRM</asp:ListItem>
                    <asp:ListItem value="IT Software- Network Administration / Security">IT Software- Network Administration / Security</asp:ListItem>
                    <asp:ListItem value="IT Software- QA and Testing">IT Software- QA &amp; Testing</asp:ListItem>
                    <asp:ListItem value="IT Software- Systems / EDP / MIS">IT Software- Systems / EDP / MIS</asp:ListItem>
                    <asp:ListItem value="IT- Hardware / Telecom / Technical Staff / Support">IT- Hardware / Telecom / Technical Staff / Support</asp:ListItem>
                    <asp:ListItem value="ITES / BPO / KPO / Customer Service / Operations">ITES / BPO / KPO / Customer Service / Operations</asp:ListItem>
                   <asp:ListItem value="Legal">Legal</asp:ListItem>
                    <asp:ListItem value="Marketing / Advertising / MR / PR">Marketing / Advertising / MR / PR</asp:ListItem>
                    <asp:ListItem value="Packaging">Packaging</asp:ListItem>
                    <asp:ListItem value="Pharma / Biotech / Healthcare / Medical / R and D">Pharma / Biotech / Healthcare / Medical / R&amp; D</asp:ListItem>
                    <asp:ListItem value="Production / Maintenance / Quality">Production / Maintenance / Quality</asp:ListItem>
                    <asp:ListItem value="Purchase / Logistics / Supply Chain">Purchase / Logistics / Supply Chain</asp:ListItem>
                    <asp:ListItem value="Sales / BD">Sales / BD</asp:ListItem>
                    <asp:ListItem value="Secretary / Front Office / Data Entry">Secretary / Front Office / Data Entry</asp:ListItem>
                   <asp:ListItem value="Self Employed / Consultants">Self Employed / Consultants</asp:ListItem>
                   <asp:ListItem value="Site Engineering / Project Management">Site Engineering / Project Management</asp:ListItem>
                    <asp:ListItem value="Teaching / Education">Teaching / Education</asp:ListItem>
                   <asp:ListItem value="Ticketing / Travel / Airlines">Ticketing / Travel / Airlines</asp:ListItem>
                  <asp:ListItem value="Top Management">Top Management</asp:ListItem>
                   <asp:ListItem value="TV / Films / Production">TV / Films / Production</asp:ListItem>
                    <asp:ListItem value="Web / Graphic Design / Visualiser">Web / Graphic Design / Visualiser</asp:ListItem>
                   <asp:ListItem value="Other">Other</asp:ListItem>
                    
                 </asp:DropDownList><br />
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              </td>
            </tr>
            <tr height="9">
              <td align="right" valign="top" style="width: 202px; height: 9px;"></td>
              <td align="left" valign="top" style="width: 390px; height: 9px"></td>
            </tr>
            <tr height="15">
              <td align="left" valign="middle" style="width: 202px; height: 15px;" class="lable4"><span id="spanindtype_id" class="lable">Current Industry Type&nbsp; :</span></td>
              <td align="left" valign="top" style="height: 15px; width: 390px;" class="lable4">
                 <asp:DropDownList ID="indtype" runat="server" Width="364px" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Select IndustryType</asp:ListItem>
                  
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
              </asp:DropDownList><br />
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              </td>
            </tr>
            <tr height="15">
              <td align="right" valign="top" style="width: 202px; height: 15px;"></td>
              <td align="left" valign="top" style="height: 15px; width: 390px;"></td>
            </tr>
            <tr height="15">
              <td colspan="2" height="15" align="left" valign="middle" class="labled">Educational Qualifications</td>
            </tr>
            <tr height="15">
              <td align="right" valign="top" style="width: 202px; height: 15px;"></td>
              <td align="left" valign="top" style="width: 390px; height: 15px"></td>
            </tr>
            <tr height="15">
              <td align="left" valign="middle" style="width: 202px;" class="lable4"><span id="spanugcourse_id" class="lable">UG Course/ Basic Qualification <font color="red"> * </font> :&nbsp;</span></td>
              <td align="left" valign="top" class="lable" style="width: 390px">&nbsp;<asp:DropDownList ID="edu" runat="server" Width="188px" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Select</asp:ListItem>
                  
                     <asp:ListItem value="Not Pursuing Graduation">Not Pursuing Graduation</asp:ListItem>
                     <asp:ListItem value="B.A">B.A</asp:ListItem>
                     <asp:ListItem value="B.Arch">B.Arch</asp:ListItem>
                    <asp:ListItem value="BCA">BCA</asp:ListItem>
                     <asp:ListItem value="B.B.A">B.B.A</asp:ListItem>
                    <asp:ListItem value="B.Com">B.Com</asp:ListItem>
                    <asp:ListItem value="B.Ed">B.Ed</asp:ListItem>
                    <asp:ListItem value="BDS">BDS</asp:ListItem>
                   <asp:ListItem value="BHM">BHM</asp:ListItem>
                    <asp:ListItem value="B.Pharma">B.Pharma</asp:ListItem>
                    <asp:ListItem value="B.Sc">B.Sc</asp:ListItem>
                    <asp:ListItem value="B.Tech/B.E.">B.Tech/B.E.</asp:ListItem>
                    <asp:ListItem value="LLB">LLB</asp:ListItem>
                    <asp:ListItem value="MBBS">MBBS</asp:ListItem>
                    <asp:ListItem value="Diploma">Diploma</asp:ListItem>
                     <asp:ListItem value="BVSC">BVSC</asp:ListItem>
                    <asp:ListItem value="Other">None</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;<span class="lable4">Major in</span> <font color="red"> * </font>:
                  <asp:TextBox ID="edu_major" runat="server" Height="22px" CssClass="lable"></asp:TextBox></td>
            </tr>
            <tr height="9">
              <td align="right" valign="middle" style="width: 202px; height: 9px;"></td>
              <td align="left" valign="top" style="height: 9px; width: 390px;"></td>
            </tr>
            
            <tr height="15">
              <td align="left" valign="middle" style="width: 202px; height: 15px;" class="lable4"><span id="span1" class="lable">PG Course (if any) :</span></td>
              <td align="left" valign="top" class="lable" style="width: 390px; height: 15px">
                   <asp:DropDownList ID="pgcourse" runat="server" Width="188px" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Select</asp:ListItem>
<asp:ListItem value="CA" >CA</asp:ListItem>
<asp:ListItem value="CS" >CS</asp:ListItem>
<asp:ListItem value="ICWA" >ICWA</asp:ListItem>
<asp:ListItem value="Integrated PG" >Integrated PG</asp:ListItem>
<asp:ListItem value="LLM" >LLM</asp:ListItem>
<asp:ListItem value="M.A" >M.A</asp:ListItem>
<asp:ListItem value="M.Arch" >M.Arch</asp:ListItem>
<asp:ListItem value="M.Com" >M.Com</asp:ListItem>
<asp:ListItem value="M.Ed" >M.Ed</asp:ListItem>
<asp:ListItem value="M.Pharma" >M.Pharma</asp:ListItem>
<asp:ListItem value="M.Sc" >M.Sc</asp:ListItem>
<asp:ListItem value="M.Tech" >M.Tech</asp:ListItem>
<asp:ListItem value="MBA/PGDM" >MBA/PGDM</asp:ListItem>

<asp:ListItem value="MCA" >MCA</asp:ListItem>
<asp:ListItem value="MS" >MS</asp:ListItem>
<asp:ListItem value="PG Diploma" >PG Diploma</asp:ListItem>
<asp:ListItem value="MVSC" >MVSC</asp:ListItem>
<asp:ListItem value="MCM" >MCM</asp:ListItem>
<asp:ListItem value="Other" >Other</asp:ListItem>
                  </asp:DropDownList>
                &nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
            <tr height="9">
              <td align="right" valign="top" style="width: 202px; height: 9px;"></td>
              <td align="left" valign="top" style="width: 390px; height: 9px"></td>
            </tr>
            <tr height="15">
              <td align="left" valign="top" style="width: 202px; height: 15px;" class="lable4"><span id="span2" class="lable">Post PG Course (if any) :</span></td>
              <td align="left" valign="top" style="height: 15px; width: 390px;" class="lable">&nbsp;<asp:DropDownList ID="post_pg" runat="server" Width="188px" CssClass="lable">
                   
                    <asp:ListItem selected="True" Value="">Select</asp:ListItem>
<asp:ListItem value="Ph.D/Doctorate" >Ph.D/Doctorate</asp:ListItem>
<asp:ListItem value="MPHIL" >MPHIL</asp:ListItem>
<asp:ListItem value="Other" >Other</asp:ListItem>
 </asp:DropDownList>

</td>
            </tr>
    
    
    <!------------------------------------------------------------------------------------------------>
    
    
    
   
  
     <tr>
    
      <td style="width: 202px; height: 20px" class="lable" valign="bottom">Qualified Exam1
      </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="exam1" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
         </td>
    </tr>
    <tr>
      <td style="width: 202px; height: 20px" valign="bottom" class="lable" align="left">
          Upload Certificate</td>
      <td style="width: 390px; height: 20px;">
          <asp:FileUpload ID="FileUpload1" runat="server" CssClass="lable" Width="213px" />
          </td>
    </tr>
     <tr>
    
      <td style="width: 202px; height: 20px" class="lable" valign="bottom">Qualified Exam2
      </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="exam2" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
         </td>
    </tr>
     <tr>
      <td style="width: 202px; height: 20px" valign="bottom" class="lable" align="left">
          Upload Certificate </td>
      <td style="width: 390px; height: 20px;">
          <asp:FileUpload ID="FileUpload2" runat="server" CssClass="lable" Width="213px" />
          </td>
    </tr>
     <tr>
    
      <td style="width: 202px; height: 20px" class="lable" valign="bottom">Qualified Exam3
      </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="exam3" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
         </td>
    </tr>
     <tr>
      <td style="width: 202px; height: 20px" valign="bottom" class="lable" align="left">
          Upload Certificate </td>
      <td style="width: 390px; height: 20px;">
          <asp:FileUpload ID="FileUpload3" runat="server" CssClass="lable" Width="213px" />
          </td>
    </tr>
     <tr>
    
      <td style="width: 202px; height: 20px" class="lable" valign="bottom">Qualified Exam4
      </td>
      <td style="width: 390px; height: 20px;">
          <asp:TextBox ID="exam4" runat="server" CssClass="lable" Width="164px"></asp:TextBox>
         </td>
    </tr>
     <tr>
      <td style="width: 202px; height: 20px" valign="bottom" class="lable" align="left">
          Upload Certificate </td>
      <td style="width: 390px; height: 20px;">
          <asp:FileUpload ID="FileUpload4" runat="server" CssClass="lable" Width="213px" />
          </td>
    </tr>
    
    <tr>
      <td colspan="2" class="lable" style="height: 26px">
          <div align="left">
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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