<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Vision.aspx.cs" Inherits="Vision" %>

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
                    Ace Indus Vision :
                </h3><br />
                <p  align="justify">

                    <b>Our Team:</b><br /><br />

<b>›› Inspired Leadership in every Relationship and Interaction.

</b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" > 
We believe in producing dramatic results for our customers by viewing every relationship and interaction as an opportunity to demonstrate leadership and generate substantial value. 
                       <br /><br />
Allow us to put into perspective, key words from our Mission Statement. "Inspired Leadership…"
<br /><br />
Inspired Leadership comes from being enrolled into the Ace Indus Vision and being able to enthuse and energize the people around. 
<br /><br />
It calls for honesty and integrity at a personal level, the ability to make commitments and honor them and the courage to acknowledge our mistakes.
<br /><br />
It means getting the 'bigger picture' and being responsible for Ace Indus as a whole. 
               </p>

 <b>"Every Relationship and Interaction …" </b><br /><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" > 
Every interaction is an opportunity to generate substantial value for each other. We seek to bring meaning and purpose into every relationship,
                        create the magic and inspiration to deliver results that transcend our abilities. 
                </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>

