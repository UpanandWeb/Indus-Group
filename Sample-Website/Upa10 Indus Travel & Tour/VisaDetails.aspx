<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="VisaDetails.aspx.cs" Inherits="VisaDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section  class="text-justify " id="background3">
    <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <asp:Image ID="im1" runat="server" class="img-fluid"  />
                        <!--
                        <img src="./images/uk1.jpg"  class="img-fluid">
                         -->
                        <p>Country: <span class="usa-name"><asp:Label ID="place" runat="server"></asp:Label></span></p>

                    </div>
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-10">
                                <div class="col-lg-2 col-sm-2 col-md-2"></div>
                            <div class="row  color-address">
                    <div class="col-lg-1"></div>
						<div class="col-lg-12 col-sm-12 col-md-6">
						<div>
                         <asp:Label ID="contact" runat="server"></asp:Label>
                         
						 </div>
						</div>
						<div class="col-lg-4  col-sm-12 col-md-6 mid-arge">
						<div>
                            <!--
                            <p><span class="font-weight-bold note-point2">The U.S. Embassy in New Delhi</span></p>
						 <p>Shanti Path, Chanakya Puri 110021</p>
						 <p>Telephone +91-11-2419-8000</p>
                            <p><a href="https://in.usembassy.gov/embassy-consulates/new-delhi/" target="_blank">Website: https://in.usembassy.gov/embassy-consulates/new-delhi/</a></p>

                            <p><span class="font-weight-bold note-point2">The U.S. Embassy in New Delhi</span></p>
						 <p>Shanti Path, Chanakya Puri 110021</p>
						 <p>Telephone +91-11-2419-8000</p>
                             <p> <a href="https://in.usembassy.gov/embassy-consulates/new-delhi/" target="_blank">Website: https://in.usembassy.gov/embassy-consulates/new-delhi/</a></p>
                     -->
						 </div>
						</div>
                            <div class="col-lg-1"></div>
                    </div>
                            </div>
                    </div>
                    </div>
                    </div>


                <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-10">
                                    <div class="text-count2">
                                        <h2 class="main-head">GUIDANCE SHEET FOR BUSINESS TRAVELLER / TOURIST / FAMILY VISIT Visa Class: B1/B2.</h2>
                                        <hr>
                                      
                                        <asp:Label ID="geninfo" runat="server"></asp:Label>
                                            </div>

                                    </div>
                                </div>
                            </div>
                    
                    </div>
        <div class="col-lg-12 pt-5">
                                <div class="row align-items-center">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-5">

                                    <h4>Business:</h4>
                                          <asp:Label ID="busi" runat="server"></asp:Label>          
                                    </div>
                                    <div class="col-lg-5 visa-image">
                                        <img src="./images/visa2.png"  class="img-fluid ">
                                    </div>
                                    <div class="col-lg-1"></div>

                                </div>
                            </div>
        <div class="col-lg-12 pt-2">
                        <div class="row align-items-center">
                            <div class="col-lg-1"></div>

                            <div class="col-lg-5">

                            <h4>Tourist:</h4>
                                <asp:Label ID="tour" runat="server"></asp:Label>          
                            </div>
                                <div class="col-lg-5 visa-image">
                                    <img src="./images/visa-visit.jpg"  class="img-fluid pay-1">
                                    <img src="./images/pay-new.jpg"  class="img-fluid pay-2">
                                </div>
                             <div class="col-lg-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

