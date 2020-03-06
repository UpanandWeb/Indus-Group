<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Scholarships.aspx.cs" Inherits="Scholarships" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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
                    Scholarship:
                </h3>
                <p>
                  There are some Colleges or Universities offer merit scholarships to international applicants. Merit scholarships are partial-tuition scholarships that may be a single lump-sum award, or a renewable annual award. Merit scholarships are considered independently of an applicant’s financial situation, so if an applicant thinks he or she may require financial assistance to fund his or her college education, the applicant must submit an application for need-based financial aid.(The Scholarship policies are differ from college to college.)

                </p>
               
            </div>
          
           
     <div class="col-sm-4" style="padding-right:50px;">
                   <uc1:Right runat="server" ID="Right" />
           </div>
        </div>

        </div>
</asp:Content>

