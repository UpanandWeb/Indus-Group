<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Cruise.aspx.cs" Inherits="Cruise" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section  class="text-justify world-map-main">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="map-head">
                    <a href="#"><span class="style-head">DESTINATIONS</span><span class="style-head2">DEPARTURE PORTS</span></a>
                </div>
                <div class="destination-names">
                <div class="name-1">
                    <a href="#"><span class="style-name7">ALASKA</span></a>
                </div>
                <div class="name-2">
                    <a href="#"><span class="style-name7">PACIFIC NORTHWEST</span></a>
                </div>
                <div class="name-3">
                    <a href="#"><span class="style-name7">HAWAII</span></a>
                </div>
                <div class="name-4">
                    <a href="#"><span class="style-name7">CANADA,ENGLAND</span></a>
                </div>
                <div class="name-5">
                    <a href="#"><span class="style-name7">THE BAHAMAS</span></a>
                </div>
                <div class="name-6">
                    <a href="#"><span class="style-name7">CARIBBEAN</span></a>
                </div>
                <div class="name-7">
                    <a href="#"><span class="style-name7">PANAMA CANAL</span></a>
                </div>
                <div class="name-8">
                    <a href="#"><span class="style-name7">SOUTH PACIFIC</span></a>
                </div>
                <div class="name-9">
                    <a href="#"><span class="style-name7">REPOSITIONING</span></a>
                </div>
                <div class="name-10">
                    <a href="#"><span class="style-name7">SOUTH AMERICA</span></a>
                </div>
                <div class="name-11">
                    <a href="#"><span class="style-name7">TRANSATLANTIC</span></a>
                </div>
                <div class="name-12">
                    <a href="#"><span class="style-name7">EUROPE</span></a>
                </div>
                <div class="name-13">
                    <a href="#"><span class="style-name7">DUBAI</span></a>
                </div>
                <div class="name-14">
                    <a href="#"><span class="style-name7">ASIA</span></a>
                </div>
                <div class="name-15">
                    <a href="#"><span class="style-name7">AUS & NZL</span></a>
                </div>
                </div>
                <!--PART2 NAMES-->
                <div class="departure-port">
                <div class="name-part1">
                    <a href="#"><span class="part2-hide">NORTH AMERICA</span></a>
                    <div class="chotu">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">Balthimore,</a> <a href="#"> Maryland</a>
                        <br>
                        <a href="#">Boston,</a> <a href="#">Massachusetts</a>
                        <br>
                        <a href="#">Cape Liberty,</a> <a href="#"> New jersey</a>
                        <br>
                        <a href="#">Fort Lauderdale,</a> <a href="#"> Florida</a>
                        <br>
                        <a href="#">Galveston,</a> <a href="#">Texes</a>
                        <br>
                        <a href="#">Honolulu(Oahu)</a> <a href="#"> Hawaii</a>
                        <br>
                        <a href="#">Los Angeles,</a> <a href="#"> California</a>
                        <br>
                        <a href="#">Miami,</a> <a href="#"> Florida</a>
                        <br>
                        <a href="#">New Orleans</a> <a href="#"> Louisiana</a>
                        <br>
                        <a href="#">Port Canaveral,</a> <a href="#">Florida</a>
                        <br>
                        <a href="#">Quebec City,</a> <a href="#">Quebec</a>
                        <br>
                        <a href="#">San Diego,</a> <a href="#">California</a>
                        <br>
                        <a href="#">Seattle,</a> <a href="#">Washington</a>
                        <br>
                        <a href="#">Seward,</a> <a href="#">Alaska</a>
                        <br>
                        <a href="#">Tampa,</a> <a href="#">Florida</a>
                        <br>
                        <a href="#">Vancouver,</a> <a href="#">British Columbia</a>
                    </div>
                </div>
                <div class="name-part2">
                    <a href="#"><span class="part2-hide2">SOUTH AMERICA & CARIBBEAN</span></a>
                    <div class="chotu2">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">San Juan,</a> <a href="#">Puerto Rico</a>
                        <br>
                        <a href="#">Sao Paulo (Santos),</a> <a href="#">Brazil</a>
                        <br>
                        <a href="#">Valparaiso,</a> <a href="#">Chile</a>
                    </div>
                </div>
                <div class="name-part3">
                    <a href="#"><span class="part2-hide3">SPAIN, PORTUGAL & FRANCE</span></a>
                    <div class="chotu3">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">Barcelona,</a> <a href="#">Spain</a>
                    </div>
                </div>
                <div class="name-part4">
                    <a href="#"><span class="part2-hide4">NORTHERN EUROPE</span></a>
                    <div class="chotu4">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">Copenhagen,</a> <a href="#">Denmark</a>
                        <br>
                        <a href="#">Hamburg,</a> <a href="#">Germany</a>
                        <br>
                        <a href="#">Oslo,</a> <a href="#">Norway</a>
                        <br>
                        <a href="#">Rotterdam,</a> <a href="#">Netherlands</a>
                        <br>
                        <a href="#">Southampton,</a> <a href="#">England</a>
                        <br>
                        <a href="#">Stockholm,</a> <a href="#">Sweden</a>
                    </div>
                </div>
                <div class="name-part5">
                    <a href="#"><span class="part2-hide5">ITALY & TURKEY</span></a>
                    <div class="chotu5">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">Civitavecchia (Rome),</a> <a href="#">Italy</a>
                        <br>
                        <a href="#">Istanbul,</a> <a href="#">Turkey</a>
                        <br>
                        <a href="#">Venice,</a> <a href="#">Italy</a>
                        <br>
                    </div>
                </div>
                <div class="name-part6">
                    <a href="#"><span class="part2-hide6">DUBAI</span></a>
                    <div class="chotu6">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">Dubai,</a> <a href="#">United Arab Emirates</a>
                    </div>
                </div>
                <div class="name-part7">
                    <a href="#"><span class="part2-hide7">ASIA & THE PACIFIC</span></a>
                    <div class="chotu7">
                        <div class="dialog">
                            <a href="#" class="close-classic"></a>
                        </div>
                        <h4 class="port-head mb-2">PORTS FOR NORTH AMERICA</h4>
                        <a href="#">CBaoshan (Shanghai),</a> <a href="#">China</a>
                        <br>
                        <a href="#">Brisbane,</a> <a href="#">Australia</a>
                        <br>
                        <a href="#">Hong Kong,</a> <a href="#">China</a>
                        <br>
                        <a href="#">Perth (Fremantle),</a> <a href="#">Australia</a>
                        <br>
                        <a href="#">Singapore</a>
                        <br>
                        <a href="#">Sydney,</a> <a href="#">Australia</a>
                        <br>
                        <a href="#">Tianjin,</a> <a href="#">China</a>
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
<!--man_logoslider-->
<script>
    $(document).ready(function () {
        $(".style-head").click(function () {
            $(".destination-names").show(1600);
        });
        $(".style-head").click(function () {
            $(".departure-port").hide(1000);
        });
        $(".style-head2").click(function () {
            $(".destination-names").hide(1000);
        });
        $(".style-head2").click(function () {
            $(".departure-port").show(1600);
        });
    });
</script>
<script>
    $(document).ready(function () {
        $(".part2-hide").click(function () {
            $(".chotu").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide2").click(function () {
            $(".chotu2").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide3").click(function () {
            $(".chotu3").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide4").click(function () {
            $(".chotu4").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide5").click(function () {
            $(".chotu5").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide6").click(function () {
            $(".chotu6").fadeToggle();
        });
    });
    $(document).ready(function () {
        $(".part2-hide7").click(function () {
            $(".chotu7").fadeToggle();
        });
    });

</script>
<script>
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu2").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu3").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu4").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu5").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu6").hide();
        });
    });
    $(document).ready(function () {
        $(".dialog").click(function () {
            $(".chotu7").hide();
        });
    });
</script>
</asp:Content>

