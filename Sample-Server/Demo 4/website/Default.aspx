<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        :: Salute India ::

    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="News - Clean HTML5 and CSS3 responsive template" />
<meta name="author" content="MyPassion" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="img/sms-4.ico" />

<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/fontello/fontello.css" />
<link rel="stylesheet" type="text/css" href="css/flexslider.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/ui.css" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/960.css" />
<link rel="stylesheet" type="text/css" href="css/devices/1000.css" media="only screen and (min-width: 768px) and (max-width: 1000px)" />
<link rel="stylesheet" type="text/css" href="css/devices/767.css" media="only screen and (min-width: 480px) and (max-width: 767px)" />
<link rel="stylesheet" type="text/css" href="css/devices/479.css" media="only screen and (min-width: 200px) and (max-width: 479px)" />
<link href='http://fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700,800' rel='stylesheet' type='text/css'>


     <style type="text/css">
  .Star{background-image: url(images/Star.gif);height: 17px;width: 17px;}
        .WaitingStar{background-image: url(images/WaitingStar.gif);height: 17px;width: 17px;}
        .FilledStar{background-image: url(images/FilledStar.gif);height: 17px;width: 17px;}
        
</style>

</head>
    
<body>
    <form id="form1" runat="server">
        <!-- Body Wrapper -->
