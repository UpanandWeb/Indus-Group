<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Salary-Statement.aspx.cs" Inherits="admin_Admin_Salary_Statement" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head1" runat="server">
    <title>: : Indus Group : : - Admin Control Panel - SAlary Statement</title>
    <style type="text/css">
body{
	 background:#202020;
	 font:bold 12px Arial, Helvetica, sans-serif;
	 margin:0;
	 padding:0;
	 min-width:960px;
	 color:#bbbbbb; 
}

a { 
	text-decoration:none; 
	color:#00c6ff;
}

h1 {
	font: 4em normal Arial, Helvetica, sans-serif;
	padding: 20px;	margin: 0;
	text-align:center;
}

h1 small{
	font: 0.2em normal  Arial, Helvetica, sans-serif;
	text-transform:uppercase; letter-spacing: 0.2em; line-height: 5em;
	display: block;
}

h2 {
    font-weight:700;
    color:#bbb;
    font-size:20px;
}

h2, p {
	margin-bottom:10px;
}

@font-face {
    font-family: 'BebasNeueRegular';
    src: url('BebasNeue-webfont.eot');
    src: url('BebasNeue-webfont.eot?#iefix') format('embedded-opentype'),
         url('BebasNeue-webfont.woff') format('woff'),
         url('BebasNeue-webfont.ttf') format('truetype'),
         url('BebasNeue-webfont.svg#BebasNeueRegular') format('svg');
    font-weight: normal;
    font-style: normal;

}

.container {width: 960px; margin: 0 auto; overflow: hidden;}

.clock {width:800px; margin:0 auto; padding:30px; border:1px solid #333; color:#fff; }

#Date { font-family:'BebasNeueRegular', Arial, Helvetica, sans-serif; font-size:36px; text-align:center; text-shadow:0 0 5px #00c6ff; }

ul { width:800px; margin:0 auto; padding:0px; list-style:none; text-align:center; }
ul li { display:inline; font-size:10em; text-align:center; font-family:'BebasNeueRegular', Arial, Helvetica, sans-serif; text-shadow:0 0 5px #00c6ff; }

#point { position:relative; -moz-animation:mymove 1s ease infinite; -webkit-animation:mymove 1s ease infinite; padding-left:10px; padding-right:10px; }

@-webkit-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}


@-moz-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px #00c6ff;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px #00c6ff; }	
}

</style>
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

<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Create two variable with the names of the months and days in an array
        var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

        // Create a newDate() object
        var newDate = new Date();
        // Extract the current date from Date object
        newDate.setDate(newDate.getDate());
        // Output the day, date, month and year    
        $('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

        setInterval(function () {
            // Create a newDate() object and extract the seconds of the current time on the visitor's
            var seconds = new Date().getSeconds();
            // Add a leading zero to seconds value
            $("#sec").html((seconds < 10 ? "0" : "") + seconds);
        }, 1000);

        setInterval(function () {
            // Create a newDate() object and extract the minutes of the current time on the visitor's
            var minutes = new Date().getMinutes();
            // Add a leading zero to the minutes value
            $("#min").html((minutes < 10 ? "0" : "") + minutes);
        }, 1000);

        setInterval(function () {
            // Create a newDate() object and extract the hours of the current time on the visitor's
            var hours = new Date().getHours();
            // Add a leading zero to the hours value
            $("#hours").html((hours < 10 ? "0" : "") + hours);
        }, 1000);

    });
</script>
<link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/CSS3-digital-clock/index.html" />
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script>
    <script language="javascript" type="text/javascript">
        function alertedit() {
            alert("Employee Details has been edited Successfully");
        }
        function alertdelete() {
            alert("Employee Details has been deleted Successfully");
        }

        function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete ' + username + ' record Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

    <style type="text/css">
        .style24 {
            height: 15px;
        }
        .AlgRgh
{
  text-align:right;
  /*font-family:Verdana, Arial, Helvetica, sans-serif;*/
}
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }

        .updateProgress {
            border-width: 1px;
            border-style: solid;
            background-color: White;
            position: absolute;
            width: 180px;
            height: 65px;
        }
    </style>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1000px;
            height: 600px;
            background-color: #333;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 350px;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 200px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }

        .style24 {
            color: #7a7a7b;
            font-size: 12px;
            font-weight: bold;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            text-decoration: none;
            height: 29px;
        }

        #empdata td {
            border: 0.1px solid #CCCCCC;
        }

        #empdata th {
            border-right: 0.1px solid #CCCCCC;
        }
    </style>
    <link rel="stylesheet" href="Styles/stylesheet.css" />

<style type="text/css">
.hrow {
font-weight:bold;
color: #C1E97C;
}
.hrow td{
padding-top: 20px;
width: 140px;
}
</style>
</head>

