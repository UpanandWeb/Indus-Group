<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-payrolldetails.aspx.cs" Inherits="admin_payrolldetails" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::Admin-Payroll::</title>
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
<body topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
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
     <tr><td align="right"><asp:LinkButton ID="lnk" runat="server" Font-Bold="true" Font-Size="20px" Text="Add Payroll Details" OnClick="lnk_Click"></asp:LinkButton></td></tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
    <tr><td height="30px" align="center" width='70%'>
    <table border="0" width="100%" align="center" >
        <tr>
            <td align="center">
                <div id="griddata" runat="server" style="text-align:center;">
        <asp:GridView ID="gvEmployeePay" runat="server" AutoGenerateColumns="false" CssClass="Grid"
                     DataKeyNames="EmpId" OnRowDataBound="OnRowDataBound">
         <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlHours" runat="server" Style="display: none">
                    <asp:GridView ID="gvHours" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="week_rangefrom" HeaderText="Week From " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="week_rangeto" HeaderText="Week To" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="hours" HeaderText="No. Of Hours " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="hour_type" HeaderText="Type Of Hour" />
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
               <asp:BoundField ItemStyle-Width="150px" DataField="netPay" HeaderText="Net Payment" />
             <asp:BoundField ItemStyle-Width="150px" DataField="salary" HeaderText="Salary" />
               <asp:BoundField ItemStyle-Width="150px" DataField="bonus" HeaderText="Bonus" />
              <asp:BoundField ItemStyle-Width="150px" DataField="pDium" HeaderText="Peridium" />
               <asp:BoundField ItemStyle-Width="150px" DataField="minusPercent" HeaderText="Minus Percentage" />
             <asp:BoundField ItemStyle-Width="150px" DataField="bePay" HeaderText="Before Pay" />
               <asp:BoundField ItemStyle-Width="150px" DataField="EmpRate" HeaderText="Employee Rate" />
             <asp:BoundField ItemStyle-Width="150px" DataField="FinalPay" HeaderText="Final Payment" />
               <asp:BoundField ItemStyle-Width="150px" DataField="TotAdva" HeaderText="Total Advance" />
             <asp:BoundField ItemStyle-Width="150px" DataField="visaType" HeaderText="Visa Type" />
               <asp:BoundField ItemStyle-Width="150px" DataField="BillDate" HeaderText="Bill Date" />
         </Columns>
        </asp:GridView>
       </div>
            </td>
        </tr>
        

        </table></td></tr></table>
                  </center>
    </form>
</body>
</html>
