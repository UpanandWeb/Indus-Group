<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>


<%@ Register Src="usercontrol/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="usercontrol/footer.ascx" TagPrefix="uc2" TagName="footer" %>
<%@ Register Src="usercontrol/footer2.ascx" TagPrefix="uc3" TagName="footer2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <title>::About-Us::</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
 <form id="form1" runat="server">
         <div class="whole_outer">
    <uc1:header ID="uc" runat="server" />

             <br />

          

             <h1 style="text-align:center;color:#C71585;">About Us</h1>
        <div class="container-fluid">

             <div class="row">

                                        <%--<asp:DataList ID="dl" runat="server" RepeatColumns="1" >
                                            <ItemTemplate>--%>

                  <div class="col-md-12 left-side">
        <div class="WebContainer">

            <p>
               Soroptimist International, which consists of Soroptimist International of the Americas, Soroptimist International of Europe, Soroptimist International of Great Britain & Ireland and Soroptimist International of the South West Pacific, is a global volunteer movement working together to transform the lives of women and girls. Our network of over 75,000 club members in 122 countries works at a local, national and international level to Educate, Empower and Enable opportunities for women and girls.
            </p>


            
                 <div class="col-md-3" style="border:solid 2px;border-color:#395999;border-radius:25px;padding:10px;">
                 
                     <%-- <ion-icon name="heart"></ion-icon>--%>
                     <div style="margin-bottom: -18px;text-align:center;"> <asp:Image ID="im1" runat="server" ImageUrl="images/like.png" Height="30" Width="30" /></div>
                      
                <h3 style="text-align:center;">VISION</h3>   
<p style="text-align:justify;">Women and girls will achieve their individual and collective potential, realise aspirations and have an equal voice in creating strong, peaceful communities worldwide.</p>
                 </div>
              <div class="col-md-1"></div>

                   <div class="col-md-3" style="border:solid 2px;border-color:#395999;border-radius:25px;padding:10px;">
                   
     <div style="margin-bottom: -18px;text-align:center;"> <asp:Image ID="Image1" runat="server" ImageUrl="images/star.png" Height="30" Width="30" /></div>

                     <h3 style="text-align:center;">MISSION</h3>    
<p style="text-align:justify;">Soroptimists transform the lives and status of women and girls through education, empowerment and enabling opportunities.</p>
                 </div>
              
            <div class="col-md-1"></div>

                <div class="col-md-3" style="border:solid 2px;border-color:#395999;border-radius:25px;padding:10px;">
                <div style="margin-bottom: -18px;text-align:center;"> <asp:Image ID="Image2" runat="server" ImageUrl="images/thumbs-up-hand-symbol.png" Height="30" Width="30" /></div>

                     <h3 style="text-align:center;">PRINCIPLES</h3>   
<p style="text-align:justify;">The principles of Soroptimism are to strive for: • The advancement of the status of women • High ethical standards • Human rights for all • Equality, development and peace and • The advancement of international understanding, goodwill and peace</p>
                 </div>
       
            </div>
                      </div>

                    
                                       <%--     </ItemTemplate>
                                        </asp:DataList>--%>
                 </div>



     
    </div> 
            
         <br />
           
             <br />
            <uc2:footer ID="foot1" runat="server" />
             </div>
         <uc3:footer2 runat="server" ID="footer2" />
    </form>
</body>
</html>
