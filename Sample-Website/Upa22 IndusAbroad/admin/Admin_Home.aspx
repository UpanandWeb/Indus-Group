<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="admin_Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
     <style type="text/css">
        
       #menu-bar
        {
  width: 990px;
  margin: 10px 0px 0px 0px;
  padding: 2px 6px 4px 6px;
  height: 30px;
  line-height: 100%;
 
  -moz-border-radius: 24px;
  box-shadow: 2px 2px 3px #666666;
  -webkit-box-shadow: 2px 2px 3px #666666;
  -moz-box-shadow: 2px 2px 3px #666666;
  background: #8B8B8B;
  background: linear-gradient(top,  #1e76d7,  #0042c5);
  background: -ms-linear-gradient(top,  #1e76d7,  #0042c5);
  background: -webkit-gradient(linear, left top, left bottom, from(#1e76d7), to(#0042c5));
  background: -moz-linear-gradient(top,  #1e76d7,  #0042c5);
  border: solid 1px #6D6D6D;
  position:relative;
  z-index:999;
}

#menu-bar li 
{
  margin: 0px 0px 6px 0px;
  padding: 0px 6px 0px 6px;
  float: left;
  position: relative;
  list-style: none;
}

#menu-bar a 
{
  font-weight: bold;
  font-family: arial;
  font-style: normal;
  font-size: 12px;
  color: #E7E5E5;
  text-decoration: none;
  display: block;
  padding: 6px 20px 6px 20px;
  margin: 0 auto;
  margin-bottom: 6px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  text-shadow: 2px 2px 3px #000000;
}

#menu-bar li ul li a 
{
  margin: 0 auto;
}
#menu-bar .active a, #menu-bar li:hover > a 

{
  background: #0399D4;
  background: linear-gradient(top,  #fabb18,  #fabb18);
  background: -ms-linear-gradient(top,  #fabb18,  #fabb18);
  background: -webkit-gradient(linear, left top, left bottom, from(#fabb18), to(#fabb18));
  background: -moz-linear-gradient(top,  #fabb18,  #fabb18);
  color: #1e76d7;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  text-shadow: 2px 2px 3px #FFFFFF;
}

#menu-bar ul li:hover a, #menu-bar li:hover li a
 
{
  background: none;
  border: none;
  color: #666;
  -box-shadow: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
}

#menu-bar ul a:hover
{
  background: #0399D4 !important;
  background: linear-gradient(top,  #04ACEC,  #0186BA) !important;
  background: -ms-linear-gradient(top,  #04ACEC,  #0186BA) !important;
  background: -webkit-gradient(linear, left top, left bottom, from(#04ACEC), to(#0186BA)) !important;
  background: -moz-linear-gradient(top,  #04ACEC,  #0186BA) !important;
  color: #FFFFFF !important;
  border-radius: 0;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  text-shadow: 2px 2px 3px #FFFFFF;
}

#menu-bar li:hover > ul
{
  display: block;
}
#menu-bar ul
{
  background: #DDDDDD;
  background: linear-gradient(top,  #FFFFFF,  #CFCFCF);
  background: -ms-linear-gradient(top,  #FFFFFF,  #CFCFCF);
  background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#CFCFCF));
  background: -moz-linear-gradient(top,  #FFFFFF,  #CFCFCF);
  display: none;
  margin: 0;
  padding: 0;
  width: 185px;
  position: absolute;
  top: 30px;
  left: 0;
  border: solid 1px #B4B4B4;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-box-shadow: 2px 2px 3px #222222;
  -moz-box-shadow: 2px 2px 3px #222222;
  box-shadow: 2px 2px 3px #222222;
  float:left;
}
#menu-bar ul li
{
  float: none;
  margin: 0;
  padding: 0;
}

#menu-bar ul a
 
{
  padding:10px 0px 10px 15px;
  color:#424242 !important;
  font-size:12px;
  font-style:normal;
  font-family:arial;
  font-weight: normal;
  text-shadow: 2px 2px 3px #FFFFFF;
}

#menu-bar ul li:first-child > a
 
{
  border-top-left-radius: 10px;
  -webkit-border-top-left-radius: 10px;
  -moz-border-radius-topleft: 10px;
  border-top-right-radius: 10px;
  -webkit-border-top-right-radius: 10px;
  -moz-border-radius-topright: 10px;
}

#menu-bar ul li:last-child > a 

{
  border-bottom-left-radius: 10px;
  -webkit-border-bottom-left-radius: 10px;
  -moz-border-radius-bottomleft: 10px;
  border-bottom-right-radius: 10px;
  -webkit-border-bottom-right-radius: 10px;
  -moz-border-radius-bottomright: 10px;
}

#menu-bar:after 

{
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}

#menu-bar
 
{
  display: inline-block;
  margin:0 auto;
}
  
}
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
    <table width="995px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
     
  
                   
    <tr>
    <td colspan="2"><br /></td>
    </tr> 
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="200px"  colspan="2">     
   <div class="table1" style="width:1000px; height:610px;">      <br />  

 
<div class="content2"><%--<a href="Admin_UserDetails.aspx">
<img src="images/user06.jpg" alt="0" width="96px" height="88px"/>
<h4>User</h4></a>--%>
    <table>
        <tr>
            <td align="center">
                <asp:ImageButton ID="imgenq" runat="server" ImageUrl="images/user06.jpg"   width="96px" height="88px" OnClick="imgenq_Click" />
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:LinkButton ID="lnkuser" runat="server" Text="Enquiry"  Font-Bold="true" OnClick="lnkuser_Click"  ></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>      
                  


<div class="content2"><%--<a href="AllNews.aspx">
<img src="images/postnews2.jpg" alt="0" width="98px" height="85px"/>
<h4> News</h4></a>--%>

     <table>
        <tr>
            <td align="center">
                <asp:ImageButton ID="imgcourse" runat="server" ImageUrl="images/course.jpg"  width="96px" height="88px" OnClick="imgcourse_Click"  />
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:LinkButton ID="lnknews" runat="server" Text="Courses"  Font-Bold="true" OnClick="lnknews_Click"   ></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>














<div class="content2"><%--<a href="Admin_Contact.aspx">
<img src="images/feedback06.png" alt="0" width="95px" height="88px"/>
<h4>contact</h4></a>--%>
    <table>
        <tr>
            <td align="center">
                <asp:ImageButton ID="imgcontact" runat="server" ImageUrl="images/contact06.jpg"  width="96px" height="88px" OnClick="imgcontact_Click"  />
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:LinkButton ID="lnkcontact" runat="server" Text="Contact Us"  Font-Bold="true" OnClick="lnkcontact_Click"   ></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>

<div class="content2"><%--<a href="#">
<img src="images/contact06.jpg" alt="0" width="96px" height="88px"/>
<h4>Feedback</h4></a>--%>
    <table>
        <tr>
            <td align="center">
                <asp:ImageButton ID="imgfeed" runat="server" ImageUrl="images/feedback06.png"  width="96px" height="88px" OnClick="imgfeed_Click"  />
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:LinkButton ID="lnkfeed" runat="server" Text="Feedback"  Font-Bold="true" OnClick="lnkfeed_Click"   ></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>

<div class="content2"><%--<a href="Admin_Exceptions.aspx">
<img src="images/Exception.png" alt="0" width="96px" height="88px"/>
<h4>Exceptions</h4></a>--%>
    <table>
        <tr>
            <td align="center">
                <asp:ImageButton ID="imgexcep" runat="server" ImageUrl="images/Exception.png"  width="96px" height="88px" OnClick="imgexcep_Click"   />
            </td>
        </tr>
         <tr>
            <td align="center">
                <asp:LinkButton ID="lnkexcep" runat="server" Text="Exceptions"  Font-Bold="true" OnClick="lnkexcep_Click"   ></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>




  
       
        

</div>
<div class="footer">
copyright © 2018 Indus Abroad. All right reserved 
</div>
     </td>
    </tr>    
  </table>
    </div>
 

</asp:Content>