<div class="body-wrapper">
	<div class="controller">
    <div class="controller2">

        <!-- Header -->
        <header id="header">
            <div class="container">
                <div class="column">
                    <div class="logo">
                        <a href="Default.aspx"><img src="img/logo-2.jpg" alt="MyPassion" /></a>
                    </div>
                    
                    <div class="search">
                        <form action="#" method="post">
                            <input type="text" value="Search." onblur="if(this.value=='') this.value='Search.';" onfocus="if(this.value=='Search.') this.value='';" class="ft"/>
                            <input type="submit" value="" class="fs">
                        </form>
                    </div>
                    
                    <!-- Nav -->
                    <nav id="nav">
                        <ul class="sf-menu">
                            <li class="current"><a href="#">Home</a></li>
                            <li>
                            	<a href="#">Movie News</a>
                              
                            </li>
                            <li><a href="#">Political News</a></li>
                            <li><a href="#">Galleries</a></li>
                            <li><a href="#">Reviews</a></li>
                            <li>
                                <a href="#">Videos</a>
                              
                            </li>
                            <li><a href="#">Gossips</a></li>
                            <li><a href="#">Advertise With Us</a></li>
                            <li><a href="#">Telugu</a></li>
                            <%--<li><a href="#">Contact</a></li>--%>
                        </ul>
                        
                    </nav>
                    <!-- /Nav -->
                </div>
            </div>
        </header>
        <!-- /Header -->
        
        <!-- Slider -->
        <section id="slider">
            <div class="container">
                <div class="main-slider">
                	<div class="badg">
                    	<p><a href="#">Popular.</a></p>
                    </div>
                	<div class="flexslider">
                        <ul class="slides">
                            
                                  <asp:Repeater ID="dlimagebind5" runat="server" >
            <ItemTemplate>
                <li >
            
           <asp:ImageButton ID="HyperLinkw2" runat="server" Target="_blank"  Width="540px" Height="372px" 
                         ImageUrl='<%# Eval("Image", "upload photos/\\{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' />
               <%--      <asp:HyperLink ID="HyperLinkw2" runat="server" Target="_blank"  Width="400px" Height="150px" 
                         ImageUrl='<%# Eval("Image", "~/upload photos/\\{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' >                            
                          </asp:HyperLink> --%>

                   
                          <p class="flex-caption">
                          <asp:HyperLink ID="HyperLink21" runat="server" Target="_blank" NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' Font-Underline="false">    
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("News_Title") %>'  ></asp:Label>

                          </asp:HyperLink> 
                               </p>
                                </li>

                      
                          </li>
            </ItemTemplate>
        </asp:Repeater>
   
                            <li>
   
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="slider2">
                	<div class="badg">
                    	<p><a href="#">Latest Gallery.    </p>   </div>           
                            
                            <ul style="list-style:none;">
                      <%--      
                             <asp:Repeater ID="Repeater1" runat="server"   >
            <ItemTemplate>
                <li >
            
           <asp:ImageButton ID="HyperLinkw2" runat="server" Target="_blank" width="100%" height="220px"  
                         ImageUrl='<%# Eval("Image", "upload photos/\\{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' />
           

                   
                          <p class="caption">
                          <asp:HyperLink ID="HyperLink21" runat="server" Target="_blank" NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' Font-Underline="false">    
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("News_Title") %>'  ></asp:Label>

                          </asp:HyperLink> 
                               </p>
                                </li>

                      
                          </li>
            </ItemTemplate>
        </asp:Repeater>--%>
                             
                            <%--    <h4 style="color:#006699;text-align:center;height:10px;" >Actors</h4>--%>
                                <h1></h1>
                                   <asp:DataList ID="ddlactors" runat="server"  RepeatColumns="2"  CellPadding="0"  CellSpacing="0"
                RepeatDirection="Horizontal" OnItemCommand="ddlactors_ItemCommand" > <%--ImageUrl='<%# Eval("actorimage") %>'--%> <%--ImageUrl='<%# Eval("actorimage", "~/upload photos\\{0}") %>'--%>
         <ItemTemplate>
        

                  <asp:ImageButton ID="Galery_Img" runat="server"   ImageUrl='<%# Eval("actorimage") %>'
       NavigateUrl='<%# string.Format("Gallery_ViewList1.aspx?Pid={0}", Eval("did")) %>' 
                     CommandName="ViewList" CommandArgument='<%#Eval("dId") %>'    Width="160px" Height="115px"/>  
                  
          
         </ItemTemplate>
      </asp:DataList>

                               <%-- <h4 style="color:#006699;text-align:center;height:10px;">Actress</h4>--%>
                                 <asp:DataList ID="ddlheroins" runat="server"   RepeatColumns="2" CellPadding="0"  CellSpacing="0"
        RepeatDirection="Horizontal"   OnItemCommand="ddlheroins_ItemCommand"> <%--ImageUrl='<%# Eval("actorimage") %>'--%>
         <ItemTemplate>        
     
                  <asp:ImageButton ID="Galery_Img" runat="server"  ImageUrl='<%# Eval("actorimage") %>'
       NavigateUrl='<%# string.Format("Gallery_ViewList1.aspx?Pid={0}", Eval("did")) %>'
                     CommandName="ViewList" CommandArgument='<%#Eval("dId") %>'    Width="160px" Height="115px"/>  
                        
         </ItemTemplate>
      </asp:DataList> 
                                </ul>
                </div>
                <br />
                     <br />
                    <%--<div style="height:100%;">
                        <br />
                    </div>--%>
             <%--   <div class="slider3">
                	<a href="#"><img src="img/trash/3.png" alt="MyPassion" /></a>
                    <p class="caption"><a href="#">Happy Birthday, blue jeans! </a></p>
                </div>
                
                <div class="slider3">
                	<a href="#"><img src="img/trash/4.png" alt="MyPassion" /></a>
                    <p class="caption"><a href="#">Fantasy Family Photos </a></p>
                </div>--%>
                
            </div>    
        </section>
        <!-- / Slider -->
        
        <!-- Content -->
        <section id="content">
            <div class="container">
            	<!-- Main Content -->
                <div class="main-content">
                	
                    <!-- Popular News -->
                	<div class="column-one-third">
                    	<h5 class="line"><span>Bollywood News.</span></h5>
                        <div class="outertight">
                        	<ul class="block">
                            
 
<li>

                                                            <asp:Repeater ID="DataList1" runat="server"  >
        <ItemTemplate>
               <asp:Image ID="Image1" AlternateText="Image Not Available" runat="server" ImageUrl='<%# Eval("image","upload photos/{0}") %>' Width="140px" Height="86px"   CssClass="alignleft"  />
           
         


                <p>
                     <span><asp:Label ID="lb" runat="server" Text='<%# Eval("postedDate") %>'></asp:Label></span>
                    
          <asp:HyperLink ID="HyperLink23" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("News_Title") %>' Height="78px"
               NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("pid")) %>'  Width="140px"> </asp:HyperLink>  
                     
                </p>
         
             <%-- <span class="rating" style="margin-top: -39px;
    margin-left: 159px;"><span style="width:80%;"></span></span>--%>

            
             <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>
        </ItemTemplate>
                             
    </asp:Repeater>
    <span style="text-align:right;">
           <asp:LinkButton ID="lnk" runat="server" Text="More..." ForeColor="#ea4748"></asp:LinkButton>     
    </span>
   
