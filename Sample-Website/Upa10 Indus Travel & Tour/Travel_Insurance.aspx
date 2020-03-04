<%@ Page Title="" Language="C#" MasterPageFile="MasterPage2.master" AutoEventWireup="true" CodeFile="Travel_Insurance.aspx.cs" Inherits="Travel_Insurance" Culture="en-Gb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Indus Tours &amp; Travels</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/aos.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/full-slider.css">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script type="text/javascript">
    $(function () {
        $("[id*=txtDate]").datepicker({minDate:0,

         
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'images/calendar.png'
        });
    });
</script>
    <script type="text/javascript">
        $(function () {
            $("[id*=txtDate1]").datepicker({
                minDate: 0,


                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'images/calendar.png'
            });
        });
</script>
   <script type="text/javascript">
       function GetDays() {
           var dropdt = new Date(document.getElementById("[id*=txtDate]").value);
           var pickdt = new Date(document.getElementById("[id*=txtDate1]").value);
           return parseInt((pickdt - dropdt) / (24 * 3600 * 1000));
       }

       function cal() {
           if (document.getElementById("[id*=txtDate1]")) {
               document.getElementById("[id*=TextBox1]").value = GetDays();
           }
       }

    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#ddlPassport").change(function () {
            if ($(this).val() == "1") {
                $("#div1").show();
                $("#div2").hide();
                $("#div3").hide();
                $("#div4").hide();
                $("#div5").hide();
                $("#div6").hide();
                //$("#Div2").hide();
                //$("#Div3").hide()
            }
            else if ($(this).val() == "2") {
                $("#div1").show();
                $("#div2").show();
                $("#div3").hide();
                $("#div4").hide();
                $("#div5").hide();
                $("#div6").hide();
            }
                //else   if ($(this).val() == "2") {
                //       $("#dvPassport").show();
                //       $("#Div2").show();
                //   }
            else if ($(this).val() == "3") {
                $("#div1").show();
                $("#div2").show();
                $("#div3").show();
                $("#div4").hide();
                $("#div5").hide();
                $("#div6").hide();
            }
            else if ($(this).val() == "4") {
                $("#div1").show();
                $("#div2").show();
                $("#div3").show();
                $("#div4").show();
                $("#div5").hide();
                $("#div5").hide();
            }
            else if ($(this).val() == "5") {
                $("#div1").show();
                $("#div2").show();
                $("#div3").show();
                $("#div4").show();
                $("#div5").show();
                $("#div6").hide();
            }
            else if ($(this).val() == "6") {
                $("#div1").show();
                $("#div2").show();
                $("#div3").show();
                $("#div4").show();
                $("#div5").show();
                $("#div6").show();
            }

            else {
                //$("#dvPassport").hide();
                //$("#Div2").hide();
                //$("#Div3").hide()
            }
        });
    });
