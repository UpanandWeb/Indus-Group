<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Monthly-Need.aspx.cs" Inherits="Monthly_Need" Culture="en-IN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="support_outer">
      <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 nopadding">
              <div class="support_bg_outer">
       	  	  	<img src="images/support_bgfinal.jpg" width="1200" height="300" alt=""/> 
              </div>  
            </div>
        </div>      
      </div>
      <div class="container-fluid">      	
      	<div class="row">
        	<div class="col-lg-12">
            	<div class="three_supportouter">
                             <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp; <asp:LinkButton ID="LinkButton1" runat="server" Text="Support" PostBackUrl="Support.aspx" Font-Size="22px"></asp:LinkButton>  >> &nbsp; <asp:Label ID="lbhome"  Text="Monthly Needs" runat="server" ForeColor="#ff9933" Font-Size="20px"></asp:Label>  
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
                                		<%--<li><a href="Support.aspx">SPONSOR A CHILD'S EDUCATION</a></li>
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
                            	<h1>Monthly Expenses</h1>                                                                
                                <div class="expenses_scroll">


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



                                  <%--  <table width="100%" border="1" class="expenses_table">
                                      <tbody>
                                        <tr width="300">
                                          <td>Groceries</td>
                                          <td>Rs.15,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Rice 400kgs @ Rs.45</td>
                                          <td>Rs.18,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Vegetables,Eggs and Meat</td>
                                          <td>Rs.20,500.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Milk 8 Litres per day@Rs.38p/lit(need to increase 2 more litres)</td>
                                          <td>Rs.10,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>General Medicines</td>
                                          <td>Rs.5,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Gas Refill @ Rs.1300X5</td>
                                          <td>Rs.6,500.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Rental for the girls premises,Boys room & storage room</td>
                                          <td>Rs.12,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Electricity & Water Bills</td>
                                          <td>Rs.6,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Maintenance(plumbing,repairs,petrol,phone bills,Hair cut,etc)</td>
                                          <td>Rs.15,000.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Salaries for 5 maids and a cook</td>
                                          <td>Rs.21,500.00</td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>
                                        <tr>
                                          <td>Total</td>
                                          <td><strong>Rs.1,29,500.00 Per Monthly Expenses</strong></td>
                                          <td><a href="#" target="_self">Donate</a></td>
                                        </tr>                                    
                                      </tbody>
                                    </table>--%>
                                </div>
								<h1>Medicines</h1>
                                <div class="table_scroll">

                                    <asp:DataList ID="DataList1" DataKeyField="did" runat="server" RepeatColumns="1" Width="100%"  >
                 
                                                        <ItemTemplate>
                                                            <table width="100%" border="1" class="donatechildtab">
                                                                <tbody>
                                                                    
                                                                <tr>
                                                                    <td width="5%">  <asp:Label ID="Label4" runat="server" Text= '<%# Container.ItemIndex + 1 %>'></asp:Label></td>
                                                                    <td width="60%">
                                                                          <asp:Label ID="lbmed" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                         <asp:Label ID="labeldt" runat="server" Text='<%#Eval("details").ToString().Trim() %>'></asp:Label>
                                                                    </td>
                                                                      <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td>
                                                                </tr>
                                                                 <%--   <tr><td><asp:Label ID="Label3" runat="server" Text="Total"></asp:Label></td><td><asp:Label ID="Label4" runat="server" ></asp:Label></td>
            <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td></tr>--%>
                                                                           </tbody>
                                                            </table>
                                                        </ItemTemplate>
                                                          
                                                    </asp:DataList>


                                   <%--<table width="100%" border="1" class="expenses_table">
                                          <tbody>
                                            <tr>
                                              <th>Sl.No</th>
                                              <th>Item</th>
                                              <th>Quantity</th>
                                            </tr>
                                            <tr>
                                              <td>1</td>
                                              <td>Zentel  10ml syrup for de-worming  </td>
                                              <td>80Nos</td>
                                            </tr>
                                            <tr>
                                              <td>2</td>
                                              <td>Paracetmol/Calpol for fever</td>
                                              <td>10sheets</td>
                                            </tr>
                                            <tr>
                                              <td>3</td>
                                              <td>Tab-Gudcef 100mg(anti biotic)</td>
                                              <td>10sheets</td>
                                            </tr>
                                            <tr>
                                              <td>4</td>
                                              <td>Dolokind MR</td>
                                              <td>20tabs</td>
                                            </tr>
                                            <tr>
                                              <td>5</td>
                                              <td>Meftal spas for stomach ache</td>
                                              <td>40tabs</td>
                                            </tr>
                                            <tr>
                                              <td>6</td>
                                              <td>Nise kid for general pains</td>
                                              <td>40tabs</td>
                                            </tr>
                                            <tr>
                                              <td>7</td>
                                              <td>Lomotil for motions</td>
                                              <td>40tabs</td>
                                            </tr>
                                            <tr>
                                              <td>8</td>
                                              <td>Metrogyl 400mg for motions for adults</td>
                                              <td>20tabs</td>
                                            </tr>
                                            <tr>
                                              <td>9</td>
                                              <td>Tab-Tus-Q cough</td>
                                              <td>60tabs</td>
                                            </tr>
                                            <tr>
                                              <td>10</td>
                                              <td>Silver-X ointment for burns</td>
                                              <td>3nos</td>
                                            </tr>
                                            <tr>
                                              <td>11</td>
                                              <td>Betadine ointment</td>
                                              <td>3nos</td>
                                            </tr>
                                            <tr>
                                              <td>12</td>
                                              <td>Hydrogen peroxide for cleaning of wounds</td>
                                              <td>2nos</td>
                                            </tr>
                                            <tr>
                                              <td>13</td>
                                              <td>Tus-Q cough lozens</td>
                                              <td>50nos</td>
                                            </tr>
                                            <tr>
                                              <td>14</td>
                                              <td>Strepsils chewable for throat infections</td>
                                              <td>50nos</td>
                                            </tr>
                                            <tr>
                                              <td>15</td>
                                              <td>Tab-Azithrsl 500mg</td>
                                              <td>20nos</td>
                                            </tr>
                                            <tr>
                                              <td>16</td>
                                              <td>Tabs-cetrizine</td>
                                              <td>60nos</td>
                                            </tr>
                                            <tr>
                                              <td>&nbsp;</td>
                                              <td><strong>Pediatric/children Medicines</strong></td>
                                              <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td>17</td>
                                              <td>Syrup-Crocin-Ds for Fever</td>
                                              <td>6nos</td>
                                            </tr>
                                            <tr>
                                              <td>18</td>
                                              <td>Syrup-omnocortil</td>
                                              <td>6nos</td>
                                            </tr>
                                            <tr>
                                              <td>19</td>
                                              <td>syrup-T-Minic</td>
                                              <td>10nos</td>
                                            </tr>
                                            <tr>
                                              <td>20</td>
                                              <td>Syrup -Ctrizen Syrup</td>
                                              <td>10nos</td>
                                            </tr>
                                            <tr>
                                              <td>21</td>
                                              <td>Syrup-Ambrodil Cough Syrup</td>
                                              <td>10nos</td>
                                            </tr>
                                            <tr>
                                              <td>22</td>
                                              <td>Syrup-Tus-Q</td>
                                              <td>10nos</td>
                                            </tr>
                                            <tr>
                                              <td>23</td>
                                              <td>Syrup-Calcium</td>
                                              <td>60Nos</td>
                                            </tr>
                                            <tr>
                                              <td>24</td>
                                              <td>Syrup-Calcium</td>
                                              <td>60Nos</td>
                                            </tr>
                                            <tr>
                                              <td>25</td>
                                              <td>Cifran Eye/Ear drops</td>
                                              <td>4nos</td>
                                            </tr>
                                            <tr>
                                              <td>26</td>
                                              <td>Syrup-Becosules(B complex Syrup)</td>
                                              <td>80nos</td>
                                            </tr>
                                             <tr>
                                              <td><strong>Note</strong></td>
                                              <td><strong>Please check Expiry Date before you buy the Medicine</strong></td>
                                              <td>&nbsp;</td>
                                            </tr>
                                          </tbody>
                                        </table>--%>
                                  </div>
                                  <h1>Groceries Per Month</h1>
                                  <div class="table_scroll">
                                      <asp:DataList ID="dlgrocery" runat="server" RepeatColumns="1" Width="100%">
                                            <ItemTemplate>
                                                            <table width="100%" border="1" class="donatechildtab">
                                                                <tbody>
                                                                    
                                                                <tr>
                                                                    <td width="5%">  <asp:Label ID="lbgr" runat="server" Text= '<%# Container.ItemIndex + 1 %>'></asp:Label></td>
                                                                    <td width="60%">
                                                                          <asp:Label ID="lbgr1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                         <asp:Label ID="lbgr2" runat="server" Text='<%#Eval("details").ToString().Trim() %>'></asp:Label>
                                                                    </td>
                                                                      <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td>
                                                                </tr>
                                                                 <%--   <tr><td><asp:Label ID="Label3" runat="server" Text="Total"></asp:Label></td><td><asp:Label ID="Label4" runat="server" ></asp:Label></td>
            <td width="10%"><span><a href="Donation.aspx" >Donate</a></span></td></tr>--%>
                                                                           </tbody>
                                                            </table>
                                                        </ItemTemplate>
                                      </asp:DataList>


                                   <%--<table width="100%" border="1" class="expenses_table">
                                          <tbody>
                                            <tr>
                                              <th>Sl.No</th>
                                              <th>Item</th>
                                              <th>Quantity</th>
                                            </tr>
                                            <tr>
                                              <td>1</td>
                                              <td>Sunflower Refined oil any brand</td>
                                              <td>40kgs</td>
                                            </tr>
                                            <tr>
                                              <td>2</td>
                                              <td>Tur Dal</td>
                                              <td>50kgs</td>
                                            </tr>
                                            <tr>
                                              <td>3</td>
                                              <td>Umpa Rawa</td>
                                              <td>15kgs</td>
                                            </tr>
                                            <tr>
                                              <td>4</td>
                                              <td>Idli Rawa</td>
                                              <td>20tabs</td>
                                            </tr>
                                            <tr>
                                              <td>5</td>
                                              <td>Zeera(jeelakarra)</td>
                                              <td>3kgs</td>
                                            </tr>
                                            <tr>
                                              <td>6</td>
                                              <td>Rai(Avalu)</td>
                                              <td>2kgs</td>
                                            </tr>
                                            <tr>
                                              <td>7</td>
                                              <td>Chena Dal</td>
                                              <td>40tabs</td>
                                            </tr>
                                            <tr>
                                              <td>8</td>
                                              <td>Urad Dal</td>
                                              <td>15kgs</td>
                                            </tr>
                                            <tr>
                                              <td>9</td>
                                              <td>Groundnuts</td>
                                              <td>15kgs</td>
                                            </tr>
                                            <tr>
                                              <td>10</td>
                                              <td>Sugar</td>
                                              <td>50kgs</td>
                                            </tr>
                                            <tr>
                                              <td>11</td>
                                              <td>Wheat(godhumalu)</td>
                                              <td>25kgs</td>
                                            </tr>
                                            <tr>
                                              <td>12</td>
                                              <td>Turmeric Powder(Ashirvad or swastika)</td>
                                              <td>2kgs</td>
                                            </tr>
                                            <tr>
                                              <td>13</td>
                                              <td>Red Chilly Powder(Ashirvad or swastika)</td>
                                              <td>6kgs</td>
                                            </tr>
                                            <tr>
                                              <td>14</td>
                                              <td>Red Dry Chilly</td>
                                              <td>4kgs</td>
                                            </tr>
                                            <tr>
                                              <td>15</td>
                                              <td>Tamarind</td>
                                              <td>15kgs</td>
                                            </tr>
                                            <tr>
                                              <td>16</td>
                                              <td>Dish Wash scrubbers</td>
                                              <td>10nos</td>
                                            </tr>                                           
                                            <tr>
                                              <td>17</td>
                                              <td>Pappad</td>
                                              <td>2kgs</td>
                                            </tr>
                                            <tr>
                                              <td>18</td>
                                              <td>Bathing Soaps Any brand is fine(But pears for winter season)</td>
                                              <td>5dozen</td>
                                            </tr>
                                            <tr>
                                              <td>19</td>
                                              <td>Surf Excel Soap Big size</td>
                                              <td>3dozen</td>
                                            </tr>
                                            <tr>
                                              <td>20</td>
                                              <td>Washing Surf Henko or Tide</td>
                                              <td>20kgs</td>
                                            </tr>
                                            <tr>
                                              <td>21</td>
                                              <td>Tooth paste pepsodent 100gms</td>
                                              <td>16nos</td>
                                            </tr>
                                            <tr>
                                              <td>22</td>
                                              <td>Head & shoulder shampoo (1Rs.sachets)</td>
                                              <td>300nos</td>
                                            </tr>
                                            <tr>
                                              <td>23</td>
                                              <td>parachut coconut oil</td>
                                              <td>5kgs</td>
                                            </tr>
                                            <tr>
                                              <td>24</td>
                                              <td>Dettol Liquid Bottle Big Size</td>
                                              <td>6Nos</td>
                                            </tr>
                                            <tr>
                                              <td>25</td>
                                              <td>Tea Powder Brookebond</td>
                                              <td>2kgs</td>
                                            </tr>
                                            <tr>
                                              <td>26</td>
                                              <td>Vim Bars Big Size</td>
                                              <td>4 dozens</td>
                                            </tr>
                                            <tr>
                                              <td>27</td>
                                              <td>Talcum Powder</td>
                                              <td>200gms6Nos</td>
                                            </tr>
                                            <tr>
                                              <td>28</td>
                                              <td>Harpic Toilet cleaner</td>
                                              <td>10bottles Bigsize</td>
                                            </tr>
                                            <tr>
                                              <td>29</td>
                                              <td>Goodnight Refill Pack </td>
                                              <td>12Nos</td>
                                            </tr>
                                            <tr>
                                              <td>30</td>
                                              <td>Sambar Powder MTR</td>
                                              <td>2kg</td>
                                            </tr>
                                            <tr>
                                              <td>31</td>
                                              <td>Salt</td>
                                              <td>36Nos</td>
                                            </tr>
                                            <tr>
                                              <td>32</td>
                                              <td>Nuvvulu(Thill)</td>
                                              <td>2kg</td>
                                            </tr>
                                            <tr>
                                              <td>33</td>
                                              <td>Voma(Ajwaine)</td>
                                              <td>1kgs</td>
                                            </tr>
                                             <tr>
                                              <td>34</td>
                                              <td>Mamy poko pants jumbo pack size 9-14</td>
                                              <td>2 Nos</td>
                                            </tr>
                                             <tr>
                                              <td>35</td>
                                              <td>Whisper for older girl children</td>
                                              <td>16 Nos</td>
                                            </tr>
                                             <tr>
                                              <td>36</td>
                                              <td>Chenna Whole</td>
                                              <td>5 Kgs</td>
                                            </tr> 
                                            <tr>
                                              <td>37</td>
                                              <td>Spices(lavang,elachi,shagira,chekka)</td>
                                              <td>each100mgs</td>
                                            </tr> 
                                            <tr>
                                              <td>38</td>
                                              <td>Bambino</td>
                                              <td>3kgs</td>
                                            </tr> 
                                            <tr>
                                              <td>39</td>
                                              <td>Rice</td>
                                              <td>300kgs</td>
                                            </tr>                                             
                                          </tbody>
                                        </table>--%>
                                  </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="rightsuppor_block">

                                
                                                <asp:DataList ID="dlimg1" runat="server" RepeatColumns="1">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>'  Width="347px" Height="347px" CssClass="gt" BorderColor="black" BorderStyle="Solid" BorderWidth="1px" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                       	    <%--	<img src="images/supportpic_1.jpg" width="450" height="100" alt="" class="img-fluid"/> --%>
                            </div>
                        </div>                                       
                    </div>
                    
                </div>            	
            </div>
        	
        </div>
      </div>
  </div>
</asp:Content>

