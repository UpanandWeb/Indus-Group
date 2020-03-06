<%@ Page Title="Medicine-Details" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MedicineDetails.aspx.cs" Inherits="MedicineDetails" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .thumb_container {
    margin: 4px 3px 0 10px;
    padding: 54px 11px 10px 14px;
    display: block;
    text-decoration: none;

    /*float: left;*/
    height: 75px;
    width:75px;
    color: #000;
    border: 1px solid #E0E0E0;
    cursor: pointer;
     border-radius: 4px
}
      .thumb_container:hover {
    box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}


    </style>

  



    <style>
         .zoom-effect-container {
    float: left;
    position: relative;
    width: 180px;
    height: 160px;
    margin: 0 auto;
    overflow: hidden;
}
 .image-card {
  position: absolute;
  top: 0;
  left: 0;
  height:160px;
  }
    </style>
    <style>
        .img_container 
{
    width: 140px;
    float: left;
    padding-bottom: 2px;

}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div style="padding:10px;" >
        <div class="row">
            <div class="col-sm-7">


               
                  <ul class="social-network social-circle" style="padding-left:50px;">
              
                                <li class="thumb_container">
                                  <asp:ImageButton ID="imgau" runat="server" ImageUrl="img/Georgia flag.jpg"   ToolTip="Georgia" PostBackUrl="MedicineDetails.aspx?contry=Georgia"/>

                                </li>
                     
                    
                               <li class="thumb_container">
                                    <%--<img src="img/AU.png" alt="" style="margin-top: -10px;" title="AUSTRALIA" />--%>
                                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/Kazakhstan flag.jpg"   ToolTip="Kazakhstan" PostBackUrl="MedicineDetails.aspx?contry=Kazakhstan"/>

                                </li>
                         

                
                               <li class="thumb_container">
                                    <%--<img src="img/US.png" alt="" style="margin-top: -10px;" title="USA" />--%>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="img/Kyrgyzstan flag.jpg"   ToolTip="Kyrgyzstan"  PostBackUrl="MedicineDetails.aspx?contry=Kyrgyzstan" />
                                </li>
                       
                               <li class="thumb_container">
                                    <%--<img src="img/CA.png" alt="" style="margin-top: -10px;" title="CANADA" />--%>
                                 <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="img/Philippines flag.jpg"   ToolTip="Philippines" PostBackUrl="MedicineDetails.aspx?contry=Philippines"  />
                                </li>
                              
                                <li class="thumb_container">
                                   <%-- <img src="img/CN.png" style="margin-top: -10px;" title="CHINA" />--%>
                                  <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="img/Russia flag.png"   ToolTip="Russia" PostBackUrl="MedicineDetails.aspx?contry=Russia"  />
                                </li>
                      </ul>


                <br />
                <h3 style="text-align:center;" id="nm" runat="server">
                    University Details of  <asp:Label ID="lblcont" runat="server" Font-Size="26px"></asp:Label>
                </h3>
                   <br />
                <table width="100%" align="center"> 
                    <tr>
                        <td width="100%" align="center" style="padding-left:35px;">
                 <asp:DataList ID="dtl" runat="server" width="100%" align="center"  >
                        <ItemTemplate>
                            <table width="90%" align="center">
                            <tr>
                                <td width="20%"></td>
                                <td width="80%" align="left">
                                       <asp:HyperLink ID="lbl1" runat="server"  Text='<%# Eval("uname") %>' 
                                               NavigateUrl='<%# Eval("Website") %>'   target="_blank"  Font-Size="18px"></asp:HyperLink>
                                </td>
                            </tr>
                                <tr><td><br /></td></tr>
                        </table>
                        </ItemTemplate>
                    </asp:DataList>

                        </td>
                    </tr>
                </table>
            </div>
           
    <div class="col-sm-5" style="padding-right:250px;">
                   <uc1:right runat="server" ID="Right" />
           </div>
        </div>
         </div>





</asp:Content>

