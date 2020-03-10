<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<%@ Register Src="UControls/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />
  
  <style>
        b,
        h3 {
            color: darkblue;
        }

        b {
            font-family: 'Lato', sans-serif;
            font-weight: bold;
        }

        p {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px
        }

        .col-sm-9 ul li {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            padding: 5px 0;
        }
      .feed 
      input,.feed select,.feed input:focus ,.feed select:focus{    width: 80%;
    border:1px solid gray;
    border-radius: 4px;
    padding: 4px 0px 0px 10px;
    background-position: 10px 5px;
    background-repeat: no-repeat;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
    height: 32px;
    /*padding-bottom:0px;*/
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

    <div style="padding:10px;">
        <div class="row">
                <div class="col-sm-3" style="margin-top: 3%">
                <img src="img/feedback.jpg" alt="" width="100%" height="400px">
            </div>
            <div class="col-sm-5 col-sm-offset-1">
                <h3>
                    Feedback :
                </h3>
    <div class="form-group feed" style="margin-bottom:0px;">
      <label for="name">Name:</label>
      <%--<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">--%>
        <asp:TextBox ID="txtname" runat="server"  placeholder="Enter Full Name" CssClass="form-control" TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"  ValidationGroup="feedback"  ForeColor="Red"
                ErrorMessage="Please enter Full Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender ID="sss" runat="server"  InvalidChars="1234567890~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                                                 TargetControlID="txtname"></cc1:FilteredTextBoxExtender> 
    </div>

    <div class="form-group feed" style="margin-bottom:0px;">
        <label for="email">Email:</label>
        <asp:TextBox ID="txtemail" runat="server"  placeholder="Enter Email" CssClass="form-control" TabIndex="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail"  ForeColor="Red"
                ErrorMessage="Please enter Email ID" ValidationGroup="feedback" SetFocusOnError="true" ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  Display="Dynamic"
                    ErrorMessage="Please Enter Valid Email Address"  ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"   ValidationGroup="feedback" 
                    ControlToValidate="txtemail" SetFocusOnError="true"></asp:RegularExpressionValidator>
      <%--<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">--%>
    </div>

      <div class="form-group feed" style="margin-bottom:0px;">
        <label for="email">Organisation:</label>
        <asp:TextBox ID="txtorg" runat="server"  placeholder="Enter Company Name" CssClass="form-control" TabIndex="3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtorg" ForeColor="Red"
                 ErrorMessage="Please enter Company Name" ValidationGroup="feedback" SetFocusOnError="true" ></asp:RequiredFieldValidator>

      <%--<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">--%>
    </div>

     <div class="form-group feed" style="margin-bottom:0px;">
      <label for="phone">Phone:</label>
        <asp:TextBox ID="txttelno" runat="server"  placeholder="Enter Mobile Number" CssClass="form-control" MaxLength="10" TabIndex="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttelno"  ForeColor="Red"
                ErrorMessage="Please enter Mobile Number" ValidationGroup="feedback" SetFocusOnError="true" ></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txttelno"  ForeColor="Red" Display="dynamic" SetFocusOnError="true"
                                          ErrorMessage="Enter Valid 10 digits number"  ValidationExpression="^[0-9]{10}$" ValidationGroup="feedback" ></asp:RegularExpressionValidator>
                                                      <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"  InvalidChars="~`!@#$%^&*()_=+<>,." 
                                                  ValidChars="0123456789" TargetControlID="txttelno" ></cc1:FilteredTextBoxExtender>
      <%--<input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">--%>
    </div>
    <div class="form-group feed" style="margin-bottom:0px;">
                <label for="phone">Address :</label>

        <asp:TextBox ID="txtaddr" runat="server"  placeholder="Enter Address" CssClass="form-control" TabIndex="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtaddr"  ForeColor="Red"
                ErrorMessage="Please enter Address" ValidationGroup="feedback" SetFocusOnError="true" ></asp:RequiredFieldValidator>

      <%--<textarea name="" id="" cols="55" rows="10" style=" border-radius: 4px;width:80%;"></textarea>--%>
    </div>
    <div class="form-group feed" style="margin-bottom:0px;">
        <label for="country">Country</label>
        <%--<select name="country" id="country" class="form-control" >--%>
        <asp:DropDownList ID="country" runat="server" CssClass="form-control">
            <asp:ListItem value="Select Country">Select Country</asp:ListItem>
	<asp:ListItem value="1">India</asp:ListItem>
	<asp:ListItem value="2">USA</asp:ListItem>
	<asp:ListItem value="3">UK/ Europe</asp:ListItem>
	<asp:ListItem value="4">Nepal</asp:ListItem>
	<asp:ListItem value="5">China</asp:ListItem>
	<asp:ListItem value="6">Australia</asp:ListItem>
	<asp:ListItem value="7">Russia</asp:ListItem>
	<asp:ListItem value="8">New Zealand</asp:ListItem>
	<asp:ListItem value="9">Singapore</asp:ListItem>
	<asp:ListItem value="11">Phillipines</asp:ListItem>
	<asp:ListItem value="12">Malaysia</asp:ListItem>
	<asp:ListItem value="13">Pakistan</asp:ListItem>
	<asp:ListItem value="14">UAE</asp:ListItem>
	<asp:ListItem value="15">Africa</asp:ListItem>
	<asp:ListItem value="16">South America</asp:ListItem>
	<asp:ListItem value="17">Bangladesh</asp:ListItem>
	<asp:ListItem value="18">Bahrain</asp:ListItem>
	<asp:ListItem value="19">Belgium</asp:ListItem>
	<asp:ListItem value="20">Egypt</asp:ListItem>
	<asp:ListItem value="21">France</asp:ListItem>
	<asp:ListItem value="22">Germany</asp:ListItem>
	<asp:ListItem value="24">Indonesia</asp:ListItem>
	<asp:ListItem value="25">Ireland</asp:ListItem>
	<asp:ListItem value="26">Japan</asp:ListItem>
	<asp:ListItem value="27">Jordan</asp:ListItem>
	<asp:ListItem value="28">Kuwait</asp:ListItem>
	<asp:ListItem value="29">Lebanon</asp:ListItem>
	<asp:ListItem value="30">Maldives</asp:ListItem>
	<asp:ListItem value="31">Mauritius</asp:ListItem>
	<asp:ListItem value="32">Mexico</asp:ListItem>
	<asp:ListItem value="33">Netherlands</asp:ListItem>
	<asp:ListItem value="34">Oman</asp:ListItem>
	<asp:ListItem value="35">Qatar</asp:ListItem>
	<asp:ListItem value="36">Saudi Arabia</asp:ListItem>
	<asp:ListItem value="37">South Africa</asp:ListItem>
	<asp:ListItem value="38">South Korea</asp:ListItem>
	<asp:ListItem value="39">Spain</asp:ListItem>
	<asp:ListItem value="40">Sri Lanka</asp:ListItem>
	<asp:ListItem value="41">Sweden</asp:ListItem>
	<asp:ListItem value="42">Switzerland</asp:ListItem>
	<asp:ListItem value="43">Thailand</asp:ListItem>
	<asp:ListItem value="44">Yemen</asp:ListItem>
	<asp:ListItem value="45">Hong Kong</asp:ListItem>
        </asp:DropDownList>
	
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select Country" ValidationGroup="feedback" 
                 ControlToValidate="Country" ErrorMessage="Please Select Country Name" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>

<%--</select>--%>

    </div>
                
    <div class="form-group feed" style="margin-bottom:0px;">
    <label for="phone">Comments :</label>

        <asp:TextBox ID="txtcomment" runat="server"  placeholder="Enter Description" CssClass="form-control" TabIndex="6" > </asp:TextBox>
      <%--<textarea name="" id="" cols="55" rows="10" style=" border-radius: 4px;width:80%;"></textarea>--%>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ValidationGroup="feedback"  ForeColor="Red"
                 ControlToValidate="txtcomment" ErrorMessage="Please enter Comments" SetFocusOnError="true"></asp:RequiredFieldValidator>
    </div>
    <div style="text-align: center">
        <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" CssClass="btn btn-success" Text="Submit" ValidationGroup="feedback" />
        <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" CssClass="btn btn-danger" Text="Reset" />

<%--    <input type="submit" class="btn btn-success" name="submit" value="Submit">
     <input type="submit" class="btn btn-danger" name="submit" value="Reset">--%>
  </div>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-lg-3">
             <uc1:Right runat="server" ID="Right" />
            </div>
        </div>
    </div>

</asp:Content>


