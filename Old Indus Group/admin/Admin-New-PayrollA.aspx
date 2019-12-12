<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-New-PayrollA.aspx.cs" Inherits="Admin_New_PayrollA" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>::Admin-Payroll::</title>
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

<%--<script type="text/javascript">
    function Validate() {
        var ddlFruits = document.getElementById("<%=ddlWeekRanges.ClientID %>");
        var tbbox = document.getElementById("<%=txtNoOfHours.ClientID %>");
        if (ddlFruits.value == "" || ddlFruits.value == "0") {
            //If the "Please Select" option is selected display error.
            alert("Please select Week Range!");
            return false;
        }
         
        
        return true;
    }
</script>--%>

     <script type="text/javascript"  lang="js">



         $(function () {

             $("#<%=txtBonus.ClientID %>").keypress(function () {

                 var sum1 = 0;
                 var num1 = document.getElementById("<%=txtSalary.ClientID%>").value;
                 var num2 = document.getElementById("<%=txtBonus.ClientID%>").value;

                 var num3 = document.getElementById("<%=txtPayAdvance.ClientID%>").value;

                 //var num3 = document.getElementById("<%=txtDEDBPayNewRate.ClientID%>").value;
                 sum1 = parseFloat(num1) + parseFloat(num2) + parseFloat(num3);
                 //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
                 document.getElementById("<%=txtGrossAfterDeduction.ClientID%>").value = sum1;

             });

         });


    </script>
   <%-- <script type="text/javascript">
        function Validate1() {
            var ddlFruits = document.getElementById("<%=ddlWeekRanges.ClientID %>");
        var tbbox = document.getElementById("<%=txtNoOfHours.ClientID %>");
            if (tbbox.value == "" ) {
            //If the "Please Select" option is selected display error.
            alert("Please Add Hours!");
            return false;
        }


        return true;
    }
