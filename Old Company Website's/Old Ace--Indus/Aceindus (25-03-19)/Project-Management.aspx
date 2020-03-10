<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Project-Management.aspx.cs" Inherits="Project_Management" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <div style="padding:10px;">
        <div class="row">
            <div class="col-lg-9">
                <h3>Project Management  :
                </h3>
                <br />
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    <b style="color: #900; font-size: 16px;">An evolving IT infrastructure to meet your changing needs :</b>  <br />
                    Increasingly demanding customers and a constantly changing competitive landscape require evolving technology capabilities. But system upgrades and new-legacy integration projects can distract already depleted IT departments from their core mission, and specific skill sets to get the job done may not be available internally. To make matters worse, stringent time constraints have to be respected if your firm is to reap all the benefits of technological innovation — that is, before your competitors complete their own project.
                </p>

                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    <b style="color: #900; font-size: 16px;">Ace Indus delivers results :</b>  <br />
                 Here, Ace Indus provides you with experienced, aggressive project managers that are both technical experts and well-versed in the specificities of your industry. To support their efforts, we also send in Indus "IT Gurus" on-site, each of which having been carefully chosen for specific skill sets so as to maximize productivity and minimize the total number of professionals working on a particular project. With a solid track record for on-time delivery and superior quality of implementation, our team works in close collaboration with yours so as to timely meet and exceed all expectations — at the best ROI.
                </p>
                <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;">
                    <b style="color: #900; font-size: 16px;">Case Study  :</b>  <br />
     Enabling better assets management at a world-renowned financial corporation After a thorough audit of some of our client's key applications, Ace Indus recommended a number of measures that dramatically improved productivity. We later provided this client with top-notch experts to manage those systems. Result: our six " IT Gurus " replaced 14 administrators while improving productivity.
                </p>
        
            </div>
            <div class="col-lg-3">
                   <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>

