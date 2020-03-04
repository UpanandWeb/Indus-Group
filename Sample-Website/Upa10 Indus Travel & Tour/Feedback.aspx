<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript" src="js/jquery-1.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section  class="text-justify " id="background-feedback">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6 m-auto">
                            <div class="feedback-emoji">
                    <h2 class="feedback-head text-center">Feedback</h2>
                   <h3 class="text-center">We would like your feedback to improve our website</h3>
                    <h3 class="text-center">What is your opinion on this website</h3>
                                <ul>
                                    <li><a href="#" target="_self"><img src="./images/emoji3.png" width="50px" height="50px"></i></a></li>
                                    <li><a href="#" target="_self"><img src="./images/emoji1.png" width="50px" height=50px"></i></a></li>
                                    <li><a href="#" target="_self"><img src="./images/emoji2.png" width="50px" height=50px"></i></a></li>
                                    <li><a href="#" target="_self"><img src="./images/emoji4.png" width="50px" height=50px"></i></a></li>
                                    <li><a href="#" target="_self"><img src="./images/emoji5.png" width="50px" height=50px"></i></a></li>
                                </ul>
                                <hr>
                                <div class="feedback-emoji2">
                                <h3>Please select your category below</h3>
                                <ul>
                                    <li><a href="#">Suggetion</a></li>
                                    <li><a href="#">Something is not quite right</a></li>
                                    <li><a href="#">Compliment</a></li>
                                </ul>
                                </div>
                                <hr>
                                <div class="feedback-feedback">
                                    <h3>Please leave your feedback below...</h3>
                                    <form>
                                        <div class="form-group">
                                             <label for="message">Name</label>
                                            <asp:TextBox ID="TextBox2" runat="server"  required class="form-control"></asp:TextBox>
                                              <label for="message">Email</label>
                                            <asp:TextBox ID="TextBox1" runat="server"  required class="form-control"></asp:TextBox>

                                            <label for="message">Message</label>
                                            <asp:TextBox ID="text" runat="server" TextMode="MultiLine" required class="form-control"></asp:TextBox>
                                         
                                          <%--  <textarea class="form-control" id="message" rows="6"></textarea>--%>
                                        </div>
                                        <div class="button-outer3">
                                            <asp:Button ID="btn" runat="server" Text="Submit"  class="btn btn-danger text-right" OnClick="btn_Click"/>
                                    <%--    <button class="btn btn-danger text-right" id="Location6" type="submit">Send</button>--%>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

