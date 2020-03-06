<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UControls/Bottom.ascx" TagPrefix="uc1" TagName="Bottom" %>
<%@ Register Src="UControls/Top.ascx" TagPrefix="uc1" TagName="Top" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::Indus Abroad::</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="css/bootstrap-min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-min.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="css/social-icons.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/../maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet" />

    <script src="js/jquery.min.js" type="text/javascript"></script>
    <style>
        .contact-form input {
            width: 100%;
            height: 23px;
            background: #fff;
            font-size: 13px;
            color: #084a5c;
            font-family: 'Open Sans', sans-serif;
            padding: 5px;
            border: 0;
            margin-bottom: 0px;
        }

        .contact-info ul li {
            font-family: igiit;
            font-size: 12px;
            color: #fff;
        }

        .contact-form textarea {
            font-family: 'Open Sans', sans-serif;
            padding: 12px;
            width: 100%;
            height: 35px;
            border: 0;
            margin-bottom: 12px;
        }

        .contact-form input.submit-btn {
            width: 100px;
            height: 40px;
            float: right;
            font-size: 24px;
            color: #fff;
            background: none;
            background-repeat: no-repeat;
            padding: 0;
            font-family: 'BenchNine', sans-serif;
            font-weight: bold;
        }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
        <div>
            <uc1:Top runat="server" ID="Top" />
            <!-- Navigation ends-->


            <div class="container-fluid">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                        <li data-target="#myCarousel" data-slide-to="5"></li>
                        <li data-target="#myCarousel" data-slide-to="6"></li>
                        <li data-target="#myCarousel" data-slide-to="7"></li>
                        <li data-target="#myCarousel" data-slide-to="8"></li>
                        <li data-target="#myCarousel" data-slide-to="9"></li>
                        <li data-target="#myCarousel" data-slide-to="10"></li>
                        <li data-target="#myCarousel" data-slide-to="11"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h1 style="color: white;">Study Business Management in UK</h1>
                            <img src="img/banner-UK.jpg" alt="Los Angeles" style="width: 100%;">
                        </div>
                        <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Oxford University-UK</h1>
                            <img src="img/oxforduniversity.jpg" alt="Los Angeles" style="width: 100%;">
                        </div>

                        <div class="item">
                            <h1 style="color: white;">Hospitality management study in canada</h1>
                            <img src="img/banner-canada.jpg" alt="Chicago" style="width: 100%;">
                        </div>
                        <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Windsor University-canada</h1>
                            <img src="img/windsor university.jpg" alt="Los Angeles" style="width: 100%;">
                        </div>

                        <div class="item">
                            <h1 style="color: white;">Study Accounting In Australia</h1>
                            <img src="img/banner-aus.jpg" alt="Chicago" style="width: 100%;">
                        </div>
                         <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Melbourne University-Australia</h1>
                            <img src="img/melbourneuniversity.jpg" alt="Los Angeles" style="width: 100%;">
                        </div>

                        <div class="item">
                            <h1 style="color: white;">Study Information Technology In USA</h1>
                            <img src="img/banner-USA.jpg" alt="Chicago" style="width: 100%;">
                        </div>
                         <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Stanford University-USA</h1>
                            <img src="img/stanforduniversity.jpg" alt="Los Angeles" style="width: 100%;">
                        </div>

                        <div class="item">
                            <h1 style="color: white;">Study MBA in Ireland</h1>
                            <img src="img/banner-ireland.jpg" alt="Chicago" style="width: 100%;">
                        </div>
                         <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Study Accounting In France</h1>
                            <img src="img/banner-france.jpg" alt="Chicago" style="width: 100%;">
                        </div>

                        <div class="item">
                            <h1 style="color: white;">Study in Phillipines</h1>
                            <img src="img/banner-Phillipines.jpg" alt="Chicago" style="width: 100%;">
                        </div>
                         <div class="item">
                            <img src="img/redesign.jpg" alt="Redesign" style="width: 100%;">
                        </div>
                        <div class="item">
                            <h1 style="color: white;">Study MBA In Newzealand</h1>
                            <img src="img/banner-newzealand.jpg" alt="Chicago" style="width: 100%;">
                        </div>

                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <!-- Wrapper for slides ends -->

            <div class="container-fluid content">
                <div class="row">
                    <h4 class="study">
                        <div class="col-md-12">
                            <%--<h2 class="study">Study Abroad</h2>--%>
                            <ul class="social-network social-circle">
                                <li>
                                    <img src="img/IN.png" alt="" style="margin-top: -10px;" title="INDIA"  />

                                </li>

                                <li>
                                    <%--<img src="img/AU.png" alt="" style="margin-top: -10px;" title="AUSTRALIA" />--%>
                                     <asp:ImageButton ID="imgau" runat="server" ImageUrl="img/AU.png" OnClick="imgau_Click"  ToolTip="AUSTRALIA"/>

                                </li>
                                <li>
                                    <%--<img src="img/US.png" alt="" style="margin-top: -10px;" title="USA" />--%>
                                    <asp:ImageButton ID="imgusa" runat="server" ImageUrl="img/US.png" OnClick="imgusa_Click"  ToolTip="USA"/>
                                </li>
                                <li>
                                    <%--<img src="img/CA.png" alt="" style="margin-top: -10px;" title="CANADA" />--%>
                                     <asp:ImageButton ID="imgcanada" runat="server" ImageUrl="img/CA.png" OnClick="imgcanada_Click"  ToolTip="CANADA"/>
                                </li>
                              
                                <li>
                                   <%-- <img src="img/CN.png" style="margin-top: -10px;" title="CHINA" />--%>
                                      <asp:ImageButton ID="imgchina" runat="server" ImageUrl="img/CN.png" OnClick="imgchina_Click"  ToolTip="CHINA"/>
                                </li>
                                <li>
                                    <%--<img src="img/GB.png" style="margin-top: -10px;" title="GREAT BRITAIN" />--%>
                                     <asp:ImageButton ID="imguk" runat="server" ImageUrl="img/GB.png" OnClick="imguk_Click"  ToolTip="UK"/>
                                </li>

                                 <li>
                                   <%-- <img src="img/SG.png" style="margin-top: -10px;" title="SINGAPORE" />--%>
                                       <asp:ImageButton ID="imgsing" runat="server" ImageUrl="img/SG.png" OnClick="imgsing_Click"  ToolTip="SINGAPORE"/>
                                 </li>
                                 <li>
                                    <%--<img src="img/DE.png" style="margin-top: -10px;" title="GERMANY" />--%>
                                       <asp:ImageButton ID="imggermany" runat="server" ImageUrl="img/DE.png" OnClick="imggermany_Click"  ToolTip="GERMANY"/>
                                 </li>

                                  <li>
                                    <%--<img src="img/IT.png" alt="" style="margin-top: -10px;" title="ITALY" />--%>
                                       <asp:ImageButton ID="imgitaly" runat="server" ImageUrl="img/IT.png" OnClick="imgitaly_Click"  ToolTip="ITALY"/>

                                  </li>
                                  <li>
                                    <%--<img src="img/FR.png" style="margin-top: -10px;" title="FRANCE" />--%>
                                       <asp:ImageButton ID="imgfrance" runat="server" ImageUrl="img/FR.png" OnClick="imgfrance_Click"  ToolTip="FRANCE"/>

                                  </li>

                                 <li>
                                   <%-- <img src="img/JP.png" alt="" style="margin-top: -10px;" title="JAPAN" />--%>
                                       <asp:ImageButton ID="imgjapan" runat="server" ImageUrl="img/JP.png" OnClick="imgjapan_Click"  ToolTip="JAPAN"/>
                                 </li>

                                 <li>
                                   <%-- <img src="img/VN.png" style="margin-top: -10px;" title="VIETNAM" />--%>
                                       <asp:ImageButton ID="imgvietnam" runat="server" ImageUrl="img/VN.png" OnClick="imgvietnam_Click"  ToolTip="VIETNAM"/>
                                 </li>
                                <li>
                                    <%--<img src="img/BR.png" style="margin-top: -10px;" title="BRAZIL" />--%>
                                       <asp:ImageButton ID="imgbrazil" runat="server" ImageUrl="img/BR.png" OnClick="imgbrazil_Click"  ToolTip="BRAZIL"/>
                                </li>
                                  <li>
                                    <%--<img src="img/AE.png" style="margin-top: -10px;" title="UNITED ARAB EMIRATES" />--%>
                                       <asp:ImageButton ID="imgdubai" runat="server" ImageUrl="img/AE.png" OnClick="imgdubai_Click"  ToolTip="DUBAI"/>
                                  </li>

                                <li>
                                    <%--<img src="img/FI.png" style="margin-top: -10px;" title="FINLAND" />--%>
                                       <asp:ImageButton ID="imgirlend" runat="server" ImageUrl="img/IE.png" OnClick="imgirlend_Click"  ToolTip="IRELAND"/>
                                </li>
                                <li>
                                   <%-- <img src="img/MX.png" style="margin-top: -10px;" title="MEXICO" />--%>
                                       <asp:ImageButton ID="imgmexico" runat="server" ImageUrl="img/MX.png" OnClick="imgmexico_Click"  ToolTip="MEXICO"/>
                                </li>
                                <li>
                                   <%-- <img src="img/NO.png" style="margin-top: -10px;" title="NORWAY" />--%>
                                       <asp:ImageButton ID="imgnorway" runat="server" ImageUrl="img/NO.png" OnClick="imgnorway_Click"  ToolTip="NORWAY"/>
                                </li>
                                <li>
                                    <%--<img src="img/PE.png" style="margin-top: -10px;" title="PERU" />--%>
                                       <asp:ImageButton ID="imgperu" runat="server" ImageUrl="img/PE.png" OnClick="imgperu_Click"  ToolTip="PERU"/>

                                </li>
                               <li>
                                    <%--<img src="img/KW.png" alt="" style="margin-top: -10px;" title="KUWAIT" />--%>
                                    <asp:ImageButton ID="imgkuwait" runat="server" ImageUrl="img/KW.png" OnClick="imgkuwait_Click"  ToolTip="KUWAIT"/>
                               </li>
                                 <li>
                                    <%--<img src="img/CH.png" style="margin-top: -10px;" title="SWITZERLAND" />--%>
                                      <asp:ImageButton ID="imgswitzer" runat="server" ImageUrl="img/CH.png" OnClick="imgswitzer_Click"  ToolTip="SWITZERLAND"/>
                                 </li>
                                <li>
                                    <%--<img src="img/LV.png" style="margin-top: -10px;" title="LATVIA" />--%>
                                     <asp:ImageButton ID="imglatvia" runat="server" ImageUrl="img/LV.png" OnClick="imglatvia_Click"  ToolTip="LATVIA"/>
                                </li>
                                <li>
                                    <%--<img src="img/BE.png" alt="" style="margin-top: -10px;" title="BELGIUM" />--%>
                                     <asp:ImageButton ID="imgbelgium" runat="server" ImageUrl="img/BE.png" OnClick="imgbelgium_Click"  ToolTip="BELGIUM"/>

                                </li>
                               <li>
                                    <img src="img/PT.png" style="margin-top: -10px;" title="PORTUGAL" /></li>
                           
                                <li>
                                    <%--<img src="img/SE.png" style="margin-top: -10px;" title="SWEDEN" />--%>
                                     <asp:ImageButton ID="imgsweden" runat="server" ImageUrl="img/SE.png" OnClick="imgsweden_Click"  ToolTip="SWEDEN"/>

                                </li>
                                <li>
                                    <%--<img src="img/TR.png" style="margin-top: -10px;" title="TURKEY" />--%>
                                     <asp:ImageButton ID="imgturkey" runat="server" ImageUrl="img/TR.png" OnClick="imgturkey_Click"  ToolTip="TURKEY"/>

                                </li>
                                <%--   <li>
                                    <img src="img/BR.png" style="margin-top: -10px;" title="BRAZIL"  /></li>
                                <li>
                                    <img src="img/AE.png" style="margin-top: -10px;" title="UNITED ARAB EMIRATES"  /></li>
                                <li>
                                    <img src="img/LV.png" style="margin-top: -10px;" title="LATVIA"  /></li>--%>
                            </ul>
                        </div>
                    </h4>
                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/sydney-opera house.jpg" alt="0" style="height: 200px;">
                            <h4>
                                  <asp:LinkButton ID="lnkaus" runat="server" Text="Study in Australia" OnClick="lnkaus_Click"  ToolTip="AUSTRALIA"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                            <!-- <h4>Courses Offerred</h4>
