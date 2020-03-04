<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="RouteMap.aspx.cs" Inherits="RouteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         function aclick(urls) {

             var element = document.getElementById("frm");
             element.setAttribute("src", urls);
             // window.open("movies.aspx?ul=" + urls);
         }
         function calcRoute() {
             var start = document.getElementById('start').value;
             var end = document.getElementById('end').value;
             var ur = 'https://www.google.co.in/maps?f=d&source=s_d&saddr=' + start + '&daddr=' + end + '&hl=en&output=embed';
             aclick(ur);
         }
</script>
    <style type="text/css">
.sddiv
{
    height:30px; width:925px;
    background-color:#F1F2EB;
    font-size:13px;
    font-weight:bold;
    color:Red;
    text-align:center;
}
.inp
{
    height:25px; width:300px;
    }
</style>
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
   <br />
    <section  class="text-justify " id="footer-map">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                            <div class="footer-map2">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d52123419.010833696!2d-45.617425553234625!3d11.973698001857276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x3bcb99daeaebd2c7%3A0xae93b78392bafbc2!2sHyderabad%2C+Telangana!3m2!1d17.385044!2d78.486671!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!3m2!1d40.7127753!2d-74.0059728!5e1!3m2!1sen!2sin!4v1540450980280" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                            </div>
                            <div class="col-lg-1"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
    </section>
    
</asp:Content>

