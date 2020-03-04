<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="WeightConversion.aspx.cs" Inherits="WeightConversion" %>

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
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">

                                    <div class="convert-sec2">
                                        <h4>Weight Converter:</h4>
                                        <h5>About this Converter</h5>
                                        <p>This online conversion calculator will convert among different units of weight or mass. For more specific calculations use avoirdupois unit conversions and troy unit conversions.
                                        </p>
                                        <h4>How to Convert Units of Acceleration</h4>
                                        <p>Conversions are performed by using a conversion factor. By knowing the conversion factor, converting between units can become a simple multiplication problem:
                                        </p>
                                        <p>S * C = E</p>
                                        <p>Where S is our starting value, C is our conversion factor, and E is our end converted result.</p>
                                        <p>To simply convert from any unit into grams, for example, from 5 kilograms, just multiply by the conversion value in the right column in the table below.
                                        </p>
                                        <p>5 kg * 1000 [ (g) / (kg) ] = 5000 g</p>
                                        <p>To convert from g into units in the left column divide by the value in the right column or, multiply by the reciprocal, 1/x.
                                        </p>
                                        <p>5000 g / 1000  [ (g) / (kg) ] = 5 kg</p>
                                        <p>To convert among any units in the left column, say from A to B, you can multiply by the factor for A to convert A into grams then divide by the factor for B to convert out of g.  Or, you can find the single factor you need by dividing the A factor by the B factor.
                                        </p>
                                        <p>For example, to convert from kilograms to pounds you would multiply by 1000 then divide by 453.59237.   Or, multiply by 1000/453.59237 = 2.204622. So, to convert directly from kg to lb, you multiply by 2.204622.
                                        </p>
                                      <div style="width:800px;margin:0px auto;">
<div style="width:99.5%;border:1px solid #2D6AB4;border-top:none;border-bottom:none;text-align:center; height:24px;font-size:16px;
    padding:5px 0px 0px 0px;border-top-right-radius:5px; border-top-left-radius:5px;background-color:#2D6AB4;
    color:#FFFFFF; font-weight:bold;">
    <a href="#" style="color:#FFFFFF; text-decoration:none;" > Multiple Conversion Widgets</a></div>
    <script type="text/javascript" src="http://ww.theunitconverter.com/converter.php?l=en&t=1&c=1&a=FFFFFF&d=000000&b=2D6AB4&s=weight"></script>
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
</asp:Content>

