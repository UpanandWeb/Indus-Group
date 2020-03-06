<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Special-Day.aspx.cs" Inherits="Special_Day" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

      <script type="text/javascript">
          function SessionExpireAlert(timeout) {
              var seconds = timeout / 1000;
              document.getElementsByName("secondsIdle").innerHTML = seconds;
              document.getElementsByName("seconds").innerHTML = seconds;
              setInterval(function () {
                  seconds--;
                  document.getElementById("seconds").innerHTML = seconds;
                  document.getElementById("secondsIdle").innerHTML = seconds;
              }, 1000);
              setTimeout(function () {
                  //Show Popup before 20 seconds of timeout.
                  $find("mpeTimeout").show();
              }, timeout + 1 * 1000);
              setTimeout(function () {
                  window.location = "Default.aspx";
              }, timeout);
          };
          function ResetSession() {
              //Redirect to refresh Session.
              window.location = window.location.href;
          }
            </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="three_supportouter">
                      <asp:LinkButton ID="lnk1" runat="server" Text="Home" PostBackUrl="Default.aspx" Font-Size="22px"></asp:LinkButton>&nbsp; >> &nbsp; <asp:LinkButton ID="LinkButton1" runat="server" Text="Support" PostBackUrl="Support.aspx" Font-Size="22px"></asp:LinkButton>  >> &nbsp; <asp:Label ID="lbhome"  Text="Special Day" runat="server" ForeColor="#ff9933" Font-Size="20px"></asp:Label>  
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
                        <div class="col-lg-9">
                            <div class="total_specialday">
                                <div class="specialday_outer">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div class="mealsleft_outer">
                                                <p>Celebrate your Birthday's,Anniversaries or any special day with orphan children and make a difference.</p>
                                                <h1>Vegetarian Special Meal</h1>

                                                <table  width="100%" border="1" class="donatechildtab"><tr><td width="20%">Sl No</td><td>Veg Menu</td></tr></table>


                                                 <asp:DataList ID="DataList1" Width="100%" runat="server" RepeatColumns="1" ShowFooter="true">
                                <ItemTemplate>

                                    <table  width="100%" border="1" class="donatechildtab">
                                        <tbody>
                                           
                                       
                                      <%--  <tr>
                                            <td>Sl.no</td><td></td>
                                        </tr>--%>
                                        <tr>
                                             <td width="20%">
                                            <asp:Label ID="Label4" runat="server" Text= '<%# Container.ItemIndex + 1 %>'></asp:Label>
                                        </td>
                                            <td>
                                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("item_name") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                             
                                  <%--  <ul style="list-style: none;">

                                        <li style="list-style: none;">--%>
                                      <%--      <p style="text-align: justify;">--%>
                                         
                                           <%-- </p>--%>
                                      <%--  </li>
                                    </ul>--%>
                                </ItemTemplate>
            <FooterTemplate>
                <asp:Label ID="tl" runat="server" Text='<%# Eval("total") %>'></asp:Label>
            </FooterTemplate>

                            </asp:DataList>
                                                <%--<table width="100%" border="1" class="mealstable">
                                                    <tbody>
                                                        <tr>
                                                            <th>Sl.No</th>
                                                            <th>Veg Menu</th>
                                                        </tr>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Vegetable Biriyani</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>Vegetable Curry</td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>Vegetable Fry</td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>Sambar</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Papad</td>
                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>Curd Chutney</td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>Sweet or Ice Cream</td>
                                                        </tr>
                                                    </tbody>
                                                </table>--%>
                                                <p class="center_para">
                                                    <span>Rs.4000/-</span>
                                                    <a href="#" target="_self">Donate</a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="picrite_outer">

                                                <asp:DataList ID="dlimg1" runat="server" RepeatColumns="1">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>' width="300" height="300" class="img-fluid" alt="" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                           <%--     <img src="images/vegfinal_1.jpg" width="300" height="300" class="img-fluid" alt="" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="specialday_outer">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div class="mealsleft_outer">
                                                <h1>Non-Vegetarian Feast Meals</h1>

                                                  <table  width="100%" border="1" class="donatechildtab"><tr><td width="20%">Sl No</td><td>Non Veg Menu</td></tr></table>


                                                 <asp:DataList ID="DataList2" Width="100%" runat="server" RepeatColumns="1" ShowFooter="true">
                                <ItemTemplate>

                                    <table  width="100%" border="1" class="donatechildtab">
                                        <tbody>
                                           
                                       
                                      <%--  <tr>
                                            <td>Sl.no</td><td></td>
                                        </tr>--%>
                                        <tr>
                                             <td width="20%">
                                            <asp:Label ID="lbnon" runat="server" Text= '<%# Container.ItemIndex + 1 %>'></asp:Label>
                                        </td>
                                            <td>
                                                      <asp:Label ID="Labellbnon2" runat="server" Text='<%# Eval("item_name") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                             
                                  <%--  <ul style="list-style: none;">

                                        <li style="list-style: none;">--%>
                                      <%--      <p style="text-align: justify;">--%>
                                         
                                           <%-- </p>--%>
                                      <%--  </li>
                                    </ul>--%>
                                </ItemTemplate>
            <FooterTemplate>
                <asp:Label ID="tl" runat="server" Text='<%# Eval("total") %>'></asp:Label>
            </FooterTemplate>

                            </asp:DataList>

                                                <%--<table width="100%" border="1" class="mealstable">
                                                    <tbody>
                                                        <tr>
                                                            <th>Sl.No</th>
                                                            <th>Non-Veg Menu</th>
                                                        </tr>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Bagara Rice or Biriyani</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>Chicken/Mutton curry/Boneless Fish Curry</td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>Curd Chutney</td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>Sweet or Ice creams</td>
                                                        </tr>
                                                    </tbody>
                                                </table>--%>
                                                <p class="center_para">
                                                    <span>Rs.5000/-</span>
                                                    <a href="#" target="_self">Donate</a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="picrite_outer">
                                                  <asp:DataList ID="DataList3" runat="server" RepeatColumns="1">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("imagename", "photos/support/{0}") %>' width="300" height="300" class="img-fluid" alt="" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                             <%--   <img src="images/nonvegfinal_2.jpg" width="300" height="300" class="img-fluid" alt="" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p>Also you can gift them individually according to their wish and needs of the children</p>
                                <h1>Breakfast menu Includes:</h1>
                                <ol>
                                    <li>Bread,Butter or jam,1 boiled egg,bambino sweet.</li>
                                    <li>2 Idli,1 Wada with chatni,Bambino sweet,Milk.</li>
                                    <li>Poori,Curry,Bambino sweet,Milk.</li>
                                    <li>Any of your desire choice.</li>
                                </ol>
                                <p>One time vegetarian feast meal Rs.4000(Lunch at 1pm,dinner at 7:30pm)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

