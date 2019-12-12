<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Reports.aspx.cs" Inherits="admin_Admin_Reports" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>: : Indus Group : : Admin Control Panel - India Employees</title>
    <link rel="stylesheet" href="Styles/stylesheet.css" />    
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
</head>

<body  topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="tl" runat="server" ></cc1:ToolkitScriptManager>

         <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
            <tr width="100%">
        <td valign="top" width="100%" class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>

            <tr><td height="30px"><hr /></td></tr>

             <tr><td height="20px" align="center">
                 Select Country : <asp:DropDownList ID="ddc" runat="server" Width="80px" AutoPostBack="true" OnSelectedIndexChanged="ddc_SelectedIndexChanged">
                                    <asp:ListItem>USA</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                  </asp:DropDownList>
                 </td></tr>


             <tr><td height="20px"></td></tr>
             <tr>
                
                 <td align="center" width="100%">
                     <asp:LinkButton ID="lnkpersonal" runat="server" Text="Personal Details" Font-Underline="true" Font-Size="18px" OnClick="lnkpersonal_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;        
                     <asp:LinkButton ID="Bankdetails" runat="server" Text="Bank Details" Font-Underline="true" Font-Size="18px" OnClick="Bankdetails_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;                     
                     <asp:LinkButton ID="lnkemergency" runat="server" Text="Emergency Details" Font-Underline="true" Font-Size="18px" OnClick="lnkemergency_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;             
                     <asp:LinkButton ID="lnkprofessional" runat="server" Text="Professional Details" Font-Underline="true" Font-Size="18px" OnClick="lnkprofessional_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;                  
                     <asp:LinkButton ID="education" runat="server" Text="Education Details" Font-Underline="true" Font-Size="18px" OnClick="education_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;               
                    <asp:LinkButton ID="Employee" runat="server" Text="MonthWise EmployeeHours" Font-Underline="true" Font-Size="18px" OnClick="Employee_Click" ValidationGroup="submit"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp; 
                     </td>                                  
             </tr>


   <tr>
       <td align="center" id="ind" runat="server">
           <br />
           <br />
         Search Employee By First Name :   <asp:TextBox ID="txtserch" runat="server" Height="25px" Width="200px" Font-Size="14px" ></asp:TextBox>
                                                      <cc1:textboxwatermarkextender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtserch"
                                                       WatermarkText="Search Employees with First Name" />
                                                     <cc1:autocompleteextender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"
                                                        CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="txtserch"
                                                        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                                                    </cc1:autocompleteextender>
          
                                                   



           <asp:Button ID="btnsearch" runat="server" Text="Search"  Height="25px" Width="60px" OnClick="btnsearch_Click"/>
           <br />
           <br />
       </td>
   </tr>
   
     <tr>
       <td align="center" id="us" runat="server">
           <br />
           <br />
         Search Employee By First Name :   <asp:TextBox ID="txtserchus" runat="server"  Width="200px" Font-Size="14px"  ></asp:TextBox>
                                                      <cc1:textboxwatermarkextender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtserchus"
                                                       WatermarkText="Search Employees with First Name" />
                                                     <cc1:autocompleteextender ServiceMethod="GetCompletionList1" MinimumPrefixLength="1"
                                                        CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="txtserchus"
                                                        ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
                                                    </cc1:autocompleteextender>

           <asp:Button ID="Button1" runat="server" Text="Search"  Height="25px" Width="60px" OnClick="btnsearch_Click"/>
           <br />
           <br />
         
       </td>
   </tr>
