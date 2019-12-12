<%@ Page Language="C#" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="Admin-Pendingaccounts.aspx.cs" Inherits="Admin_Pendingaccounts" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Src="~/Usercontrols/CommonControl.ascx" TagPrefix="uc2" TagName="CommonControl" %>--%>
<%--<%@ Register Src="~/usercontrols/Emp_topmenu.ascx" TagName="topmenu" TagPrefix="cc3" %>--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending-Accounts</title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .Grid td {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }
    </style>

     <link rel="stylesheet" href="Styles/stylesheet.css" />
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

    <style>
        .stimg {
            cursor: pointer;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>

        <center>


        <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
             <%-- <uc2:CommonControl ID="common" runat="server" />--%>
    </td>
    </tr>
      <tr><td height="30px"></td></tr>
        <tr>
     <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
     <table width='100%' border='0' cellspacing='0' cellpadding='0'>     
     <tr> <td align='center' bgcolor='white' width='70%'><font color='#003399' size='6pt'><b><u>Pending Accounts</u></b></font> </td>
        </tr>
       </table>
      </td>
    </tr>
     <tr><td height="20px"></td></tr>
    <tr><td height="30px">
    <table border="0" width="100%">
           <tr>
                <td height="20px" align="center">
                    <%--<asp:UpdatePanel ID="up" runat="server" UpdateMode="Always">
                        <ContentTemplate>--%>
                            Select Employee <span style="color:red">*</span>:
                             <asp:DropDownList ID="ddemp" runat="server" Width="250px" AutoPostBack="true"  OnSelectedIndexChanged="ddemp_SelectedIndexChanged"   >
                        <asp:ListItem>Select Employee</asp:ListItem>
                    </asp:DropDownList>
                       <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
                   
                </td>
            </tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
            <tr>
               <%-- <td height="20px" align="center">Select Report Type <span style="color:red">*</span>:
                    <asp:DropDownList ID="ddt" runat="server" Width="150px" AutoPostBack="true" OnTextChanged="ddt_TextChanged">
                   
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Billing Rate</asp:ListItem>
                    </asp:DropDownList> &nbsp; <asp:Label ID="lblerror" runat="server" ></asp:Label>
                </td>--%>
                <%--<td>OR </td>
                <td align="center" id="ind" runat="server">Search Employee By First Name :  
                    <asp:TextBox ID="txtserch" runat="server" Height="25px" Width="200px" Font-Size="14px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtserch"
                        WatermarkText="Search Employees with First Name" />
                    <cc1:AutoCompleteExtender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"
                        CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="txtserch"
                        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                    </cc1:AutoCompleteExtender>
                    <asp:Button ID="btnsearch" runat="server" Text="Search" Height="25px" Width="60px" OnClick="btnsearch_Click" />
                </td>--%>
            </tr>
         <tr>
                <td height="10px" align="center"></td>
            </tr>
    
            <tr>
                <td height="20px" align="center">
                    <asp:Button ID="btnsearch" runat="server" Text="Search" Width="80px" Font-Size="18px" OnClick="btnsearch_Click1"></asp:Button>
                </td>
            </tr>

            <tr><td align="left"><asp:LinkButton ID="lnk" runat="server" Text="Export Excel Sheet" Font-Bold="true" Font-Size="20px" OnClick="lnk_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbempinfo" runat="server" Font-Size="18px" ForeColor="Green"></asp:Label></td></tr>
            <tr>
                <td height="10px" align="center"></td>
            </tr>
       <tr>
           <td>
                <asp:GridView ID="gvEmployeePay" runat="server" AutoGenerateColumns="false" CssClass="Grid" Width="100%" EmptyDataRowStyle-HorizontalAlign="Center" OnRowCommand="gvEmployeePay_RowCommand"  
                     DataKeyNames="mpid" OnRowDeleting="gvEmployeePay_RowDeleting" OnRowDataBound="gvEmployeePay_RowDataBound" >

                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="HdnID" runat="server" Value='<%# Eval("mpid") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                          <asp:TemplateField ItemStyle-Width="2%">
            <ItemTemplate>
                   <asp:Image ID="imgchild" runat="server" ImageUrl="images/plus.png" CssClass="stimg" />
                <%--<img alt = "" style="cursor: pointer" src="images/plus.png" />--%>
                <asp:Panel ID="pnlHours" runat="server" Style="display: none">
                    <asp:GridView ID="gvHours" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="mpid" OnRowCommand="gvHours_RowCommand" CssClass = "ChildGrid"  >
                        <Columns>
                                <asp:BoundField ItemStyle-Width="80px" DataField="empid" HeaderText="Employee ID"  />
                        <asp:BoundField ItemStyle-Width="80px" DataField="paymonth" HeaderText="QB Payroll-Month"  />
                      <%--     <asp:BoundField ItemStyle-Width="80px" DataField="balance" HeaderText="Pay Roll Period(Week Range)"  />--%>
                     <%--   <asp:BoundField ItemStyle-Width="100px" DataField="deduction" HeaderText="Deduction"  />--%>

                            <asp:TemplateField  HeaderText="Deduction-Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lb" runat="server" Text='<%#Eval("deduction") %>'></asp:Label>
                                </ItemTemplate>
                                  <FooterTemplate>
            <asp:Label ID="lblTotal" runat="server" ForeColor="Black" Font-Bold="true" />
         </FooterTemplate>
                            </asp:TemplateField>
                       <%-- <asp:BoundField ItemStyle-Width="80px" DataField="total" HeaderText="Reg.Hour Total"  />--%>
                      <%--   <asp:BoundField ItemStyle-Width="80px" DataField="actual" HeaderText="Actual Rate"  />--%>
                   <%--     <asp:BoundField ItemStyle-Width="80px" DataField="ottotal" HeaderText="OT Total Hr."  />--%>
                       
                         <asp:BoundField ItemStyle-Width="150px" DataField="balance_remark" HeaderText="Remark"  />
                        <asp:BoundField ItemStyle-Width="150px" DataField="createddate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}"   />
   <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkdel" runat="server" Text="Delete" CommandArgument='<%#Eval("pid") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="deletegv"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns>
                        
                    </asp:GridView>
                    
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
                        <asp:BoundField ItemStyle-Width="80px" DataField="empid" HeaderText="Employee ID"  />
                        <asp:BoundField ItemStyle-Width="80px" DataField="mont" HeaderText="QB Payroll-Month"  />
                           <asp:BoundField ItemStyle-Width="80px" DataField="month_year" HeaderText="Pay Roll Period"  />

                          <asp:BoundField ItemStyle-Width="80px" DataField="total" HeaderText="Reg.Hour Total"  />
                         <asp:BoundField ItemStyle-Width="80px" DataField="actual" HeaderText="Actual Rate$"  />
                        <asp:BoundField ItemStyle-Width="80px" DataField="ottotal" HeaderText="OT Total Hr."  />
                          <asp:BoundField ItemStyle-Width="80px" DataField="ot_rate" HeaderText="OT Rate"  />
                        <asp:BoundField ItemStyle-Width="80px" DataField="emprate" HeaderText="Emp Rate $"  />
                            <asp:BoundField ItemStyle-Width="100px" DataField="empgross" HeaderText="Emp Gross $"  />

                         <asp:BoundField ItemStyle-Width="80px" DataField="pdium" HeaderText="Peridium $"  />
                        <asp:BoundField ItemStyle-Width="80px" DataField="rate_insurance" HeaderText="Insurance $"  />
                        <asp:BoundField ItemStyle-Width="100px" DataField="totgross" HeaderText="Total Gross $"  />
                      
                         
                          
                         <asp:BoundField ItemStyle-Width="120px" DataField="bepay" HeaderText="Balance"  />
                         <asp:BoundField ItemStyle-Width="150px" DataField="remark" HeaderText="Remark"  />

                        <asp:TemplateField HeaderText="Deduction" ItemStyle-Width="40px">
                 <ItemTemplate>
                     <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server" OnClientClick="return confirm('Are you sure you want to deduction this record?');"  ImageUrl="images/deduction.png"   CommandArgument='<%#Eval("mpId") %>'   CommandName="delete" />
                 </ItemTemplate>
             </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
           </td>

       </tr>
        <tr>
                <td height="10px" align="center"></td>
            </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lb2" runat="server" Text="Deleted Details" Font-Bold="true" Font-Size="20px" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>

            <td>
                <br />
            </td>
        </tr>

        

        <tr>
            <td align="left">
                <asp:Label ID="lbhead" runat="server" Text="Deduction" Font-Bold="true" Font-Size="20px"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                <table width="100%" id="temp" runat="server">
                   
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                       <tr>
                        <td align="left" width="5%">
                            <asp:Label ID="lblwmount" runat="server" Text="Amount :" Font-Size="16px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtdeduction" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>


                      <tr>
                        <td align="left" width="5%">
                            <asp:Label ID="Label1" runat="server" Text="Remark :" Font-Size="16px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtremark" runat="server" Width="250px" Height="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                       
                        <td  align="left"><asp:Button ID="btn" runat="server" Text="Save" OnClick="btn_Click"  Width="50px" Font-Size="16px"/>&nbsp; &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Cancel"   Width="70px" Font-Size="16px" OnClick="Button1_Click"/></td>
                    </tr>
                </table>
            </td>
        </tr>

    </table></td></tr></table></center>

    </form>
</body>
</html>
