<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Portfolio.aspx.cs" Inherits="Portfolio" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />
  
  <style>
    
      b , h3 { color: darkblue;}
      b{font-family: 'Lato', sans-serif;font-weight:bold;}
      p {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;line-height: 25px}
      .col-sm-9 ul li {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;padding: 5px 0;}
      
      .some{ padding: 20px 2px; }
      .some .col-sm-3 {margin:0 0 1% 0}
      .some .col-sm-3 img , iframe {border: 1px solid darkblue; border-radius: 5px; padding: 10px}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding:10px;">
        <div class="row">
            <div class="col-sm-9">
            <h3>
                    Portfolio :
                </h3>
								<div class="row some" >
								    <div class="col-sm-3"><a href="http://aceindus.in/ittraining/training/" target="_blank"><img src="img/g-4.JPG" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://www.1indus.com" target="_blank"><img src="img/g-beetle.jpg" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://saluteindia.com" target="_blank"><img src="img/g-grow-green.jpg" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://www.industravels.com" target="_blank"><img src="img/g-shutterbug.jpg" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://www.wawalive.com" target="_blank"><img src="img/g-5.JPG" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://1indus.com/web/mnhbs/" target="_blank"><img src="img/g-6.jpg" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://www.indussms.com" target="_blank"><img src="img/g-7.jpg" alt="" width="100%" height="400px"></a></div>
								    <div class="col-sm-3"><a href="http://www.indusemail.com" target="_blank"><img src="img/g-8.jpg" alt="" width="100%" height="400px"></a></div>
								    
								    
								</div>
							</div>

            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
           
        </div>
    </div>
</asp:Content>

