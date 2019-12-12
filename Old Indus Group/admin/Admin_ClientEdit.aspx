<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_ClientEdit.aspx.cs" Inherits="Admin_ClientEdit" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
 <title>: : Indus Group : : - Admin Control Panel - ClientEdit</title>
<script language="JavaScript1.2" src="Jscripts/statesopt.js" type="text/javascript"></script>
<script language="JavaScript" src="Jscripts/empregvalidation.js" type="text/javascript"></script>
<link href="Styles/stylesheet.css" rel="stylesheet" type="text/css" />

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
<form id="regForm" name="regForm"  method="post" runat="server">
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

<table width="100%">
<tr height="19">
              <%-- <td align="center" class="toplft" height="15" ></td>--%>
              </tr>
              <tr height="190" width="100%">
             <%-- <td align="left" > </td>--%>
                <td  align="center" class="border"  valign="top" width="75%"  style="height: 190px;">
                <table width="100%" align="left" border="0" cellpadding="0" cellspacing="0">
    <tr height="8">
      <td align="left" valign="top" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"><asp:Label ID="lblmail" runat="server" Width="385px" Font-Italic="True" Font-Names="Arial" ForeColor="Red" Font-Size="Smaller"></asp:Label></td>
    </tr>
    <tr height="15">
      <td colspan="2" align="left" valign="top" bgcolor="#336699" class="headings style23" style="height: 14px">User id &amp; Password</td>
    </tr>
    <tr height="15">
      <td align="right" valign="top" width="20%" height="15"></td>
      <td align="left" valign="top" width="50%" height="15"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">User ID<font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtusername" runat="server" Height="19px" 
                                                Width="146px"></asp:TextBox>
        &nbsp;&nbsp; &nbsp; <span style="font-size: 9pt; color: #cf3131">Enter Email ID as User
              ID.</span><!---&nbsp; Tip: Use your email-id as your username---></td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" style="height: 9px"></td>
      <td align="right" valign="top" width="50%" style="height: 9px"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Password <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtpwd" runat="server" Height="19px" Width="146px" onblur='javascript:checkpwdlen();' ></asp:TextBox>
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <span class="login">Length should be 6 characters or more.</td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Confirm Password <font color="red"> * </font> :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtconpwd" runat="server" Height="19px"
                                                Width="146px" onblur='javascript:checkpwd();'></asp:TextBox>
        </td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">
          Company Name <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtcompname" runat="server" Height="19px" 
                                                 Width="146px"></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Company Mail id<font color="red"> * </font> :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtcompmail" runat="server" Height="19px" 
                                                Width="146px" onblur='javascript:echeck();'></asp:TextBox>
        </td>
    </tr>
    <tr height="15">
      <td align="right" valign="top" width="20%" height="15"></td>
      <td align="left" valign="top" width="50%" height="15"></td>
    </tr>
    <tr height="15" class="headings">
      <td width="20%" height="15" align="left" valign="top" bgcolor="#336699"><span class="style23">Company Information</span></td>
      <td width="50%" height="15" align="left" valign="top" bgcolor="#336699"></td>
    </tr>
    <tr height="15">
      <td align="left" valign="top" width="20%" height="15"></td>
      <td align="left" valign="top" width="50%" height="15"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Industry Type <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:DropDownList ID="indtype" runat="server" Width="344px" CssClass="lable">
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
    <tr height="8">
      <td align="left" valign="middle" width="20%" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Contact Person <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="conperson" runat="server" Width="146px"> 
                                                </asp:TextBox>
       </td>
    </tr>
    <tr height="8">
      <td align="left" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable">Contact Person's Designation<font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="cpersondesig" runat="server" Width="146px">
                                                </asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td align="right" valign="middle" width="20%" height="8"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable"> URL <font color="red"> * </font> :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txturl" runat="server"  onblur='javascript:checkDomain();'>
                                               </asp:TextBox>
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td align="right" valign="middle" width="20%" style="height: 19px" class="lable"> Brief Description <font color="red"> * </font> :</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="txtdesc" runat="server" Height="70px" TextMode="MultiLine" Width="310px"></asp:TextBox>
      </td>
    </tr>
    <tr height="15">
      <td width="20%" height="2" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%"></td>
    </tr>
    <tr height="15" class="headings">
      <td height="2" colspan="2" align="left" valign="middle" bgcolor="#336699"><span class="style23">Primary Contact Details</span></td>
    </tr>
    <tr height="15">
      <td width="20%" height="2" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="middle" style="height: 19px" class="lable">Address for Communication<font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="praddr" runat="server" Width="181px" Height="19px" 
                                                ></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td width="20%" align="right" valign="middle" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 19px" class="lable">Street Address<font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="staddr" runat="server" Width="181px" 
                                                ></asp:TextBox>
      </td>
    </tr>
    <tr height="8">
      <td width="20%" align="right" valign="top" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 22px" class="lable"> Country <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 22px" class="lable">&nbsp;&nbsp;
        <asp:DropDownList ID="country" runat="server" Width="160px"  onchange='javascript:statepopfn();' CssClass="lable">
          <asp:ListItem Selected="True" Value=''>Select your Country</asp:ListItem>
          <asp:ListItem Value="1">USA / Canada</asp:ListItem>
          <asp:ListItem Value="2">India</asp:ListItem>
          <asp:ListItem Value="3">UK / Europe</asp:ListItem>
          <asp:ListItem Value="4">Nepal</asp:ListItem>
          <asp:ListItem Value="5">China</asp:ListItem>
          <asp:ListItem Value="6">Australla</asp:ListItem>
          <asp:ListItem Value="7">Russia</asp:ListItem>
          <asp:ListItem Value="8">New Zealand</asp:ListItem>
          <asp:ListItem Value="9">Singapore</asp:ListItem>
          <asp:ListItem Value="10">Hong Kong</asp:ListItem>
          <asp:ListItem Value="11">Phillipines</asp:ListItem>
          <asp:ListItem Value="12">Malaysia</asp:ListItem>
          <asp:ListItem Value="13">Pakistan</asp:ListItem>
          <asp:ListItem Value="14">UAE</asp:ListItem>
          <asp:ListItem Value="15">Africa</asp:ListItem>
          <asp:ListItem Value="16">South America</asp:ListItem>
          <asp:ListItem Value="17">Bangladesh</asp:ListItem>
        </asp:DropDownList>
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 22px" class="lable">State <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 22px" class="lable">&nbsp;&nbsp;
        <asp:DropDownList ID="state" runat="server" 
                                                Width="160px" CssClass="lable">
                                                <asp:ListItem Selected="True" Value=''>Select your State</asp:ListItem>
        </asp:DropDownList>
       </td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="15">
      <td width="20%" align="right" valign="top" style="height: 19px" class="lable"><span id="spanindtype_id">City<font color="red"> * </font>:</span></td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <asp:TextBox ID="city" runat="server" Height="19px"
                                                Width="181px"></asp:TextBox>
      </td>
    </tr>
    <tr height="19">
      <td width="20%" align="right" valign="middle" style="height: 19px" class="lable"> Phone <font color="red"> * </font>:</td>
      <td align="left" valign="top" width="50%" style="height: 19px" class="lable">&nbsp;&nbsp;
          <table class="bodytext" align="center" width="94%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
              <tr>
                <td class="login" style="width: 63px">&nbsp;</td>
                <td class="login" style="width: 108px">Country Code</td>
                <td class="login" style="width: 88px">Area Code</td>
                <td class="login" style="width: 152px">Phone No.</td>
              </tr>
              <tr>
                <td style="width: 63px; height: 19px" class="lable"><span id="spanrphone_id">Work 1<font color="red"> * </font>:</span></td>
                <td style="width: 108px; height: 19px" class="lable"><asp:TextBox ID="W1_ccode" runat="server" Width="72px"  onblur='javascript:chknum(this);'></asp:TextBox>
                    <br />
                </td>
                <td style="width: 88px; height: 19px" class="lable"><asp:TextBox ID="W1_acode" runat="server" Width="72px"  onblur='javascript:chknum(this);'></asp:TextBox>
                    <br />
                </td>
                <td style="height: 19px; width: 152px;" class="lable"><asp:TextBox ID="W1_phno" runat="server" Width="98px" onblur='javascript:chknum(this);'></asp:TextBox>
                  &nbsp; <br />
                </td>
              </tr>
              <tr>
                <td style="width: 63px; height: 19px;" class="lable"><span id="span1">Work 2 :</span></td>
                <td style="width: 108px; height: 19px;"><asp:TextBox ID="W2_ccode" runat="server" Width="60px" onblur='javascript:chknum(this);'></asp:TextBox></td>
                <td style="width: 88px; height: 19px;" class="lable"><asp:TextBox ID="W2_acode" runat="server" Width="60px" onblur='javascript:chknum(this);'></asp:TextBox></td>
                <td style="width: 152px; height: 19px" class="lable"><asp:TextBox ID="W2_phno" runat="server" Width="90px" onblur='javascript:chknum(this);'></asp:TextBox></td>
              </tr>
              <tr>
                <td colspan="4" width="472" class="lable"><span class="rednormaltext"></span></td>
              </tr>
                <tr>
                    <td class="lable" style="width: 63px; height: 19px">
                        Mobile <span style="color: #ff0000">* </span>:</td>
                    <td class="lable" colspan="3" style="height: 19px" width="417">
                        <asp:TextBox ID="mobile" runat="server" onblur="javascript:chknum(this);" Width="141px"></asp:TextBox></td>
                </tr>
              <tr>
                <td style="width: 63px; height: 19px" class="lable"><span id="spanmphone_id">Fax  <span style="color: #ff0000">* </span>:</span></td>
                <td colspan="3" width="417" style="height: 19px" class="lable">
                    <asp:TextBox ID="txtfax" runat="server" Width="141px" onblur='javascript:chknum(this);'></asp:TextBox>
                  <span class="rednormaltext"></span><span class="rednormaltext"></span></td>
              </tr>
            </tbody>
          </table>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        </td>
    </tr>
    <tr height="19">
      <td width="20%" colspan='2' height="19" align="left" valign="middle"><span class="login">&nbsp;&nbsp;	Fields marked with <font color="red"> * </font> are Mandatory. </span></td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="right" valign="middle"></td>
      <td align="left" valign="top" width="50%" height="7"></td>
    </tr>
    <tr height="8">
      <td width="20%" height="8" align="left" valign="top"></td>
      <td align="left" valign="top" width="50%" height="8"></td>
    </tr>
    <tr height="8">
      <td width="20%" align="left" valign="top" style="height: 8px"></td>
      <td align="left" valign="top" width="50%" style="height: 8px"></td>
    </tr>
    <tr height="15">
      <td colspan="2" align="center" valign="top" style="height: 19px" class="lable"><asp:Button ID="btn_continue" runat="server" Text="Accept &amp; Continue" Width="142px" BackColor="Silver" BorderColor="Transparent" BorderStyle="Inset" Font-Bold="True" Font-Size="xSmall" ForeColor="#004040" OnClick="btn_continue_Click" />  
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

