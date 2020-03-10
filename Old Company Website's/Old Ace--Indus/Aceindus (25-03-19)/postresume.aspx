<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PostResume.aspx.cs" Inherits="PostResume" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />

    <style>
        b, h3 {
            color: darkblue;
        }

        b {
            font-family: 'Lato', sans-serif;
            font-weight: bold;
        }

        p {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px;
        }

        .col-sm-9 ul li {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            padding: 5px 0;
        }

        .some {
            padding: 20px 2px;
        }

            .some .col-sm-3 {
                margin: 0 0 1% 0;
            }

                .some .col-sm-3 img, iframe {
                    border: 1px solid darkblue;
                    border-radius: 5px;
                    padding: 10px;
                }
                 .feed 
     {    width: 80%;
    border:1px solid gray;
    border-radius: 4px;
    padding: 4px 0px 4px 10px;
    background-position: 10px 5px;
    background-repeat: no-repeat;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
    height: 30px;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>
    <div style="padding: 10px;">
        <div class="row">
            <div class="col-sm-9">
                <h3>Post Your Resume :
                </h3>

                <table width="100%" align="center">
                    <tr>
                         <td   valign="top" >
                       <table border="0" width="100%">
                        <tr>
                            <td colspan="5" style="height:15px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:center;">
                                <table border="0" width="98%"  style="background:url(images/regiterlinebg.png) repeat-x">
                                    <tr>
                                        <td width="1%" height="30">&nbsp;</td>
                                        <td height="30">
                                            <span style="text-align:center;font-size:18px;padding-right:450px;font-weight:bold;">Create Login Details</span></td>
                                        <td width="1%" height="30">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <asp:Label ID="lblusername" runat="server" Text="">
                                <font color="red"><strong>*</strong></font>Email</asp:Label>
                            </td>
                            <td width="2%" height="30">&nbsp;</td>
                            <td><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtemail" runat="server" Width="300px" CssClass="feed" TabIndex="1"></asp:TextBox></td>
                            <td width="30%">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Please Enter Valid Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail" Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RegularExpressionValidator><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Please Enter Your Email Address." ControlToValidate="txtemail" 
                                    Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                           
                        <tr>
                            <td align="right"><asp:Label ID="lblpwd" runat="server" Text=""><font color="red"><strong>*</strong></font>Password</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                             <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtpwd" runat="server" Width="300px" TextMode="Password" CssClass="feed" TabIndex="2"></asp:TextBox></td>
                            <td width="30%">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ForeColor="Red"
                                ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                                Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td align="right"><asp:Label ID="lblcnfpwd" runat="server" Text=""><font color="red"><strong>*</strong></font> Confirm the Password</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                             <td width="1%"><strong>:</strong></td>
                            <td><asp:TextBox ID="txtcnfpwd" runat="server" Width="300px" TextMode="Password" CssClass="feed" TabIndex="3"></asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="txtcnfpwd" 
                                    ErrorMessage="Please Enter Your Confirm Password." Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server"  Display="Dynamic" ForeColor="Red"

                                    ControlToValidate="txtcnfpwd" ControlToCompare="txtpwd" 
                                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height:15px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:center;">
                                <table border="0" width="98%" style="background:url(images/regiterlinebg.png) repeat-x">
                                    <tr>
                                        <td width="1%" height="30">&nbsp;</td>
                                        <td colspan="5" height="30">
                                           <span style="text-align:center;font-size:18px;padding-right:450px;font-weight:bold;">Contact Information</span></td>
                                        <td width="1%" height="30">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><asp:Label ID="lblname" runat="server" Text="Full Name"></asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                          
                              <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtfullname" runat="server" Width="300px" CssClass="feed" TabIndex="4"></asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ForeColor="Red"
                                ControlToValidate="txtfullname" ErrorMessage="Please enter the Full Name" 
                                Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         

                        <tr>
                            <td align="right"><asp:Label ID="lbllocation" runat="server" Text=""><font color="red"><strong>*</strong></font>Current Location</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                          
                              <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtlocation" runat="server" Width="300px" CssClass="feed" TabIndex="5"></asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ForeColor="Red"
                                ControlToValidate="txtlocation" ErrorMessage="Please enter the Current Location." 
                                Font-Size="Smaller" ValidationGroup="post" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td align="right"><asp:Label ID="lblmob" runat="server" Text=""><font color="red"><strong>*</strong></font>Mobile Number</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                            
                            <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtmob" runat="server" Width="300px" MaxLength="10" CssClass="feed" TabIndex="6"></asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ForeColor="Red"
                                ControlToValidate="txtmob" ErrorMessage="Please enter the Mobile Number" SetFocusOnError="true" Display="dynamic"
                                Font-Size="Smaller" ValidationGroup="post"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtmob"  ForeColor="Red" Display="dynamic" SetFocusOnError="true"
                                          ErrorMessage="Enter Valid 10 digits number"  ValidationExpression="^[0-9]{10}$" ValidationGroup="post" ></asp:RegularExpressionValidator>
                                                      <cc1:filteredtextboxextender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars="~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="0123456789" TargetControlID="txtmob" ></cc1:filteredtextboxextender>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height:15px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:center;">
                                <table border="0" width="98%" style="background:url(images/regiterlinebg.png) repeat-x">
                                    <tr>
                                        <td width="1%" height="30">&nbsp;</td>
                                        <td  height="30" colspan="5">
                                            <span style="text-align:center;font-size:18px;padding-right:450px;font-weight:bold;">Current Employment Details</span></td>
                                        <td width="1%" height="30">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><asp:Label ID="Label1" runat="server" Text=""><font color="red"><strong>*</strong></font>Work Experience</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                             <td width="1%"><strong>:</strong></td>
                            <td Width="300px">
                                <table  width="100%">
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlyears" runat="server" width="90px" CssClass="feed">
                                                <asp:ListItem>Years</asp:ListItem>
                                                <asp:ListItem>Fresher</asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30+</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlmonths" runat="server" Width="90px" CssClass="feed">
                                                <asp:ListItem>Months</asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"  ForeColor="Red" Display="Dynamic"
                                    ControlToValidate="ddlyears" InitialValue="Years" SetFocusOnError="true"
                                    ErrorMessage="Please Select the Years." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="ddlmonths" InitialValue="Months" SetFocusOnError="true"
                                    ErrorMessage="Please Select the Month." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                       </tr>
                       <tr>
                            <td align="right"><asp:Label ID="lblskills" runat="server" Text=""><font color="red"><strong>*</strong></font>Key Skills?</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                            <td width="1%"><strong>:</strong></td>
                            <td><asp:TextBox ID="txtskills" TextMode="MultiLine" runat="server" Height="60px"  CssClass="feed" TabIndex="7"
                                    Width="300px"></asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  ForeColor="Red" SetFocusOnError="true"
                                    ControlToValidate="txtskills" ErrorMessage="Please Enter Your Skills" Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td align="right"><asp:Label ID="lblheadingprofile" runat="server" Text="">
                                <font color="red"><strong>*</strong></font>Applying For The Position</asp:Label></td>
                           
                            <td width="2%" height="30">&nbsp;</td>
                               <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;"><asp:TextBox ID="txtheadingprofile" runat="server" Width="300px" CssClass="feed" TabIndex="8"> </asp:TextBox></td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  ForeColor="Red"
                                    ControlToValidate="txtheadingprofile" ErrorMessage="Please Enter Your Profile Heading" SetFocusOnError="true" Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td align="right"><asp:Label ID="Label2" runat="server" Text="">
                                <font color="red"><strong>*</strong></font> Which Industry does your Company belong to?</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>

                            <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlindustry" runat="server" Width="300px" CssClass="feed">
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
                                    <asp:ListItem value="Textiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
                                    <asp:ListItem value="Tyres">Tyres</asp:ListItem>
                                    <asp:ListItem value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"  ForeColor="Red"
                                    ControlToValidate="ddlindustry" InitialValue="Select Industry Type" SetFocusOnError="true" 
                                    ErrorMessage="Please Select Your Industry." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>
                         <tr>
                          
                               <td align="right"><asp:Label ID="Label3" runat="server" Text=""><font color="red"><strong>*</strong></font>Functional Area</asp:Label></td>
                           
                            <td width="2%" height="30">&nbsp;</td>
                              <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlfunctionalarea" runat="server" Width="300px" CssClass="feed">
                                    <asp:ListItem Selected="True">Select Functional Area</asp:ListItem>
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
                                    <asp:ListItem value="Textiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
                                    <asp:ListItem value="Tyres">Tyres</asp:ListItem>
                                    <asp:ListItem value="Other">Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"  ForeColor="Red"
                                    ControlToValidate="ddlfunctionalarea" InitialValue="Select Functional Area" SetFocusOnError="true"
                                    ErrorMessage="Please Select Your Functional Area." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>
                         <tr>
                            <td colspan="5" style="height:15px"></td>
                        </tr>
                         <tr>
                            <td colspan="5" style="text-align:center;">
                                <table border="0" width="98%" style="background:url(images/regiterlinebg.png) repeat-x">
                                    <tr>
                                        <td width="1%" height="30">&nbsp;</td>
                                        <td colspan="5" height="30">
                                            <span style="text-align:center;font-size:18px;padding-right:450px;font-weight:bold;">Your Education Background</span></td>
                                        <td width="1%" height="30">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="right"><asp:Label ID="Label4" runat="server" Text=""><font color="red"><strong>*</strong></font>Basic Education</asp:Label></td>
                           
                            <td width="2%" height="30">&nbsp;</td>
                             <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlbasicedu" runat="server" Width="300px" CssClass="feed">
                                    <asp:ListItem Selected="True">Select</asp:ListItem>
                                    <asp:ListItem>10+</asp:ListItem>
                                    <asp:ListItem>Intermediate</asp:ListItem>
                                 </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"  ForeColor="Red"
                                    ControlToValidate="ddlbasicedu" InitialValue="Select" SetFocusOnError="true"
                                    ErrorMessage="Please Select Your Basic Education." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>
                         <tr>
                            <td align="right"><asp:Label ID="Label6" runat="server" Text=""><font color="red"><strong>*</strong></font>Master Education</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                              <td width="1%"><strong>:</strong></td>
                            <td style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlmasteredu" runat="server" Width="300px" CssClass="feed">
                                    <asp:ListItem Selected="True">Select</asp:ListItem>
                                    <asp:ListItem>BSC Degree</asp:ListItem>
                                    <asp:ListItem>B.Tech</asp:ListItem>
                                    <asp:ListItem>Post Graduation(P.G)</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"  ForeColor="Red"
                                    ControlToValidate="ddlmasteredu" InitialValue="Select" SetFocusOnError="true" 
                                    ErrorMessage="Please Select Your Master Education." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>
                         <tr>
                            <td colspan="5" style="height:15px"></td>
                        </tr>
                         <tr>
                            <td colspan="5" style="text-align:center;">
                                <table border="0" width="98%" style="background:url(images/regiterlinebg.png) repeat-x">
                                    <tr>
                                        <td width="1%" height="30">&nbsp;</td>
                                        <td colspan="5" height="30">
                                            <span style="text-align:center;font-size:18px;font-weight:bold;padding-right:450px;">Upload Your Resume</span></td>
                                        <td width="1%" height="30">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                             <tr>
                            <td align="right"><asp:Label ID="Label5" runat="server" Text=""><font color="red"><strong>*</strong></font>Supported Formats: doc, docx, rtf. Max file size: 300 Kb</asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                           
                              <td width="1%"><strong>:</strong></td>
                            <td>
                              <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                            <td width="30%">
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"  ForeColor="Red" SetFocusOnError="true"
                                    ControlToValidate="FileUpload1" ErrorMessage="Please Upload Your Resume." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>
<%--                        <tr>
                            <td align="right"><font color="red"><strong>*</strong></font> 
                                <asp:Label ID="Label8" runat="server" Font-Size="10px"  Text="Supported Formats: doc, docx, rtf. Max file size: 300 Kb"></asp:Label></td>
                            <td width="2%" height="30">&nbsp;</td>
                            
                            <td width="1%"><strong>:</strong></td>
                            <td colspan="2"><asp:FileUpload ID="FileUpload1" runat="server" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ControlToValidate="FileUpload1" ErrorMessage="Please Upload Your Resume." Font-Size="Smaller" ValidationGroup="post">
                                </asp:RequiredFieldValidator>
                            </td>
                         </tr>--%> 
                         <tr>
                            <td colspan="5" style="height:50px"></td>
                        </tr>
                         <tr>
                            <td colspan="5" align="center">
                                <table border="0" width="20%">
                                    <tr>
                                        <td><%--<asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                                                onclick="btnsubmit_Click" ValidationGroup="post" />--%>
                                   <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" CssClass="btn btn-success" Text="Submit" ValidationGroup="post"  />
                                            

                                        </td>
                                        <td><asp:Button ID="btnreset" runat="server" Text="Reset"  CssClass="btn btn-danger" 
                                                onclick="btnreset_Click" /></td>
                                    </tr>
                                </table>
                                   <%--<asp:Button ID="Button1" runat="server" OnClick="btnsubmit_Click" CssClass="btn btn-success" Text="Submit" ValidationGroup="feedback" />--%>
        <%--<asp:Button ID="Button2" runat="server" OnClick="btnreset_Click" CssClass="btn btn-danger" Text="Reset" />--%>
                            </td>
                         </tr>     
                       </table>   
                    </td>
                    </tr>
                </table>
            </div>

            <div class="col-lg-3">
                <uc1:Right runat="server" ID="Right" />
            </div>

        </div>
    </div>
</asp:Content>

