<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        .lb {
            color:white;
          font-size:20px;
        }
    </style>
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

    <section  class="text-justify">
        <div class="container-fluid nopadding">
            <div class="col-lg-12">
                <div class="row">
                  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="./videos/bgvideo2.mp4" type="video/mp4">
  </video>
                    <div class="col-lg-2"></div>
                    <div class="col-lg-4">
                        <div class="travel-bg2">
                        </div>
                    </div>
                    <div class="col-lg-4 col-xs--3 col-sm-3 col-md-3">
                        <h4 class="contact-head6">Contact</h4>
                        <div class="form-group color-change2">
                            <asp:Label ID="lb1" runat="server" Text="Name" CssClass="lb"  ></asp:Label>
                            <asp:TextBox ID="txt" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txt" ErrorMessage="Enter Name" ValidationGroup="val" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                                   <%--  <div class="form-group color-change2">
                         <asp:Label ID="Label1" runat="server" Text="Email" CssClass="lb"  ></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ValidationGroup="val" ErrorMessage="Enter Email" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>--%>
                           <div class="form-group color-change2">
                                  <asp:Label ID="Label2" runat="server" Text="Email" CssClass="lb"  ></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ValidationGroup="val" ErrorMessage="Enter Email" ForeColor="Red">*</asp:RequiredFieldValidator>
                               </div>
                      
                                <div class="form-group color-change2">
                                  <asp:Label ID="Label3" runat="server" Text="Phone" CssClass="lb"  ></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ValidationGroup="val" ErrorMessage="Enter Mobile" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </div>
                                 <div class="form-group form-height color-change2">
                                       <asp:Label ID="Label4" runat="server" Text="Location" CssClass="lb"  ></asp:Label>
                                     <asp:DropDownList ID="ddl" runat="server"  AppendDataBoundItems="true">
                                         <asp:ListItem Value="0" >Select</asp:ListItem>
                                            <asp:ListItem Value="1" >Hyderabad</asp:ListItem>
                                          <asp:ListItem Value="2" >Delhi</asp:ListItem>
                                           <asp:ListItem Value="3" >Mumbai</asp:ListItem>
                                         <asp:ListItem Value="4" >Bangalore</asp:ListItem>
                                         <asp:ListItem ></asp:ListItem>
                                     </asp:DropDownList>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" ValidationGroup="val" runat="server" ControlToValidate="ddl" ErrorMessage="Enter place" ForeColor="Red">*</asp:RequiredFieldValidator>
                                     </div>
                        <div class="form-group color-change2">
                             <asp:Label ID="Label5" runat="server" Text="Message" CssClass="lb"  ></asp:Label>

                            <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ValidationGroup="val" ControlToValidate="TextBox6" ErrorMessage="Enter place" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        <asp:Button ID="btn" runat="server" Text="Submit" CssClass="btn btn-info" ValidationGroup="val" OnClick="btn_Click"/>
                        <asp:ValidationSummary ID="val" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="val" />
                        <%--<form  class="color-change">
                                <div class="form-group color-change2">
                                    <label for="name">Name</label>
                                        <input class="form-control" type="text" id="name" placeholder="" required>
                                </div>
                                <div class="form-group color-change2">
                                    <label for="email">Email address</label>
                                        <input class="form-control" type="email" id="email" placeholder="" required>
                                </div>
                                <div class="form-group color-change2">
                                    <label for="number">Phone</label>
                                        <input class="form-control" type="tel" id="number" placeholder="" required>
                                </div>
                            <div class="form-group form-height color-change2">
                                <label for="Location3">Location</label>
                                <select class="form-control" id="Location3">
                                    <option>Hyderabad</option>
                                    <option>Mumbai</option>
                                    <option>Chennai</option>
                                    <option>Delhi</option>
                                </select>
                            </div>
                            <div class="form-group color-change2">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" rows="3"></textarea>
                            </div>
                             <button class="btn btn-info" id="Location5" type="submit">Submit</button>
                        </form>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

