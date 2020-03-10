<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Development.aspx.cs" Inherits="Development" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />
  
  <style>
    
      b , h3 { color: darkgreen;}
      b{font-family: 'Lato', sans-serif;font-weight:bold;}
      p {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;line-height: 25px}
      .col-sm-9 ul li {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;padding: 5px 0;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:10px;">
        <div class="row">
               <div class="col-sm-9">
            <h3>
                    Software Development :<br /><br />
                </h3>
								<p align="justify">
								     Customer Relationship Management software is defined as business management and automation of the front-office divisions of an organization. CRM software is essentially meant to address the needs of Marketing, Sales & Distribution, Customer Service and Support divisions within an organization and allow the three to share data on prospects, customers, partners, competitors and employees. The purpose of CRM software is to manage the customer through the entire lifecycle, i.e. from prospect to qualified opportunity to order.

CRM software automates many of the needs of Marketing, Sales and Support users, such as Telephony, or the ability to conduct phone calls and manage call data, and tools to capture, share and manage automated alerts on lead data as it passes through the sales pipeline. CRM software provides a standard framework for pushing leads through a sales pipeline and managing it amongst many stakeholders in real time, in order to provide better customer relations and grow revenues by creating more sales, and losing fewer customers.

CRM software helps organizations achieve their customer relations goals by measuring key performance indicators collected by the CRM software about customer lifecycle behaviour. Benefits include isolating those marketing campaigns that drove the most and best quality leads, improving internal efficiency, complete customer histories and the ability to provide appropriate support and consequently retain customers.
 <br /> <br />
 
 
 <b> Aspects of CRM:</b> <br />

There are four aspects of CRM, each of which can be implemented in isolation:	<br /><br />

<b>Active CRM :</b><br /> A centralized database for storing data, which can be used to automate business processes and common tasks. <br /><br />

<b>Operational CRM :</b><br />The automation or support of customer processes involving sales or service representatives <br /><br />

<b>Collaborative CRM :</b><br /> Direct communication with customers not involving sales or service representatives (“self service”) <br /><br />

<b>Analytical CRM :</b><br /> The analysis of customer data for a broad range of purposes<br /><br />



                                    <a href="Contact.aspx"  style="font-size:27px;color:#0c7cdd;">
Request a Quote</a> &nbsp;&nbsp;
To receive information on Ace Indus services, simply contact us at <b> info@aceindus.in</b>

								</p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
                
            </div>
        </div>
    </div>
</asp:Content>

