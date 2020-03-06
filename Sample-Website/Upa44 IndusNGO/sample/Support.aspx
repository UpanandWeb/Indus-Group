<%@ Page Title="Anandam Foundation" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Support" Culture="en-IN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="support_outer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 nopadding">
                    <div class="support_bg_outer">
                        <img src="images/support_bgfinal.jpg" width="1200" height="300" alt="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="three_supportouter">

                           <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp; <asp:Label ID="lbhome"  Text="Support" runat="server" ForeColor="#ff9933" Font-Size="22px"></asp:Label>  
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
                                       <%-- <li><a href="Support.aspx">SPONSOR A CHILD'S EDUCATION</a></li>
                                        <li><a href="Support-Nutrition.aspx" target="_self">SPONSOR A CHILD FOR NUTRITION FOOD</a></li>
                                        <li><a href="Monthly-Need.aspx">SPONSOR MONTHLY NEEDS</a></li>
                                        <li><a href="Current-Needs.aspx">SPONSOR CURRENT HOME NEEDS</a></li>
                                        <li><a href="Special-Day.aspx">SPONSOR YOUR SPECIAL DAY</a></li>
                                        <li><a href="Donation.aspx">ANY DONATION</a></li>
                                        <li><a href="Fund.aspx">CORPUS FUND</a></li>--%>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="centersupport_content">
                                   <%-- <h1>Importance of Education</h1>--%>

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
                                   <asp:Label ID="dblTotal" runat="server"></asp:Label>
                                  <%--  <p>Every child needs to be educated it is a basic right. it is estimated that in our own country at leasr 35 million, and possibly as many as 60 million, children aged 6-14 years are not in school. A good education equips a person for a better life shapes their thinking and gives the knowledge helps them to live with dignity.Illiteracy is like a vicious cycle and it needs to be broken by providing better education to these children. It will help them to develop a perpectiveof looking at life. Education helps will help them gain better job oppotunities to financial independence and boost their sellf confidence. It is only possible to have a stable mind and a balanced life once they are self dependent and have a reputable standing in the society.</p>
                                    <p>By Simply being educated you'd have little job insecurity. no inferiority complex and a well organized understanding of the world. Education may not be th key to happiness, but it definitely is the key to a lot of other things which come together to make you happy. One thing i wish i can do is, to provide education for all: no children left behind and change the world for good!!. Your adoption for educating a child will have a lastinf positive effect throughout his/her life. </p>--%>
                                    <div class="table_scroll">
                                        <table width="100%" border="1" class="donatechildtab">
                                            <tbody>
                                                <tr width="300">
                                                    <td>Sponsor a Kid for an Education per annum for School Fees</td>
                                                    <td>Rs.12,000</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Transportation</td>
                                                    <td>Rs.4,000</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Total</td>
                                                    <td>16,000</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h2>Sponsor a Kid for School Fees for school need per annum</h2>
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
                                               
                                            <%--<tbody>
                                                <tr>
                                                    <td>Text Books &amp; Note Books</td>
                                                    <td>Rs.2,500</td>
                                                    <td><span><a href="Donation.aspx" >Donate</a></span></td>
                                                </tr>
                                                <tr>
                                                    <td>2 Pairs of Regular uniform</td>
                                                    <td>Rs.1,800</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>1 Pair of White Uniform</td>
                                                    <td>Rs.900</td>
                                                    <td><a href="Donation.aspx" target="_self">Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>2 Pair of School shoes</td>
                                                    <td>Rs.700</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1">School bag</td>
                                                    <td class="auto-style1">Rs.400</td>
                                                    <td class="auto-style1"><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Tie &amp; Belt</td>
                                                    <td>Rs.175</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Stationary and Lunch Box</td>
                                                    <td>Rs.350</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Total</td>
                                                    <td>Rs.6,825</td>
                                                    <td><a href="Donation.aspx" >Donate</a></td>
                                                </tr>
                                            </tbody>--%>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="rightsuppor_block">
                                    <img src="images/supportpic_1.jpg" width="450" height="100" alt="" class="img-fluid" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>





</asp:Content>

