<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_AllPaysheets.aspx.cs" Inherits="admin_Admin_AllPaysheets" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Pay Sheet </title>
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
function PrintGridData() {
var prtGrid = document.getElementById('pnlInPrint');
prtGrid.border = 0;
var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
prtwin.document.write(prtGrid.outerHTML);
prtwin.document.close();
prtwin.focus();
prtwin.print();
prtwin.close();

return true;
}
</script>
<style>
.under
{
	text-decoration: underline;
}
</style>
<style>
    .modalBackground 
{
   
    background-color:#EBEBEB;
    filter:alpha(opacity=70);
    opacity:0.7;
}
    #Gridview1
      {
      	border:1px solid Gray;
	padding:2px;
      }
   .GridviewScrollHeader TH, .GridviewScrollHeader TD 
{ 
	color: #00277a;
    padding: 5px;         
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: #EFEFEF; 
    text-align: center; 
   
} 
.GridviewScrollItem TD 
{ 
	color:Gray;
    padding: 5px;     
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: White; 
} 
.GridviewScrollPager  
{ 
    border-top: 1px solid #AAAAAA; 
    background-color: #FFFFFF; 
} 
.GridviewScrollPager TD 
{ 
	    padding-top: 3px; 
    font-size: 14px; 
    padding-left: 5px; 
    padding-right: 5px; 
} 
.GridviewScrollPager A 
{ 
    color: #00277a; 
}
.GridviewScrollPager SPAN
{
    font-size: 16px;
    font-weight: bold;
}
    </style>   
     <script type="text/javascript">
         function ConfirmationBox(userid) {
             var result = confirm('Are you sure you want to delete employee record ');
             if (result) {
                 return true;
             }
             else {
                 return false;
             }
         }
</script> 
<script type="text/javascript">
         function ConfirmationBox() {

             var result = confirm('Are you sure you want to delete employee record ');
             if (result) {

                 return true;
             }
             else {
                 return false;
             }
         }
</script>
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
<body id="body1" runat="server" >
    <form id="form1" runat="server">
     <div>
    <center>
