<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Management" %>

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
                    Management :
                </h3><br />
                <p  align="justify">

                    <b>Our Team:</b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  We understand that the right people make all the difference. Our team comprises of highly dedicated professionals from diverse backgrounds, driven by a common goal - to constantly test our abilities and deliver value to our clients.
We encourage teamwork, innovation, knowledge sharing and continuous learning. We take extreme caution to recruit the best available talent for our services whether it is E-solutions or business process management.
               </p>
 <b>Professional Background: </b><br /><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" > 
Our top management comprises of enterprising leaders who bring with them a combined experience in the areas of Internet and information technology, media and process management. 
<br /><br />
Our broad range of services requires an eclectic mix of professionals who have the right blend of knowledge and talent. Our Web solutions team consists of functional and technical experts recruited from the best management and technology schools. We have stringent and highly defined processes that enable us to pick the right people for our Business process management services. Our Transaction Processing team boasts of a background in administrative and support functions in reputed organizations where efficiency and speed form the core deliverables.
<br /><br />
To maintain excellence in quality of our language services, our endeavor is to recruit native (mother tongue) translators with technical acumen where needed, having excellent command of both language pairs.

                </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>

