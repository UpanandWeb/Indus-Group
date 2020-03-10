<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Wap.aspx.cs" Inherits="Wap" %>

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
                    WAP Application :
                </h3>
								<p align="justify">
<b> What is WAP?</b> <br />

The Wireless Application Protocol (WAP) is a new advanced intelligent messaging service for digital mobile phones and other mobile terminals that will allow you to see Internet content in special text format on special WAP-enabled GSM mobile phones. WAP Web sites that support colour are still few, although several applications, such as mapping services, are expected to make use of the colour option.
	<br /><br />
WAP also specifies a proxy server that acts as a gateway between the wireless network and the wire-line Internet, providing protocol translation and optimizing data transfer for the wireless handset. 
    <br /><br />
WAP also specifies a computer-telephony integration API, called WTAI, between data and voice. This enables applications to take full advantage of the fact that this wireless mobile terminal is most often a phone and the mobile user's constant companion.
    <br /><br />
On-board memory on a WAP phone can be used for off-line content, enhanced address books, bookmarks and text-input methods.
    <br /><br />

<b>WAP-enabled GSM Phones:</b><br /> With WAP-enabled GSM mobile phones like the Nokia 7110, Alcatel OneTouch, Siemens S25, Motorola Timeport L7389, Ericsson T36, Ericsson R520, Ericsson R320, Ericsson R380, Motorola v2282, Nokia 6250, Nokia 6210, Sagem MC 939 WAP, Sony CMD-CD5 or WAP-enabled palmtops like the Siemens IC35 (Unifier) and the Ericsson MC218 you'll be able to:
    <br />
<ul>
    <li>Surf the Internet in text format</li>
    <li>Send/Receive e-mail</li>
    <li>Get/Buy stocks</li>
    <li>Book and buy Metro and theatre tickets</li>
    <li>Get traffic directions</li>
    <li>Order flowers for your loved one</li>
</ul>
    <br />
WAP is the first truly open standard in the area, removing the barrier of proprietary solutions. WAP will make wireless data boom for the mass market.
    <br /><br />
Goals of the Wireless Application Protocol
    <br />
<ul>
    <li>Independent of wireless network standard</li>
    <li>Open to all</li>
    <li>Will be proposed to the appropriate standards bodies</li>
    <li>Applications scale across transport options</li>
    <li>Applications scale across device types</li>
    <li>Extensible over time to new networks and transports</li>
</ul>
                           </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
                
            </div>
        </div>
    </div>
</asp:Content>