</li>       
                                                  
                              
                            </ul>
                        </div>
                        
                    </div>
                    <!-- /Popular News -->
                    
                    <!-- Hot News -->
                    <div class="column-one-third">
                    	<h5 class="line"><span>Tollywood News.</span></h5>
                        <div class="outertight m-r-no">
                        	<ul class="block">
                              
                               <asp:Repeater ID="Repeater1" runat="server"  >
        <ItemTemplate>
               <asp:Image ID="Image1" AlternateText="Image Not Available" runat="server" ImageUrl='<%# Eval("image","upload photos/{0}") %>' Width="140px" Height="86px"   CssClass="alignleft"  />
           
         


                <p>
                     <span><asp:Label ID="lb" runat="server" Text='<%# Eval("postedDate") %>'></asp:Label></span>
                    
          <asp:HyperLink ID="HyperLink23" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("News_Title") %>' Height="78px"
               NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("pid")) %>'  Width="140px"> </asp:HyperLink>  
                     
                </p>
         
         <%--     <span class="rating" style="margin-top: -39px;
    margin-left: 159px;"><span style="width:80%;"></span></span>--%>

            
             <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>
        </ItemTemplate>
                    
    </asp:Repeater>
                               
                 <span style="text-align:right;">
           <asp:LinkButton ID="LinkButton1" runat="server" Text="More..." ForeColor="#ea4748"></asp:LinkButton>     
    </span>                         
                            </ul>
                        </div>
                        
                    </div>
                    <!-- /Hot News -->
                    
                    <!-- Life Style -->
                    <div class="column-two-third">
                    	<h5 class="line">
                        	<span>Gossips.</span>
                            <div class="navbar">
                                <a id="next1" class="next" href="#"><span></span></a>	
                                <a id="prev1" class="prev" href="#"><span></span></a>
                            </div>
                        </h5>
                        
                        <div class="outertight">
                        	<%--<img src="img/trash/24.png" alt="MyPassion" />--%>

                     <asp:Repeater ID="Repeater2" runat="server"  >
            <ItemTemplate>
                <li  style="list-style:none">
            
           <asp:ImageButton ID="HyperLinkw2" runat="server" Target="_blank"  Width="300px" Height="162px" 
                         ImageUrl='<%# Eval("imgname", "upload photos/{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("sid")) %>' />
               <%--      <asp:HyperLink ID="HyperLinkw2" runat="server" Target="_blank"  Width="400px" Height="150px" 
                         ImageUrl='<%# Eval("Image", "~/upload photos/\\{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' >                            
                          </asp:HyperLink> --%>

                   
                                </li>
             


                      
                      
                <li style="list-style:none">
                    <h6 class="regular"><a href="#"><asp:Label ID="lbgossip" runat="server" Text='<%#Eval("Title") %>'></asp:Label></a></h6>

                    <span class="meta"><asp:Label ID="gosdate" runat="server" Text='<%#Eval("postdate") %>'></asp:Label> \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>

                     <p>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Discription").ToString().Substring(0, 150) %>'></asp:Label>
                    </p>

                </li>
                <li style="list-style:none;">
                    	

                    </li>
                <li style="list-style:none">
                   
                </li>

            </ItemTemplate>
        </asp:Repeater>

                         
                        </div>
                        
                        <div class="outertight m-r-no">
                        	
                        	<ul class="block" id="carousel">
                                <li>

                                
                               
                                        <asp:Repeater ID="Repeater3" runat="server"  >
        <ItemTemplate>
               <asp:Image ID="Image1" AlternateText="Image Not Available" runat="server" ImageUrl='<%# Eval("imgname","upload photos/{0}") %>' Width="140px" Height="86px"   CssClass="alignleft"  />
           
         


                <p>
                     <span><asp:Label ID="lb" runat="server" Text='<%# Eval("postDate") %>'></asp:Label></span>
                    
          <asp:HyperLink ID="HyperLink23" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("Title") %>' Height="78px"
               NavigateUrl='<%# string.Format("Details2.aspx?sid={0}", Eval("sid")) %>'  Width="140px"> </asp:HyperLink>  
                     
                </p>
         
             <%-- <span class="rating" style="margin-top: -39px;
    margin-left: 159px;"><span style="width:80%;"></span></span>--%>

            
             <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>
        </ItemTemplate>
                             
    </asp:Repeater>
                                 
                               <%--  <span style="text-align:right;">
           <asp:LinkButton ID="LinkButton2" runat="server" Text="More..." ForeColor="#ea4748"></asp:LinkButton>     
    </span>         --%>
                               </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /Life Style -->
                    
                    <!-- World News -->
                    <div class="column-two-third">
                    	<h5 class="line">
                        	<span>Movie Reviews</span>
                            <div class="navbar">
                                <a id="next2" class="next" href="#"><span></span></a>	
                                <a id="prev2" class="prev" href="#"><span></span></a>
                            </div>
                        </h5>
                        
                        <div class="outerwide" >
                        	<ul class="wnews" id="carousel2">
                            	
                                <li>

                              <asp:Repeater ID="ddlreviews" runat="server"  OnItemDataBound="ddlreviews_ItemDataBound" >
            <ItemTemplate>
                <li  style="list-style:none">
               <asp:HiddenField runat="server" ID="hfName1" Value='<%# Eval("MReviewTitleId") %>' />
          <asp:ImageButton ID="img1" runat="server"  
                                           ImageUrl='<%#Eval("MReview_Image","Upload photos/{0}") %>' Width="300px" Height="162px"  CssClass="alignleft" 
                                           CommandName="review" CommandArgument='<%# Eval("MReviewTitleId") %>' Style="border:solid 2px #e5e5e5" /> 
               <%--      <asp:HyperLink ID="HyperLinkw2" runat="server" Target="_blank"  Width="400px" Height="150px" 
                         ImageUrl='<%# Eval("Image", "~/upload photos/\\{0}") %>' NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("Pid")) %>' >                            
                          </asp:HyperLink> --%>

                   <h6 class="regular"><a href="#"><asp:Label ID="lbreviews" runat="server" Text='<%#Eval("MReview_Title") %>'></asp:Label></a></h6>

                    <span class="meta"><asp:Label ID="revsdate" runat="server" Text='<%#Eval("MReviewPosteddate") %>'></asp:Label> \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                       <asp:Image ID="imgrat2" runat="server" Width="51px"   />
              <%--        <cc1:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar" 
               CurrentRating='<%#Eval("MReview_Rating") %>'></cc1:Rating>--%>

                     <p>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("MReviewDiscription").ToString().Substring(0, 150) %>'></asp:Label>
                    </p>

