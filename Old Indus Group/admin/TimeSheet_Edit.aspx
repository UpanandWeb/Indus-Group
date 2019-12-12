<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeSheet_Edit.aspx.cs" Inherits="TimeSheet_Edit" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Indus Group - Admin Control Panel</title>
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
    
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("TimeSheet Details has been saved Successfully");
}
function alertdelete()
{
alert("TimeSheet Details has been deleted Successfully");
}

function alertsubmit()
{
alert("TimeSheet Details has been saved Successfully");
}


    </script>
    
 <script type="text/javascript">
 function st1()
 {
 
 var x1 =parseInt(regForm.t1.value);
 if (isNaN(x1))
     x1 =0;
 var x2 =parseInt(regForm.t2.value);
 if (isNaN(x2))
     x2 =0;
 var x3 =parseInt(regForm.t3.value);
 if (isNaN(x3))
     x3 =0;

 var x4 =parseInt(regForm.t4.value);
 if (isNaN(x4))
     x4 =0;

 var x5 =parseInt(regForm.t5.value);
 if (isNaN(x5))
     x5 =0;

 var x6 =parseInt(regForm.t6.value);
 if (isNaN(x6))
     x6 =0;
 var x7 =parseInt(regForm.t7.value);
 if (isNaN(x7))
     x7 =0;
 var x8 =parseInt(regForm.t8.value);
 if (isNaN(x8))
     x8 =0;
 var x9 =parseInt(regForm.t9.value);
 if (isNaN(x9))
     x9 =0;
 var x10 =parseInt(regForm.t10.value);
 if (isNaN(x10))
     x10 =0;
      var x11 =parseInt(regForm.t11.value);
 if (isNaN(x11))
     x11 =0;
 var x12 =parseInt(regForm.t12.value);
 if (isNaN(x12))
     x12 =0;
 var x13 =parseInt(regForm.t13.value);
 if (isNaN(x13))
     x13 =0;
 var x14 =parseInt(regForm.t14.value);
 if (isNaN(x14))
     x14 =0;
 var x15 =parseInt(regForm.t15.value);
 if (isNaN(x15))
     x15 =0;
 var x16 =parseInt(regForm.t16.value);
 if (isNaN(x16))
     x16 =0;
 var x17 =parseInt(regForm.t17.value);
 if (isNaN(x17))
     x17 =0;
 var x18 =parseInt(regForm.t18.value);
 if (isNaN(x18))
     x18 =0;
 var x19 =parseInt(regForm.t19.value);
 if (isNaN(x19))
     x19 =0;
 var x20 =parseInt(regForm.t20.value);
 if (isNaN(x20))
     x20 =0;

 var x21 =parseInt(regForm.t21.value);
 if (isNaN(x21))
     x21 =0;
 var x22 =parseInt(regForm.t22.value);
 if (isNaN(x22))
     x22 =0;

 var x23 =parseInt(regForm.t23.value);
 if (isNaN(x23))
     x23 =0;

 var x24 =parseInt(regForm.t24.value);
 if (isNaN(x24))
     x24 =0;

 var x25 =parseInt(regForm.t25.value);
 if (isNaN(x25))
     x25 =0;
 var x26 =parseInt(regForm.t26.value);
  if (isNaN(x26))
     x26 =0;
 var x27 =parseInt(regForm.t27.value);
 if (isNaN(x27))
     x27 =0;

 var x28 =parseInt(regForm.t28.value);
 if (isNaN(x28))
     x28 =0;

 var x29 =parseInt(regForm.t29.value);
 if (isNaN(x29))
     x29 =0;

 var x30 =parseInt(regForm.t30.value);
 if (isNaN(x30))
     x30 =0;
var x31 =parseInt(regForm.t31.value);
 if (isNaN(x31))
     x31 =0;

   var y = x1 + x2 + x3 + x4 + x5 + x6 +x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x27 + x28 + x29 + x30 + x31;

//    alert(y);
    document.regForm.whrs.value = y;
 }

 

 
 function st2()
 {
  var x1 =parseInt(regForm.o1.value);
 if (isNaN(x1))
     x1 =0;
 var x2 =parseInt(regForm.o2.value);
 if (isNaN(x2))
     x2 =0;
 var x3 =parseInt(regForm.o3.value);
 if (isNaN(x3))
     x3 =0;

 var x4 =parseInt(regForm.o4.value);
 if (isNaN(x4))
     x4 =0;

 var x5 =parseInt(regForm.o5.value);
 if (isNaN(x5))
     x5 =0;

 var x6 =parseInt(regForm.o6.value);
 if (isNaN(x6))
     x6 =0;
 var x7 =parseInt(regForm.o7.value);
 if (isNaN(x7))
     x7 =0;
 var x8 =parseInt(regForm.o8.value);
 if (isNaN(x8))
     x8 =0;
 var x9 =parseInt(regForm.o9.value);
 if (isNaN(x9))
     x9 =0;
 var x10 =parseInt(regForm.o10.value);
 if (isNaN(x10))
     x10 =0;
      var x11 =parseInt(regForm.o11.value);
 if (isNaN(x11))
     x11 =0;
 var x12 =parseInt(regForm.o12.value);
 if (isNaN(x12))
     x12 =0;
 var x13 =parseInt(regForm.o13.value);
 if (isNaN(x13))
     x13 =0;
 var x14 =parseInt(regForm.o14.value);
 if (isNaN(x14))
     x14 =0;
 var x15 =parseInt(regForm.o15.value);
 if (isNaN(x15))
     x15 =0;
 var x16 =parseInt(regForm.o16.value);
 if (isNaN(x16))
     x16 =0;
 var x17 =parseInt(regForm.o17.value);
 if (isNaN(x17))
     x17 =0;
 var x18 =parseInt(regForm.o18.value);
 if (isNaN(x18))
     x18 =0;
 var x19 =parseInt(regForm.o19.value);
 if (isNaN(x19))
     x19 =0;
 var x20 =parseInt(regForm.o20.value);
 if (isNaN(x20))
     x20 =0;

 var x21 =parseInt(regForm.o21.value);
 if (isNaN(x21))
     x21 =0;
 var x22 =parseInt(regForm.o22.value);
 if (isNaN(x22))
     x22 =0;

 var x23 =parseInt(regForm.o23.value);
 if (isNaN(x23))
     x23 =0;

 var x24 =parseInt(regForm.o24.value);
 if (isNaN(x24))
     x24 =0;

 var x25 =parseInt(regForm.o25.value);
 if (isNaN(x25))
     x25 =0;
 var x26 =parseInt(regForm.o26.value);
  if (isNaN(x26))
     x26 =0;
 var x27 =parseInt(regForm.o27.value);
 if (isNaN(x27))
     x27 =0;

 var x28 =parseInt(regForm.o28.value);
 if (isNaN(x28))
     x28 =0;

 var x29 =parseInt(regForm.o29.value);
 if (isNaN(x29))
     x29 =0;

 var x30 =parseInt(regForm.o30.value);
 if (isNaN(x30))
     x30 =0;
var x31 =parseInt(regForm.o31.value);
 if (isNaN(x31))
     x31 =0;

   var y = x1 + x2 + x3 + x4 + x5 + x6 +x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x27 + x28 + x29 + x30 + x31;

//    alert(y);
    document.regForm.otime.value = y;
 }

