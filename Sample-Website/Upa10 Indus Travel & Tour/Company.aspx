<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Company" %>

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

    <section  class="text-justify " id="background1">
        <div class="container-fluid">
            <div class="col-lg-12">
            <div class="row" id="text-content">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                <div class="text-adjest">
                    <h2 class="h2-main">Indus Travels Is Your Global Travel Partner</h2>
                    <hr class="hr-hr">
                    <%--<p>Indus travels and tours is a premium travels and tours company, specialized in providing services such as air ticketing (domestic and international), offering exclusive travel packages and also cruise tours. Our primary motivating factor to start this organization was to alleviate all the travel related hassles of our endeared customers</p>
                    <p>Having a core management team of travel experts, who have not only got extensive knowledge on travels and tours worldwide, but also have got the required experience and expertise to provide seamless travel solutions. We have got an extensive network of travel agencies, hence any customer who comes our way will be provided with the minutest detail of their travel plan. We along with our agencies and partners are IATA (International Air Transport Association) affiliated.</p>
                    <p>Indus travels and tours initiated its operations in the year 2001. Since then, our team has worked hard to provide value based cost-effective travel services. Having a decade of experience in the global travels and tours domain, we understand in-depth as to how the travel industry functions, as so with such finesse, we assure you that your travel plan will be customized to suit your budget. Upon that, you will not only save money but also save time, as our travel consultants will custom design your travel plan in such a way that you can travel quite a few destinations in a less amount of time.</p>--%>

                    <p>
                        <asp:Label ID="lb" runat="server" Text='<%#Eval("content") %>'></asp:Label>
                    </p>
                </div>
              <%--  <div class="pointed_image">
                    <h4 class="font-weight-bold">Why?</h4>
                    <ul>
                        <li> Book air tickets swiftly</li>
                        <li> Detailed itineraries along with well-drafted travel documentation</li>
                        <li> Bespoke travel plan designed by experienced and skilled travel consultants</li>
                        <li> Exclusive and budget-friendly holiday packages</li>
                        <li> Easy and flexible payment options</li>
                        <li> Well thought-out travel packages for corporate, individuals and families</li>
                        <li> Remarkable global cruise tours</li>
                        <li> Round the clock customer service team</li>
                    </ul>
                </div>--%>
               <%-- <div>
                    <h4 class="font-weight-bold">Mission:</h4>
                    <p class="text-resize">To make sure that all our esteemed customers are highly satisfied by our services. With a stringent process driven approach, our team strives for providing value of the highest order to our customers. Customer retention is what we yearn for, and so we take methodical steps in order to ensure customer loyalty. Building a long-term trust is what we strive for consistently.</p>
                    <h4 class="font-weight-bold">Vision:</h4>
                    <p class="text-resize">To be a progressive organization, adept in all the global travel policies and framework. We want to build a global brand image, laudable for exceptional performance in travel and tour services. To enchant all our customers time and again, who have believed in us and given us a chance to serve them prolifically.
                    </p>
                </div>--%>
                    <div class="col-lg-1"></div>
                </div>
            </div>
            </div>
        </div>
    </section>
</asp:Content>