</script>--%>
    

    <script type="text/javascript">
        debugger
        function CalcTotalBillingGross() {

            var totHrs = document.getElementById("<%=txtPayPeriod.ClientID%>").value;
            var totOthrs = document.getElementById("<%=txtOTHrs.ClientID%>").value;

            var sum = 0;
            sum = parseFloat(totHrs) + parseFloat(totOthrs);
            document.getElementById("<%=txtBillingGross.ClientID%>").value = sum;

        }
        function CalcTotalBillingregGross() {

            //var totHrs = document.getElementById("<%=lbactutot.ClientID%>").value;


                //  var sum = 0;
                //  if (!isNaN(totHrs) && !isNaN(actRate)) {
                //     sum = parseFloat(actRate) * parseFloat(totHrs);
                //   document.getElementById("<%=txtPayPeriod.ClientID%>").value = sum;


            }
        function CalcTotalBillingotGross() {

            var tototHrs = document.getElementById("<%=lblottot.ClientID%>").value;


            var sum = 0;
            if (!isNaN(totHrs) && !isNaN(otRate)) {
                sum = parseFloat(otRate) * parseFloat(tototHrs);
                document.getElementById("<%=txtOTHrs.ClientID%>").value = sum;

            }
        }
        // debugger;
        // var totGross = document.getElementById("<%=txtBillingGross.ClientID%>").value;

        function MonthlySalAsperLCA() {
            var summonth = 0;
            summonth = Math.round((document.getElementById("<%=txtLCASalary.ClientID%>").value) / 12);
                        document.getElementById("<%=txtSalary.ClientID%>").value = summonth;
                        // document.getElementById("<%=txtMonthSalary.ClientID%>").value =summonth;
                        //=Math.round( (document.getElementById("<%=txtLCASalary.ClientID%>").value) / 12);

                        //document.getElementById("<%=txtSalary.ClientID%>").value = document.getElementById("<%=txtMonthSalary.ClientID%>").value
                    }

        function CalcGrossAfterDeduction() {
            var sum1 = 0;
            var num1 = document.getElementById("<%=txtSalary.ClientID%>").value;
            var num2 = document.getElementById("<%=txtBonus.ClientID%>").value;

            var num3 = document.getElementById("<%=txtPayAdvance.ClientID%>").value;

            //var num3 = document.getElementById("<%=txtDEDBPayNewRate.ClientID%>").value;
            sum1 = parseFloat(num1) + parseFloat(num2) + parseFloat(num3);
            //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
            document.getElementById("<%=txtGrossAfterDeduction.ClientID%>").value = sum1;
            // document.getElementById("<%=txtPayAdvance.ClientID%>").value=sum1

        }
        function Calcbonus() {
            var sum2 = 0;
            var num1 = document.getElementById("<%=txtEmployeeGross.ClientID%>").value;
            var num2 = document.getElementById("<%=txtSalary.ClientID%>").value;

            var num3 = document.getElementById("<%=txtDEDBPayNewRate.ClientID%>").value;
            sum2 = parseFloat(num1) - parseFloat(num2) - parseFloat(num3);
            //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
            document.getElementById("<%=txtBonus.ClientID%>").value = sum2;
        }

        // function calbalance() {
        //   var sum2 = 0;
        //  var num1 = document.getElementById("<%=txtEmployeeGross.ClientID%>").value;
        //  var num2 = document.getElementById("<%=txtSalary.ClientID%>").value;

        //  var num3 = document.getElementById("<%=txtBonus.ClientID%>").value;
        //  var num4 = document.getElementById("<%=txtPayAdvance.ClientID%>").value;
        //  sum1 = parseFloat(num1) - parseFloat(num2) - parseFloat(num3) - parseFloat(num4);
        //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
        // document.getElementById("<%=txtBalance.ClientID%>").value = sum1;
        // }

        function calytd() {
            var sum4 = 0;

            var num1 = document.getElementById("<%=txtSalary.ClientID%>").value;

            var num2 = document.getElementById("<%=txtBonus.ClientID%>").value;

            sum4 = parseFloat(num1) + parseFloat(num2)
            //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
            document.getElementById("<%=TextBox6.ClientID%>").value = sum4;
        }


    </script>

   <%-- <script>
        function calculatebalance() {
            var sum5 = 0;
            var num1 = document.getElementById("<%=txtEmployeeGross.ClientID%>").value;

            var num2 = document.getElementById("<%=txtGrossAfterDeduction.ClientID%>").value;
              if (!isNaN(num1) && !isNaN(num2)) {
                  sum5 = parseFloat(num1) - parseFloat(num2);
               document.getElementById("<%=txtBalance.ClientID%>").value = sum5;
            }


        }
    </script>--%>
   
      <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .Grid td
        {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .Grid th
        {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid td
        {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid th
        {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    
 
</head>
<body topmargin="0" leftmargin="0" bgcolor="#F6FDFD" >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>

         <center>


        <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
      <tr><td height="30px"></td></tr>
        <tr>
     <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
     <table width='100%' border='0' cellspacing='0' cellpadding='0'>     
     <tr> <td align='center' bgcolor='white' width='70%'><font color='#003399' size='6pt'><b><u>Payroll Data</u></b></font> </td>
        </tr>
       </table>
      </td>
    </tr>
     <tr><td height="20px"></td></tr>
    <tr><td height="30px">
    <table border="0" width="100%">

 <%--        <tr><td align="center"  colspan="4">
    
       <asp:ImageButton ID="imgus" runat="server"  ImageUrl="~/admin/images/02.png" height="30px" OnClick="imgus_Click" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:ImageButton ID="imgind" runat="server"  ImageUrl="~/admin/images/01.png" height="20px" OnClick="imgind_Click" />
     </td>
     </tr>--%>
     <tr><td height="20px"></td></tr>

       
    </table>
    </td></tr>
  
     
 


  

          


     <tr id="tr4" runat="server">        
      <td id="td7" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%" align="center">
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%"" style="border:2px solid black;padding:10px;">
            <div style="text-align: right;">
            <asp:LinkButton ID="hlExport" Text="Export Payroll Spreadsheet" runat="server" OnClick="lnkdownload_Click" Font-Bold="true" Font-Size="20px"></asp:LinkButton>
        </div>
        <br />
          <div>
            QB Payroll Month
            <asp:DropDownList ID="ddlPayMonth" runat="server"  Height="16px" Width="178px" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlPayMonth_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="January"></asp:ListItem>
                        <asp:ListItem Value="2" Text="February"></asp:ListItem>
                        <asp:ListItem Value="3" Text="March"></asp:ListItem>
                        <asp:ListItem Value="4" Text="April"></asp:ListItem>
                        <asp:ListItem Value="5" Text="May"></asp:ListItem>
                        <asp:ListItem Value="6" Text="June"></asp:ListItem>
                        <asp:ListItem Value="7" Text="July"></asp:ListItem>
                        <asp:ListItem Value="8" Text="August"></asp:ListItem>
                        <asp:ListItem Value="9" Text="September"></asp:ListItem>
                        <asp:ListItem Value="10" Text="October"></asp:ListItem>
                        <asp:ListItem Value="11" Text="November"></asp:ListItem>
                        <asp:ListItem Value="12" Text="December"></asp:ListItem>

                    </asp:DropDownList>
               &nbsp;
            QB Payroll Year &nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlPayrollYr" runat="server" TabIndex="2" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlPayMonth_SelectedIndexChanged" >
                <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="2018"></asp:ListItem>
                <asp:ListItem Value="2" Text="2019"></asp:ListItem>
                <asp:ListItem Value="3" Text="2020"></asp:ListItem>
                <asp:ListItem Value="4" Text="2021"></asp:ListItem>
                <asp:ListItem Value="5" Text="2022"></asp:ListItem>
                <asp:ListItem Value="6" Text="2023"></asp:ListItem>
                <asp:ListItem Value="7" Text="2024"></asp:ListItem>
                <asp:ListItem Value="8" Text="2025"></asp:ListItem>
                <asp:ListItem Value="9" Text="2026"></asp:ListItem>
                <asp:ListItem Value="10" Text="2027"></asp:ListItem>
            </asp:DropDownList>
        </div>
          <br />
        <div>
            <asp:Label ID="lblEmpId" runat="server" Text="Employee ID"></asp:Label>
            &nbsp;<strong>:</strong>
           
            <asp:DropDownList ID="ddlempid" runat="server" Width="200px" TabIndex="3" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlempid_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="">Select</asp:ListItem>
               
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="reddl" runat="server" ControlToValidate="ddlempid" ErrorMessage="Select Employee" InitialValue="0" ForeColor="Red" ValidationGroup="submit"></asp:RequiredFieldValidator>
                   
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEmpName" runat="server" Text="Employee First Name"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtEmpName" runat="server" Width="190px" TabIndex="4" ReadOnly="true" BackColor="#D3D3D3" ></asp:TextBox>

              &nbsp;&nbsp;&nbsp;&nbsp
              <asp:Label ID="Label1" runat="server" Text="Employee Last Name"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="TextBox1" runat="server" Width="190px" TabIndex="5" ReadOnly="true" BackColor="#D3D3D3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Month Type"></asp:Label>&nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlMonthType" runat="server">
                <asp:ListItem Value="0" >Select</asp:ListItem>
                <asp:ListItem Value="1" Text="Every Month"></asp:ListItem>
                <asp:ListItem Value="2" Text="Every Month#2"></asp:ListItem>
                <asp:ListItem Value="3" Text="Every Month#3"></asp:ListItem>
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="reqmonthtype" runat="server" ControlToValidate="ddlMonthType" InitialValue="0" ErrorMessage="Select Month Type" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <br />
     <asp:Panel ID="pn1" runat="server">

            <div id="lc" runat="server">
            <asp:Label ID="Label4" runat="server" Text="LCA Salary"></asp:Label>
            &nbsp;<strong>:</strong><strong>$</strong>
            <asp:TextBox ID="txtLCASalary" runat="server" TabIndex="6" onkeyup="MonthlySalAsperLCA()" Width="180px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqlcasal" runat="server" ControlToValidate="txtLCASalary" ErrorMessage="Add LCA Salary" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="Regex1" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$|((\d+)((\,\d{1,2})?))$"
ErrorMessage="Enter Decimal number" ValidationGroup="submit" ForeColor="Red"
ControlToValidate="txtLCASalary" />

            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="LCA Salary Previous"></asp:Label>
            &nbsp;<strong>:</strong><strong>$</strong>
            <asp:TextBox ID="txtMonthSalary" runat="server" Width="180px"></asp:TextBox>

             <%--   <asp:RequiredFieldValidator ID="reqmonthsal" runat="server" ControlToValidate="txtMonthSalary" ErrorMessage="Add LCA Salary Previous" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="H1 Update Info"></asp:Label>
            &nbsp;<strong>:</strong>
            <asp:TextBox ID="txtH1UpdateInfo" TabIndex="7" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<br /><br />
                <asp:Label ID="Label6" runat="server" Text="Current YTD"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
                

            &nbsp;<asp:TextBox ID="TextBox6" runat="server" TabIndex="8"   Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqcurentytd" runat="server" ControlToValidate="TextBox6" ErrorMessage="Add Current YTD" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$|((\d+)((\,\d{1,2})?))$"
ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." ValidationGroup="submit" ForeColor="Red"
ControlToValidate="TextBox6" />
        </div>
        <br />

           
      
        <div id="wk" runat="server">
            <hr />

              <div>

            <table width="100%">

                <tr style="background-color:#507CD1;height:30px;"><td colspan="2">   <span style="font-weight:bold;color:white;font-size:20px;">Weekly Hour Details :</span>   &nbsp;</td></tr>

                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                       Employee payroll year &nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlYear" runat="server" Width="150px" TabIndex="9">
                <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="2018"></asp:ListItem>
                <asp:ListItem Value="2" Text="2019"></asp:ListItem>
                <asp:ListItem Value="3" Text="2020"></asp:ListItem>
                <asp:ListItem Value="4" Text="2021"></asp:ListItem>
                <asp:ListItem Value="5" Text="2022"></asp:ListItem>
                <asp:ListItem Value="6" Text="2023"></asp:ListItem>
            </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="reqyear" runat="server" ControlToValidate="ddlYear" InitialValue="0" ErrorMessage="Add Pay-roll Year" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                  <td>
                   <%--   <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always">
                <ContentTemplate>--%>
                    <asp:Label ID="lblmonth" runat="server" Text="Employee Payroll month"></asp:Label>
                    &nbsp;<strong>:</strong>
                    <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" TabIndex="10" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="Jan" Text="January"></asp:ListItem>
                        <asp:ListItem Value="Feb" Text="February"></asp:ListItem>
                        <asp:ListItem Value="Mar" Text="March"></asp:ListItem>
                        <asp:ListItem Value="Apr" Text="April"></asp:ListItem>
                        <asp:ListItem Value="May" Text="May"></asp:ListItem>
                        <asp:ListItem Value="Jun" Text="June"></asp:ListItem>
                        <asp:ListItem Value="Jul" Text="July"></asp:ListItem>
                        <asp:ListItem Value="Aug" Text="August"></asp:ListItem>
                        <asp:ListItem Value="Sep" Text="September"></asp:ListItem>
                        <asp:ListItem Value="Oct" Text="October"></asp:ListItem>
                        <asp:ListItem Value="Nov" Text="November"></asp:ListItem>
                        <asp:ListItem Value="Dec" Text="December"></asp:ListItem>

                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="reqpaymonth" runat="server" ControlToValidate="ddlMonth" InitialValue="0" ErrorMessage="Add Pay-roll Month" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
           <%--     </ContentTemplate>
            </asp:UpdatePanel>--%>
                  </td>
                </tr>
            </table>
           
            <br />
           
            

        </div>
        
        </div>
      
        <div id="wkdetails" runat="server">
              <span style="font-weight:bold;">Add Hours weekly</span>   &nbsp;<strong>:</strong>
              <br />
                          <br />
            
            <br /><br />

            
        
             
            
            <div id="divgrid1" runat="server" style="width:100%;">
               <%--   <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                <asp:GridView ID="GridView1" Width="90%" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="16px"
                    ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1">
                    <AlternatingRowStyle BackColor="White" />

                    <Columns>
                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Week Range" DataField="week" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%" />
                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Regular Hours" DataField="reghours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                         <asp:BoundField HeaderStyle-Width="120px" HeaderText="Actual Rate" DataField="actualrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                         <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalregamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                  
               <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Hours" DataField="othours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Rate" DataField="otrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                           <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalotamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                  <%--  <asp:ButtonField HeaderText="Edit" ButtonType="Link" Text="Edit" CommandName="edit" ItemStyle-HorizontalAlign="Center" /> --%>


                          <asp:TemplateField ItemStyle-Width="8%" HeaderText="Edit">    
                <ItemTemplate>    
                    <asp:LinkButton ID="LinkButton3" Text="Edit" runat="server" CommandName="Edit" />    
                 
                </ItemTemplate>    
                <EditItemTemplate>    
                    <asp:LinkButton ID="LinkButton5" Text="Update" runat="server" OnClick="OnUpdate" ForeColor="White" />    
                    <asp:LinkButton ID="LinkButton6" Text="Cancel" runat="server" OnClick="OnCancel" ForeColor="White" />    
                </EditItemTemplate>    
            </asp:TemplateField>    
                        <asp:ButtonField HeaderText="Delete" ButtonType="Link" Text="Delete" CommandName="Delete" ItemStyle-HorizontalAlign="Center" />
                     
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" ForeColor="White" Font-Size="14px" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="20px" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />


                </asp:GridView>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="lb" runat="server">Total Regular Hours :</span> 
                   <asp:Label ID="lbactutot" runat="server" ></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <span id="lb1" runat="server">Total OT Hours :</span>    <asp:Label ID="lblottot" runat="server" ></asp:Label>
                   <%--   </ContentTemplate>
            </asp:UpdatePanel>--%>
            </div>
        </div>

        <hr />

         <table width="100%">
               <tr style="background-color:#507CD1;height:30px;"><td>   <span style="font-weight:bold;color:white;font-size:20px;">Employee Pay Details :</span>   &nbsp;</td></tr>
         </table>
         <br />
        <div>
            <asp:Label ID="lblPayPeriod" runat="server" Text="Regular Total Reg Amount"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPayPeriod" runat="server"   BackColor="#D3D3D3" TabIndex="14" Width="180px" ></asp:TextBox>
            &nbsp;
             <asp:Label ID="Label7" runat="server" Text="Total OT Amount" ></asp:Label><strong>:</strong>
            <asp:TextBox ID="txtOTHrs" runat="server"   Width="180px" TabIndex="15"></asp:TextBox> &nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblTotalBillingGross" runat="server" Text="Total Billing Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtBillingGross" runat="server" ReadOnly="true" BackColor="#D3D3D3" TabIndex="16" Width="180px"></asp:TextBox>
               &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalBilling" runat="server" Text="Total Billing"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtTotalBilling" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        <div>
        <%--    <asp:Label ID="lblActualRate" runat="server" Text="Actual Rate"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtActualRate" runat="server"   TabIndex="17" Width="180px" > </asp:TextBox>--%>&nbsp;&nbsp;
              <%-- <asp:Label ID="lblOTRate" runat="server" Text="OT Rate"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtOTRate" runat="server"   Width="180px" TabIndex="18"></asp:TextBox>--%>
             <asp:Label ID="lblMinusPercentage" runat="server" Text="Minus Percentage"></asp:Label>&nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlMinusPercentage" runat="server" AutoPostBack="true"  TabIndex="19" OnSelectedIndexChanged="ddlMinusPercentage_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="75% x 25%"></asp:ListItem>
                        <asp:ListItem Value="2" Text="80% x 20%"></asp:ListItem>
                        <asp:ListItem Value="3" Text="70% x 30%"></asp:ListItem>
                   <asp:ListItem Value="4" Text="Salary"></asp:ListItem>
               </asp:DropDownList>



             &nbsp;
                <asp:Label ID="lblEmployeeRate" runat="server" Text="Employee Rate"></asp:Label>
            &nbsp;<strong>:$</strong><asp:TextBox ID="txtEmployeeRate" runat="server" TabIndex="20"  BackColor="#D3D3D3" Width="180px"></asp:TextBox>
          
        &nbsp;
       
            <%--<asp:TextBox ID="txtMinusPercentage" runat="server"></asp:TextBox>--%><br />
            <br />
        </div>
        <div>
            <asp:Label ID="lblEmployeeGross" runat="server" Text="Employee Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtEmployeeGross" runat="server"  BackColor="#D3D3D3" onkeyup="calculatebalance()" TabIndex="21" ></asp:TextBox>&nbsp;
        <asp:Label ID="lblIGIGross" runat="server" Text="IGI Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtIGIGross" runat="server"  BackColor="#D3D3D3"></asp:TextBox>

            <br />

            <br />
            <asp:Label ID="lblSalary" runat="server" Text="Salary"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
            <asp:TextBox ID="txtSalary" runat="server"  Width="180px" TabIndex="25" onkeyup="CalcGrossAfterDeduction()" ></asp:TextBox>&nbsp;

            <asp:RequiredFieldValidator ID="reqsal" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary Can't be empty" ForeColor="Red" ValidationGroup="submit"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <asp:Label ID="lblPeridium" runat="server" Text="Peridium"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPeridium" runat="server" Width="180px" TabIndex="22"></asp:TextBox>&nbsp;
        <asp:Label ID="lblDEDBPayNewRate" runat="server" Text="DED B Pay New Rate(Insurance)"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
        <%--    <asp:TextBox ID="txtDEDBPayNewRate" runat="server" onkeyup="Calcbonus()" Width="180px" TabIndex="23"></asp:TextBox>--%>&nbsp;
            <asp:TextBox ID="txtDEDBPayNewRate" runat="server" onkeyup="Calcbonus()"  AutoPostBack="true" OnTextChanged="txtDEDBPayNewRate_TextChanged" Width="180px" TabIndex="23"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$|((\d+)((\,\d{1,2})?))$"
ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." ValidationGroup="submit" ForeColor="Red"
ControlToValidate="txtDEDBPayNewRate" />
            <br />
              <br />
        <asp:Label ID="lblDescriptionofDeduction" runat="server" Text="Description of Deduction"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtDescriptionofDeduction" runat="server" Width="180px" TabIndex="24"></asp:TextBox><br/><br/>


        </div>
        <br />
        <div>
            
        <asp:Label ID="lblBonus" runat="server" Text="Bonus"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
          <%--  <asp:TextBox ID="txtBonus" runat="server" onkeyup="calytd()" TabIndex="26"  Width="180px" ></asp:TextBox>--%>&nbsp;
            <asp:TextBox ID="txtBonus" runat="server" onkeyup="CalcGrossAfterDeduction()"  TabIndex="26"  Width="180px" OnTextChanged="txtBonus_TextChanged1"  AutoPostBack="true"></asp:TextBox>
        <asp:Label ID="lblPayAdvance" runat="server" Text="Pay Advance Deduction"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPayAdvance" runat="server" onkeyup="CalcGrossAfterDeduction()" AutoPostBack="true" OnTextChanged="txtPayAdvance_TextChanged"  TabIndex="27" Width="180px"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="lblGrossAfterDeduction" runat="server" Text="Gross After Deduction"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
         <asp:TextBox ID="txtGrossAfterDeduction" runat="server" Width="180px" onkeyup="calculatebalance()" TabIndex="28"></asp:TextBox>&nbsp;

           <%-- <asp:TextBox ID="txtGrossAfterDeduction" runat="server" Width="180px" onchange="CalcGrossAfterDeduction()" TabIndex="28"></asp:TextBox>--%>
        <%--<asp:Label ID="lblGrossAfterDeduction2" runat="server" Text="Gross After Deduction#2"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtGrossAfterDeduction2" runat="server"></asp:TextBox>--%>
        </div>
        <br />
        <div>
            <asp:Label ID="lblActualQBDeduc" runat="server" Text="Actual QB Deduc"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtActualQBDeduc" runat="server" Width="180px" TabIndex="29"></asp:TextBox>&nbsp;
        <asp:Label ID="lblPayAdv" runat="server" Text="Pay Advance(Balance)"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPayAdv" runat="server" Width="180px" TabIndex="29"></asp:TextBox>&nbsp;
        <asp:Label ID="lblImmiStatus" runat="server" Text="Immi Status"></asp:Label>
            <%--<asp:TextBox ID="txtImmiStatus" runat="server"></asp:TextBox>--%>

             <asp:DropDownList ID="txtImmiStatus" runat="server" Width="180px" TabIndex="30" AppendDataBoundItems="true">
                <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="H1-B"></asp:ListItem>
                <asp:ListItem Value="2" Text="EAD"></asp:ListItem>
                <asp:ListItem Value="3" Text="OPT"></asp:ListItem>
                <asp:ListItem Value="4" Text="CPT"></asp:ListItem>
                <asp:ListItem Value="5" Text="GC"></asp:ListItem>
                <asp:ListItem Value="6" Text="H4 EAD"></asp:ListItem>
                  <asp:ListItem Value="7" Text="CITIZEN"></asp:ListItem>
            </asp:DropDownList>
           <asp:RequiredFieldValidator ID="reqtxtImmiStatus" ControlToValidate="txtImmiStatus" InitialValue="0" runat="server"  ErrorMessage="Select Immigration Status" ForeColor="Red" ValidationGroup="submit"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <asp:Label ID="lblBalance" runat="server" Text="Balance"></asp:Label><strong>:</strong><strong>$</strong>
            <asp:TextBox ID="txtBalance" runat="server" Width="180px"    TabIndex="31"></asp:TextBox>
             <asp:Label ID="Label13" runat="server" Text="Choose Color"></asp:Label><strong>:</strong>
             <asp:DropDownList ID="ddlbalance" runat="server" >
                <asp:ListItem Value="0">Select</asp:ListItem>
                 <asp:ListItem Value="1">Red</asp:ListItem>
                <asp:ListItem Value="2">Black</asp:ListItem>
                 <asp:ListItem Value="3">Blue</asp:ListItem>
            </asp:DropDownList>
            
            <br />
        <%--      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$|((\d+)((\,\d{1,2})?))$"
ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." ValidationGroup="submit" ForeColor="Red"
ControlToValidate="txtBalance" />--%>
         

            </div>
            <div>
          <asp:Label ID="lblSecondPay" runat="server" Text="Second Pay"></asp:Label>
         

            <asp:DropDownList ID="txtSecondPay" runat="server" TabIndex="32">
                <asp:ListItem  Value="0" Selected="True">No

                </asp:ListItem>
                    <asp:ListItem  Value="1" >Yes

                </asp:ListItem>
            </asp:DropDownList>
               <%--<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>--%>

                <asp:Label ID="lblremarks" runat="server" Text="Remarks"></asp:Label>&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;
              <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" TabIndex="33" Width="300px" Height="100px" ></asp:TextBox>

               <asp:Label ID="Label9" runat="server" Text="Choose Color"></asp:Label><strong>:</strong>
            <asp:DropDownList ID="ddlclor" runat="server" >
                <asp:ListItem Value="0">Select</asp:ListItem>
                 <asp:ListItem Value="1">Red</asp:ListItem>
                <asp:ListItem Value="2">Black</asp:ListItem>
                 <asp:ListItem Value="3">Blue</asp:ListItem>
            </asp:DropDownList>

        </div>
        <br />

                <br />
        <div style="text-align:center;">
            <asp:Button ID="btn" Text="Submit" runat="server" OnClick="btn_Click" Font-Bold="true" Font-Size="18px" ValidationGroup="submit" />
              <asp:Button ID="Button1" Text="Update" runat="server"  Font-Bold="true" Font-Size="18px" Visible="false" ValidationGroup="submit" OnClick="Button1_Click1" />
                   <asp:Button ID="Button2" Text="Cancel" runat="server"  Font-Bold="true" Font-Size="18px"  OnClick="Button2_Click1" />
            <asp:ValidationSummary ID="val" runat="server" ValidationGroup="submit" ShowMessageBox="true" ShowSummary="false" />

        </div>
          <br />
            </asp:Panel>

   
         </td><td width="4px">&nbsp;</td>
         </tr></table>
    
      </td>
      <td width="2px">&nbsp;</td>
    </tr>


    

       <tr>
                <td align="center">
                    <h1><asp:Label ID="hrnew" runat="server"></asp:Label></h1>
                </td>
            </tr>
    
    
   
   </table>

             <br />
             <table id="grid" runat="server" border="0" width="100%" align="center" style="border:2px solid black;padding:10px; height:auto;">
        <tr>
            <td align="center" >
                <div id="Div1" runat="server" style="text-align:center;">
        <asp:GridView ID="gvEmployeePay" runat="server" AutoGenerateColumns="false"  CssClass="Grid" Width="100%" EmptyDataRowStyle-HorizontalAlign="Center"  OnRowCancelingEdit="gvEmployeePay_RowCancelingEdit" 
                     DataKeyNames="mpid" OnRowDataBound="OnRowDataBound"  OnPageIndexChanging="gvEmployeePay_PageIndexChanging" OnRowCommand="gvEmployeePay_RowCommand" OnRowDeleting="gvEmployeePay_RowDeleting">
         <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlHours" runat="server" Style="display: none">
                    <asp:GridView ID="gvHours" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="mpid" CssClass = "ChildGrid" OnRowDataBound="gvHours_RowDataBound">
                        <Columns>
                               <asp:TemplateField HeaderText="Week From" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel1" runat="server" Text='<%#Eval("week_rangefrom","{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <%-- <asp:BoundField ItemStyle-Width="150px" DataField="week_rangefrom" HeaderText="Week From " DataFormatString="{0:MM/dd/yyyy}" />--%>
                           <%-- <asp:BoundField ItemStyle-Width="150px" DataField="week_rangeto" HeaderText="Week To"  DataFormatString="{0:MM/dd/yyyy}"/>--%>

                              <asp:TemplateField HeaderText="Week To" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel2" runat="server" Text='<%#Eval("week_rangeto","{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <%-- <asp:BoundField ItemStyle-Width="150px" DataField="hours" HeaderText="Reg. Hours " />--%>
                          <%--  <asp:BoundField ItemStyle-Width="150px" DataField="hour_type" HeaderText="OT Hours" />--%>
                            <asp:TemplateField HeaderText="Reg. Hours" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel3" runat="server" Text='<%#Eval("hours") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    Total Hour:
                                     <asp:Label ID="tothorreg" runat="server" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OT Hours" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel4" runat="server" Text='<%#Eval("hour_type") %>'></asp:Label>
                                </ItemTemplate>

                                    <FooterTemplate>
                                    Total OT Hour:
                                     <asp:Label ID="tothorregot" runat="server" ForeColor="Black" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Actual Rate" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel5" runat="server" Text='<%#Eval("actual_rate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="OT Rate" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="smallgridlabel6" runat="server" Text='<%#Eval("ot_rate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <%-- <asp:BoundField ItemStyle-Width="150px" DataField="actual_rate" HeaderText="Actual Rate" />--%>
                           <%--  <asp:BoundField ItemStyle-Width="150px" DataField="ot_rate" HeaderText="OT Rate" />--%>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
             
            
              <%--  <asp:BoundField ItemStyle-Width="150px" DataField="EmpId" HeaderText="EmpId" />--%>
               <asp:TemplateField HeaderText="EmpId" SortExpression="EmpId">

<EditItemTemplate>

<asp:TextBox ID="txtempid" Width="100px" runat="server" Text='<%# Bind("EmpId") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtempid" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label1emp" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
               <asp:TemplateField HeaderText="Employee Name" SortExpression="empname">

<EditItemTemplate>

<asp:TextBox ID="txtempname" Width="100px" runat="server" Text='<%# Bind("CName") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtempname" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label1" runat="server" Text='<%# Bind("CName") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
           <%--    <asp:BoundField ItemStyle-Width="150px" DataField="mont" HeaderText="Month" />--%>

               <asp:TemplateField HeaderText="Month" SortExpression="mnt" Visible="false">

<EditItemTemplate>

<asp:TextBox ID="txtmonth" Width="100px" runat="server" Text='<%# Bind("mont") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtmonth" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label1month" runat="server" Text='<%# Bind("mont") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
               <asp:TemplateField HeaderText="Employee Rate" SortExpression="emprate">

<EditItemTemplate>

<asp:TextBox ID="txtemprate" Width="100px" runat="server" Text='<%# Bind("EmpRate") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtemprate" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label2" runat="server" Text='<%# Bind("EmpRate") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>

               <%-- <asp:BoundField ItemStyle-Width="150px" DataField="empGross" HeaderText="Employee Gross" />--%>
             <asp:TemplateField HeaderText="Employee Gross" SortExpression="empGross">

<EditItemTemplate>

<asp:TextBox ID="txtempgross" Width="100px" runat="server" Text='<%# Bind("empGross") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtempgross" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label3" runat="server" Text='<%# Bind("empGross") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
            <%--   <asp:BoundField ItemStyle-Width="150px" DataField="IGIGross" HeaderText="IGI Gross" />--%>


             <asp:TemplateField HeaderText="IGI Gross" SortExpression="igigross">

<EditItemTemplate>

<asp:TextBox ID="txtigigross" Width="100px" runat="server" Text='<%# Bind("IGIGross") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtigigross" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label4" runat="server" Text='<%# Bind("IGIGross") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
             <%--<asp:BoundField ItemStyle-Width="150px" DataField="totGross" HeaderText="Total Gross" />--%>


                <asp:TemplateField HeaderText="Total Gross" SortExpression="totalgross">

<EditItemTemplate>

<asp:TextBox ID="txttotalgross" Width="100px" runat="server" Text='<%# Bind("totGross") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txttotalgross" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label5" runat="server" Text='<%# Bind("totGross") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
            <%--   <asp:BoundField ItemStyle-Width="150px" DataField="netPay" HeaderText="Net Payment" />--%>
         <%--    <asp:BoundField ItemStyle-Width="150px" DataField="salary" HeaderText="Salary" />--%>


               <asp:TemplateField HeaderText="Lca Salary" SortExpression="lsalary">

<EditItemTemplate>

<asp:TextBox ID="txtlsalary" Width="100px" runat="server" Text='<%# Bind("Lcasal") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtlsalary" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label12" runat="server" Text='<%# Bind("Lcasal") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>

                <asp:TemplateField HeaderText="Current YTD" SortExpression="ytd">

<EditItemTemplate>

<asp:TextBox ID="txtlytdsalary" Width="100px" runat="server" Text='<%# Bind("CurrentYTD") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtlytdsalary" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label14" runat="server" Text='<%# Bind("CurrentYTD") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
             <asp:TemplateField HeaderText="Salary" SortExpression="salary">

<EditItemTemplate>

<asp:TextBox ID="txtsalary" Width="100px" runat="server" Text='<%# Bind("salary") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtsalary" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label6" runat="server" Text='<%# Bind("salary") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
            



              <asp:TemplateField HeaderText="Bonus" SortExpression="bonus">

<EditItemTemplate>

<asp:TextBox ID="txtbonus" Width="100px" runat="server" Text='<%# Bind("bonus") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtbonus" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label7" runat="server" Text='<%# String.IsNullOrEmpty(Eval("bonus").ToString()) ?  "" :  string.Format("{0:0.00}",Convert.ToDouble(Eval("bonus").ToString())) %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
          <%--    <asp:BoundField ItemStyle-Width="150px" DataField="pDium" HeaderText="Peridium" />--%>


             <asp:TemplateField HeaderText="Peridium" SortExpression="pdium">

<EditItemTemplate>

<asp:TextBox ID="txtperi" Width="100px" runat="server" Text='<%# Bind("pDium") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtperi" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label8" runat="server" Text='<%# Bind("pDium") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
              <%-- <asp:BoundField ItemStyle-Width="150px" DataField="advapay" HeaderText="Pay Adv. Deduct" />--%>
               <asp:TemplateField HeaderText="Pay Adv. Deduct" SortExpression="payadva">

<EditItemTemplate>

<asp:TextBox ID="txtpay" Width="100px" runat="server" Text='<%# Bind("advapay") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtpay" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Labelpay" runat="server" Text='<%# Bind("advapay") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
           
            <%--   <asp:BoundField ItemStyle-Width="150px" DataField="Rate_Insurance" HeaderText="Pay New Rate(Insurance)" />--%>
                 <asp:TemplateField HeaderText="Pay New Rate(Insurance)" SortExpression="payinsu">

<EditItemTemplate>

<asp:TextBox ID="txtinsurance" Width="100px" runat="server" Text='<%# Bind("Rate_Insurance") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtinsurance" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Labelinsurance" runat="server" Text='<%# Bind("Rate_Insurance") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
            <%--   <asp:BoundField ItemStyle-Width="150px" DataField="despofdeduct" HeaderText="Desp. of Deduction" />--%>
                      <asp:TemplateField HeaderText="Desp. of Deduction" SortExpression="desp">

<EditItemTemplate>

<asp:TextBox ID="txtinsurancedesp" Width="100px" runat="server" Text='<%# Bind("despofdeduct") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtinsurancedesp" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Labelinsurancedesp" runat="server" Text='<%# Bind("despofdeduct") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>
               <asp:TemplateField HeaderText="Minus Percentage">  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropDownList4" runat="server"   
SelectedValue='<%# Bind("minusPercent") %>'>  
                                    
               <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="75% x 25%"></asp:ListItem>
                        <asp:ListItem Value="2" Text="80% x 20%"></asp:ListItem>
                        <asp:ListItem Value="3" Text="70% x 30%"></asp:ListItem>
                  <asp:ListItem Value="4" Text="Salary"></asp:ListItem>
                                </asp:DropDownList>  
                            </EditItemTemplate>  
                            <ItemTemplate>
                                <asp:Label ID="lblminusper" runat="server" Text='<%#Bind("minus") %>'></asp:Label>
                                
                                 <%-- <asp:DropDownList ID="DropDownList5" Enabled="false" runat="server"   
SelectedValue='<%# Bind("minusPercent") %>'>  
                                      <asp:ListItem Value="0">Select</asp:ListItem>
               <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="75% x 25%"></asp:ListItem>
                        <asp:ListItem Value="2" Text="80% x 20%"></asp:ListItem>
                        <asp:ListItem Value="3" Text="70% x 30%"></asp:ListItem>
                  <asp:ListItem Value="4" Text="Salary"></asp:ListItem>
                                </asp:DropDownList>  --%>

</ItemTemplate>

</asp:TemplateField>
         <%--    <asp:BoundField ItemStyle-Width="150px" DataField="bePay" HeaderText="Balance" />--%>

                 <asp:TemplateField HeaderText="Balance" SortExpression="balance">

<EditItemTemplate>

<asp:TextBox ID="txtbalance" Width="100px" runat="server" Text='<%# Bind("bePay") %>'></asp:TextBox>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtbalance" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Label10" runat="server" Text='<%# Bind("bePay") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>

             
                <asp:TemplateField HeaderText="Color Code" >  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropDownListclor"  runat="server" SelectedItem='<%#Bind("colorcode")%>' >  
                                      <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="Red"></asp:ListItem>
                <asp:ListItem Value="2" Text="Black"></asp:ListItem>
                <asp:ListItem Value="3" Text="Blue"></asp:ListItem>
   <%--<asp:ListItem Value="4" Text="Green"></asp:ListItem>--%>
                                </asp:DropDownList>  
                            </EditItemTemplate> 
                    <ItemTemplate>
                        <asp:Label ID="Labelcolor" runat="server" Text='<%# Bind("color") %>'>  
                                </asp:Label>
                    </ItemTemplate> 
                         
                        </asp:TemplateField>  
             <%--  <asp:BoundField ItemStyle-Width="150px" DataField="EmpRate" HeaderText="Employee Rate" />--%>
            <%-- <asp:BoundField ItemStyle-Width="150px" DataField="FinalPay" HeaderText="Final Payment" />--%>
              <%-- <asp:BoundField ItemStyle-Width="150px" DataField="TotAdva" HeaderText="Total Advance" />--%>
           <%--  <asp:BoundField ItemStyle-Width="150px" DataField="visaType" HeaderText="Visa Type" />--%>


                <asp:TemplateField HeaderText="Visa Type">  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropDownList2" runat="server"   
SelectedValue='<%# Bind("visaType") %>'>  
                                      <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="H1-B"></asp:ListItem>
                <asp:ListItem Value="2" Text="EAD"></asp:ListItem>
                <asp:ListItem Value="3" Text="OPT"></asp:ListItem>
                <asp:ListItem Value="4" Text="CPT"></asp:ListItem>
                <asp:ListItem Value="5" Text="GC"></asp:ListItem>
                <asp:ListItem Value="6" Text="H4 EAD"></asp:ListItem>
                  <asp:ListItem Value="7" Text="CITIZEN"></asp:ListItem>
                                </asp:DropDownList>  
                            </EditItemTemplate>  
                            <ItemTemplate>  <%--<asp:DropDownList ID="DropDownList3" Enabled="false" runat="server"   
SelectedValue='<%# Bind("visaType") %>'>  
                                      <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="H1-B"></asp:ListItem>
                <asp:ListItem Value="2" Text="EAD"></asp:ListItem>
                <asp:ListItem Value="3" Text="OPT"></asp:ListItem>
                <asp:ListItem Value="4" Text="CPT"></asp:ListItem>
                <asp:ListItem Value="5" Text="GC"></asp:ListItem>
                <asp:ListItem Value="6" Text="H4 EAD"></asp:ListItem>
                  <asp:ListItem Value="7" Text="CITIZEN"></asp:ListItem>
                                </asp:DropDownList>  --%>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("visa") %>'>  
                                </asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
               <asp:BoundField ItemStyle-Width="150px" DataField="BillDate" ReadOnly="true" HeaderText="Created Date"   DataFormatString="{0:MM/dd/yyyy}"  />
               <%-- <asp:BoundField ItemStyle-Width="150px" DataField="remark"  HeaderText="Remarks" />--%>
               <asp:TemplateField HeaderText="Remarks" SortExpression="remark">

<EditItemTemplate>

<asp:TextBox ID="txtremark" Width="100px" runat="server" Text='<%# Bind("remark") %>'></asp:TextBox>
    
                                <asp:DropDownList ID="DropDownListclorremark"  runat="server"  >  
                                      <asp:ListItem Value="0">Select</asp:ListItem>
                <asp:ListItem Value="1" Text="Red"></asp:ListItem>
                <asp:ListItem Value="2" Text="Black"></asp:ListItem>
                <asp:ListItem Value="3" Text="Blue"></asp:ListItem>
                                    </asp:DropDownList>

</EditItemTemplate>

<FooterTemplate>

<asp:TextBox ID="txtremark" runat="server"  Width="100px"></asp:TextBox>

</FooterTemplate>

<ItemTemplate>

<asp:Label ID="Labelremark" runat="server" Text='<%# Bind("remark") %>'></asp:Label>

</ItemTemplate>

</asp:TemplateField>

             <asp:TemplateField HeaderText="Action">
                 <ItemTemplate>
                     <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');"  ImageUrl="images/delete.png"   CommandArgument='<%#Eval("weekdetail_month") %>'   CommandName="delete" />
                 </ItemTemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="Edit" ShowHeader="False" ItemStyle-Width="5%" ItemStyle-ForeColor="White" >

<EditItemTemplate >

<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" OnClick="Update1" CommandArgument='<%#Eval("weekdetail_month") %>' Text="Update"></asp:LinkButton>

<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="Cancel1" Text="Cancel"></asp:LinkButton>

</EditItemTemplate>



<ItemTemplate>

<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CommandArgument='<%#Eval("weekdetail_month") %>' Text="Edit" OnClientClick="return confirm('Are you sure you want to Edit this record?');" ></asp:LinkButton>

</ItemTemplate>

</asp:TemplateField>
         </Columns>
            <EmptyDataTemplate>
               
            </EmptyDataTemplate>
            <EmptyDataRowStyle Font-Bold="true" Font-Size="18px" ForeColor="Red" />
        </asp:GridView>

 <asp:Label ID="Label8" runat="server" Text="No Records Found" ForeColor="Red" Font-Bold="true" Font-Size="18px" Visible="false"></asp:Label>
<input type="hidden" id="hdnInnerHtml" value="" runat="server" />
       </div>
            </td>
        </tr>
        

        </table>

             <br />
             <br />

</center>
    
    </form>
</body>
</html>
