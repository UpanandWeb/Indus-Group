<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Erp.aspx.cs" Inherits="Erp" %>
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
                    ERP Software :
                </h3>
								<p align="justify">
								     If you are one of those who have decided to build a custom enterprise resource planning software for your organization then we’ve got news for you. Building custom ERP system has never been this easy and affordable as in recent times.
                                    <br /> <br />
 But before you go in for the numerous vendors and partner meeting, wait a second. Do you have your basics right? Have you wondered why do you need ERP in your organization? Are there any dos and don’ts while considering and implementing an enterprise resource planning software solution? How can ERP software help your various processes?
        <br /> <br />
Read some of the featured articles to find out more about Ace Indus solutions related to enterprise resource management, human resources software, employee relationship management, enterprise information portals, and recruitment applications and so on….
        <br /> <br />
 
 <b> ERP Software Development – Get your ABCs right before implementing:</b> <br />

What you need to keep in mind when you begin to consider implementing an ERP solution in your organization? What are the critical factors that influence the success of such an endeavor?
        <br /><br />

                            </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
                
            </div>
        </div>
    </div>
</asp:Content>
