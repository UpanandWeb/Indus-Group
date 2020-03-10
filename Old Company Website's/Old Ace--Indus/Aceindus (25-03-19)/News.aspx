<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>


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
                    News & Events :
                </h3><br />
                <p  align="justify">

                    <b>We at Ace Indus strive toward one vision . . . to be the one and only place that IT managers call for people-centered IT solutions.
</b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  Whether a client needs to recruit top talent, manage contractors, or implement an IT project under a tight schedule, we will be there. And we will exceed the client's expectations. 
               </p>
 <b>We will attain our vision by :</b><br /><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" > 
Providing national and global enterprises with best-in-class IT staffing and specialized project services.
Recruiting only the very best people, encouraging their professional growth and development, and challenging them with assignments at leading employers.
Balancing fiscal responsibility with aggressive growth, attained both organically and through strategic mergers and acquisitions. We focus our efforts on key values that will further our success:           </p>
              
                     <b>
                       People :
                     </b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  
              The caliber of people we attract is due to our commitment to provide competitive compensation, stimulating personal and professional growth, and rewarding outstanding performance.  </p>    
                    
                     <b>Place :   </b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  
                We constantly work to foster and maintain an environment of trust where people demonstrate their best qualities and are enriched by the career experience. </p>  
                     
                    <b> Pursuit : </b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  
               We are inspired to be the best at everything we do and are proactive in developing methods to work smarter. We relentlessly pursue new ways to bring unparalleled value to our clients.  </p>  
                    
                     <b> Progress : </b><br />
                   <p style="word-wrap: break-word;font-size:17px;line-height:30px;text-align:justify;" >  
              We are committed to information technology and its ability to advance the goals of the business world, further science, enhance quality of life, improve communication, and fully explore our potentiality. </p>   
                    </p>
							</div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>


