<%@ Page Title="Event-Details" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EventDetails.aspx.cs" Inherits="EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    <div class="container-fluid">
        <div class="row">

                 <div class="col-lg-12">
                <div class="featured_outer" >
                    <h1>Event Details </h1>

                    <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp; <asp:Label ID="lbhome"  Text="Event Details" runat="server" ForeColor="#ff9933" Font-Size="22px"></asp:Label>  

                    <asp:DataList ID="ddl" RepeatColumns="1" runat="server" >
                        <ItemTemplate>
                            <table width="100%" >
                        <tr>
                            <td>
                                   <div class="featured_outer" >
                                       <div class="new_pic">
                                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagename", "photos/events/{0}") %>'   width="550" height="300" alt="Event" CssClass="img-fluid"  />
                                       </div>

                                    
                               <%--  <img src="images/featured_pic1.jpg" width="550" height="300" alt="" class="img-fluid" />--%>
                                       </div>
                            
                            </td>

                            <td valign="top" >
                                 <div class="col-md-12">
                                  <%--  <div class="news_cont">--%>
                                              <h2><asp:Label ID="lb" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                                 </h2>
                                     <p><asp:Label ID="lb2" runat="server" Text='<%# Eval("content") %>'></asp:Label> </p>

                                        <%--</div>--%>
                            </div>
                            </td>
                        </tr>
                    </table>
                        </ItemTemplate>

                    </asp:DataList>

                    
                   
              
                </div>

                       
           
            </div>
        </div>

    </div>
</asp:Content>

