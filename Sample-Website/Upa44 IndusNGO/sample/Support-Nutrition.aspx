<%@ Page Title="Anandam Foundation" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Support-Nutrition.aspx.cs" Inherits="Support_Nutrition" Culture="en-IN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">      	
      	<div class="row">
        	<div class="col-lg-12">
            	<div class="three_supportouter">
                                               <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp; <asp:LinkButton ID="LinkButton1" runat="server" Text="Support" PostBackUrl="Support.aspx" Font-Size="22px"></asp:LinkButton>  >> &nbsp; <asp:Label ID="lbhome"  Text="NUTRITION FOOD" runat="server" ForeColor="#ff9933" Font-Size="20px"></asp:Label>  
                	<div class="row">
                    	<div class="col-lg-3">
            	            <div class="options_outer">
                            	<ul>


                                    <asp:DataList runat="server" ID="list" RepeatColumns="1" OnItemCommand="list_ItemCommand">
                                            <ItemTemplate>
                                                <ul>

                                               
                                                <li>
                                                       <asp:LinkButton ID="lnklist" runat="server" Width="474" Text='<%# Eval("menu_name") %>' CommandArgument='<%# Eval("sid") %>' CommandName="view"></asp:LinkButton>
                                                </li>
                                                     </ul>
                                             
                                            </ItemTemplate>

                                        </asp:DataList>
                              <%-- 	<li><a href="Support.aspx">SPONSOR A CHILD'S EDUCATION</a></li>
                                    <li><a href="Support-Nutrition.aspx" target="_self">SPONSOR A CHILD FOR NUTRITION FOOD</a></li>
                                    <li><a href="Monthly-Need.aspx">SPONSOR MONTHLY NEEDS</a></li>
                                    <li><a href="Current-Needs.aspx">SPONSOR CURRENT HOME NEEDS</a></li>
                                    <li><a href="Special-Day.aspx">SPONSOR YOUR SPECIAL DAY</a></li>
                                    <li><a href="Donation.aspx" >ANY DONATION</a></li>
                                    <li><a href="Fund.aspx">CORPUS FUND</a></li>--%>
                                </ul>
                            </div>	
                        </div>
                        <div class="col-lg-6">
                            <div class="centersupport_content">

                                      <asp:DataList ID="DataList1" runat="server" RepeatColumns="1">
                                <ItemTemplate>
                                    <h1><asp:Label ID="lbtitle" runat="server" Text='<%# Eval("title") %>'></asp:Label></h1>
                                  <%--  <ul style="list-style: none;">

                                        <li style="list-style: none;">--%>
                                      <%--      <p style="text-align: justify;">--%>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                           <%-- </p>--%>
                                      <%--  </li>
                                    </ul>--%>
                                </ItemTemplate>


                            </asp:DataList>
                            	<%--<h1>Need for Better Nutrition</h1>
                                <p>WHAT a joy it is to behold a well-nourished child!Yet,a child is not healthy by accident.Nutrition is very important for everyone,but it is especially important for children becauseit is directly linked to all aspects of their growth & development especially brain develops rapidly at a young age.Hunger can prevent children from making the most of a formal education and the sad truth is that hunger can have physical and psychological effects on growing children that make learning substantially difficult.</p>
                                <p>Food is the fuel necessary to get through a normal day.Children experiencing hunger are more likely to have problems with memory and concentration because they do not have the energy to carry out these functions.Without the right nutrients,the brain cannot develop properly,resulting in long term effects on learning abilities.Malnutrition makes children more susceptible to illness.However, we wish to address this problem and its possible only with your help.Your donation for food is will bring the best out of them and shape them to be healthy individuals.</p>--%>
                                <h2>Sponsor a kid for Nutrition food, Medical and  maintenance</h2>
                                <div class="table_scroll">
                                    <table width="100%" border="1" class="donatechildtab">
                                      <tbody>
                                        <tr width="300">
                                          <td>Food & Maintenance per month</td>
                                          <td>Rs.2500</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Medical Insurance annum</td>
                                          <td>Rs.1,200</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Six pairs of regular clothes </td>
                                          <td>Rs.3,600</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>                                    
                                      </tbody>
                                    </table>
                                </div>
								<h2>Sponsor a gift pack on child's birthday-pack includes of</h2>
                                <div class="table_scroll">
                                    <asp:DataList ID="dldetails" DataKeyField="did" runat="server" RepeatColumns="1" Width="100%" OnItemDataBound="dldetails_ItemDataBound" ShowFooter="true">
                                                        <ItemTemplate>
                                                            <table width="100%" border="1" class="donatechildtab">
                                                                <tbody>

                                                         
                                                                <tr>
                                                                    <td width="60%">
                                                                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                         <asp:Label ID="Label2" runat="server" Text='<%# (Convert.ToDecimal(DataBinder.Eval(Container.DataItem,"details"))).ToString("C2") %>'></asp:Label>
                                                                    </td>
                                                                      <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td>
                                                                </tr>
                                                                 <%--   <tr><td><asp:Label ID="Label3" runat="server" Text="Total"></asp:Label></td><td><asp:Label ID="Label4" runat="server" ></asp:Label></td>
            <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td></tr>--%>
                                                                           </tbody>
                                                            </table>
                                                        </ItemTemplate>
                                                            <FooterTemplate>
                                                                <table width="100%" border="1" class="donatechildtab">
                                                                    <tr>
                                                                        <td width="60%">
                                                                            Total
                                                                        </td>
                                                                        <td>
                                                                              <asp:Label ID="total" runat="server" ></asp:Label>
                                                                        </td>
                                                                           <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td>
                                                                    </tr>
                                                                </table>

                 
                </FooterTemplate>
                                                    </asp:DataList>

                                    <%--<table width="100%" border="1" class="donatechildtab">
                                      <tbody>
                                        <tr>
                                          <td>Clothes</td>
                                          <td>Rs.1000</td>
                                          <td><span><a href="#" target="_self">Donate</a></span></td>
                                        </tr>
                                        <tr>
                                          <td>Footwear</td>
                                          <td>Rs.250</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Cakes &amp; Chocolates</td>
                                          <td>Rs.350</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Total</td>
                                          <td>Rs.1,600</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>	                                                                            
                                      </tbody>
                                    </table>--%>
                                  </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="rightsuppor_block">
                       	    	<img src="images/supportpic_1.jpg" width="450" height="100" alt="" class="img-fluid"/> 
                            </div>
                        </div>                                       
                    </div>
                    
                </div>            	
            </div>
        	
        </div>
      </div> 
</asp:Content>

