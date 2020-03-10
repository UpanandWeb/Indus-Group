<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Technology.aspx.cs" Inherits="Technology" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  <div style="padding:10px;">
        <div class="row">
            <div class="col-lg-9">
                <h3>
                    Technologies :
                </h3>
                <br />
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    Working Together to Make a Difference 

To provide employers with more options and, quite simply, a better way of managing their employee screening programs, We have partnered with industry leading HR services and solutions providers, including six of the top eight e-recruiting solutions providers.

To that end, we've engineered our solutions in conjunction with each provider, then tested and refined them time and again. The result? Pre-integrated solutions that are proven to work.

We have partnered with industry-leading companies that you know and respect, including:
Integration Partner : 

                </p>
                
                <img src="img/OraclePeopleSoft.gif" alt="">
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    Oracle | PeopleSoft
PeopleSoft eRecruit™, now integrated with Oracle, forms a strategic solution (through pre-integration) with HireRight for versions 8.3, 8.8, 8.9, 9.0 and 9.1...Learn more........
                </p>
                <img src="img/lOracle.gif" alt="">
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    Oracle
HireRight's partnership with Oracle brings you user-friendly integrated services within Oracle's iRecruitment™ solution, via pre-integration. Using HireRight's online services...
                </p>
                <img src="img/microsoft.jpeg" alt="">
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    The Microsoft Partner Network Hosting competency can help you develop partner-hosted services, which play a key role in how customers consume Microsoft software. Learn about the benefits and how to attain this competency.
                </p>
                <img src="img/ibm.jpg" alt="">
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    IBM products (xSeries, iSeries, pSeries, zSeries, UNIX servers, Storage product, Servers, Software etc.) can be bought through our business partners. To locate your nearest IBM business partner select your city or the one closest to you.
                </p>
                
            </div>
            <div class="col-lg-3">
                 <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>
</asp:Content>

