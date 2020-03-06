<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="css/styles.css" rel="stylesheet" />

    <style>
        .thumb_container {
    margin: 4px 3px 0 10px;
    padding: 10px 5px 0px 9px;
    display: block;
    text-decoration: none;

    float: left;
    height: 253px;
    width:253px;
    color: #000;
    border: 1px solid #E0E0E0;
    cursor: pointer
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 nopadding">
                <div class="bg_cont">
                    <h1>"Let Our Family Help Yours"</h1>
                    <h2>Our Sponsors</h2>
                    <!--logo_slider-->
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                            <div id="logoslider" class="carousel slide">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="row">
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_1.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_2.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_3.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_4.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_5.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_6.jpg" alt="Image" style="height: 80px;"></a></div>
                                        </div>
                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                    <div class="item">
                                        <div class="row">
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_1.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_2.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_3.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_4.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_5.jpg" alt="Image" style="height: 80px;"></a></div>
                                            <div class="col-lg-2"><a href="#" class="thumbnail">
                                                <img src="images/slogofinal_6.jpg" alt="Image" style="height: 80px;"></a></div>
                                        </div>
                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--logo_slider-->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left_welcome">
                            <h1>Welcome to Anandam Foundation</h1>
                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="1">
                                <ItemTemplate>
                                    <ul style="list-style: none;">

                                        <li>
                                            <p style="text-align: justify;">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                            </p>
                                        </li>
                                    </ul>
                                </ItemTemplate>


                            </asp:DataList>

                            <%--                            <p>ANANDAM Foundation is a non-profit organization working for underprivileged children - orphaned, abandoned, destitute and other vulnerable groups. 
                            <p>Our mission is to change lives of such children - by providing them with long-term care. This includes basic needs, education and healthcare, and skills necessary to transform them into responsible citizens.We are based in Dundigal, outskirts of Hyderabad.</p> 
                            <p>160 of our children stay in a 25000 sq ft facility We also have a separate facility for cooking and dining. Forty of our children in STD XI and above stay in various residential colleges in Hyderabad.In addition, we also sponsor education of more than 200 poor children in collaboration with corporate and non-profit partners.</p>--%>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="rite_updates">
                            <h1>News &amp; Updates</h1>
                            <div class="updates_window">
                                <div class="latest-news-all">
                                    <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" OnItemCommand="DataList2_ItemCommand">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="latest-news-left">
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagename", "photos/events/{0}") %>' Width="150" Height="100" alt="Event" CommandArgument='<%# Eval("eid") %>' CommandName="img" />
                                                        </div>

                                                    </td>

                                                    <td>
                                                        <div class="latest-news-right">
                                                            <p style="text-align: justify;">

                                                                <asp:LinkButton ID="lnk1" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("eid") %>' CommandName="view"  ></asp:LinkButton>

                                                            </p>
                                                            <div class="news"><span class="news-left">Admin</span> <span class="news-right">
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("posteddate") %>'></asp:Label></span> </div>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>


                                        </ItemTemplate>


                                    </asp:DataList>

                                </div>





                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 nopadding">
                <div class="ourvideos_outer">
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="ourvideo_left">
                                        <h1>Our Videos</h1>
                                        <iframe width="100%" height="315" src="https://www.youtube.com/embed/kmPd1_pGoaQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="upcom_rite">
                                        <h1>Upcoming Events</h1>
                                        <p style="text-align: center;">
                                            <asp:DataList ID="dataupcoming" runat="server" RepeatColumns="1" OnItemCommand="dataupcoming_ItemCommand">

                                                <ItemTemplate>

                                                    <table width="100%">
                                                        <tr>
                                                            <td align="center" colspan="2" style="padding-left: 254px;">
                                                                <asp:LinkButton ID="lnk2" runat="server" Text='<%# Eval("title") %>' ForeColor="White" Font-Bold="true" Font-Size="20px" CommandArgument='<%# Eval("eid") %>' CommandName="view"></asp:LinkButton>
                                                            </td>
                                                        </tr>


                                                    </table>



                                                </ItemTemplate>
                                            </asp:DataList>

                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 nopadding">
                <div class="ourgallery_outer">
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                            <div class="photo_gallery">
                                <h1>Gallery</h1>
                                <div class="row">
                                    

                               
                                  
                                          <div class="col-lg-2">
                                            <asp:DataList ID="ddlgallery" runat="server" RepeatColumns="6">
                                               
                                                <ItemTemplate>
                                                         
                                                            <div class="thumb_container">

                                                       <a href='<%# Eval("imagename", "photos/gallery/{0}") %>' class="fancybox" rel="ligthbox">
                                                    <asp:ImageButton ID="img" runat="server"  ImageUrl='<%# Eval("imagename", "photos/gallery/{0}") %>' width="235" height="230" alt=""  CssClass="img-fluid" />

                                                           </div>
                                                          
                                                </ItemTemplate>
                                            </asp:DataList>
                                         </div>
                                    </div>
                                    
                                 
                                 
                                   
                                    
                                </div>
                                <%--<div class="row">
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/gnew3.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/gnew3.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/g8.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/g8.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/gnew4.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/gnew4.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/g10.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/g10.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/g11.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/g11.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="gallery_pics">
                                            <a href="images/g12.jpg" class="fancybox" rel="ligthbox">
                                                <img src="images/g12.jpg" width="350" height="350" alt="" class="img-fluid" />
                                            </a>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="mission_header">
                    <h1>Mission</h1>
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-3">
                            <div class="block_action">
                                <span>
                                    <img src="images/family-care.png" width="70" height="70" alt="" /></span>
                                <h2>Child Protection</h2>

                                <asp:DataList ID="child" runat="server" RepeatColumns="1">
                                    <ItemTemplate>
                                        <p>
                                            <asp:Label ID="lb" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                        </p>

                                    </ItemTemplate>
                                </asp:DataList>

                                <%--  <p>Children pushed into child labour, children facing abuse in the community, children trafficked, children affected by a calamity or emergency situation - Save the Children works to protect children.</p>--%>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="block_action">
                                <img src="images/family-group.png" width="70" height="70" alt="" />
                                <h2>Adoption Child</h2>


                                <asp:DataList ID="DataList3" runat="server" RepeatColumns="1">
                                    <ItemTemplate>
                                        <p>
                                            <asp:Label ID="lb" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                        </p>

                                    </ItemTemplate>
                                </asp:DataList>
                                <%--    <p>Adoption means a legal process that allows someone to become the parent of a child, even though the parent and child are not related by blood. But in every other way, adoptive parents are the child's parents.</p>--%>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="block_action">
                                <img src="images/management.png" width="70" height="70" alt="" />
                                <h2>Charity Actions</h2>
                                <asp:DataList ID="DataList4" runat="server" RepeatColumns="1">
                                    <ItemTemplate>
                                        <p>
                                            <asp:Label ID="lb" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                        </p>

                                    </ItemTemplate>
                                </asp:DataList>

                                <%-- <p>Anandam Charity Foundation is a humanistic independent Foundation cares for orphans' affairs, in general, and rescue of orphans, in particular.</p>--%>
                            </div>
                        </div>
                        <div class="col-lg-1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-5">
                <div class="featured_outer">
                    <h1>Featured Projects</h1>
                    <img src="images/featured_pic1.jpg" width="550" height="300" alt="" class="img-fluid" />
                    <h2>Donec cursus felis a enim egestas</h2>
                    <p>Etiam ex lorem cursus vitae placerat suscipit dapibus tortor sed nec augue vitae.</p>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="news_heading">
                    <h1>Support</h1>
                    <div class="row">

                        <asp:DataList ID="DataList5" runat="server" RepeatColumns="1">
                            <ItemTemplate>

                                <div class="col-md-4">
                                    <div class="new_pic">                                        
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>' width="250" height="137"  CssClass="img-fluid" alt="Support" />
                                    </div>

                                </div>

                                <div class="col-md-8">
                                    <div class="news_cont">
                                        <h2>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("title") %>'></asp:Label></h2>
                                        <p>
                                            <asp:Label ID="lb" runat="server" Text='<%# Eval("content") %>'></asp:Label></p>

                                    </div>
                                </div>





                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                    
                    
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <div class="supportus_total">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="supportus_outer">
                        <h1>How You Can Support Us</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="support_block">
                                <h1>Adopt a child's Education and give them a better future</h1>
                                <a href="#" target="_self">
                                    <img src="images/supportus_1.png" width="459" height="467" alt="" class="img-fluid" /></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="support_block">
                                <h1>Adopt a child's food to grow healthier and stronger</h1>
                                <a href="https://www.amazon.in/" target="_self">
                                    <img src="images/support_food.jpg" width="459" height="467" alt="" class="img-fluid" />
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="support_block">
                                <h1>Contribute monthly needs of an orphanage to run in a better way</h1>
                                <a href="#" target="_blank">
                                    <img src="images/monthly_needsfinal.png" width="459" height="467" alt="" class="img-fluid" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