function st3(fld)
 {
 
 var x =regForm.t3.value;
 //var x =
 var y =0;
 if(parseInt(x) != 0)
 {
    y =document.regForm.whrs.value;
    y = y + x;
    alert(y);
    document.regForm.whrs.value = y;
 }
    
 
 
 }
 
 </script>   
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
    <style type="text/css">
        .style24
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 102px;
        }
        .style26
        {
            color: #00277a;
            font-size: 11px;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            width: 601px;
        }
        .style27
        {
            height: 22px;
        }
    </style>
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="regForm" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
       
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
      
       <table style="width: 702px">
       <tr><td align="right" valign="bottom" ><a runat="server" id="navi">Back</a></td></tr>
                <tr>
                    <td class="lable" align="left" valign="top">
                        <table id="tb1" allign="center" runat="server" width="702">
                            <tr height="20">
                                <td colspan="3" align="center" style="font-weight: bold; font-size: 15pt; color:#00277a">
                                    Edit
                                    Time Sheet                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Emp ID</td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:TextBox ReadOnly="true" ID="empid" runat="server" CssClass="lable" Width="94px" 
                                        BorderWidth="1"></asp:TextBox>
                                </td>
                                
                                
                             </tr>
                            
                            <tr>
                                <td class="lable">
                                    Consultant Name
                                    
                                </td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:TextBox ID="txtcname" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="lable">
                                    Client Name
                                </td>
                                <td>
                                    : </td>
                                <td class="style26">
                                    <asp:TextBox ID="clname" runat="server" Width="209px" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            
                              <tr>
                                <td class="lable">
                                    Time Period</td>
                                <td>
                                    : </td>
                                <td class="style26">
                                <asp:DropDownList ID="txttime" runat="server" CssClass="lable" Width="209px" 
                                        AutoPostBack="true" onselectedindexchanged="txttime_SelectedIndexChanged">
                                
                                <asp:ListItem Text="Select Time Period" Selected="True">Select Time Period</asp:ListItem>
                                <asp:ListItem Text="January">January</asp:ListItem>
                                <asp:ListItem Text="February">February</asp:ListItem>
                                <asp:ListItem Text="March">March</asp:ListItem>
                                <asp:ListItem Text="April">April</asp:ListItem>
                                <asp:ListItem Text="May">May</asp:ListItem>
                                <asp:ListItem Text="June">June</asp:ListItem>
                                <asp:ListItem Text="July">July</asp:ListItem>
                                <asp:ListItem Text="August">August</asp:ListItem>
                                <asp:ListItem Text="September">September</asp:ListItem>
                                <asp:ListItem Text="October">October</asp:ListItem>
                                <asp:ListItem Text="November">November</asp:ListItem>
                                <asp:ListItem Text="December">December</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttime" InitialValue="Select Time Period"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                                                
                                        </td>
                            </tr>
                            
                              <tr>
                                <td class="lable">
                                    From Date
                                </td>
                                <td>
                                    :</td>
                                <td class="style26">
                                
                                 <asp:TextBox ID="fromdate" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="172px" Height="19px"></asp:TextBox>
              &nbsp; (Ex:MM/DD/YYYY)
          <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="fromdate">
          </cc1:CalendarExtender>
         
                                       
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fromdate"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            
                            
                              <tr>
                                <td class="lable">
                                    To Date
                                </td>
                                <td>
                                    :</td>
                                <td class="style26">
                                
                                 <asp:TextBox ID="todate" runat="server" MaxLength="50" TextMode="SingleLine" CssClass="lable4" Width="172px" Height="19px"></asp:TextBox>
              &nbsp; (Ex:MM/DD/YYYY)
          <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="todate">
          </cc1:CalendarExtender>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="todate"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                         
                        <%--</table>--%>
                       
                        
                        <%--<table id="tb3" runat="server">--%>
                        
                            <tr>
                                <td class="lable" colspan="3">
                                    <table>
                                                             
                        
                        <tr>
                        <td align="center" class="lable">
                        Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                        </td>
                        <td class="lable" align="center">
                        1
                        </td>
                        
                        <td class="lable" align="center">
                        2
                        </td>
                        <td class="lable" align="center">
                        3
                        </td>
                        <td class="lable" align="center">
                        4
                        </td>
                        <td class="lable" align="center">
                        5
                        </td>
                        
                        <td class="lable" align="center">
                        6
                        </td>

                        <td class="lable" align="center">
                        7
                        </td>

                        <td class="lable" align="center">
                        8
                        </td>

                        <td class="lable" align="center">
                        9
                        </td>

                        <td class="lable" align="center">
                        10
                        </td>
                       <td class="lable" align="center">
                        11
                        </td>
                        <td class="lable" align="center">
                        12
                        </td>

                        <td class="lable" align="center">
                        13
                        </td>
                        <td class="lable" align="center">
                        14
                        </td>
                        <td class="lable" align="center">
                        15
                        </td>

