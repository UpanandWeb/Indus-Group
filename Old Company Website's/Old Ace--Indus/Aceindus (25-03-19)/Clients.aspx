<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Clients.aspx.cs" Inherits="Clients" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding:10px;">
        <div class="row">
            <div class="col-lg-9">
                <h3>Clients   :
                </h3>
                <br />
                    <b style="color: #900; font-size: 16px;">Ace Indus offers solutions in a wide variety of Industries, including :</b> <br />

                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Banking :</b> <br />
              With a wealth of experience partnering the world’s leading banks and financial institutions, and a 
                    comprehensive range of services and solutions,It results: optimized investments, enhanced 
                    operational efficiencies, minimized risk and sustained cost leadership.
                </p>
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Government  :</b> <br />
                 Government solutions unit partners with governments, public sector entities and defense and security 
                    establishments to offer IT-based governance solutions that work for all stakeholders.
                </p> 
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Finance  :</b> <br />
          With a wealth of experience partnering the world’s leading banks and financial institutions, 
                    and a comprehensive range of services and solutions,It results: optimized investments, 
                    enhanced operational efficiencies, minimized risk and sustained cost leadership.
                </p>
                  <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Healthcare  :</b> <br />
         Healthcare organizations, today, must cope with a transforming business model while meeting the pressures 
                      of the industry’s regulatory demands.
                </p>
                  <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Hi-Tech  :</b> <br />
         In today’s fast paced world, characterized by dynamic technological evolution, High 
                      Tech enterprises are coping with challenges such as reduced time-to-market, 
                      technological obsolescence and constant pressure to control IT costs.
                </p>
         <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Insurance :</b> <br />
         In today’s resurgent global economy, insurers seek to focus on growth and improved customer / producer experience.
                </p>
                 <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Manufacturing :</b> <br />
        Global manufacturers are trying to reduce operational expenditure, invest in process improvement, utilize existing capacity optimally and increase efficiencies
                </p>
                 <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Retail  :</b> <br />
         Retail companies operate in environments that are highly dynamic, with new challenges and opportunities emerging constantly.
                </p>
            </div>
            <div class="col-lg-3">
                <uc1:Right runat="server" ID="Right" />
               
            </div>
        </div>
    </div>
</asp:Content>