<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="tt" runat="server" ></cc1:ToolkitScriptManager>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tr width="100%">
                <td valign="top" width='100%' class="lblog">
                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                </td>
            </tr>


            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center">

                    <table width="100%" align="center">
                        <tr>
                            <td align="center"  width="100%">
                                <font color='#003399' size='6pt'><b>Employee Salary Statement</b></font>
                            </td>
                        </tr>
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>

                         <tr>
                            <td height="15px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" width="100%" >
                                <table align="center" width="80%">
                                    <tr>
                                         <td width="30%" align="left">
                                            <asp:DropDownList ID="ddemp" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="220px" AutoPostBack="true" 
                                                OnSelectedIndexChanged="ddemp_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      
                                            <asp:DropDownList ID="ddyear" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="100px" >
                                                <asp:ListItem>Year</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                                <asp:ListItem>2021</asp:ListItem>
                                                <asp:ListItem>2022</asp:ListItem>
                                                <asp:ListItem>2023</asp:ListItem>
                                                <asp:ListItem>2024</asp:ListItem>
                                                <asp:ListItem>2025</asp:ListItem>
                                                <asp:ListItem>2026</asp:ListItem> 
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                              
                  <asp:DropDownList ID="ddmonth" runat="server" Font-Bold="true" Font-Size="16px" Height="30px" Width="90px"  OnSelectedIndexChanged="ddmonth_SelectedIndexChanged" AutoPostBack="true">
                               <asp:ListItem>Month</asp:ListItem>
                               <asp:ListItem Value="1">January</asp:ListItem>
                               <asp:ListItem Value="2">February</asp:ListItem>
                               <asp:ListItem Value="3">March</asp:ListItem>
                               <asp:ListItem Value="4">April</asp:ListItem>
                               <asp:ListItem Value="5">May</asp:ListItem>
                               <asp:ListItem Value="6">June</asp:ListItem>
                               <asp:ListItem Value="7">July</asp:ListItem>
                               <asp:ListItem Value="8">August</asp:ListItem>
                               <asp:ListItem Value="9">September</asp:ListItem>
                               <asp:ListItem Value="10">October</asp:ListItem>
                               <asp:ListItem Value="11">November</asp:ListItem>
                               <asp:ListItem Value="12">December</asp:ListItem>
                  </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" <%--style="overflow:scroll;"--%> >
                                <asp:GridView ID="empdata" runat="server" Width="94%"  AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False"
                                DataKeyNames="eid"     Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" BackColor="White" AllowPaging="True" PagerStyle-Mode="NumericPages" PageSize="30"
                                    PagerStyle-BackColor="White" OnPageIndexChanging="empdata_PageIndexChanging"  >
                                    <Columns>
                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                               <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)"  />
                                                <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("eID") %>'  />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Serial No" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%> 
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Employee Name" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempname" ForeColor="Gray" Text='<%# Bind("ename") %>' runat="server" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Month" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldate" ForeColor="Gray" Text='<%# Bind("smonth") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Year" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblin1" ForeColor="Gray" Text='<%# Bind("syear") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Days" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout1" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Workdays" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout133" ForeColor="Gray" Text='<%# Bind("wdays") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Leaves" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblin11" ForeColor="Gray" Text='<%# Bind("ldays") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Worked Days" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblwork" ForeColor="Gray" Text='<%# Bind("tdays") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="LOP Days" HeaderStyle-Width="3%" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblworkq" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                         <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="LOP Amount" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout12" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="PT" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout123" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="TDS" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout122" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Other Amount" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout121" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Gross Salary" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblout11" ForeColor="Gray" Text='<%# Bind("salary") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Total Payable"  HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal" ForeColor="Gray" Text='<%# Bind("gainsal") %>' runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Remarks" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalww1" ForeColor="Gray" Text="" runat="server" CssClass="data"  ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />

                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Bank Name" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal1" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Account Number" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal2" ForeColor="Gray" Text="" runat="server" CssClass="data"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Ifsc Code" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal3" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Aadhar Number" HeaderStyle-Width="8%" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal4" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                          <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Pan Number" HeaderStyle-Width="8%" ItemStyle-Width="8%" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotal5" ForeColor="Gray" Text="" runat="server" CssClass="data" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                 
                                       
                                     <%--   <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="3%" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="3%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnedit1" Width='20' Height='20' runat="server" ImageUrl="images/edit1.png" OnClick="lnkeditrecord" />
                                            </ItemTemplate>
                                            <ItemStyle Width="3%"></ItemStyle>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" ItemStyle-Width="5%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="5%" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtndel" Width='20' Height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
                                                <br />
                                            </ItemTemplate>
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:TemplateField>

                                    </Columns>
                                    <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                                    <RowStyle CssClass="datagrid-2" Font-Size="9pt" HorizontalAlign="Center"
                                        Font-Strikeout="False" Font-Underline="False" />
                                    <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right"
                                        Font-Bold="True" Font-Italic="True" Font-Size="8pt"
                                        Font-Underline="False" Height="20px" Wrap="True" />
                                    <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                                    <HeaderStyle BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue"
                                        ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
                                </asp:GridView>

                            </td>
                        </tr>
                        <tr>
                            <td height="10px">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"></td>
            </tr>
            <tr>
                <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable">&nbsp;</td>
            </tr>
        </table>
          <script type="text/javascript">
              function changeColor(CheckBoxObj) {
                  if (CheckBoxObj.checked == true) {

                      CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
                  }
                  else {
                      CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
                  }
              }
</script>
    </form>
</body>
</html>
