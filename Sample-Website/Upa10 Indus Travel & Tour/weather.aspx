<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Weather.aspx.cs" Inherits="Weather" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <section  class="text-justify">
        <div id="weather-footer">
            <div class="container-fluid">
                <div class="col-lg-12 nopadding">
                    <div class="row">
                        <!--
                        <div class="text-count">
                            <img src="./images/v2.jpg"  class="img-fluid">
                        </div>
                        -->
                        <div class="col-lg-12">
                            <div class="row mt-5">
                                <div class="col-lg-4">
                                <div class="convert-sec">
                                    <a class="weatherwidget-io" href="https://forecast7.com/en/19d0872d88/mumbai/" data-label_1="MUMBAI" data-label_2="WEATHER" data-theme="pool_table" >NEW YORK WEATHER</a>
                                    <script>
                                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                    </script>
                                </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="convert-sec">
                                        <a class="weatherwidget-io" href="https://forecast7.com/en/38d97n77d39/herndon/" data-label_1="HERNDON" data-label_2="WEATHER" data-theme="pool_table" >SYDNEY WEATHER</a>
                                        <script>
                                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                        </script>
                                    </div>
                                </div>
                            <div class="col-lg-4">
                                <div class="convert-sec">
                                    <a class="weatherwidget-io" href="https://forecast7.com/en/17d3978d49/hyderabad/" data-label_1="HYDERABAD" data-label_2="WEATHER" data-theme="pool_table" >Hyderabad</a>
                                    <script>
                                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                    </script>
                                </div>
                            </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="row mb-5">
                                <div class="col-lg-4">
                                    <div class="convert-sec">
                                        <a class="weatherwidget-io" href="https://forecast7.com/en/1d36103d87/singapore/" data-label_1="SINGAPORE" data-label_2="WEATHER" data-theme="pool_table" >SINGAPORE WEATHER</a>
                                        <script>
                                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                        </script>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="convert-sec">
                                        <a class="weatherwidget-io" href="https://forecast7.com/en/28d6677d23/delhi/" data-label_1="DELHI" data-label_2="WEATHER" data-theme="pool_table" >DELHI WEATHER</a>
                                        <script>
                                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                        </script>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="convert-sec">
                                        <a class="weatherwidget-io" href="https://forecast7.com/en/51d51n0d13/london/" data-label_1="LONDON" data-label_2="WEATHER" data-theme="pool_table" >LONDON WEATHER</a>
                                        <script>
                                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = 'https://weatherwidget.io/js/widget.min.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'weatherwidget-io-js');
                                        </script>
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