<span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>

                                </li>
             


                      
                      
                <li style="list-style:none">
                    
                </li>
                <li style="list-style:none;">
                    	

                    </li>
                <li style="list-style:none">
                   
                </li>

            </ItemTemplate>
        </asp:Repeater>


                                </li>
                              
                               
                            </ul>
                        </div>
                        
                        <div class="outerwide">
                        	<ul class="block2">
                               
                            
                                <li>

                                    <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound"  >
        <ItemTemplate>
             <asp:HiddenField runat="server" ID="hfName" Value='<%# Eval("MReviewTitleId") %>' />
               <asp:Image ID="Image1" AlternateText="Image Not Available" runat="server" ImageUrl='<%# Eval("MReview_Image","upload photos/{0}") %>' Width="140px" Height="86px"   CssClass="alignleft"  />
                <p>
                     <span><asp:Label ID="lb" runat="server" Text='<%# Eval("MReviewPosteddate") %>'></asp:Label></span>
                    <asp:Image ID="imgrat" runat="server" Width="51px"   />
               <%--     <cc1:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar" 
               CurrentRating='<%#Eval("MReview_Rating") %>'></cc1:Rating>--%>
          <asp:HyperLink ID="HyperLink23" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("MReview_Title") %>' Height="78px"
               NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("MReviewTitleId")) %>'  Width="140px"> </asp:HyperLink>  
                        <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>
                </p>
         
         <%--     <span class="rating" style="margin-top: -39px;
    margin-left: 159px;"><span style="width:80%;"></span></span>--%>

            
         
        </ItemTemplate>
                             
    </asp:Repeater>
                                    </li>
                                <li class="m-r-no">
                                     <asp:Repeater ID="Repeater6" runat="server" OnItemDataBound="Repeater6_ItemDataBound"  >
        <ItemTemplate>

                    <asp:HiddenField runat="server" ID="hfName2" Value='<%# Eval("MReviewTitleId") %>' />
               <asp:Image ID="Image1" AlternateText="Image Not Available" runat="server" ImageUrl='<%# Eval("MReview_Image","upload photos/{0}") %>' Width="140px" Height="86px"   CssClass="alignleft"  />
           
         


                <p>
                     <span><asp:Label ID="lb" runat="server" Text='<%# Eval("MReviewPosteddate") %>'></asp:Label></span>
                    
                    <asp:Image ID="imgrat1" runat="server" Width="51px" />
            <%--        <cc1:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar" 
               CurrentRating='<%#Eval("MReview_Rating") %>'></cc1:Rating>--%>
          <asp:HyperLink ID="HyperLink24" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("MReview_Title") %>' Height="78px"
               NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("MReviewTitleId")) %>'  Width="140px"> </asp:HyperLink>  
                     
                       <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>
                </p>
         
         <%--     <span class="rating" style="margin-top: -39px;
    margin-left: 159px;"><span style="width:80%;"></span></span>--%>

            
   <%--         <span style="border-bottom: solid #dbdbdb;border-width:1px; "> </span>--%>
        </ItemTemplate>
                             
    </asp:Repeater>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                    <!-- /World News -->
                    
                    <!-- Popular News -->
                	<div class="column-two-third">
                    	<div class="outertight">
                        	<h5 class="line"><span>Bhakthi</span></h5>
                            
                            <div class="outertight m-r-no">
                                <div class="">
                                    <ul class="">
                                        <li style="list-style:none;" >
                                             <asp:Repeater ID="bhaktiddl" runat="server"      >
         <ItemTemplate>
             <li style="list-style:none;margin-left:-20px" >
              <asp:ImageButton ID="imghmd" runat="server" ImageUrl='<%#Eval("imagename") %>'  Width="300px" Height="162px"   Target="_blank"
                         CommandName="god" CommandArgument='<%#Eval("id") %>' />

                      <h6 class="regular" style="text-align:center"><a href="#"><asp:Label      ID="lb1" runat="server" Text='<%#Eval("godname") %>'></asp:Label>
   </a></h6>
                                <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                <p> <asp:Label ID="Label2" runat="server" Text='<%#Eval("description").ToString().Substring(0, 55) %>'></asp:Label></p>  

                     
             </li>
             
                          
              
                   
                 </tr>
             </table>
                        
         </ItemTemplate>
      </asp:Repeater>

                                        </li>
                                    </ul>
                                </div>
                                
                              
                            </div>
                         
                            
                            <ul class="block">
                                <li>
                                    <asp:Repeater ID="Repeater8" runat="server"      >
         <ItemTemplate>
             <li style="list-style:none;">
                 <asp:ImageButton ID="imghmd" runat="server" ImageUrl='<%#Eval("imagename") %>' CssClass="alignleft"  Target="_blank" Width="140px" Height="86px"
                         CommandName="god" CommandArgument='<%#Eval("id") %>' />

                  <h6 class="regular" style="text-align:center"><a href="#"><asp:Label      ID="lb1" runat="server" Text='<%#Eval("godname") %>'></asp:Label>
   </a></h6>
                              <%--  <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>--%>
                             <%--   <p> <asp:Label ID="Label2" runat="server" Text='<%#Eval("godname") %>'></asp:Label></p>  --%>

                     
             </li>
             
                          
                   
                   
                 </tr>
             </table>
                        
         </ItemTemplate>
      </asp:Repeater>
                                        <span style="text-align:right;">
           <asp:LinkButton ID="LinkButton3" runat="server" Text="More..." ForeColor="#ea4748"></asp:LinkButton>     
    </span>         
                                </li>
                            
                            </ul>
                        </div>
                        
                        <div class="outertight m-r-no">
                        	<h5 class="line"><span>Crime News.</span></h5>
                            
                            <div class="outertight m-r-no">
                                <div class="">
                                    <ul class="">
                                        <li style="list-style:none;">
                                            <asp:Repeater ID="Repeater7" runat="server"      >
         <ItemTemplate>
             <li style="list-style:none;margin-left:-18px;">
                 <asp:ImageButton ID="imghmd" runat="server" ImageUrl='<%# Eval("imagename","upload photos/{0}") %>'  Width="300px" Height="162px"   Target="_blank"
                         CommandName="god" CommandArgument='<%#Eval("id") %>' />
                     <h6 class="regular" style="text-align:center"><asp:Label ID="Label5" runat="server" Text='<%#Eval("title").ToString().Substring(0, 25) %>' Width="200px"></asp:Label></h6>  
               <span class="meta"><asp:Label ID="Label4" runat="server" Text='<%#Eval("createddate") %>'></asp:Label></span>  
               
                       <p> <asp:Label ID="Label2" runat="server" Text='<%#Eval("description").ToString().Substring(0, 100) %>'></asp:Label></p>  
                     
             </li>
             <li style="list-style:none;">
                
             </li>
                          
                   
                   
                 </tr>
             </table>
                        
         </ItemTemplate>
      </asp:Repeater>
                                        </li>
                                    </ul>
                                </div>
                                
                               <%-- <h6 class="regular"><a href="#">Blandit Rutrum, Erat et Sagittis. Lorem
    Ipsum Dolor, Sit Amet Adipsing.</a></h6>
                                <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                <p>Blandit rutrum, erat et egestas ultricies, dolor tortor egestas enim, quiste rhoncus sem purus eu sapien. Curabitur a orci nec risus lacinia vehic. Lorem ipsum 
    dolor adipcising elit. Erat egestan sagittis lorem aupo dolor sit ameta, auctor libero tempor...</p>--%>
                            </div>
                            
                            <ul class="block">
                                <li>
                                    <asp:Repeater ID="Repeater9" runat="server"      >
         <ItemTemplate>
             <li style="list-style:none;">
                 <asp:ImageButton ID="imghmd" runat="server" ImageUrl='<%# Eval("imagename","upload photos/{0}") %>'  class="alignleft" Width="140px" Height="86px"    Target="_blank"
                         CommandName="god" CommandArgument='<%#Eval("id") %>' />
                  <p>
                     <span >
                          <asp:Label ID="Label3" runat="server" Text='<%#Eval("createddate") %>'></asp:Label>
                     </span>
                      <span style="color:#929292;">  <asp:Label ID="lbti" runat="server" Text='<%#Eval("title").ToString().Substring(0, 25) %>' Width="140px" ForeColor="#929292"></asp:Label></span>
                     
                 </p>
                     
             </li>
           
                   
                   
                 </tr>
             </table>
                        
         </ItemTemplate>
      </asp:Repeater>    <span style="text-align:right;">
           <asp:LinkButton ID="LinkButton4" runat="server" Text="More..." ForeColor="#ea4748"></asp:LinkButton>     
    </span>         
                                </li>
                               
                            </ul>
                        </div>
                    	
                    </div>
                    <!-- /Popular News -->
                    
                </div>
                <!-- /Main Content -->
                
                <!-- Left Sidebar -->
                <div class="column-one-third">
                	<div class="sidebar">
                    	<h5 class="line"><span>Stay Connected.</span></h5>
                        <ul class="social">
                        	<li>
                            	<a href="#" class="facebook"><i class="icon-facebook"></i></a>
                                <span>6,800 <br/> <i>fans</i></span>
                            </li>
                            <li>
                            	<a href="#" class="twitter"><i class="icon-twitter"></i></a>
                                <span>12,475 <br/> <i>followers</i></span>
                            </li>
                            <li>
                            	<a href="#" class="rss"><i class="icon-rss"></i></a>
                                <span><i>Subscribe via rss</i></span>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>Vimeo Video.</span></h5>
                        <iframe src="http://player.vimeo.com/video/65110834?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff" width="300px" height="170px" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                    </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>Ads Spot.</span></h5>
                        <ul class="ads125">
                        	<li><a href="#"><img src="img/banner/3.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="img/banner/1.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="img/banner/2.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="img/banner/4.png" alt="MyPassion" /></a></li>
                        </ul>
                    </div>
                    
                    <div class="sidebar">
                    	<div id="tabs">
                            <ul>
                                <li><a href="#tabs1">Recent.</a></li>
                                <li><a href="#tabs2">Popular.</a></li>
                                <li><a href="#tabs3">Comments.</a></li>
                            </ul>
                            <div id="tabs1">
                                <ul>
                                	<li>
                                    	<a href="#" class="title">Blandit Rutrum, Erat et Sagittis Adipcising Elit.</a>
                                        <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                        <span class="rating"><span style="width:70%;"></span></span>
                                    </li>
                                    <li>
                                    	<a href="#" class="title">Blandit Rutrum, Erat et Sagittis Adipcising Elit.</a>
                                        <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                        <span class="rating"><span style="width:70%;"></span></span>
                                    </li>
                                    <li>
                                    	<a href="#" class="title">Blandit Rutrum, Erat et Sagittis Adipcising Elit.</a>
                                        <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                        <span class="rating"><span style="width:70%;"></span></span>
                                    </li>
                                    <li>
                                    	<a href="#" class="title">Blandit Rutrum, Erat et Sagittis Adipcising Elit.</a>
                                        <span class="meta">26 May, 2013.   \\   <a href="#">World News.</a>   \\   <a href="#">No Coments.</a></span>
                                        <span class="rating"><span style="width:70%;"></span></span>
                                    </li>
                                </ul>
                            </div>
                            <div id="tabs2">
                                <ul>
                                	                                   	   <asp:Repeater ID="DataList2" runat="server"  >
        <ItemTemplate>
        <li style="list-style:none;">
            <span class="meta"><asp:Label ID="lb" runat="server" Text='<%#Eval("posteddate") %>'></asp:Label></span>
