<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="holidaypackage.aspx.cs" Inherits="holidaypackage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<style>
.outer-im{
	width:90%;
overflow:hidden;
margin:0 auto;
}
.outer-im input{
	width:90%;
margin:10px 0px 0px 0px;
}
.text-center{
background-color: #fff!important;
    width: 80%!important;
    margin: 0 auto!important;
}
.card{
	background:transparent!important;
	border:1px solid transparent!important;
}

</style>
</asp:Content>
   <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <section  class="text-justify " id="background-ticketing">
        <div class="container-fluid">
            </div>
           <div class="container-fluid mt-5">
            <div class="col-lg-12">
                <h2 class="mt-5 text-danger font-weight-bold">Holiday Package:</h2>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card text-dark">
                               <asp:DataList ID="dl2" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" OnItemCommand="dl2_ItemCommand" >
                                                    <ItemTemplate>
                                                      <div class="outer-im">
                                                        <asp:ImageButton ID="im1" runat="server"   AlternateText="No Image" CssClass="card-img-top" ImageUrl='<%# Eval("imagename", "images/{0}") %>' CommandName="view" CommandArgument='<%#Eval("id") %>' />
</div>
                                                          <div class="card-body text-center">
                                                        <h2><asp:LinkButton ID="lb2" runat="server" Text='<%#Eval("place") %>' CommandName="view" CommandArgument='<%#Eval("id") %>'></asp:LinkButton></h2>
                                                        <p><asp:Label ID="lb22" runat="server" Text='<%#Eval("subtitle") %>'></asp:Label></p>
                                                              </div>
                                                   </ItemTemplate>
             
                                                </asp:DataList>

                            <%--<a href="http://1indus.com/newtravels/PackageDetails.aspx?id=6"><img class="card-img-top" src="./images/domfinal_2.jpg" alt="Card image cap" width="250" height="250"></a>
                            <div class="card-body text-center">
                                <h5 class="card-title">Taj mahal</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet,</p>--%>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
               </div>
                    </section>
    
</asp:Content>