<tr>
       <td>
          <table align="center">
              <tr>
                  <td>
                      <asp:CheckBox ID="chk1" runat="server" Text="First Name" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk2" runat="server" Text="Last Name" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk3" runat="server" Text="Email Id" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk4" runat="server" Text="Mobile" />
                  </td>
              </tr> 
               <tr>
                  <td>
                      <asp:CheckBox ID="chk5" runat="server" Text="Bank A/c Number" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk6" runat="server" Text="Bank Name" />
                  </td>
                     <td>
                      <asp:CheckBox ID="chifsc" runat="server" Text="IFSC Code" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk7" runat="server" Text="Aadhar Number" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk8" runat="server" Text="Pan Number" />
                  </td>
              </tr> 
               <tr>
                  <td>
                      <asp:CheckBox ID="chk9" runat="server" Text="Skills 1" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk10" runat="server" Text="Skills 2" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk11" runat="server" Text="Education 1" />
                  </td>
                   <td>
                      <asp:CheckBox ID="chk12" runat="server" Text="Education 2" />
                  </td>
              </tr> 
              <tr>
                  <td><br /></td>
              </tr>
                <tr>
                  <td align="center" colspan="4">
                      <asp:Button ID="btnsubmit" runat="server" Text="Import Employee Data By Excel Sheet"  OnClick="btnsubmit_Click"  Height="30px"/>
                  </td>
                  
              </tr> 
          </table>
       </td>
   </tr>
    <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
   </table>
         <%--  NEW ADD Employee Month AND YEAR WISE DATA--%> 
       <br />
       <br />
          <div style="text-align: center;">
           Emplyee Month &nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlPayMonth" runat="server"  Width="150px" AutoPostBack="false" TabIndex="1" OnSelectedIndexChanged="ddlPayMonth_SelectedIndexChanged">
                        <asp:ListItem Value="">Select</asp:ListItem>
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
              <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="ddlPayMonth" Display="Dynamic" 
                                                                                ErrorMessage="*"  InitialValue="" ValidationGroup="submit" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
               &nbsp;
           Employee Year &nbsp;<strong>:</strong>
            <asp:DropDownList ID="ddlPayrollYr" runat="server" TabIndex="2" Width="150px" AutoPostBack="false" OnSelectedIndexChanged="ddlPayMonth_SelectedIndexChanged" >
                <asp:ListItem Value="">Select</asp:ListItem>
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
            </asp:DropDownList>&nbsp;&nbsp;   
              <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="ddlPayrollYr" Display="Dynamic" 
                                                                                ErrorMessage="*"  InitialValue="" ValidationGroup="submit" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>      
             <asp:Button ID="Button2" runat="server" Text="Search" Height="25px" Width="60px" OnClick="btnsearch_Click1" ValidationGroup="submit"></asp:Button>
        </div>
          <tr>
                <div style="text-align: center;">
                    <h1><asp:Label ID="MonthwiseemployeeHours" runat="server"></asp:Label></h1>
                </div>
            </tr>
        <div style="text-align: right;">
         <asp:LinkButton ID="hlExport" Text="Export Employee Spreadsheet" runat="server" OnClick="lnkdownload_Click" Font-Bold="true" Font-Size="20px"></asp:LinkButton>
        </div>
        <br />

        <table id="grid" runat="server" border="0" width="80%" align="center" style="height:auto;">
        <tr>
            <td align="center" >
                <div id="Div1" runat="server" style="text-align:center;">
        <asp:GridView ID="gvEmployeePay" runat="server" AutoGenerateColumns="false"  CssClass="Grid" Width="100%" EmptyDataRowStyle-HorizontalAlign="Center" 
                  DataKeyNames="empid"  OnPageIndexChanging="gvEmployeePay_PageIndexChanging" >
 <Columns>                       
<asp:TemplateField HeaderText="Client  Name" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label1" runat="server" Text='<%#Eval("CName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
        
 <asp:TemplateField HeaderText="Employee name" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label1month" runat="server" Text='<%#Eval("efname") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee lastname" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label2" runat="server" Text='<%#Eval("elname") %>'></asp:Label>
</ItemTemplate>

</asp:TemplateField>
        
 <asp:TemplateField HeaderText="Employee ID" ItemStyle-Width="150px">
  <ItemTemplate>

<asp:Label ID="Label3" runat="server" Text='<%#Eval("empid") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
       
<asp:TemplateField HeaderText="actual_rate" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label7" runat="server" Text='<%#Eval("actual_rate") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

     <asp:TemplateField HeaderText="ot_rate" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label8" runat="server" Text='<%#Eval("ot_rate") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

 <asp:TemplateField HeaderText="week_rangefrom" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label9" runat="server" Text='<%#Eval("week_rangefrom","{0:MM/dd/yyyy}") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="week_rangeto" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label10" runat="server" Text='<%#Eval("week_rangeto","{0:MM/dd/yyyy}") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
             
<asp:TemplateField HeaderText="actualhours" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label11" runat="server" Text='<%#Eval("actualhours") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
             
<asp:TemplateField HeaderText="othours" ItemStyle-Width="150px">
<ItemTemplate>
<asp:Label ID="Label12" runat="server" Text='<%#Eval("othours") %>'></asp:Label>
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
   </form>
</body>
</html>
