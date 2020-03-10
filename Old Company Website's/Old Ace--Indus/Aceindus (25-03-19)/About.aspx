<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

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
                    About us :
                </h3>
								<p align="justify">
								    <b style="font-size: 14px">Ace Indus</b> is a professionally managed Placement Consultant and Staffing Company focusing on the growing needs of recruiting industry professionals matching with client requirements. 

Backed by the team of experienced recruitment professionals, Ace Indus specializes on staffing solutions like Permanent Staffing, Temporary Staffing, Executive Staffing and IT staffing. <br> <br>

<b>Values & Believes</b>  <br> <br>

We believe in adding value to our clients. We attempt to identify candidates that meet our clients' requirements to the best of our ability. We attempt to enhance the effectiveness of our client’s recruitment operations by providing the most appropriate referrals and support with information in line with their requirements.We believe in conducting our business with honesty and professional integrity. We never solicit candidates from our clients (not even indirectly), we don't refer candidates with doubtful integrity to our clients and we conduct our business with utmost transparency.We are careful in choosing our clients - we work closely with companies that appreciate our values. And we take equal care in recommending candidates to our clients; only when we are convinced that the candidate will align with our client's culture & value system and deliver value in the long term do we refer them to our clients.
 <br> <br>
 
 
 <b>Industry We Serve</b>
 <ul>
     
     <li>Accounting / Finance</li>
     <li>Advertising / Publishing / Entertainment/ Media</li>
     <li>Banking/ Finance</li>
     <li>Healthcare</li>
     <li>Call Center/ BPO/ ITES</li>
     <li>Information Technology (Hardware/ Software)</li>
     <li>Telecom/ Technology/ ISP</li>
     <li>Manufacturing / Operations</li>
     <li>Engineering Services</li>
     <li>Automotive/ Engg</li>
     <li>Consulting Services</li>
     <li>Education/ Training</li>
     <li>Hospitality/ Travel/ Tourism</li>
     <li>Logistics/ Shipping</li>
     <li>Insurance</li>
     <li>Legal/Law</li>
     <li>Oil and Gas</li>
     <li>Real Estate/ Construction</li>
     <li>Retail</li>
     <li>Textiles/ Garments</li>
 </ul>

<b>Our Team</b>

<ul>
    <li>We have a dedicated and growing team of skilled personnel, trained in Recruitment and HR Management.</li>
    <li>The Team Members have a significant recruitment experience in a variety of market sectors.</li>
    <li>Each one is a specialist in their given field, giving you instant access to knowledge in recruitment issues for your specific needs.</li>
</ul>

<b>Our Success Story in one year</b>

<ul>
    <li>We have closed 50 + technical position.</li>
    <li>Achieved the top list for our services with our clients.</li>
    <li>We have technical resources deputed at our client place.</li>
    <li>We achieved success on time delivery and crisis management.</li>
    <li>Able to deliver the quality resources at all levels of resource requirement.</li>
    <li>We have growth rate of 100 % in one year.</li>
    <li>Have been awarded and recognized by our clients.</li>
</ul>


<b>Process and Quality System</b>

<ul>
    <li>Employee competency mapping</li>
    <li>MIS system</li>
    <li>Work flow</li>
    <li>Quality parameter on every activity</li>
    <li>Defined turn around time for every activity</li>
</ul>





								</p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>