<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#006699" Target="_blank" Text='<%#Eval("News_Title") %>' Height="30px"
               NavigateUrl='<%# string.Format("Details2.aspx?Pid={0}", Eval("NewsId")) %>' CssClass="thumb1"></asp:HyperLink> 

            </li>

             
                      
            

      
              
        </ItemTemplate>
    </asp:Repeater>
                                                                   </ul>
                            </div>
                            <div id="tabs3">
                                <ul>
                                	<li>
                                    	<a href="#" class="title"><strong>Someone:</strong> eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis id erat.</a>
                                    </li>
                                    <li>
                                    	<a href="#" class="title"><strong>Someone:</strong> eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis id erat.</a>
                                    </li>
                                    <li>
                                    	<a href="#" class="title"><strong>Someone:</strong> eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis id erat.</a>
                                    </li>
                                    <li>
                                    	<a href="#" class="title"><strong>Someone:</strong> eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis id erat.</a>
                                    </li>
                                    <li>
                                    	<a href="#" class="title"><strong>Someone:</strong> eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis id erat.</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>Accordion.</span></h5>
                        <div id="accordion">
                        
                            <h3>Poserue Clubre.</h3>
                            <div>
                                <p>Vestibulum tempor feugiat est in posuere. Sed auctor libero augue, a faucibus turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices. posuere.</p>
                            </div>
                            
                            <h3>Lubelia Mest.</h3>
                            <div>
                                <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.</p>
                            </div>
                        
                            <h3>Tincidunt Massa.</h3>
                            <div>
                                <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
                            </div>
                            
                            <h3>Quisque lobortis.</h3>
                            <div>
                                <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.</p>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>Ads Spot.</span></h5>
                        <a href="#"><img src="img/tf_300x250_v1.gif" alt="MyPassion" /></a>     
                    </div>
                	
                    <div class="sidebar">
                    	<h5 class="line"><span>Facebook.</span></h5>
                        <iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fenvato&amp;width=298&amp;height=258&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;border_color=%23BCBCBC&amp;header=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:298px; height:258px;" allowTransparency="true"></iframe>
                    </div>
                </div>
                <!-- /Left Sidebar -->
                
            </div>    
        </section>
        <!-- / Content -->
        
        <!-- Footer -->
        <footer id="footer">
            <div class="container">
            	<div class="column-one-fourth">
                    <h5 class="line"><span>Tweets.</span></h5>
                    <div id="tweets"></div>
                </div>
                <div class="column-one-fourth">
                    <h5 class="line"><span>Navigation.</span></h5>
                    <ul class="footnav">
                    	<li><a href="#"><i class="icon-right-open"></i> World.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Business.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Politics.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Sports.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Health.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Sciences.</a></li>
                        <li><a href="#"><i class="icon-right-open"></i> Spotlight.</a></li>
                    </ul>
                </div>
                <div class="column-one-fourth">
                    <h5 class="line"><span> Comedy</span></h5>
                    <div class="flickrfeed">
                        <ul id="basicuse" class="thumbs"><li  >


             <%--                 <asp:DataList ID="DataList2" runat="server"   RepeatColumns="3"
        RepeatDirection="Horizontal"   > 
         <ItemTemplate>        
         <table><tr><td style="width:130px;height:150px">
                  <asp:ImageButton ID="Galery_Img1" runat="server"  ImageUrl='<%# Eval("imagename") %>'
       NavigateUrl='<%# string.Format("Comedyhome.aspx?pid={0}", Eval("cid")) %>'
                     CommandName="comedy" CommandArgument='<%#Eval("cid") %>' CssClass="imggallcontainer" Style="border:solid 3px #e5e5e5"  Width="130px" Height="135px"/>  
                    </td></tr></table>         
         </ItemTemplate>
      </asp:DataList> --%>
                                <asp:Repeater ID="Repeater4" runat="server"  >
                    <ItemTemplate>
                        <tr>
                            <td width="50%" >
                           <asp:ImageButton ID="Galery_Img1" runat="server"  ImageUrl='<%# Eval("imagename") %>'
       NavigateUrl='<%# string.Format("Comedyhome.aspx?pid={0}", Eval("cid")) %>'
                     CommandName="comedy" CommandArgument='<%#Eval("cid") %>'   Width="93px" Height="67px"/>  
                           <%--     <%# Eval("Discription") %>--%>
                            </td>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <td  width="50%">
                            <asp:ImageButton ID="Galery_Img1" runat="server"  ImageUrl='<%# Eval("imagename") %>'
       NavigateUrl='<%# string.Format("Comedyhome.aspx?pid={0}", Eval("cid")) %>'
                     CommandName="comedy" CommandArgument='<%#Eval("cid") %>'   Width="93px" Height="67px"/>  
                        <%--    <%# Eval("Discription") %>--%>
                        </td>
                        </tr>
                    </AlternatingItemTemplate>

                                    
                                         
                    <HeaderTemplate>
                        <table  cellpadding="0" cellspacing="0" border="0" >
                    </HeaderTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                                 
                                                         </li></ul>
                    </div>
                </div>
                <div class="column-one-fourth">
                    <h5 class="line"><span>About.</span></h5>
                    <p>Blandit rutrum, erat et egestas ultricies, dolor tortor egestas enim, quiste rhon cus sem purus eu sapien. Lorem ipsum dolor sit amet adipcising elit. Elit norem simuls tortor lorem adipcising purus mosteu dsapien egestas.</p>
                </div>
                <p class="copyright">Copyright 2018. All Rights Reserved</p>
            </div>
        </footer>
        <!-- / Footer -->
    
    </div>
	</div>
</div>
<!-- / Body Wrapper -->

    </form>
<!-- SCRIPTS -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easing.min.js"></script>
<script type="text/javascript" src="js/1.8.2.min.js"></script>
<script type="text/javascript" src="js/ui.js"></script>
<script type="text/javascript" src="js/carouFredSel.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/customM.js"></script>
<script type="text/javascript" src="js/flexslider-min.js"></script>
<script type="text/javascript" src="js/tweetable.js"></script>
<script type="text/javascript" src="js/timeago.js"></script>
<%--<script type="text/javascript" src="js/jflickrfeed.min.js"></script>--%>
<script type="text/javascript" src="js/mobilemenu.js"></script>


<script type="text/javascript" src="js/mypassion.js"></script>

</body>
</html>
