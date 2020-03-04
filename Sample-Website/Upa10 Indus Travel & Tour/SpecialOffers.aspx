<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="SpecialOffers.aspx.cs" Inherits="SpecialOffers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .br {
          width: 100%;overflow: hidden;border-bottom: 3px solid gray;background-color: #234170;padding: 10px;
        }

    </style>
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
    <style>
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.7;
            z-index:999999999!important;
        }
        .pnlBackGround
        {
            position: fixed;
            top: 10%;
            left: 10px;
            width: 600px;
            height: 125px;
            text-align: center;
            background-color: #fff;
            border: solid 3px black;
            padding: 15px;
    border-bottom: 1px solid #e5e5e5;
    height:auto;
    width:600px;

    /*Width="600px" Height="500px"*/
    
       
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <section  class="text-justify " id="background3">
        <div class="container-fluid">
                       <div class="special-head"> 
					   <h1>SPECIAL OFFERS</h1>
					   </div>
                              <div class="col-lg-12">
                                               <div class="row">
											   <div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                                 <div class="pic-wrapper2">
                            <figure class="htl2-1"></figure>
                             <figure class="htl2-2"></figure>
                            <figure class="htl2-3"></figure>
                                </div>
                            </div>
                             <div class="col-lg-8">
                                <div class="row align-items-center bord_gap">
                                     <asp:DataList ID="dl" Width="100%" runat="server" RepeatColumns="1"  CssClass="br">
                                            <ItemTemplate>
                                    <div class="col-lg-8">

                                       <table >
                                           <tr>
                                               <td  style="text-align:left;" valign="top">
                                                      <h3><asp:Label ID="lbtitle" runat="server" Text='<%#Eval("subcat") %>'></asp:Label></h3>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td style="text-align:left;">
                                                        <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="Price" />
                                                  <asp:Button ID="btn1" runat="server" CssClass="btn btn-success" Text="Book Now" />
                                         

                                              
                                               <%-- <a class="accordion-more2" data-toggle="collapse" data-parent="#jobcollapse" href="#jobcollapse">More</a>--%>
                                        
                                            
                                        </div>
                                    </div>
                                               </td>
                                           </tr>
                                          
                                           <tr>
                                               <td>
                                                    <p style="text-align:justify;"><asp:Label ID="lbcontent" runat="server" Text='<%# Eval("content").ToString().Substring(0,100) %>'></asp:Label>  <asp:LinkButton ID="lnkmore" runat="server"   CommandArgument='<%#Eval("oid") %>'  OnClick="ViewDetails" >...More</asp:LinkButton></p>
                                               </td>

                                       
                                           </tr>
                                          <tr style="border-bottom:3px solid gray;width:100%; ">
                                              <td>

                                              </td>
                                          </tr>
                                       </table>
                                             
                                     <%--    <a href="#"><i class="fa fa-map-marker"> Italy</i></a>--%>
                                           
                                               
                                           
                                  
                                     <%--    <a href="#"><i class="fa fa-map-marker"> Italy</i></a>--%>
                                
                                    
                                    </div>
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-3  col-sm-12 col-md-12 col-xs-12 visa-image">
                                        <asp:ImageButton ID="img" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("imagename", "photos/{0}") %>' />
                                    <%--    <img src="./images/hotel1.jpg"  class="img-fluid">--%>
                                    </div>
                             </ItemTemplate>
                                        </asp:DataList>





                                       <asp:Panel ID="pnlGridViewDetails" runat="server"  Style="display: none;"
        CssClass="pnlBackGround">
        <%--Add other controls here--%>
        <table >
            
            <tr>
                <td>
                    <h2 style="color:
#c4115c;">Offer Description</h2>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Details"></asp:Label><br />
        <asp:Button ID="btnclose" runat="server" Text="Close" OnClick="btnclose_Click" ForeColor="Black" />
                </td>
            </tr>
          

        </table>

       
    </asp:Panel>
                                           <asp:Button ID="btnDummy" runat="server" Style="display: none;" />
    <asp:ModalPopupExtender ID="GridViewDetails" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlGridViewDetails" BackgroundCssClass="modalBackground" />





                                </div>
                                </div>
								<div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                              <div class="spec_inner2">
                       	    	<a href="#" target="_self"><img src="images/spec_final1.jpg" width="350" height="250" alt="" class="img-fluid"/></a> 
                                <h1>Special Offers on Hotels</h1>
                            </div>
                               </div>
                                   </div>            
                                    </div>
                                        <div class="col-lg-12">
                                               <div class="row">
											  <div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                            </div>
                             
								 
                                   </div>            
                            </div>
                             <div class="col-lg-12">
                                                           
                                   </div>
                             <div class="col-lg-12">
                                    <div class="row">
						<div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                            <div class="pic-wrapper3">
                            <figure class="htl-1"></figure>
                             <figure class="htl-2"></figure>
                            <figure class="htl-3"></figure>
                                </div>
                           </div>
                             
			      
                                   </div>            
                            </div>
                             <div class="col-lg-12">
                               <div class="row">
						  <div class="col-lg-2 col-sm-12 col-md-3 col-xs-12">
                 
                          </div>
                             
							   
                                   </div>            
                            </div>
                             <div class="col-lg-12">
                               <div class="row">
						 
                             
					           
                                   </div>            
                            </div>
                          </div>
                 </section>
     <!-- view Modal Hotels -->
    <!-- model hotel-->
    <div class="modal fade" id="hotel1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-dark">
                    <h3>Customer Service</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="bg-teal text-danger" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam cumque distinctio dolorem explicabo mollitia, quisquam totam veniam vitae? Doloremque, eligendi.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eaque facere harum illum nihil repellendus.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, dolor!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger">Book</button>
                </div>
            </div>
        </div>
    </div>

    <!-- model hote2-->
</asp:Content>

