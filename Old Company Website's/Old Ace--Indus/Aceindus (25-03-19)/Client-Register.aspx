<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Client-Register.aspx.cs" Inherits="Client_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .feed1 {
            width: 30%;
            border: 1px solid gray;
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
    <div style="padding: 10px;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <br />
                <h2 style="text-align: center;">Client Registration</h2>
                <br />
                <table width="100%" align="center">
               
                    <tr>
                        <td height="30" align="left" colspan="4" style="background: url(images/regiterlinebg.png) repeat-x"> 
                            <font ><b>User ID &amp; Password</b></font>

                        </td>
                    </tr>
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                        <td width="30%" align="left">
                            <asp:TextBox ID="txtusername" runat="server" Width="250px"  CssClass="feed1"
                                OnTextChanged="txtusername_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <div id="checkusername" runat="server" visible="false">
                                
                                <asp:Image ID="imgstatus" ImageUrl="~/admin/images/check.gif" runat="server" Width="17px" Height="17px" />
                                <asp:Label ID="CheckAvailability" runat="server">Check Availability</asp:Label>&nbsp;&nbsp;&nbsp;
                            </div>
                        </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                ControlToValidate="txtusername" ErrorMessage="Please enter  User Name"
                                Font-Size="Smaller" Display="Dynamic" Font-Overline="False" SetFocusOnError="True" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                        </td>
                      <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtpwd" runat="server" Width="250px" TextMode="Password" CssClass="feed1"></asp:TextBox>
                    </td>
                         <td width="30%" align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtpwd" ErrorMessage="Please enter  Password"
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
             
                    <tr>
                         <td width="30%" align="right">
                            <asp:Label ID="lblconfirmpwd" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtconfirmpwd" runat="server" Width="250px" CssClass="feed1"
                                TextMode="Password"></asp:TextBox>
                          </td>
                         <td width="30%" align="left">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" ErrorMessage="Please enter re-password" ValidationGroup="client">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd"
                                ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="client"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
                 
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblcompanyname" runat="server" Text="Company Name"></asp:Label>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                        <td width="30%" align="left">
                            <asp:TextBox ID="txtcompanyname" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                       </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name"
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
               
                    <tr>
                         <td width="30%" align="right">
                            <asp:Label ID="lblcompanymailid" runat="server" Text="Company Mail ID"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                       <td width="30%" align="left">
                            <asp:TextBox ID="txtcompanymailid" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                           </td>
                         <td width="30%" align="left">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="Please Enter Valid Email Address"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="client"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Display="Dynamic"
                                 ErrorMessage="Enter Company Mail ID" ControlToValidate="txtcompanymailid" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
                 
                    <tr>
                        <td height="30" colspan="4" style="background: url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
                    </tr>
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="ddlindustype" runat="server" Text="Industry Type"></asp:Label>
                        </td>
                         <td width="10%" align="center"><strong>:</strong></td>
                        <td width="30%" align="left">
                            <asp:DropDownList ID="ddlindtype" runat="server" Width="250px" 
                                CssClass="feed1">
                                <asp:ListItem Selected="True">Select Industry Type</asp:ListItem>
                                <asp:ListItem Value="Accounting/Taxation/Finance">Accounting/Taxation/Finance</asp:ListItem>
                                <asp:ListItem Value="Advertising/PR/MR/Events">Advertising/PR/MR/Events</asp:ListItem>
                                <asp:ListItem Value="Agriculture/Dairy">Agriculture/Dairy</asp:ListItem>
                                <asp:ListItem Value="Architecture/Interior Designing">Architecture/Interior Designing</asp:ListItem>
                                <asp:ListItem Value="Auto/Auto Ancillary">Auto/Auto Ancillary</asp:ListItem>
                                <asp:ListItem Value="Banking/Financial Services/Broking">Banking/Financial Services/Broking</asp:ListItem>
                                <asp:ListItem Value="BPO/ITES/CRM/Transcription">BPO/ITES/CRM/Transcription</asp:ListItem>
                                <asp:ListItem Value="Chemicals/PetroChemical/Plastic/Rubber">Chemicals/PetroChemical/Plastic/Rubber</asp:ListItem>
                                <asp:ListItem Value="Construction/Engineering/Cement/Metals">Construction/Engineering/Cement/Metals</asp:ListItem>
                                <asp:ListItem Value="Consumer Durables">Consumer Durables</asp:ListItem>
                                <asp:ListItem Value="Courier/Transportation/Freight">Courier/Transportation/Freight</asp:ListItem>
                                <asp:ListItem Value="Defence/Government">Defence/Government</asp:ListItem>
                                <asp:ListItem Value="Education/Teaching/Training">Education/Teaching/Training</asp:ListItem>
                                <asp:ListItem Value="Export/Import">Export/Import</asp:ListItem>
                                <asp:ListItem Value="Fertilizers/Pesticides">Fertilizers/Pesticides</asp:ListItem>
                                <asp:ListItem Value="FMCG/Foods/Beverage">FMCG/Foods/Beverage</asp:ListItem>
                                <asp:ListItem Value="Fresher/Trainee">Fresher/Trainee</asp:ListItem>
                                <asp:ListItem Value="Gems and Jewellery">Gems&amp; Jewellery</asp:ListItem>
                                <asp:ListItem Value="Hotels/Restaurants/Airlines/Travel">Hotels/Restaurants/Airlines/Travel</asp:ListItem>
                                <asp:ListItem Value="Industrial Products/Heavy Machinery">Industrial Products/Heavy Machinery</asp:ListItem>
                                <asp:ListItem Value="Insurance">Insurance</asp:ListItem>
                                <asp:ListItem Value="IT-Software/Software Services">IT-Software/Software Services</asp:ListItem>
                                <asp:ListItem Value="IT-Hardware and Networking">IT-Hardware&amp; Networking</asp:ListItem>
                                <asp:ListItem Value="Telcom/ISP">Telcom/ISP</asp:ListItem>
                                <asp:ListItem Value="Legal">Legal</asp:ListItem>
                                <asp:ListItem Value="Media/Dotcom/Entertainment">Media/Dotcom/Entertainment</asp:ListItem>
                                <asp:ListItem Value="Medical/Healthcare/Hospital">Medical/Healthcare/Hospital</asp:ListItem>
                                <asp:ListItem Value="NGO/Social Services">NGO/Social Services</asp:ListItem>
                                <asp:ListItem Value="Office Equipment/Automation">Office Equipment/Automation</asp:ListItem>
                                <asp:ListItem Value="Oil and Gas/Power/Infrastructure/Energy">Oil and Gas/Power/Infrastructure/Energy</asp:ListItem>
                                <asp:ListItem Value="Paper">Paper</asp:ListItem>
                                <asp:ListItem Value="Pharma/Biotech/Clinical Research">Pharma/Biotech/Clinical Research</asp:ListItem>
                                <asp:ListItem Value="Printing/Packaging">Printing/Packaging</asp:ListItem>
                                <asp:ListItem Value="Real Estate/Property">Real Estate/Property</asp:ListItem>
                                <asp:ListItem Value="Recruitment/Employment Firm">Recruitment/Employment Firm</asp:ListItem>
                                <asp:ListItem Value="Retailing">Retailing</asp:ListItem>
                                <asp:ListItem Value="Security/Law Enforcement">Security/Law Enforcement</asp:ListItem>
                                <asp:ListItem Value="Semiconductors/Electronics">Semiconductors/Electronics</asp:ListItem>
                                <asp:ListItem Value="Shipping/Marine">Shipping/Marine</asp:ListItem>
                                <asp:ListItem Value="Textiles/Garments/Accessories">Textiles/Garments/Accessories</asp:ListItem>
                                <asp:ListItem Value="Tyres">Tyres</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                         <td width="30%" align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                ControlToValidate="ddlindtype" InitialValue="Select Industry Type"
                                ErrorMessage="Please Select the Industry Type." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
              
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblcontactperson" runat="server" Text="Contact Person"></asp:Label>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtcontactperson" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                             </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="txtcontactperson"
                                ErrorMessage="Please enter the Contact Person" Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>

                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lblcontactpersondesg" runat="server" Text="Contact Person's Designation"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                      <td width="30%" align="left">
                            <asp:TextBox ID="txtcontactpersondesg" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                          </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtcontactpersondesg"
                                ErrorMessage="Please enter the Designation." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
           
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lblurl" runat="server" Text="URL"></asp:Label>
                        </td>
                          <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtulr" runat="server"  Width="250px" CssClass="feed1"></asp:TextBox>
                             </td>
                         <td width="30%" align="left">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                ControlToValidate="txtulr" ErrorMessage="Please enter the URL."
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
            
                    <tr>
                         <td width="30%" align="right">
                            <asp:Label ID="lbldesc" runat="server" Text="Brief Description"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="60px"
                                Width="250px" CssClass="feed1"></asp:TextBox>
                             </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                ControlToValidate="txtdesc" ErrorMessage="Please enter the Description."
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
             
                    <tr>
                        <td height="30" colspan="4" style="background: url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
                    </tr>
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lbladdrforommunication" runat="server" Text="Address for Communication"></asp:Label>
                        </td>
                         <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:TextBox ID="txtaddrforcommunication" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                             </td>
                         <td width="30%" align="left">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                ControlToValidate="txtaddrforcommunication"
                                ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
               
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblstreetaddr" runat="server" Text="Street Address"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                       <td width="30%" align="left">
                            <asp:TextBox ID="txtstreetaddr" runat="server" Width="250px" CssClass="feed1"></asp:TextBox>
                           </td>
                         <td width="30%" align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                ControlToValidate="txtstreetaddr"
                                ErrorMessage="Please enter the Street Address." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
         
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblcountry" runat="server" Text="Country"></asp:Label>
                        </td>
                       <td width="10%" align="center"><strong>:</strong></td>
                         <td width="30%" align="left">
                            <asp:DropDownList ID="country" runat="server"   Width="250px" CssClass="feed1"
                                BorderWidth="1" AutoPostBack="true"
                                OnSelectedIndexChanged="country_SelectedIndexChanged">

                                <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                            </asp:DropDownList>
                             </td>
                         <td width="30%" align="left">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="country" InitialValue="Select your Country"
                                ErrorMessage="Please Select the Country." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
            
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>
                        </td>
                                               <td width="10%" align="center"><strong>:</strong></td>
                       <td width="30%" align="left">
                            <asp:DropDownList ID="state" runat="server"  Width="250px" CssClass="feed1"
                                OnSelectedIndexChanged="country_SelectedIndexChanged">
                                <asp:ListItem Value="Select Country">Select State</asp:ListItem>
                            </asp:DropDownList>
                           </td>
                         <td width="30%" align="left">
                            <asp:RequiredFieldValidator ID="rfvstate" runat="server"
                                ControlToValidate="state" InitialValue="Select your State"
                                ErrorMessage="Please Select the State." Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
         
                    <tr>
                       <td width="30%" align="right">
                            <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                        <td width="30%" align="left">
                            <asp:TextBox ID="txtcity" runat="server"  Width="250px" CssClass="feed1"></asp:TextBox>
                            </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                ControlToValidate="txtcity" ErrorMessage="Please enter the City."
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
        
                    <tr>
                         <td width="30%" align="right">
                            <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td width="10%" align="center"><strong>:</strong></td>
                        <td width="30%" align="left">
                            <asp:TextBox ID="txtphone" runat="server"  Width="250px" CssClass="feed1" MaxLength="10"></asp:TextBox>
                            </td>
                         <td width="30%" align="left">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number."
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
       
                    <tr>
                        <td width="30%" align="right">
                            <asp:Label ID="lblFax" runat="server" Text="Fax"></asp:Label>
                        </td>
                         <td width="10%" align="center"><strong>:</strong></td>
                       <td width="30%" align="left">
                            <asp:TextBox ID="txtfax" runat="server" Width="250px" CssClass="feed1" MaxLength="12"></asp:TextBox>
                           </td>
                         <td width="30%" align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number."
                                Font-Size="Smaller" ValidationGroup="client"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>
             
                    <tr>
                        <td height="30" colspan="4" style="background: url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Terms &amp; Conditions</b></font></td>
                    </tr>
                    <tr height="10px">
                        <td colspan="4" align="center" valign="top" >
                                          <table border="0">
                                              <tr>
                                                  <td valign="top">
                                                      <asp:CheckBox ID="CheckBox1" runat="server" />
                                                  </td>
                                                  <td width="100%">
                                                      <p>I have read and understood and agree to the <a href="#">Terms and Conditions</a> governing the use of careersgen.com. You must agree to the terms and conditions before you can continue.</p>
                                                      <asp:CustomValidator ID="CustomValidator1" runat="server"
                                                          ErrorMessage="Please select the checkbox." Text="Please select the checkbox."
                                                          OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="client"></asp:CustomValidator>
                                                  </td>
                                              </tr>
                                          </table>
                        </td>
                    </tr>
                    <tr><td height="2px">&nbsp;</td></tr>

                    <tr>
                        <td width="100%" colspan="4" align="center">
                            <table border="0" width="100%">
                                <tr>
                                    <td width="100%" align="center">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success"
                                            OnClick="btnsubmit_Click" ValidationGroup="client" />
                                    
                                        <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-danger"
                                            OnClick="btnreset_Click" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblerror" runat="server" Text="lblerror"></asp:Label></td>
                    </tr>
                </table>

            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>