</script>

    <style>
        .outer input[type="radio"]{
            margin: 0px 0px 0px 30px;
            /*float:left;*/
        }
        .outer label {
            margin:-10px 0px 0px 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> 

       <section  class="text-justify " id="passport-visa2">
        <div class="container-fluid">
            <div class="col-lg-12 nopadding">
                <div class="row">
                    <div class="text-count">
                        <img src="./images/travel-insurence.jpg"  class="img-fluid">
                    </div>
                    <div class="col-lg-12">
                        <div class="row p-5">
                            <div class="col-lg-12">
                                <h3>Travel Insurance:</h3>
                                <hr>
                                <p>
                                    Like any other insurance policy, travel insurance also plays a vital role. Travel insurance covers medical and non-medical expenses when you are travelling to another foreign country. There can be many scenarios where travel insurance can be of help like say you fall sick during travel or you might lose some of your valuables like passports, personal accident, medical expenses, loss of checked in baggage or any other necessary belongings.
                                </p>
                                <p>
                                    With a contingent travel insurance plan, you can travel without any worry, as you are covered amply under the travel insurance plan. <b>
                                    <a href="#"> Indus travels and tours </a> </b>
                                    being a global travel and tours company specialized in worldwide travels and also have got travel insurance plans for student, individuals and corporate,
                                    so that they can get the maximum benefit from our reasonable and well laid out travel plans.</p>
                                <p>
                                    Our team will assist you in picking up a perfect travel insurance plan. We will also guide you in ascertaining as
                                    to what are all the credentials and documentation required, so that you can easily acquire an insurance plan.</p>
                                <p> We will be more than happy to help you for any further assistance. </p>
                                <p>Kindly contact on the information provided below:</p>
                                <h3> Online Travel Insurance Buying Process </h3>
                                <div class="footer-insurence">
                                <form>
                                    <div class="col-lg-12 mb-3">
                                        <div class="row">
                                            <div class="col-lg-5">
                                              <%--  <input type="radio" value="travel" group="options" name="Insurance"> International Travel Insurance </input>--%>
                                               <%-- <asp:radiobuttonlist runat="server"></asp:radiobuttonlist>--%>

                                                <div class="outer">
<asp:RadioButtonList ID="rad" runat="server"  RepeatDirection="Horizontal" CssClass="outer">
                                                    <asp:ListItem Selected="True">International Travel Insurance</asp:ListItem>

                                                    <asp:ListItem>Student Travel Insurance</asp:ListItem>
                                                </asp:RadioButtonList>

                                                <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="rad" ErrorMessage="Select Insurance Type">*</asp:RequiredFieldValidator>

                                                </div>
                                                
                                               <%-- <asp:RadioButton ID="rad" runat="server" Text="International Travel Insurance" GroupName="rad1" Checked="true" ></asp:RadioButton>--%>
                                            </div>
                                            <div class="col-lg-4">
                                                   <%-- <asp:RadioButton ID="RadioButton1" runat="server" Text="Student Travel Insurance" GroupName="rad1" ></asp:RadioButton>--%>
                                             <%--   <input type="radio" value="student" group="options" name="Insurance">Student Travel Insurance </input>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <h4> Where are you travelling? </h4>
                                        <div class="col-lg-12 mb-3">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                       <div class="outer">
                                                    <asp:RadioButtonList ID="rad2" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Selected="True">USA / Canada</asp:ListItem>
                                                        <asp:ListItem>
                                                            Asia 
                                                        </asp:ListItem>
                                                        <asp:ListItem>
                                                            Others 
                                                        </asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="rad2" ErrorMessage="Select Place" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                                           </div>
                                                </div>                                               
                                            </div>
                                        </div>
                                    <h4>Sum insured</h4>
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="col-lg-2">
                                 <asp:DropDownList ID="ddl" runat="server" AppendDataBoundItems="true">
                                     <asp:ListItem Value="0">Select</asp:ListItem>
                                     <asp:ListItem Value="1">1 month</asp:ListItem>
                                       <asp:ListItem >3 month</asp:ListItem>
                                       <asp:ListItem >6 month</asp:ListItem>
                                       <asp:ListItem >12 month</asp:ListItem>
                                 </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="ddl" ErrorMessage="Select Duration" ValidationGroup="cal">*</asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mt-4">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div>
                                        <label for="Departure">Departure date</label>

                                        <asp:TextBox ID="txtDate" runat="server"  ForeColor="Black"></asp:TextBox>
                                             <asp:calendarextender ID="ceStartDate" runat="server" TargetControlID="txtDate"
                PopupPosition="Right" Format="dd/MM/yyyy" />

                                        <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="txtDate" ErrorMessage="Select start date" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                       <%-- <input class="form-control" type="date" id="Departure" placeholder="">--%>
                                    </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div>
                                                    <label for="Return">Return</label>
                                                       <asp:TextBox ID="txtDate1" runat="server"  ForeColor="Black" ></asp:TextBox>
                                                       <asp:calendarextender ID="ceEndDate" runat="server" TargetControlID="txtDate1"
                PopupPosition="Right" Format="dd/MM/yyyy" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate1" ErrorMessage="Select end date" ValidationGroup="cal">*</asp:RequiredFieldValidator> 
                                                <%--    <input class="form-control" type="date" id="Return" placeholder="">--%>

                                                   <%-- <asp:Button ID="btn" runat="server" Text="cal" OnClick="CalculateDays" />--%>
                                                </div>
                                            </div>
                                        
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div>
                                                    <label for="Travelers">Number of Travelers</label>
                                                   
 <select id="ddlPassport"  >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option value="0">Select</option>
&nbsp;&nbsp;&nbsp; <option value="1">1</option>
&nbsp;&nbsp;&nbsp; <option value="2">2</option>
&nbsp;&nbsp;&nbsp;&nbsp; <option value="3">3</option>
&nbsp;&nbsp;&nbsp;&nbsp; <option value="4">4</option>
&nbsp;&nbsp;&nbsp;&nbsp; <option value="5">5</option>
&nbsp;&nbsp;&nbsp;&nbsp; <option value="6">6</option>
                                                    </select>
                                                
                                                  

                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPassport" ErrorMessage="Select Travelers" ValidationGroup="cal">*</asp:RequiredFieldValidator>--%>
                                              <%--   <asp:DropDownList ID="ddl" runat="server" AppendDataBoundItems="true" >
                                                     <asp:ListItem Value="0">
                                                         Select
                                                     </asp:ListItem >
                                                          <asp:ListItem Value="1">
                                                         1
                                                     </asp:ListItem>
                                                      <asp:ListItem Value="2">
                                                         2
                                                     </asp:ListItem>
                                                      <asp:ListItem Value="3">
                                                         3
                                                     </asp:ListItem>
                                                      <asp:ListItem Value="4">
                                                         4
                                                     </asp:ListItem>
                                                      <asp:ListItem Value="5">
                                                         5
                                                     </asp:ListItem>
                                                      <asp:ListItem Value="6">
                                                         6
                                                     </asp:ListItem>
                                                 </asp:DropDownList>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h4> Details </h4>
                                    <div class="col-lg-12" id="dl" >
                                        <div class="row">
                                            <div id="div1" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Traveler 1</label>
                                               <asp:DropDownList ID="ddl1" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddl1" ErrorMessage="Select Travelers Details" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                             </div>
                                            <div id="div2" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Trveler 2</label>
                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="DropDownList1" ErrorMessage="Select Travelers Details" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                            </div>
                                            <div id="div3" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Trveler 3</label>
                                               <asp:DropDownList ID="DropDownList2" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ControlToValidate="DropDownList2" ErrorMessage="Select Travelers Details" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                            </div>
                                            <div id="div4" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Trveler 4</label>
                                                <asp:DropDownList ID="DropDownList3" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                            </div>
                                            <div id="div5" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Trveler 5</label>
                                                <asp:DropDownList ID="DropDownList4" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Select Travelers DEtails" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                            </div>
                                            <div id="div6" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <label>Trveler 6</label>
                                                <asp:DropDownList ID="DropDownList5" runat="server">
                                                   <asp:ListItem Value="0">
                                                       Select
                                                   </asp:ListItem>
                                                    <asp:ListItem >
                                                       3m-40yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       41-55yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       56-60yrs
                                                   </asp:ListItem>
                                                   <asp:ListItem>
                                                       61-70yrs
                                                   </asp:ListItem>
                                               </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="DropDownList5" ErrorMessage="Select Travelers DEtails" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <h4> Your Information </h4>
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-inline">
                                                    <label for="umail"> Email ID</label>
                                                    

                                                    <asp:TextBox ID="txt1" runat="server" ></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="0" ControlToValidate="txt1" ErrorMessage="Enter Email" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                            </div>
                                                </div>

                                             <div class="col-lg-4">
                                                <div class="form-inline">

                                                     <label for="umail">Phone Number</label>
                                                      <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="0" ControlToValidate="TextBox1" ErrorMessage="Enter Mobile" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                                 <%--   <label for="unum"> Phone Number</label>
                                                    <input class="form-control" type="tel" id="unum" placeholder="">--%>
                                                </div>
                                            </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </form>
                                    <div class="mt-4">
                                        <asp:CheckBox ID="chk" runat="server" Text="I Agree Terms and Conditions" />
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Check Checkbox" ValidationGroup="cal">*</asp:RequiredFieldValidator>
                                       <%-- <input type="checkbox" value="travel" group="options" name="Insurance"> I Agree Terms and Conditions</input>--%>
                                        <br>
                                     <%--   <button class="btn btn-danger f-conditions">Submit</button>--%>

                                        <asp:Button ID="btn1" runat="server" Text="Submit" CssClass="btn btn-danger f-condition" ValidationGroup="cal" OnClick="btn1_Click" />
                                        <asp:ValidationSummary ID="val" runat="server" ValidationGroup="cal" ShowMessageBox="true" ShowSummary="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
         
</asp:Content>

