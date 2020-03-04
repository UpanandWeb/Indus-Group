<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Currency.aspx.cs" Inherits="Currency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

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

    <section  class="text-justify">
        <div id="visa3">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <!--
                    <div class="text-count">
                        <img src="./images/v2.jpg"  class="img-fluid">
                    </div>
                    -->
                    <div class="col-lg-12">
                        <div class="row p-5">
                            <div class="col-lg-4"></div>
                            <div class="col-lg-4">
                            <div class="convert-sec">
                            <div id="powerd"><a href="https://www.transfermate.com/" target="_blank" id="tm_add146" class="tm_add146"></a></div>
                            <div id="demo-rate-convert"></div>
                            <noscript><br/><span style="color: red;">Please enable your JavaScript.</span></noscript>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <script src="js/aos.js"></script>
<script>
    AOS.init({
        easing: 'ease-in-out-sine'
    });
</script>
<!--animateonscroll-->
<!--logo_slider-->
<script>

    $(document).ready(function () {
        $('#logoslider').carousel({
            interval: 3000
        })
    });
</script>
<!--logo_slider-->
<!--man-logo-slider-->
<script>
    $(document).ready(function () {
        $('#media').carousel({
            pause: true,
            interval: false,
        });
    });
</script>
<script>
    var apiTargetHtmlObj = document.getElementById("demo-rate-convert");
    var tmScript = document.createElement("script");
    tmScript.src = "https://www.transfermate.com/en/exchange_rates_api.asp?csel=BMD,BAM&cshort=ZAR";
    document.getElementsByTagName("head")[0].appendChild(tmScript);
</script>
</asp:Content>


