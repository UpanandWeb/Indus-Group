<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Overview" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />
  
  <style>
    
       b,h3 { color: darkblue;}
      b{font-family: 'Lato', sans-serif;font-weight:bold;}
      p {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;line-height: 25px}
      .col-sm-9 ul li {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;padding: 5px 0;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="padding:10px;">
        <div class="row">
            <div class="col-sm-9" >
            <h3>
                   Company Overview :
                </h3>
								<p align="justify">
								    <b style="font-size: 14px"></b> Whether you are only looking for some specific resources during a limited time frame, or require a complete solution design and implementation, our offering schedule has the flexibility and depth to adapt to your needs and objectives.
                    <br /> <br />
<b>From Consulting to Outsourcing, we provide our clients with:</b>  <br /> <br />
A variable cost delivery model for you that virtually eliminates downtime and cannibalization of hard earned profits.<br />
Superior satisfaction with top quality, emotionally intelligent resources.<br />
Reduced risk with superior quality deliverables, fixed fee services, and guaranteed results <br /> <br />

<b>Our commitment : </b>Delighting each and every customer by delivering unequaled client service at the best value. 
                   <br /> <br />

<b>We invite you to learn more about our different services: </b>
                   <br /> <br />

<b>Consulting :</b> <br />
                                   In need of a project-specific skill set? Would like to find out how to dramatically improve your IT infrastructure by fully leveraging existing assets? Our top-notch " IT Gurus " can help.
                   <br /> <br />
<b>Project Management:</b><br />
                                     When facing time-critical deployment on-site, such as system upgrades, legacy integration and application customization, our experienced project manager deliver results — fast.
                       <br /> <br />
<b>Project Outsourcing:</b> <br /> 
                                    If you need to design and deploy peripheral systems, but are lacking the necessary expertise in-house to make it happen, we can develop a turn-key solution according to your exact specifications.
                      <br /> <br />
<b>Offshore Development:</b><br />
                                     Sometimes, maximizing productivity calls for the design and creation of a large, complex application. Our Indian Offshore Development offering delivers superior quality, custom-fit software at tremendous cost savings.
                        <br /> <br />

<b>Value-Added Reseller ship (VAR) in India:</b> <br />
                                   If you are a software company wishing to expand your international outreach, and are looking for an aggressive, energetic team to directly sell and support your products in the Indian market, we can help you maximize your sales there.
                       <br /> <br />

								</p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>

