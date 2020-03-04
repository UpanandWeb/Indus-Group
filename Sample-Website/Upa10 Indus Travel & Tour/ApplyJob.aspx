<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="ApplyJob.aspx.cs" Inherits="ApplyJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Indus Tours &amp; Travels</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/full-slider.css" />
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!--menu_links-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--menu_links-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section  class="text-justify" id="background40">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <img src="./images/career.jpg"  class="img-fluid">
                        <p><span class="usa-name">CARRER</span></p>

                    </div>
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="col-lg-12">
                                    <div class="col-lg-6">
                                    <img src="./images/career-5.jpg" class="img-fluid">
                                        
                                    </div>
                                    <div class="col-lg-6">
                                        <p>Career is an important aspect of any person’s life. It determines the kind of lifestyle one will lead and his/her position in the society. While everyone dreams of a good lifestyle not everyone is able to build a strong career that can ensure the same.</p>
                                    <p>Career is usually associated with the professional aspect of a person’s life. However, some even relate it to an individual’s life and learning in addition to his work. Here are essays of varying lengths on Career to help you with the topic whenever you required. You can select any career essay as per your need:</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="apply-resume">
                                    <h4>Post Your Resume</h4>
                             
                                    <div class="form-group">
                                        <label for="name">Name</label><br />
                                        <asp:TextBox ID="txt1" runat="server" ForeColor="Black" ></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txt1" ErrorMessage="Add Name" ForeColor="Red" ValidationGroup="val1" >*</asp:RequiredFieldValidator> 
                                    <%--    <input class="form-control" type="text" id="name" placeholder="" required>--%>
                                    </div>
                                    <div class="form-group">
                                        <label for="number">Contact Phone</label><br />
                                          <asp:TextBox ID="txt2" runat="server" ForeColor="Black" ></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt2" ErrorMessage="Add Mobile" ForeColor="Red" ValidationGroup="val1" >*</asp:RequiredFieldValidator> 
                                       <%-- <input class="form-control" type="tel" id="number" placeholder="" required>--%>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email address</label><br />
                                          <asp:TextBox ID="txt3" runat="server" ForeColor="Black" ></asp:TextBox>

                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt3" ErrorMessage="Add Email" ForeColor="Red" ValidationGroup="val1" >*</asp:RequiredFieldValidator> 
                                     <%--   <input class="form-control" type="email" id="email" placeholder="" required>--%>
                                    </div>
                                    <div class="form-group">
                                        <label for="file">Upload Resume</label><br />
                                        <asp:FileUpload ID="fp" runat="server" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fp" ErrorMessage="Add FIle" ForeColor="Red" ValidationGroup="val1" >*</asp:RequiredFieldValidator> 
                                       <%-- <input class="form-control" type="file" id="file" placeholder="" required>--%>
                                    </div>
                               <asp:Button ID="btn" runat="server" Text="Submit" class="btn btn-danger" OnClick="btn_Click" ValidationGroup="val1" />

                                    <asp:ValidationSummary ID="val" runat="server" ValidationGroup="val1" ShowMessageBox="true" ShowSummary="false" />
                                   <%-- <button class="btn btn-danger" id="Location8" type="submit">Submit</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    </section>

    </section>

</asp:Content>

