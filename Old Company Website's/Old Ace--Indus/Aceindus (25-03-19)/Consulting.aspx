<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Consulting.aspx.cs" Inherits="Consulting" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding:10px;">
        <div class="row">
            <div class="col-lg-9">
                <h3>Consulting  :
                </h3>
                <br />

                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Making the most of your investment :</b> <br />
                    In today's highly competitive market, every IT investment must have a rapid, measurable Return On Investment (ROI). With their long experience in Healthcare and Finance, our senior Consultants have both the industry and the technical expertise to analyze your existing IT infrastructure and recommend you solutions that will leverage existing investments to the fullest while dramatically increasing productivity.
                </p>
                 <br />
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Facing gaps in your IT Department?  :</b> <br />
                 Of course, software alone is not enough — available expertise plays a crucial role in whether you will get the maximum ROI from your IT infrastructure. But finding the right professionals amongst the many now available to address your temporary needs can be a very time-intensive & costly proposition. When looking for specific know-how on short-term projects, or when in need of ad-hoc assistance (for example, when key personnel holidays may leave you stranded), Ace Indus can provide you with one of our carefully selected "IT Gurus" well-versed in your particular vertical and/or technology — at an unbeatable value proposition. Working with us enables you to get the expertise you need when you need it, 
                    while preserving a maximum of flexibility in your organization.
                </p> <br />
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >
                    <b style="color: #900; font-size: 16px;">Case Study  :</b> <br />
           Partnering to deploy an award-winning solution worldwide To keep up with a rapidly rising number of new orders, our customer needed to quickly expand its consulting force. However, facing a tight job market and high turnover rates, in-house recruitment was deemed both unpractical and expensive. Partnering with Ace Indus enabled this client to meet its strict implementation deadlines at Fortune 500 companies - and much more.
                </p>
        
            </div>
            <div class="col-lg-3">
                <uc1:Right runat="server" ID="Right" />
               
            </div>
        </div>
    </div>
</asp:Content>

