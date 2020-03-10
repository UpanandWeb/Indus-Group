<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" %>
<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />
  
  <style>
    
      b , h3 { color: darkgreen;}
      b{font-family: 'Lato', sans-serif;font-weight:bold;}
      p {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;line-height: 25px}
      .col-sm-9 ul li {font-family: 'Lato', sans-serif;font-weight: 500; font-size: 14px;padding: 5px 0;}
      .list2 li  {list-style:square !important;display:list-item}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:10px;">
        <div class="row">
               <div class="col-sm-9">
            <h3>
                   Software Desktop Application :
                </h3>
								<p align="justify">
								    Desktop application for deployment across a company-wide intranet, or for use on single-user machines. Most of the software products we develop are used by the customers of our clients and marketed under our clients' company names. Now, we're ready to apply our knowledge and expertise to the unique challenges and requirements of your operation.
                                    <br /><br />

<b>Best Desktop Application Development Practices :- </b><br />Custom software solutions developed by Ace Indus satisfy our customer’s functional requirements and cut total costs for system implementation, introduction and support.<br />
<ul class="list2 ">
    <li >Elegant and convenient user interface shortens learning curve</li>
    <li>Fast data access increases productivity</li>
    <li>Software scalability decreases maintenance cost</li>
    <li>Project cost is cut down by use of standard software components</li>
</ul>
   <b>Ace Indus develops desktop utilities and custom software applications :-</b><br /> 
<ul>
    <li>Business Automation Tools</li>
    <li>Data Processing</li>
    <li>Smart Card Solution</li>
    <li>Plug-ins</li>
    <li>Utilities</li>
</ul>
<b>Our Solutions:-</b><br />
<ul>
    <li>Inventory Software</li>
    <li>lawyer Management Solution</li>
    <li>Desktop SMS Solution</li>
    <li>Office Automation Solution</li>
    <li>COM/DCOM-based Software</li>
    <li>Product Manufacture Management</li>
    <li>Other General Purpose Software</li>
    <li>Accounting Software</li>
    <li>Matrimonial Software</li>
    <li>Desktop FAX Software</li>
    <li>Windows Installer Packages</li>
    <li>Customer Relationship Management System (CRM)</li>
    <li>Educational Management Software</li>
</ul>
In addition to building applications, we are also experts in building components – such as COM, DCOM, OCX, ActiveX, Custom Controls, Windows Forms Custom Controls, ASP.NET Server Controls, User Controls and Windows Installer Packages (MSI). <br /><br />

<b>Staunch Commitments :-</b><br /> Our strong software engineering background makes us uniquely qualified to create a successful solution for virtually any type of application development project. Now, we're ready to apply our knowledge and expertise to the unique challenges and requirements of your operation. <br /><br />

                            </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
                
            </div>
        </div>
    </div>
</asp:Content>
