<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Advertisement.aspx.cs" Inherits="Advertisement" %>

<%@ Register Assembly="Recaptcha" Namespace="Recaptcha"  TagPrefix="recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/jquery-1.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
     <script type="text/javascript">
         $(document).ready(function () {
             $("#txtContact").keydown(function (e) {
                 if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                     // Allow: Ctrl+A
                            (e.keyCode == 65 && e.ctrlKey === true) ||
                     // Allow: home, end, left, right
                            (e.keyCode >= 35 && e.keyCode <= 39)) {
                     // let it happen, don't do anything
                     return;
                 }
                 // Ensure that it is a number and stop the keypress
                 if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                     e.preventDefault();
                 }
             });
         });

         $(document).ready(function () {
             $("#txtmail").focusout(function () {
                 var EmailText = $("#txtmail").val();
                 if ($.trim(EmailText).length == 0) {
                     alert("Please enter email address");
                     return false;
                 }
                 if (validateEmail(EmailText)) {
                     return true;
                 }
                 else {
                     alert('Invalid Email Address');
                     return false;
                 }
             });
         });


         function validateEmail(sEmail) {
             var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
             if (filter.test(sEmail)) {
                 return true;
             }
             else {
                 return false;
             }
         }
 </script>
<style type="text/css">
    .txtb{
width:58%; height:20px; border:#ccc 1px solid;}
.butn
{
	/*height:33px;*/ 
 padding:10px; margin-top:5px; background-color: #085381; font-weight:bold; color: #FFFFFF; border-radius:5px;
}
  #recaptcha_privacy,#recaptcha_whatsthis_btn,#recaptcha_logo
  {
  	display:none;
  }
  #recaptcha_switch_audio_btn img,#recaptcha_switch_img_btn img,#recaptcha_reload_btn
  {
  	height:25;
  }
 
 .hrl{border:1px solid #C1C4C5;}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section  class="text-justify " id="visa3">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <img src="./images/ads-img2.jpeg"  class="img-fluid">
                    </div>
                    <div class="col-lg-12">
                        <div class="row p-5">
                            <div class="col-lg-12">
                                <h3>Advertise With Indus Travels And Tours:</h3>
                                <hr>
                                <div>
                                    <p>Indus travels and tours welcome you to join us as an advertising partner.Having a global presence and a strong tie-up with some of the global travel agencies and some leading travel networks, we can help you expand your business in terms of promotion and heighten your business relationships.</p>
                                    <p>Not only do we want to excel in our business, but at the same time also want to coordinate with those travel organizations who are interested to advertise with us. In due course of time, as they have given us a chance to serve them, we will see to that through the effective medium of advertising you can reach out to your specific customer base and hence level up your business.
                                    </p>
                                </div>
                                <div class="col-lg-12">
                                    <h4 class="text-center">Kindly provide the following details, in order to provide you fruitful service.</h4>
                                    <div class="row">
                                        <div class="col-lg-12"></div>
                                        <div class="col-lg-12">
                                            <div class="ad-contact">
                                            <table cellpadding="3" cellspacing="3" style="width: 100%">
                            <tbody><tr>
                                <td style="padding-left:50px;">
                                    <%--<div style="border:1px solid gray; padding-left:50px;">	--%>
                                            <table cellpadding="4" cellspacing="4" style="width: 100%">
                                                <tbody><tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%" valign="top">
                                                        <asp:Label ID="lb" runat="server" Text="Name" Font-Size="22px"></asp:Label></td>
                                                    <td style="width: 45%">
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="txtb"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="req1" runat="server" ValidationGroup="g1" ControlToValidate="txtName" >*</asp:RequiredFieldValidator>
<%--                    <input name="ctl00$ContentPlaceHolder1$txtname" type="text"  style="width:58%; height:20px; border:#ccc 1px solid;">
--%>                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%" valign="top">
                                                  <asp:Label ID="Label1" runat="server" Text="Business" Font-Size="22px"></asp:Label>       </td>
                                                    <td style="width: 45%">
                                                    <asp:DropDownList ID="ddlBusiness" runat="server" CssClass="txtb">
                                                   
                                                    <asp:ListItem Value="Select">Select</asp:ListItem>
		<asp:ListItem Value="Adventure Tours">Adventure Tours</asp:ListItem>
		<asp:ListItem Value="Amusement Parks">Amusement Parks</asp:ListItem>
		<asp:ListItem Value="Apartment Hotels">Apartment Hotels</asp:ListItem>
		<asp:ListItem Value="Ayurvedic Centres">Ayurvedic Centres</asp:ListItem>
		<asp:ListItem Value="Ayurvedic Spa">Ayurvedic Spa</asp:ListItem>
		<asp:ListItem Value="Resorts">Resorts</asp:ListItem>
		<asp:ListItem Value="Eco-Tourism">Eco-Tourism</asp:ListItem>
		<asp:ListItem Value="Farm Tourism">Farm Tourism</asp:ListItem>
		<asp:ListItem Value="Home Stays">Home Stays</asp:ListItem>
		<asp:ListItem Value="Hotels">Hotels</asp:ListItem>
		<asp:ListItem Value="Houseboats">Houseboats</asp:ListItem>
		<asp:ListItem Value="Resorts">Resorts</asp:ListItem>
		<asp:ListItem Value="Specialist Hospitals (Medical Tourism)">Specialist Hospitals (Medical Tourism)</asp:ListItem>
		<asp:ListItem Value="Travel Guides">Travel Guides</asp:ListItem>
		<asp:ListItem Value="Others">Others</asp:ListItem>
                                                    </asp:DropDownList>
  <%--<select name="ctl00$ContentPlaceHolder1$dropbusiness"  style="width:59%; height:20px; border:#ccc 1px solid;">
		<option value="Select">Select</option>
		<option value="Adventure Tours">Adventure Tours</option>
		<option value="Amusement Parks">Amusement Parks</option>
		<option value="Apartment Hotels">Apartment Hotels</option>
		<option value="Ayurvedic Centres">Ayurvedic Centres</option>
		<option value="Ayurvedic Spa">Ayurvedic Spa</option>
		<option value="Resorts">Resorts</option>
		<option value="Eco-Tourism">Eco-Tourism</option>
		<option value="Farm Tourism">Farm Tourism</option>
		<option value="Home Stays">Home Stays</option>
		<option value="Hotels">Hotels</option>
		<option value="Houseboats">Houseboats</option>
		<option value="Resorts">Resorts</option>
		<option value="Specialist Hospitals (Medical Tourism)">Specialist Hospitals (Medical Tourism)</option>
		<option value="Travel Guides">Travel Guides</option>
		<option value="Others">Others</option>

	</select>--%>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="Select"
                                                       ValidationGroup="g1" ControlToValidate="ddlBusiness" >*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                       <asp:Label ID="Label2" runat="server" Text="Contact Number" Font-Size="22px"></asp:Label>    </td>
                                                    <td style="width: 45%">
                                                    <asp:TextBox ID="txtContact" runat="server" CssClass="txtb" MaxLength="11"></asp:TextBox>
<%--   <input name="ctl00$ContentPlaceHolder1$txtcontactno" type="text"  style=" width:58.5%; height:20px; border:#ccc 1px solid;">
--%>                                         

  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="g1" ControlToValidate="txtContact" >*</asp:RequiredFieldValidator>
                                                      
                                            </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                      <asp:Label ID="Label3" runat="server" Text="Email" Font-Size="22px"></asp:Label>   </td>
                                                    <td style="width: 45%">
                                                    <asp:TextBox ID="txtmail" runat="server" CssClass="txtb"></asp:TextBox>
<%--    <input name="ctl00$ContentPlaceHolder1$txtemail" type="text" style=" width:58.5%; height:20px; border:#ccc 1px solid;">
--%>                                                    
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                       ValidationGroup="g1" ControlToValidate="txtmail" >*</asp:RequiredFieldValidator>
</td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                       <asp:Label ID="Label4" runat="server" Text="Ad Page" Font-Size="22px"></asp:Label>  </td>
                                                    <td style="width: 45%">
                                                    <asp:DropDownList ID="ddlAdpage" runat="server" CssClass="txtb">
                                                    <asp:ListItem Value="Select">Select</asp:ListItem>
		<asp:ListItem Value="Home">Home</asp:ListItem>
		<asp:ListItem Value="Inner">Inner</asp:ListItem>
		<asp:ListItem Value="Mail Conf.">Mail Conf.</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="Select" 
                                                       ValidationGroup="g1" ControlToValidate="ddlAdpage" >*</asp:RequiredFieldValidator>
    <%--<select name="ctl00$ContentPlaceHolder1$dropadpage" style="width:30%;  height:20px; border:#ccc 1px solid;">
		<option value="Select">Select</option>
		<option value="Home">Home</option>
		<option value="Inner">Inner</option>
		<option value="Mail Conf.">Mail Conf.</option>

	</select>--%>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                     <asp:Label ID="Label5" runat="server" Text="Ad Type" Font-Size="22px"></asp:Label>  </td>
                                                    <td style="width: 45%">
                                                     <asp:DropDownList ID="dllAdtype" runat="server" CssClass="txtb">
                                                    <asp:ListItem Value="Select">Select</asp:ListItem>                                                   
		<asp:ListItem Value="Banner">Banner</asp:ListItem>
		<asp:ListItem Value="Image">Image</asp:ListItem>
		<asp:ListItem Value="Flash">Flash</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  InitialValue="Select"
                                                       ValidationGroup="g1" ControlToValidate="dllAdtype" >*</asp:RequiredFieldValidator>
   <%--<select name="ctl00$ContentPlaceHolder1$dropadtype" style="width:30%;  height:20px; border:#ccc 1px solid;">
		<option value="Select">Select</option>
		<option value="Banner">Banner</option>
		<option value="Image">Image</option>
		<option value="Flash">Flash</option>

	</select>--%>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                       <asp:Label ID="Label6" runat="server" Text="Ad Size (cm)" Font-Size="22px"></asp:Label>     </td>
                                                    <td style="width: 45%">
                                                     <asp:DropDownList ID="ddlSize" runat="server" CssClass="txtb">
                                                    <asp:ListItem Value="Select">Select</asp:ListItem>                                                    
		<asp:ListItem Value="9.0 x 4.5">9.0 x 4.5</asp:ListItem>
		<asp:ListItem Value="9.0 x 3.5">9.0 x 3.5</asp:ListItem>
		<asp:ListItem Value="4.5 x 3.3 ">4.5 x 3.3 </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  InitialValue="Select"
                                                       ValidationGroup="g1" ControlToValidate="ddlSize" >*</asp:RequiredFieldValidator>
  <%--<select name="ctl00$ContentPlaceHolder1$dropadsize" style="width:30%;  height:20px; border:#ccc 1px solid;">
		<option value="Select">Select</option>
		<option value="9.0 x 4.5">9.0 x 4.5</option>
		<option value="9.0 x 3.5">9.0 x 3.5</option>
		<option value="4.5 x 3.3 ">4.5 x 3.3 </option>

	</select>--%>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">
                                                        <asp:Label ID="Label7" runat="server" Text="Ad Period" Font-Size="22px"></asp:Label>    </td>
                                                    <td style="width: 45%">
                                                     <asp:DropDownList ID="ddlPeriod" runat="server" CssClass="txtb">
                                                    <asp:ListItem Value="Select">Select</asp:ListItem> 
                                                    <asp:ListItem Value="3 Months">3 Months</asp:ListItem>
		<asp:ListItem Value="6 Months">6 Months</asp:ListItem>
		<asp:ListItem Value="One Year ">One Year </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  InitialValue="Select"
                                                       ValidationGroup="g1" ControlToValidate="ddlPeriod" >*</asp:RequiredFieldValidator>
<%--<select name="ctl00$ContentPlaceHolder1$dropadperiod"  style="width:30%;">
		<option value="Select">Select</option>
		<option value="3 Months">3 Months</option>
		<option value="6 Months">6 Months</option>
		<option value="One Year ">One Year </option>

	</select>--%>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                <td colspan="4" align="center">
                                                <%-- <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6LcCWvMSAAAAAD1zl9Tz8o0tdxtltjLoicVwXBhG" 
                   PrivateKey="6LcCWvMSAAAAAGDEDPzv8l083xM9Ayf353jYwiwG" BackColor="WhiteSmoke" Theme="clean" />--%>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">&nbsp;
                                                        </td>
                                                    <td style="width: 45%" >
                                                    <asp:Button ID="btnSubmit" runat="server" CssClass="butn" Text=" Submit " 
                                                            ValidationGroup="g1" onclick="btnSubmit_Click"  />
                                                    &emsp;
                                                     <asp:Button ID="btnCancel" runat="server" CssClass="butn" Text=" Cancel " OnClick="btnCancel_Click"  />
<%-- <input type="submit" name="ctl00$ContentPlaceHolder1$btnsubmit" value=" Submit "  style="height:33px; 
 padding:10px; margin-top:5px; background-color: #89C2E4; color: #FFFFFF; border-radius:5px;">
<input type="submit" name="ctl00$ContentPlaceHolder1$btncancel" value=" Cancel "  style="height:33px; padding:10px; margin-top:5px;
  background-color: #89C2E4; color: #FFFFFF; border-radius:5px;">--%>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                    <td style="width: 15%">&nbsp;
                                                        </td>
                                                    <td style="width: 45%">
 <span id="ContentPlaceHolder1_labalert" style="color:#205477;"></span>
                                                    </td>
                                                    <td style="width: 20%">&nbsp;
                                                        </td>
                                                </tr>
                                            </tbody></table>
                                           <%-- </div>--%>

                                </td>
                            </tr>
</tbody></table>   
                                              
                                            </div>
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </section>
</asp:Content>

