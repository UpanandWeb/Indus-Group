<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About"  %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />

    <style>
        b,
        h3 {
            color: darkblue;
        }

        b {
            font-family: 'Lato', sans-serif;
            font-weight: bold;
        }

        p {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px
        }

        .col-sm-9 ul li {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            padding: 5px 0;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div style="padding:10px;">
        <div class="row">
            <div class="col-sm-8">
                <h3>
                    About us :
                </h3>
                <p>
                   Indus abroad provides international education services for students who wish to attend an International Universities and Colleges. We focuses on areas of international education like international student visa, counselling, financial assistance, admission in international college/university suits to their need & interest.    
We provides admission assistance to prospective student, right from identifying the right college to gaining admission to the embassy with an I-20 form and apply for a student visa.
We handles the whole process to ensure the prospective student has the highest chance to gain admission and obtain his or her student visa.

                </p>
               
            </div>
          
            <div class="col-sm-4" style="padding-right:50px;">
                   <uc1:Right runat="server" ID="Right" />
           </div>
            </div>
          </div>
</asp:Content>