<ul>
<li>Medicine</li>
<li>Mca</li>
<li>Information Technology</li>
</ul>-->
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/london-bridge.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in UK--%>
                                <asp:LinkButton ID="lnkus" runat="server" Text="Study in UK" OnClick="lnkus_Click"  ToolTip="UK"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/canada.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in Canada--%>
                                <asp:LinkButton ID="lnkcan" runat="server" Text="Study in CANADA" OnClick="lnkcan_Click"  ToolTip="CANADA"/>

                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/america.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in USA--%>
                                <asp:LinkButton ID="lnkusa" runat="server" Text="Study in USA" OnClick="lnkusa_Click"  ToolTip="USA"/>

                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                </div>
            </div>

            <div class="container-fluid content">
                <div class="row">
                    <h2 class="study1">Education</h2>
                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/med.jpg" alt="0" style="height: 200px;">
                            <h4>Medicine</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/it.jpg" alt="0" style="height: 200px;">
                            <h4>Information Technology</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/mba.jpg" alt="0" style="height: 200px;">
                            <h4>MBA</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>

                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/engineering-image.jpg" alt="0" style="height: 200px;">
                            <h4>Engineering</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                </div>
            </div>


            <div class="container-fluid content">
                <div class="row">
                    <!-- <h2 class="study">Study Abroad</h2> -->
                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/study-in-newzealand.jpg" alt="0" style="height: 200px;">
                            <h4>Study in New zealand</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/mbbs-in-philippine.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in ITALY--%>
                                <asp:LinkButton ID="lnkitaly" runat="server" Text="Study in ITALY" OnClick="lnkitaly_Click"  ToolTip="ITALY"/>

                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/study-in-france.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in FRANCE--%>
                                 <asp:LinkButton ID="lnkfrance" runat="server" Text="Study in FRANCE" OnClick="lnkfrance_Click"  ToolTip="FRANCE"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/study-in-ireland.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in JAPAN--%>
                                 <asp:LinkButton ID="lnkjapan" runat="server" Text="Study in JAPAN" OnClick="lnkjapan_Click"  ToolTip="JAPAN"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                </div>
            </div>




            <div class="container-fluid content">
                <div class="row">
                    <!-- <h2 class="study">Study Abroad</h2> -->
                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/malaysia.jpg" alt="0" style="height: 200px;">
                            <h4><%--tudy in China--%>
                                <asp:LinkButton ID="lnkchina" runat="server" Text="Study in CHINA" OnClick="lnkchina_Click"  ToolTip="CHINA"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/singapore.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in Singapore--%>
                                <asp:LinkButton ID="lnksing" runat="server" Text="Study in SINGAPORE" OnClick="lnksing_Click"  ToolTip="SINGAPORE"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="img/germany.jpg" alt="0" style="height: 200px;">
                            <h4><%--Study in Germany--%>
                                <asp:LinkButton ID="lnkgermany" runat="server" Text="Study in GERMANY" OnClick="lnkgermany_Click"  ToolTip="GERMANY"/>
                            </h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="aus thumbnail">
                            <img src="http://studyabroadfree.com/wp-content/uploads/2012/02/study-in-russia-for-free.jpg" alt="0" style="height: 200px;">
                            <h4>Study in Russia</h4>
                            <p>Each year, hundreds of Indian students choose to study, train and travel overseas. Some go to do a Bachelors degree, and some for MS .....</p>
                        </div>
                    </div>

                </div>
            </div>


            <div class="container-fluid">
                <div class="row">
                    <h2 style="text-align: center;">Famous Universities</h2>
                </div>
                <div class='row'>

                    <div class="carousel slide media-carousel" id="media">
                        <div class="carousel-inner">
                            <div class="item  active">
                                <div class="row">
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Angeles university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/AUC university.png"></a>

                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Emilio university.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/MAHSA University.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/OLoFU university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Ross university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Teesside university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Trinity university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Xavier university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/monash_university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/St Georges university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/De La Selle university.png"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="row">
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/AMA university.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Oklahoma_City_University_seal.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Becker EduPristine university.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/MAHSA University.png"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/OLoFU university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Ross university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Teesside university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Trinity university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Xavier university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/Spartan university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/St Georges university.jpg"></a>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="thumbnail" href="#">
                                            <img alt="" src="img/AUC university.png"></a>
                                    </div>

                                </div>
                            </div>

                            <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
                            <a data-slide="next" href="#media" class="right carousel-control">›</a>
                        </div>
                    </div>

                </div>
            </div>


            <div class="container-fluid content">
                <div class="row">

                    <div class="col-md-4 awards" style="text-align: center;padding-left:20px;">
                        <h3 style="text-align: center;">Upcoming Events  </h3>
                        <%--  <img src="img/34745710064_02ba085e33_o.png" alt="0" width="120" height="100" />
                        <img src="img/34745709924_21861739e2_o.png" alt="0" width="120" height="100" />
                        <img src="img/35418759092_62c8c28790_o.png" alt="0" width="120" height="100" />
                        <img src="img/34745710064_02ba085e33_o.png" alt="0" width="120" height="100" />--%>
                        <marquee onmouseover="stop();" onmouseout="start();" scrollamount="2" direction="up" height="100px">
                   <b>NEWS AND EVENTS</b><br />
                    <div style="text-align: justify">Study in a world top 100 Universities for Engineering with INR 10 Lakhs Scholarship.
                         Meet University of  Faculty .
                    </div><br/>
                    <b>SEMINAR AND WORKSHOP</b><br />
                    <div style="text-align: justify">
                    Study in USA TOP 100 Public Universities with 70% Scholarship !! Meet University

                    </div><br/>
                            <b>NEWS AND EVENTS</b><br />
                    <div style="text-align: justify">Study in a world top 100 Universities for Engineering with INR 10 Lakhs Scholarship.
                         Meet University of  Faculty .
                    </div><br/>
                    <b>SEMINAR AND WORKSHOP</b><br />
                    <div style="text-align: justify">
                    Study in USA TOP 100 Public Universities with 70% Scholarship !! Meet University

                    </div><br/>
                    </marquee>
                    </div>

                    <div class="col-md-4">
                        <h2 style="text-align: center;">Testimonials</h2>
                        <p>Thank you very much for helping in visa procedure. Your work is absolutely fabulous. I had a pretty hard time but things are taken care till the end. I was very well informed about the course and about the lifestyle in U.S.A.</p>
                        <p class="text-right">"Ricky Thomas"</p>

                    </div>

                    <div class="col-md-4 awards" style="text-align: center;">
                        <h3 style="text-align: center;"><u>Upcoming Seminars</u></h3>
                        <%--<img src="img/34745710064_02ba085e33_o.png" alt="0" width="120" height="100" />
                        <img src="img/34745709924_21861739e2_o.png" alt="0" width="120" height="100" />
                        <img src="img/35418759092_62c8c28790_o.png" alt="0" width="120" height="100" />
                        <img src="img/34745710064_02ba085e33_o.png" alt="0" width="120" height="100" />--%>
                         <marquee onmouseover="stop();" onmouseout="start();" scrollamount="2" direction="down" height="100px">
                   <b>NEWS AND EVENTS</b><br />
                    <div style="text-align: justify">Study in a world top 100 Universities for Engineering with INR 10 Lakhs Scholarship.
                         Meet University of  Faculty .
                    </div><br/>
                    <b>SEMINAR AND WORKSHOP</b><br />
                    <div style="text-align: justify">
                    Study in USA TOP 100 Public Universities with 70% Scholarship !! Meet University

                    </div><br/>
                            <b>NEWS AND EVENTS</b><br />
                    <div style="text-align: justify">Study in a world top 100 Universities for Engineering with INR 10 Lakhs Scholarship.
                         Meet University of  Faculty .
                    </div><br/>
                    <b>SEMINAR AND WORKSHOP</b><br />
                    <div style="text-align: justify">
                    Study in USA TOP 100 Public Universities with 70% Scholarship !! Meet University

                    </div><br/>
                    </marquee>
                    </div>
                </div>
            </div>

            <div class="container-fluid content">
                <div class="row" style="background-color: rgba(242, 51, 21, 0.7607843137254902) !important; padding-top: 10px;">

                    <div class="col-md-4 address" style="padding-left: 70px;">
                        <table width="100%" style="color: white;">
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-map-marker"></i><span style="margin-left: 10px;">Address</span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>Global Head Quarters </span>
                                </td>
                            </tr>
                            <tr>
                                <td width="45%" align="left"></td>
                                <td width="10%" align="center" valign="top"></td>
                                <td width="45%" align="left">
                                    <b>INDUSABROAD </b>
                                    <br />
                                    1039 Sterling Road, Ste. 103,<br />
                                    Herndon-VA-20170. USA,<br />
                                    Washington DC Metro Area
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-calendar"></i>&nbsp;&nbsp;<span>Monday - Friday</span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>9:30 AM to 5:30 PM</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-phone" style="height: 20px;"></i><span class="span-width">Voice </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>571-777-9969</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-phone" style="height: 20px;"></i>&nbsp;<span class="span-width">Fax </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>703-649-6458</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-envelope" style="height: 20px;"></i>
                                    <span class="span-width">General Enquiries </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>info@indusabroad.com  </span>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div class="col-md-4 contact-form" style="padding-right: 60px;">
                        <span style="text-align: center; font-size: 24px; color: white; padding-left: 150px; text-transform: uppercase; padding-bottom: 10px;">Enquiry</span>
                        <div class="info-detail">
                            <asp:TextBox ID="txt1name" runat="server" CssClass="name" PlaceHolder="Enter Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1name" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="email" PlaceHolder="Enter Your Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtphone" runat="server" CssClass="phone" PlaceHolder="Enter Your Phone No"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphone" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtmsg" runat="server" CssClass="message" PlaceHolder="Message" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmsg" ValidationGroup="submit1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:Button ID="btnsubmit" runat="server" CssClass="submit-btn" Text="SUBMIT" OnClick="btnsubmit_Click"
                                ValidationGroup="submit1" />
                            <asp:ValidationSummary ID="valsum" runat="server" ValidationGroup="submit1" />
                        </div>
                    </div>


                    <div class="col-md-4 address1" style="padding-right: 70px;">
                        <%--<div class="panel panel-default">
                            <div class="panel-body">--%>
                        <%--<h2 style="text-align:center;">Contact</h2>--%>


                        <table width="100%" style="color: white;">
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-map-marker"></i><span style="margin-left: 10px;">Address</span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span><b>INDUSABROAD </b></span>
                                </td>
                            </tr>
                            <tr>
                                <td width="45%" align="left"></td>
                                <td width="10%" align="center" valign="top"></td>
                                <td width="45%" align="left">Plot # 21,Flat #203,<br />
                                    Techno Residency,<br />
                                    <%--Opp: Mind Space(Raheja IT Park),<br />--%>
                                Madhapur,Hyderabad,<br />
                                    TS-500081,India
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-calendar"></i>&nbsp;<span>Monday - Friday</span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>9:30 AM to 5:30 PM</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-phone" style="height: 20px;"></i><span class="span-width">Voice </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>040 2311 6226</span>
                                </td>
                            </tr>
                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-phone" style="height: 20px;"></i>&nbsp;<span class="span-width">Fax </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>040-23116228</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px">&nbsp;</td>
                            </tr>

                            <tr>
                                <td width="45%" align="left">
                                    <i class="fa fa-envelope" style="height: 20px;"></i>
                                    <span class="span-width">General Enquiries </span>
                                </td>
                                <td width="10%" align="center">:</td>
                                <td width="45%" align="left">
                                    <span>info@indusabroad.com  </span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>


            <uc1:Bottom runat="server" ID="Bottom" />

            <script type="text/javascript" src="scripts/js/jquery.js"></script>
            <script type="text/javascript" src="scripts/js/bootsrap-min.js"></script>

            <script>
                $('.carousel').carousel({
                    interval: 5000 //changes the speed
                })
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#media').carousel({
                        pause: true,
                        interval: false,
                    });
                });
            </script>
        </div>
    </form>
</body>
</html>