<td class="lable">
                                    &nbsp;
                                    </td>
                        
                        
                        </tr>
                        
                        
                                    <tr>
                                    <td align="center" class="lable">
                                    Reg.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </td>
                                    <td class="lable">
                                    <asp:TextBox ID="t1" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t2" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t3" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t4" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t5" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t6" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t7" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t8" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t9" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t10" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t11" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t12" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t13" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t14" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t15" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    &nbsp;
                                    </td>
                                    </tr>


                                    <tr>
                                    <td align="center" class="lable">
                                    OT.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </td>
                                    <td class="lable">
                                    <asp:TextBox ID="o1" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o2" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o3" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o4" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o5" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o6" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o7" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o8" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o9" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o10" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o11" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o12" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o13" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o14" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o15" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    <td class="lable">
                                    &nbsp;
                                    </td>
                          
                                    
                                    </tr>

                                    <tr height="10px">
                                    <td colspan="16">&nbsp; </td>
                                    </tr>
                                    
                                    
                                     <tr>
                                     <td align="center" class="lable">
                                    Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </td>
                        <td class="lable" align="center">
                        16
                        </td>
                        
                        <td class="lable" align="center">
                        17
                        </td>
                        <td class="lable" align="center">
                        18
                        </td>
                        <td class="lable" align="center">
                        19
                        </td>
                        <td class="lable" align="center">
                        20
                        </td>
                        
                        <td class="lable" align="center">
                        21
                        </td>

                        <td class="lable" align="center">
                        22
                        </td>

                        <td class="lable" align="center">
                        23
                        </td>

                        <td class="lable" align="center">
                        24
                        </td>

                        <td class="lable" align="center">
                        25
                        </td>
                       <td class="lable" align="center">
                        26
                        </td>
                        <td class="lable" align="center">
                        27
                        </td>

                        <td class="lable" align="center">
                        28
                        </td>
                        <td class="lable" align="center">
                        29
                        </td>
                        <td class="lable" align="center">
                        30
                        </td>
                        
                        <td class="lable" align="center">
                        31
                        </td>
                        
                        </tr>
                        
                                    <tr>
                                    <td align="center" class="lable">
                                    Reg.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                                    </td>
                                    <td class="lable">
                                    <asp:TextBox ID="t16" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t17" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t18" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t19" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t20" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t21" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t22" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t23" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t24" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t25" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t26" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t27" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t28" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t29" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t30" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="t31" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    </tr>
                                    
                                    
                                    
                                    
                                    <tr>
                                    <td align="center" class="lable">
                                    OT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        :</td>
                                    <td class="lable">
                                    <asp:TextBox ID="o16" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o17" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o18" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o19" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o20" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o21" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o22" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o23" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o24" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o25" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o26" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o27" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o28" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o29" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>
                                    
                                    <td class="lable">
                                    <asp:TextBox ID="o30" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>

                                    <td class="lable">
                                    <asp:TextBox ID="o31" runat="server" Width="30" CssClass="lable" BorderWidth="1"></asp:TextBox>
                                    </td>

                                    
                                    </tr>
                                    
                                                                         
                                    </table>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                   
                                    Total
                                    Working Hours
                                </td>
                                <td>
                                    : </td>
                                <td class="lable">
                                    <asp:TextBox  ID="whrs" runat="server" CssClass="lable" BorderWidth="1" 
                                        Width="209px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="whrs" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <input type="button" id="btn" value="Total Working Hrs"  style="height:18px;  width: 100px;" class="lable" onclick="st1();" />
                                  
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                    Total
                                    Over Time
                                </td>
                                <td>
                                    : </td>
                                <td class="lable">
                                    <asp:TextBox ID="otime" runat="server" Width="209px" CssClass="lable" BorderWidth="1" Text="0"></asp:TextBox>&nbsp;&nbsp;
                                <input type="button" id="btn2" value="Total Overtime Hrs"  
                                        style="height:18px; width: 100px;" class="lable" onclick="st2();" />    
                                </td>
                            </tr>
                            <tr>
                                <td class="style24">
                                    Remarks</td>
                               <td>
                                    : </td>
                                <td class="lable">
                                    <asp:TextBox ID="txtrem" runat="server" TextMode="MultiLine" BorderWidth="1" 
                                        CssClass="lable" Height="102px" Width="296px"></asp:TextBox>
                                    </td>
                                        </tr>
                                    
                                    <tr>
                                    <td colspan="3">&nbsp; </td>
                                    </tr>    
                                    
                                    <tr>
                                    <td colspan="3" class="lable" align="center" style="font-weight: bold; font-size: 15pt">                                    
                                    Instructions
                                    </td>
                                    </tr>
                                        
                                         <tr>
                              <%-- <td class="style25"></td>
                               --%>
                                <td class="lable" colspan="3">
                                    Please enter regular hours in Reg. cell and over time hours in OT cell. All days 
                                    in the specified time period must be filled.&nbsp; Use Codes as follows:&nbsp; V = 
                                    Vacation, H = Holiday Monthly: 1 - 30/31 days, Mon-Sun.&nbsp; Please submit the 
                                    time sheet before 5th of every month. Otherwise we will not be able to run the 
                                    payroll by 15th of every month for those who have not submitted the IGI Internal 
                                    payroll time sheet. Thanks for your co-operation.</td>
                                   
                                        </tr>
                               
                                    <tr>
                                    <td colspan="3" class="style27">&nbsp; </td>
                                    </tr>        
                                        
                               <tr>
                               <%--<td class="style25"></td>--%>
                               
                              <td class="lable" colspan="3" align="center">
                                    Indus Group Inc. 1033 Sterling Road, Ste. 204, Herndon - VA - 20170, USA.<br />
                                                                        www.1indus.com email: <a href="mailto:accounts@1indus.com">accounts@1indus.com</a>, Phone:&nbsp; 703-291-8299 / Fax: 703-649-6458
                                    </td>
                                   
                                        </tr>
                                        
                                    <tr>
                                    <td colspan="3">&nbsp; </td>
                                    </tr>        
                                        
                                        
                                        
                            <tr>
                            <td class="lable" colspan="3" align="center">
                                <asp:Button ID="btnsave" runat="server" Text="Submit" onclick="btnsave_Click" />
                                <%--<asp:Button ID="btnsave" runat="server" Text="Submit" />--%>

                            </td>
                            </tr>
                            
                           
                            <tr>
                                        
                                <td colspan="3">
                                                    
    
                                     </td>
                               
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
      
      
      
      </td>
    </tr>
    
    <tr>
    <td id="cntdata" runat="server">
    
    </td>
    </tr>
  
    </table>
            
    </form>
</body>
</html>