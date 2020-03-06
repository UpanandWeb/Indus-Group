<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Current-Needs.aspx.cs" Inherits="Current_Needs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .img {
            padding:5px;
        }
    </style>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="support_outer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 nopadding">
                    <div class="support_bg_outer">
                        <img src="images/support_bgfinal.jpg" width="1200" height="300" alt="" />
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="three_supportouter">
                        <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="Support" PostBackUrl="Support.aspx" Font-Size="22px"></asp:LinkButton>
                        >> &nbsp;
                        <asp:Label ID="lbhome" Text="Current Needs" runat="server" ForeColor="#ff9933" Font-Size="20px"></asp:Label>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="options_outer">
                                    <ul>

                                        <asp:DataList runat="server" ID="list" RepeatColumns="1" OnItemCommand="list_ItemCommand">
                                            <ItemTemplate>
                                                <ul>
                                                    <li>
                                                        <asp:LinkButton ID="lnklist" runat="server" Width="474" Text='<%# Eval("menu_name") %>' CommandArgument='<%# Eval("sid") %>' CommandName="view"></asp:LinkButton>
                                                    </li>
                                                </ul>

                                            </ItemTemplate>

                                        </asp:DataList>

                                        <%--<li><a href="Support.aspx">SPONSOR A CHILD'S EDUCATION</a></li>
                                    <li><a href="Support-Nutrition.aspx" target="_self">SPONSOR A CHILD FOR NUTRITION FOOD</a></li>
                                    <li><a href="Monthly-Need.aspx">SPONSOR MONTHLY NEEDS</a></li>
                                    <li><a href="Current-Needs.aspx">SPONSOR CURRENT HOME NEEDS</a></li>
                                    <li><a href="Special-Day.aspx">SPONSOR YOUR SPECIAL DAY</a></li>
                                    <li><a href="Donation.aspx" >ANY DONATION</a></li>
                                    <li><a href="Fund.aspx">CORPUS FUND</a></li>--%>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="centersupport_content">
                                    <h1>Current Needs</h1>
                                    <ul style="margin-top:-38px;">

                                        <asp:DataList ID="dls" runat="server" RepeatColumns="1" Width="100%">
                                            <ItemTemplate>

                                                <asp:Label ID="lb" runat="server" Text='<%# Eval("content") %>'></asp:Label>


                                            </ItemTemplate>
                                        </asp:DataList>
                                        <%--<li>Gas connections(domestic) New connections. Rs.7950 need atleast 4 connections.priority 2)</li>
                                    <li>5 kgs  capacity steel boxes for storage of pulses 6Nos Total Rs.6000</li>
                                    <li>2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>1kgs 2kgs   capacity steel boxes for storage of pulses 6Nos</li>
                                    <li>1/2 kgs 2kgs capacity  steel boxes for storage of pulses 6Nos</li>--%>
                                    </ul>
                                    <div class="support_sliderpic">
                                        <div id="blogCarousel" class="carousel slide" data-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#blogCarousel" data-slide-to="1"></li>
                                            </ol>
                                            <!-- Carousel items -->
                                            <div class="carousel-inner">

                                                <div class="carousel-item active">
                                                    <div class="row">
                                                    <div class="img-scroll">
                                                            <asp:DataList ID="ddlcurrent" runat="server" RepeatColumns="4">
                                                                <ItemTemplate>
                                                                    <div class="col-md-3">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgddl" runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <h3>
                                                                                        <asp:Label ID="lbcur" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                                                                    </h3>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>



                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                          </div>

                                         
                                                    <!--.row-->
                                                </div>
                                                <!--.item-->

                                                <%--<div class="carousel-item">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_5.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Mat</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_6.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Chapathi Maker</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_7.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Stiching Machine</h3>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="#">
                                                                <img src="images/suppcf_8.jpg" alt="Image" style="max-width:100%;">
                                                            </a>
                                                            <h3>Rice Bowl</h3>
                                                        </div>
                                                    </div>
                                                    <!--.row-->
                                                </div>--%>
                                                <!--.item-->

                                            </div>
                                    <!--.carousel-inner-->
                                </div>
                                <!--.Carousel-->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="rightsuppor_block">

                           <asp:DataList ID="dlside" runat="server" RepeatColumns="1">
                               <ItemTemplate>
                                        <div class="rightsuppor_block">
                                   <asp:ImageButton ID="dlsideimg"  runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>'  width="442px" height="309px" alt="No Images" CssClass="img"  BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" />
                                               </div>
                               </ItemTemplate>
                            </asp:DataList>
                          <%--  <img src="images/supportpic_1.jpg" width="450" height="100" alt="" class="img-fluid" />--%>
                        </div>
                 
                </div>

            </div>
        </div>

    </div>
    </div>
            </div>
    <script>
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });

            $(".zoom").hover(function () {

                $(this).addClass('transition');
            }, function () {

                $(this).removeClass('transition');
            });
        });
    </script>
    <!--gallery-->
    <!--logo_slider-->
    <script>
        $(document).ready(function () {
            $('#logoslider').carousel({
                interval: 3000
            })
        });
    </script>
    <!--logo_slider-->
    <!--support-carousal-->
    <script>
        $('#blogCarousel').carousel({
            interval: 2000
        });
    </script>
    </div>
</asp:Content>