<table width="998px" cellpadding="0"cellspacing="0" bgcolor="#ffffff" >
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr>
    <td>&nbsp;
    </td>
    </tr>
    <tr height="19">
    <td width="998px" align="center"  height="15" class="headings4" style="color:#174eb4;">Pay Sheets</td>                     
    </tr>
    <tr>
    <td>&nbsp;</td>
    </tr>
         <tr>
         <td align="center">
         <div style="width:998px; text-align:right">
       <a href="Admin_Paysheet.aspx" style="padding-right:10px; font-size:10pt"><< Back </a>&emsp;<br /><br /></div>
                <asp:GridView ID="Gridview1" runat="server" Width="998px" DataKeyNames="mpid"
                 ForeColor="#00277a"  AutoGenerateColumns="false" PageSize="5" AllowPaging="true" 
                   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 onpageindexchanging="MyGrid_PageIndexChanging" >
                <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
                <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
                <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right" /> 
                <Columns> 
                <asp:TemplateField HeaderText="S.No." ItemStyle-BorderColor="#CCCCCC" HeaderStyle-HorizontalAlign="Center" >
                      <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" ForeColor="Gray" Font-Names="arial" VerticalAlign="Middle"  Width="60" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <ItemStyle Width="15px" />
                        <HeaderStyle Width="15px" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>              
                 <asp:Label ID="lblFName" runat="server" Text='<%#Eval("firstname") %>'/> &nbsp;
                 <asp:Label ID="lblLName" runat="server"  Text='<%#Eval("lastname") %>'/> 
                </ItemTemplate>               
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Time">
                <ItemTemplate >
                <asp:Label ID="lblMonth" runat="server" Text='<%#Eval("mont") %>'  /> /
                <asp:Label ID="lblYear" runat="server" Text='<%#Eval("yer") %>'  />
                </ItemTemplate>                
                </asp:TemplateField>                 
                <asp:TemplateField HeaderText="Total Hours">
                <ItemTemplate>               
                        <asp:Label ID="lblHours" runat="server" Text='<%#Eval("totHours") %>'  />        
                </ItemTemplate>                               
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Actual Rate">                              
                <ItemTemplate>               
                <asp:Label ID="lblArate" runat="server"  Text='<%#Eval("ActualRate") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee Rate">                             
                <ItemTemplate>               
                <asp:Label ID="lblErate" runat="server"  Text='<%#Eval("EmpRate") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pre Balance">                              
                <ItemTemplate>               
                <asp:Label ID="lblPreBal" runat="server"  Text='<%#Eval("Prebal") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Advance">                             
                <ItemTemplate>               
                <asp:Label ID="lblTAdv" runat="server"  Text='<%#Eval("totAdva") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay Amount">                             
                <ItemTemplate>               
                <asp:Label ID="lblTotal" runat="server"  Text='<%#Eval("FinalPay") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ItemStyle-Width="25px" ItemStyle-BorderColor="#CCCCCC" HeaderText="View" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle ForeColor="Gray" Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"   Width="25" HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate >                                   
                                    <asp:ImageButton ID="imgbtnedit" width='20' height='20' runat="server"  ImageUrl="images/preview.png" OnClick="lnkviewrecord" />                                 
                              </ItemTemplate>                              
                   </asp:TemplateField>
                <asp:TemplateField >
               <ItemTemplate>                      
               <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
               <br />                                        
               </ItemTemplate>               
                </asp:TemplateField>            
                </Columns>
                </asp:GridView><br />
        <hr  />
        <br />
         </td>
         </tr> 
         <tr>
         <td style="color:#00277a" align="center">
         <asp:Panel ID="pnlTop" runat="server"  Visible="false">
         <asp:Panel ID="pnlInPrint" runat="server" >
         <table  width="998px" >
         <tr>
         <td width="150px" align="left">Name </td>
         <td width="10px">:</td>
         <td width="170px" align="left">
         <asp:Label ID="lblName" runat="server" CssClass="under"></asp:Label></td>
         <td ></td>
         <td width="150px" align="left">Employee Id</td>
         <td width="10px">:</td>
         <td width="170px" align="left">
          <asp:Label ID="lblId" runat="server" CssClass="under"></asp:Label>
          </td>
          <td></td>
         </tr>
         <tr>
         <td  align="left">Month </td>
         <td >:</td>
         <td  align="left">
         <asp:Label ID="lblMonth" runat="server" CssClass="under"></asp:Label></td>
         <td ></td>
         <td  align="left">Total Hours</td>
         <td >:</td>
         <td  align="left">
          <asp:Label ID="lblHours" runat="server" CssClass="under"></asp:Label>
          </td>
          <td></td>
         </tr>         
         <tr>
         <td  align="left">Immigration Type </td>
         <td >:</td>
         <td  align="left">
         <asp:Label ID="lblImmig" runat="server" CssClass="under"></asp:Label></td>
         <td ></td>
         <td  align="left">Bill Date</td>
         <td >:</td>
         <td  align="left">
          <asp:Label ID="lblBiDate" runat="server" CssClass="under"></asp:Label>
          </td>
          <td></td>
         </tr>
         <tr>
         <td  align="left">Pre Balance </td>
         <td>:</td>
         <td  align="left">
         <asp:Label ID="lblpBal" runat="server" CssClass="under"></asp:Label></td>
         <td></td>
         <td  align="left">Total Advance</td>
         <td>:</td>
         <td  align="left">
          <asp:Label ID="lblTAdvance" runat="server" CssClass="under"></asp:Label>
          </td>
          <td></td>
         </tr>
         </table> 
         <table  border="1px" width="998px" >
         <tr>
         <td align="center">Month Sheet</td>
         <td align="center">Rate</td>
         <td align="center">Debit Amount</td>
         <td align="center">Credit Amount</td>         
         </tr>
          <%--<tr>
         <td colspan="4"><hr /></td>         
         </tr>--%>
          <tr>
         <td align="left">Actual Rate</td>
         <td align="center"><asp:Label ID="lblARate" runat="server" ></asp:Label></td>
         <td></td>
         <td></td>
         </tr>
         <tr>
         <td align="left">Total Gross</td>
         <td></td>
         <td></td>
         <td align="center"><asp:Label ID="lblTGross" runat="server" ></asp:Label></td>
         </tr>
          <tr>
         <td align="left">Employee Rate</td>
         <td align="center"><asp:Label ID="lblERate" runat="server" ></asp:Label></td>
         <td ></td>
         <td></td>
         </tr>
         <tr>
         <td align="left">IGI Gross</td>
         <td></td>
         <td align="center"><asp:Label ID="lblIGI" runat="server" ></asp:Label></td>
         <td></td>
         </tr>
          <tr>
         <td align="left">Employee Gross</td>
         <td></td>
         <td ></td>
         <td align="center"><asp:Label ID="lblEGross" runat="server" ></asp:Label></td>
         </tr>
          <tr>
         <td align="left">Per Dium</td>
         <td></td>
         <td align="center"><asp:Label ID="lblpDium" runat="server" ></asp:Label></td>
         <td></td>
         </tr>
          <tr>
         <td align="left">Before Pay</td>
         <td></td>
         <td align="center"><asp:Label ID="lblBePay" runat="server" ></asp:Label></td>
         <td></td>
         </tr>
          <tr>
         <td align="left">Net Pay  </td>
         <td></td>
         <td ></td>
         <td align="center"><asp:Label ID="lblNetpay" runat="server" ></asp:Label>         
         </td>
         </tr>
          <tr>
         <td align="left">Pay Advance</td>
         <td></td>
         <td align="center"><asp:Label ID="lblPAdvance" runat="server"></asp:Label> </td>
         <td></td>
         </tr>
         <tr><td colspan="4"></td></tr>
          <tr>          
         <td align="left">Total Pay</td>
         <td></td>
         <td ></td>
         <td height="50" align="center">
         <hr />
         <asp:Label ID="lblTotPay" runat="server"></asp:Label>
         <hr />
         </td>
         </tr>
         </table>
         </asp:Panel>
         <br />
         <asp:Button ID="btnprint" runat="server" Text=" Print "  OnClientClick="PrintGridData()" OnClick="btnprint_Click"/>       
        </asp:Panel>
        <asp:Label ID="lblNoRecord" runat="server" Text="No Records Found"  ></asp:Label>
         </td>
         </tr>     
   </table>
     </center>
       
    </div>
    </form>
</body>
</html>
