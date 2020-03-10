<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_payroll.aspx.cs" Inherits="invoice_Default2" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::Admin-Payroll::</title>

<script type="text/javascript">
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
</script>
    <script type="text/javascript">
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
</script>
    

    <script type="text/javascript">
        debugger
        function CalcTotalBillingGross() {

            var totHrs = document.getElementById("<%=txtPayPeriod.ClientID%>").value;
            var totOthrs = document.getElementById("<%=txtOTHrs.ClientID%>").value;

            var sum = 0;
            sum= parseFloat(totHrs) + parseFloat(totOthrs);
            document.getElementById("<%=txtBillingGross.ClientID%>").value = sum;
               
            }
            function CalcTotalBillingregGross() {

                //var totHrs = document.getElementById("<%=lbactutot.ClientID%>").value;
                //var actRate = document.getElementById("<%=txtActualRate.ClientID%>").value;

              //  var sum = 0;
              //  if (!isNaN(totHrs) && !isNaN(actRate)) {
               //     sum = parseFloat(actRate) * parseFloat(totHrs);
                 //   document.getElementById("<%=txtPayPeriod.ClientID%>").value = sum;
               
                
            }
        function CalcTotalBillingotGross() {

            var tototHrs = document.getElementById("<%=lblottot.ClientID%>").value;
            var otRate = document.getElementById("<%=txtOTRate.ClientID%>").value;

            var sum = 0;
            if (!isNaN(totHrs) && !isNaN(otRate)) {
                sum = parseFloat(otRate) * parseFloat(tototHrs);
                document.getElementById("<%=txtOTHrs.ClientID%>").value = sum;

            }
        }
            // debugger;
            // var totGross = document.getElementById("<%=txtBillingGross.ClientID%>").value;
        
                    function MonthlySalAsperLCA() {
                        var summonth=0;
                        summonth=Math.round((document.getElementById("<%=txtLCASalary.ClientID%>").value) / 12);
                        document.getElementById("<%=txtSalary.ClientID%>").value=summonth;
                      // document.getElementById("<%=txtMonthSalary.ClientID%>").value =summonth;
                            //=Math.round( (document.getElementById("<%=txtLCASalary.ClientID%>").value) / 12);

            //document.getElementById("<%=txtSalary.ClientID%>").value = document.getElementById("<%=txtMonthSalary.ClientID%>").value
        }

        function CalcGrossAfterDeduction() {
            var sum1 = 0;
            var num1 = document.getElementById("<%=txtSalary.ClientID%>").value;
            var num2 = document.getElementById("<%=txtBonus.ClientID%>").value;

            // var num3 = document.getElementById("<%=txtPayAdvance.ClientID%>").value;

            var num3 = document.getElementById("<%=txtDEDBPayNewRate.ClientID%>").value;
            sum1 = parseFloat(num1) + parseFloat(num2) + parseFloat(num3);
            //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
            document.getElementById("<%=txtGrossAfterDeduction.ClientID%>").value = sum1;
            document.getElementById("<%=txtPayAdvance.ClientID%>").value=sum1
            
            }
        function Calcbonus() {
            var sum2 = 0;
            var num1 = document.getElementById("<%=txtEmployeeGross.ClientID%>").value;
            var num2 = document.getElementById("<%=txtSalary.ClientID%>").value;

            var num3 = document.getElementById("<%=txtDEDBPayNewRate.ClientID%>").value;
            sum1 = parseFloat(num1) - parseFloat(num2) - parseFloat(num3);
            //sum1 = (document.getElementById("<%=txtSalary.ClientID%>").value + document.getElementById("<%=txtBonus.ClientID%>").value + document.getElementById("<%=txtPayAdvance.ClientID%>").value);
            //document.getElementById("<%=txtBonus.ClientID%>").value = sum1;
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

    <script>
        function calculatebalance() {
            var sum5 = 0;
            var num1 = document.getElementById("<%=txtEmployeeGross.ClientID%>").value;

            var num2 = document.getElementById("<%=txtGrossAfterDeduction.ClientID%>").value;
              if (!isNaN(num1) && !isNaN(num2)) {
                  sum5 = parseFloat(num1) - parseFloat(num2);
                  document.getElementById("<%=txtBalance.ClientID%>").value = sum5;
            }


        }
    </script>
   
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
            <asp:LinkButton ID="hlExport" Text="Export Payoll Spreadsheet" runat="server" OnClick="lnkdownload_Click" Font-Bold="true" Font-Size="20px"></asp:LinkButton>
        </div>
        <br />
          <div>
            QB Payroll Month
            <asp:DropDownList ID="ddlPayMonth" runat="server"  Height="16px" Width="178px" AutoPostBack="true" TabIndex="1" OnSelectedIndexChanged="ddlPayMonth_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="January"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Febraury"></asp:ListItem>
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
            <asp:DropDownList ID="ddlPayrollYr" runat="server" TabIndex="2" Width="150px">
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

            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="LCA Salary Previous"></asp:Label>
            &nbsp;<strong>:</strong><strong>$</strong>
            <asp:TextBox ID="txtMonthSalary" runat="server" Width="180px"></asp:TextBox>

                <asp:RequiredFieldValidator ID="reqmonthsal" runat="server" ControlToValidate="txtMonthSalary" ErrorMessage="Add LCA Salary Previous" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="H1 Update Info"></asp:Label>
            &nbsp;<strong>:</strong>
            <asp:TextBox ID="txtH1UpdateInfo" TabIndex="7" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<br /><br />
                <asp:Label ID="Label6" runat="server" Text="Current YTD"></asp:Label>&nbsp;<strong>:</strong><strong>$</strong>
                

            &nbsp;<asp:TextBox ID="TextBox6" runat="server" TabIndex="8"   Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqcurentytd" runat="server" ControlToValidate="txtMonthSalary" ErrorMessage="Add Current YTD" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
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
                      <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label ID="lblmonth" runat="server" Text="Employee Payroll month"></asp:Label>
                    &nbsp;<strong>:</strong>
                    <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" TabIndex="10" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="January"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Febraury"></asp:ListItem>
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
                     <asp:RequiredFieldValidator ID="reqpaymonth" runat="server" ControlToValidate="ddlMonth" InitialValue="0" ErrorMessage="Add Pay-roll Month" ValidationGroup="submit" ForeColor="Red"></asp:RequiredFieldValidator>
                </ContentTemplate>
            </asp:UpdatePanel>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblWeekRanges" runat="server" Text="Week Ranges"></asp:Label>
                    &nbsp;<strong>:</strong>
                    &nbsp;<asp:DropDownList ID="ddlWeekRanges" runat="server" TabIndex="11" Width="180px" AppendDataBoundItems="true">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="re1" runat="server" ControlToValidate="ddlWeekRanges" ErrorMessage="Select Week Range" ForeColor="Red" ValidationGroup="fr1">*</asp:RequiredFieldValidator>
                    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                      <asp:DropDownList ID="ddlHrType" runat="server" TabIndex="12" AppendDataBoundItems="true">
                         
                        <asp:ListItem Value="R" Selected="True" >Regular</asp:ListItem>
                        <asp:ListItem Value="O">OT</asp:ListItem>
                     </asp:DropDownList>
                   
                </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br />

            <table width="100%">
                <tr>
                    <td width="20%">
                            <asp:Label ID="lblNoOfHours" runat="server" Text="No Of Hours"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtNoOfHours" runat="server" Width="100px" TabIndex="13"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlWeekRanges" ErrorMessage="Add Hours" ValidationGroup="fr1" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                      <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>--%>
        <asp:Button ID="btnAddregularhours" runat="server" OnClick="Button1_Click" Text="Add regular/ot hours" OnClientClick=" Validate(); Validate1()"   />

                
                   <%--  </ContentTemplate>
            </asp:UpdatePanel>--%>
                    </td>
                </tr>
            </table>
        
             
            
            <div style="width:800px;">
               <%--   <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                <asp:GridView ID="GridView1" Width="1000px" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" runat="server" CellPadding="4" HeaderStyle-Font-Size="16px"
                    ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />

                    <Columns>
                        <asp:BoundField HeaderStyle-Width="180px" HeaderText="Week Range" DataField="week" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%" />
                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="Regular Hours" DataField="reghours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                         <asp:BoundField HeaderStyle-Width="120px" HeaderText="Actual Rate" DataField="actualrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                         <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalregamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                  
               <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Hours" DataField="othours" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderStyle-Width="120px" HeaderText="OT Rate" DataField="otrate" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                           <asp:BoundField HeaderStyle-Width="120px" HeaderText="Total" DataField="totalotamount" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="14px" ItemStyle-HorizontalAlign="Center" />
                  <%--  <asp:ButtonField HeaderText="Edit" ButtonType="Link" Text="Edit" CommandName="edit" ItemStyle-HorizontalAlign="Center" /> --%>
                        <asp:ButtonField HeaderText="Delete" ButtonType="Link" Text="Delete" CommandName="Delete" ItemStyle-HorizontalAlign="Center" />
                     
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
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
            <asp:TextBox ID="txtPayPeriod" runat="server"  ReadOnly="true" BackColor="#D3D3D3" TabIndex="14" Width="180px" ></asp:TextBox>
            &nbsp;
             <asp:Label ID="Label7" runat="server" Text="Total OT Amount" Width="180px"></asp:Label><strong>:</strong>
            <asp:TextBox ID="txtOTHrs" runat="server"  ReadOnly="True" Width="180px" TabIndex="15"></asp:TextBox> &nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblTotalBillingGross" runat="server" Text="Total Billing Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtBillingGross" runat="server" ReadOnly="true" BackColor="#D3D3D3" TabIndex="16" Width="180px"></asp:TextBox>
               &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalBilling" runat="server" Text="Total Billing"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtTotalBilling" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="lblActualRate" runat="server" Text="Actual Rate"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtActualRate" runat="server"   TabIndex="17" Width="180px" > </asp:TextBox>&nbsp;&nbsp;
               <asp:Label ID="lblOTRate" runat="server" Text="OT Rate"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtOTRate" runat="server"   Width="180px" TabIndex="18"></asp:TextBox>
             <asp:Label ID="lblMinusPercentage" runat="server" Text="Minus Percentage"></asp:Label>&nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlMinusPercentage" runat="server" AutoPostBack="true"  TabIndex="19" OnSelectedIndexChanged="ddlMinusPercentage_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1" Text="75% x 25%"></asp:ListItem>
                        <asp:ListItem Value="2" Text="80% x 20%"></asp:ListItem>
                        <asp:ListItem Value="3" Text="70% x 30%"></asp:ListItem>
               </asp:DropDownList>



             &nbsp;
                <asp:Label ID="lblEmployeeRate" runat="server" Text="Employee Rate"></asp:Label>
            &nbsp;<strong>:$</strong><asp:TextBox ID="txtEmployeeRate" runat="server" TabIndex="20" ReadOnly="true" BackColor="#D3D3D3" Width="180px"></asp:TextBox>
          
        &nbsp;
       
            <%--<asp:TextBox ID="txtMinusPercentage" runat="server"></asp:TextBox>--%><br />
            <br />
        </div>
        <div>
            <asp:Label ID="lblEmployeeGross" runat="server" Text="Employee Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtEmployeeGross" runat="server" ReadOnly="true" BackColor="#D3D3D3" onkeyup="calculatebalance()" TabIndex="21" ></asp:TextBox>&nbsp;
        <asp:Label ID="lblIGIGross" runat="server" Text="IGI Gross"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtIGIGross" runat="server" ReadOnly="true" BackColor="#D3D3D3"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="lblPeridium" runat="server" Text="Peridium"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPeridium" runat="server" Width="180px" TabIndex="22"></asp:TextBox>&nbsp;
        <asp:Label ID="lblDEDBPayNewRate" runat="server" Text="DED B Pay New Rate(Insurance)"></asp:Label>&nbsp;<strong>:</strong>
        <%--    <asp:TextBox ID="txtDEDBPayNewRate" runat="server" onkeyup="Calcbonus()" Width="180px" TabIndex="23"></asp:TextBox>--%>&nbsp;
            <asp:TextBox ID="txtDEDBPayNewRate" runat="server" onkeyup="CalcGrossAfterDeduction()" Width="180px" TabIndex="23"></asp:TextBox>
        <asp:Label ID="lblDescriptionofDeduction" runat="server" Text="Description of Deduction"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtDescriptionofDeduction" runat="server" Width="180px" TabIndex="24"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="lblSalary" runat="server" Text="Salary"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtSalary" runat="server"  Width="180px" TabIndex="25" onkeyup="CalcGrossAfterDeduction()" ></asp:TextBox>&nbsp;

            <asp:RequiredFieldValidator ID="reqsal" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary Can't be empty" ForeColor="Red" ValidationGroup="submit"></asp:RequiredFieldValidator>
        <asp:Label ID="lblBonus" runat="server" Text="Bonus"></asp:Label>&nbsp;<strong>:</strong>
          <%--  <asp:TextBox ID="txtBonus" runat="server" onkeyup="calytd()" TabIndex="26"  Width="180px" ></asp:TextBox>--%>&nbsp;
            <asp:TextBox ID="txtBonus" runat="server" onkeyup="CalcGrossAfterDeduction()" TabIndex="26"  Width="180px" ></asp:TextBox>
        <asp:Label ID="lblPayAdvance" runat="server" Text="Pay Advance Deduction"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtPayAdvance" runat="server" onkeyup="CalcGrossAfterDeduction()" TabIndex="27" Width="180px"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="lblGrossAfterDeduction" runat="server" Text="Gross After Deduction"></asp:Label>&nbsp;<strong>:</strong>
            <asp:TextBox ID="txtGrossAfterDeduction" runat="server" Width="180px" onchange="calculatebalance()" TabIndex="28"></asp:TextBox>&nbsp;
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
            <asp:Label ID="lblBalance" runat="server" Text="Balance"></asp:Label><strong>:</strong>
            <asp:TextBox ID="txtBalance" runat="server" Width="180px" onkeyup="calculatebalance()"   TabIndex="31"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSecondPay" runat="server" Text="Second Pay"></asp:Label>
         

            <asp:DropDownList ID="txtSecondPay" runat="server" TabIndex="32">
                <asp:ListItem  Value="0" Selected="True">No

                </asp:ListItem>
                    <asp:ListItem  Value="1" >Yes

                </asp:ListItem>
            </asp:DropDownList>
               <%--<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>--%>

                <asp:Label ID="lblremarks" runat="server" Text="Remarks"></asp:Label>&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;
              <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" TabIndex="33" Width="300px" Height="100px" ></asp:TextBox>


        </div>
        <br />

                <br />
        <div style="text-align:center;">
            <asp:Button ID="btn" Text="Submit" runat="server" OnClick="btn_Click" Font-Bold="true" Font-Size="18px" ValidationGroup="submit" />

            <asp:ValidationSummary ID="val" runat="server" ValidationGroup="submit" ShowMessageBox="true" ShowSummary="false" />

        </div>
          <br />
            </asp:Panel>

   
         </td><td width="4px">&nbsp;</td>
         </tr></table>
    
      </td>
      <td width="2px">&nbsp;</td>
    </tr>


    

     
    
    
   
   </table>

             <br />
             <table id="grid" runat="server" border="0" width="100%" align="center" style="border:2px solid black;padding:10px;">
        <tr>
            <td align="center" >
                <div id="Div1" runat="server" style="text-align:center;">
        <asp:GridView ID="gvEmployeePay" runat="server" AutoGenerateColumns="false" CssClass="Grid" Width="100%" EmptyDataRowStyle-HorizontalAlign="Center" 
                     DataKeyNames="EmpId" OnRowDataBound="OnRowDataBound" PageSize="5" AllowPaging="true" OnPageIndexChanging="gvEmployeePay_PageIndexChanging" OnRowCommand="gvEmployeePay_RowCommand" OnRowDeleting="gvEmployeePay_RowDeleting">
         <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlHours" runat="server" Style="display: none">
                    <asp:GridView ID="gvHours" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="week_rangefrom" HeaderText="Week From " DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="week_rangeto" HeaderText="Week To"  DataFormatString="{0:MM/dd/yyyy}"/>
                            <asp:BoundField ItemStyle-Width="150px" DataField="hours" HeaderText="Reg. Hours " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="hour_type" HeaderText="OT Hours" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField ItemStyle-Width="150px" DataField="CName" HeaderText="Employee Name" />
                <asp:BoundField ItemStyle-Width="150px" DataField="ActualRate" HeaderText="Actual Rate" />
               <asp:BoundField ItemStyle-Width="150px" DataField="EmpRate" HeaderText="Employee Rate" />
                <asp:BoundField ItemStyle-Width="150px" DataField="empGross" HeaderText="Employee Gross" />
               <asp:BoundField ItemStyle-Width="150px" DataField="IGIGross" HeaderText="IGI Gross" />
             <asp:BoundField ItemStyle-Width="150px" DataField="totGross" HeaderText="Total Gross" />
            <%--   <asp:BoundField ItemStyle-Width="150px" DataField="netPay" HeaderText="Net Payment" />--%>
             <asp:BoundField ItemStyle-Width="150px" DataField="salary" HeaderText="Salary" />
               <asp:BoundField ItemStyle-Width="150px" DataField="bonus" HeaderText="Bonus" />
              <asp:BoundField ItemStyle-Width="150px" DataField="pDium" HeaderText="Peridium" />
               <asp:BoundField ItemStyle-Width="150px" DataField="minusPercent" HeaderText="Minus Percentage" />
             <asp:BoundField ItemStyle-Width="150px" DataField="bePay" HeaderText="Balance" />
             <%--  <asp:BoundField ItemStyle-Width="150px" DataField="EmpRate" HeaderText="Employee Rate" />--%>
            <%-- <asp:BoundField ItemStyle-Width="150px" DataField="FinalPay" HeaderText="Final Payment" />--%>
               <asp:BoundField ItemStyle-Width="150px" DataField="TotAdva" HeaderText="Total Advance" />
             <asp:BoundField ItemStyle-Width="150px" DataField="visaType" HeaderText="Visa Type" />
               <asp:BoundField ItemStyle-Width="150px" DataField="BillDate" HeaderText="Created Date" />
          <%--   <asp:TemplateField HeaderText="Action">
                 <ItemTemplate>
                     <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server"  ImageUrl="images/delete.png"   CommandArgument='<%#Eval("mpId") %>'   CommandName="delete" />
                 </ItemTemplate>
             </asp:TemplateField>--%>
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
