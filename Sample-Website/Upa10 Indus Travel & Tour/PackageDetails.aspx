<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="PackageDetails.aspx.cs" Inherits="PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>Indus Tours &amp; Travels</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/aos.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/full-slider.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!--menu_links-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--menu_links-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  id="back" runat="server" >
        <div class="container-fluid">
            <div class="col-lg-12">
                <div class="row" id="text-manali">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <div class="text-total">
                            <h3 class="h2-manali-top">Package Details 0f <span class="color-manali-top"><asp:Label ID="plnm" runat="server"></asp:Label></span></h3>
                            <hr class="hr-manali">
                            <h3 class="sub-header">General Information</h3>
                            <div class="section1-manali text-justify">
                                <h3 class="top-head2">TOUR OF <asp:Label ID="plnm2" runat="server"></asp:Label> PACKAGES FOR 2018</h3>
                                <div>
                                    <ul>
                                        <asp:Label ID="pkg" runat="server"></asp:Label>
                                        <%--<li>6D / 5N</li>
                                        <li>GUJARAT</li>
                                        <li>INR 24,399 * Onwards.</li>
                                        <li>TOUR OF GUJARAT - 6D / 5N<br>
                                            *Family | Honeymoon | Wildlife.
                                        </li>--%>
                                    </ul>
                                </div>
                                <h3>Note:</h3>
                                <p class="bg-color-p2"> Single Adult in a room has to pay extra Rs.7,350 - in standard & Rs. 11,400 - in Deluxe packages</p>
                            </div>
                        </div>
                        <h3 class="sub-header">Itinerary Details</h3>
                        <div class="section2">
                            <p>
                          <asp:Label ID="desc" runat="server" ></asp:Label>
                                </p>
                        </div>
                        <div class="col-lg-1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

