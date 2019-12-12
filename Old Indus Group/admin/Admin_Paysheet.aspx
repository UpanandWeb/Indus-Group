<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Paysheet.aspx.cs" Inherits="admin_Admin_Paysheet" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title>Pay Sheet </title>
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
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
    font-weight: bold;     
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
    <%--<script>
   function body_onload()
   {
   document.getElementById("grd1").style.visibility = "hidden";

   }
    </script>--%>
     <%--<script type="text/javascript">
function PrintGridData() {
//document.getElementById("grd1").style.visibility = "visible";
document.getElementById("btnprint").style.visibility = "hidden";
document.getElementById("btnsave").style.visibility = "hidden";
//document.getElementById("btnps").style.visibility = "hidden";

var prtGrid = document.getElementById('pnlBord');
prtGrid.border = 0;
var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
prtwin.document.write(prtGrid.outerHTML);
prtwin.document.close();
prtwin.focus();
prtwin.print();
prtwin.close();
//document.getElementById("btnprint").style.visibility = "visible";
//document.getElementById("btnsave").style.visibility = "visible";
//document.getElementById("btnps").style.visibility = "visible";
}
</script>--%>
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
function SetFocus5(txtb)
{
if(txtb.value=="")
 {
  alert('Enter Number of Hours !!');
  txtb.focus();  
 } 
}
</script>
<script type="text/javascript">
function SetFocus6(txtbox)
{
if(txtbox.value=="")
 {
  alert('Enter Actual Amount !!');
 txtbox.focus();
 } 
}

</script>
<script type="text/javascript">
function SetFocusBP(txtbox)
{
if(txtbox.value=="")
 {
  alert('Please caliculate the net pay !!');
 document.getElementById('txtNewrate').focus();
 } 
}

</script>
<script type="text/javascript">
function SetFocus7(txtbo,txtnet)
{
if(txtnet.value=="")
{
 alert('Please caliculate the net pay !!');
 document.getElementById('txtNewrate').focus();
}
else
{
  if(txtbo.value=="")
   {
    alert('Please enter bonus percentage !!');
    txtbo.focus();
   } 
 }
}
</script>
<script type="text/javascript">
function setEmpty(t1,t2,t3,t4,t5)
{
if(t1.value=="")
 {
  t1.value="0";
 }
if(t2.value=="")
 {
  t2.value="0";
 }
 if(t3.value=="")
 {
  t3.value="0";
 }
 if(t4.value=="")
 {
  t4.value="0";
 } 
  t5.value="";
 
}
</script>
<script type="text/javascript">
function SetFocus(txt1,txt2)
{
var dat2=new Date(txt2.value);
var dat1 = new Date(txt1.value);
//dat1.setDate(dat1.getDate()+6);
if(txt1.value=="")
 {
  alert('Enter From date in this week !!');
  txt1.focus();
  txt2.value="";
 }
  else if(dat2.getTime() == dat1.getTime())
  {
  } 
 else if(dat2.getTime() <= dat1.getTime())
  {
   alert('To date is greater than (or) equal to From date !!');
   txt2.value="";
   } 
}
</script>
<script type="text/javascript">
function drop(ddl)
{
   if(ddl.selectedIndex>0)
    {      
   
    }
    else
    {    
    alert('please select employee id');  
    
    }
     
}
</script>
<script type="text/javascript"  language="javascript">
    function valid(txt2)   
    {        
    txt2.value="";  
    }    
    </script> 
<script type="text/javascript"  language="javascript">
    function Setvalue(tgross,txtb)   
    {      
    if(tgross.value=="")
    {
    txtb.value="";
    alert('Caliculate Employee Gross First');    
    }
    }    
    </script>
    <script type="text/javascript"  language="javascript">
    function focEmoty(txtb,txtfdate)   
    {   
    if(txtfdate.value=="")
    {
    alert('select from date for this week');
    txtfdate.focus();
    }
    else
    {  
     txtb.value="";     
     }
    }    
    </script>
    <script type="text/javascript"  language="javascript">
    function focEmoty1(txtfdate)   
    {   
    if(txtfdate.value=="")
    {
    alert('select from date for this week');
    txtfdate.focus();
    }    
    }    
    </script>
    <script language="javascript" type="text/javascript">
    function message()
    {
      alert("please check the due amount !!!");
    }    
    </script>
     
    
</head>
<%--<body  onload="body_onload();">--%>
<body id="body1" runat="server" >
    <form id="form1" runat="server">
     <div>
    <center>
     <cc1:ToolkitScriptManager ID="scrst" runat="server"></cc1:ToolkitScriptManager>     
<table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
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
    <td width="998px" align="center"  height="15" class="headings4" style="color:#174eb4;">Pay Sheet</td>                     
    </tr>
    <tr>
    <td>&nbsp;</td>
    </tr>
    <tr>
    <td>
    <div style="text-align:right; width:990px; padding-right:10px"> <a id="allpay" runat="server" href="Admin_AllPaysheets.aspx" >View all paysheets</a></div>
    <asp:UpdatePanel ID="update1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="pnlBord" runat="server" BorderWidth="1" BorderColor="Gray">
    <table width="998px" style="color:#00277a; font-size:9pt" id="tab1" >
        <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold">Basic Details</td></tr>
        <tr>
         <td width="2px"></td>                                                           
        <td align="left" width="120px">Employee Id</td>
        <td width="5px" align="center">:</td>
        <td align="left"><%--<asp:TextBox ID="txtEmpId" runat="server" Width="150px"></asp:TextBox>--%>
        <asp:DropDownList ID="ddlEmpId" runat="server" AutoPostBack="true" Width="150px" OnSelectedIndexChanged="ddlEmpId_Changed"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="requi1" runat="server" InitialValue="Select" ControlToValidate="ddlEmpId" ValidationGroup="g1" >*</asp:RequiredFieldValidator>
        </td>  
        <td width="2px"></td> 
        <td align="left" width="120px">First Name</td>                                                           
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtFname" runat="server" Width="150px" onfocus="javascript:drop(document.getElementById('ddlEmpId'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="req1" runat="server" ValidationGroup="g1" ControlToValidate="txtFname">*</asp:RequiredFieldValidator>
        </td>
        <td width="2px"></td>
        <td align="left" width="120px">Last Name</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtLname" runat="server" Width="150px" onfocus="javascript:drop(document.getElementById('ddlEmpId'));"></asp:TextBox></td> 
                 
        </tr>
        <tr><td></td>
        <td align="left">Type Of Payment</td>
        <td>:</td>
        <td colspan="9" align=left>
        <asp:RadioButtonList ID="rdlist" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem Text="Monthly" Value="0" Selected="True"></asp:ListItem>
        <asp:ListItem Text="Semi_Monthly" Value="1"></asp:ListItem>
        </asp:RadioButtonList>
        </td></tr>
         <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold">Working Details</td></tr>
         <%--<tr>
       <td colspan="12">
        <table width="900px" style="color:#00277a; font-size:9pt">--%>
        <tr>
        <%--<td width="2px"></td>
        <td align="left">Week 1 &#9658;</td>--%>
        <td width="5px"></td>
        <td align="left"> Week 1 &#9658; &emsp; From</td>
        <td width="5px" align="center"> :</td>
        <td align="left"> <asp:TextBox ID="txtFWeek1" runat="server" Width="150px" 
         onchange="javascript:valid(document.getElementById('txtTWeek1'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="g1" ControlToValidate="txtFWeek1">*</asp:RequiredFieldValidator>
        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFWeek1"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">To</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTWeek1" runat="server" Width="150px" 
         onchange="javascript:SetFocus(document.getElementById('txtFWeek1'),document.getElementById('txtTWeek1'));"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="g1" ControlToValidate="txtTWeek1">*</asp:RequiredFieldValidator>               
        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtTWeek1"></cc1:CalendarExtender>        
        </td>
        <td width="5px"></td>
        <td align="left">Hours</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtHWeek1" runat="server" Width="150px" ValidationGroup="g1" MaxLength="2" AutoPostBack="true"
         onfocus="javascript:focEmoty(document.getElementById('txtHWeek1'),document.getElementById('txtFWeek1'))"
         onchange="javascript:setEmpty(document.getElementById('txtHWeek1'),document.getElementById('txtHWeek2'),document.getElementById('txtHWeek3'),document.getElementById('txtHWeek4'),document.getElementById('txtHWeek5'));" ></asp:TextBox>
        <cc1:FilteredTextBoxExtender ID="filter1" runat="server" TargetControlID="txtHWeek1" ValidChars="0123456789" FilterType="Numbers" FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="g1" ControlToValidate="txtHWeek1">*</asp:RequiredFieldValidator>        
        </td>
        </tr>
        <tr>
        <%--<td width="2px"></td>
        <td align="left">Week 2 &#9658;</td>--%>
        <td width="5px"></td>
        <td align="left">Week 2 &#9658; &emsp;From</td>
        <td width="5px" align="center"> :</td>
        <td align="left"> <asp:TextBox ID="txtFWeek2" runat="server" Width="150px" onchange="javascript:valid(document.getElementById('txtTWeek2'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="g1" ControlToValidate="txtFWeek2">*</asp:RequiredFieldValidator>        
        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtFWeek2"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">To</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTWeek2" runat="server" Width="150px"
         onchange="javascript:SetFocus(document.getElementById('txtFWeek2'),document.getElementById('txtTWeek2'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="g1" ControlToValidate="txtTWeek2">*</asp:RequiredFieldValidator>        
         <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtTWeek2"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">Hours</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtHWeek2" runat="server" Width="150px" ValidationGroup="g1" MaxLength="2" AutoPostBack="true"
         onfocus="javascript:focEmoty(document.getElementById('txtHWeek2'),document.getElementById('txtFWeek2'))"
         onchange="javascript:setEmpty(document.getElementById('txtHWeek1'),document.getElementById('txtHWeek2'),document.getElementById('txtHWeek3'),document.getElementById('txtHWeek4'),document.getElementById('txtHWeek5'));" ></asp:TextBox>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHWeek2" ValidChars="0123456789" FilterType="Numbers" FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="g1" ControlToValidate="txtHWeek2">*</asp:RequiredFieldValidator>        
        </td>
        </tr>
        <tr>
       <%-- <td width="2px"></td>
        <td align="left">Week 3 &#9658;</td>--%>
        <td width="5px"></td>
        <td align="left">Week 3 &#9658; &emsp;From</td>
        <td width="5px" align="center"> :</td>
        <td align="left"> <asp:TextBox ID="txtFWeek3" runat="server" Width="150px" onchange="javascript:valid(document.getElementById('txtTWeek3'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="g1" ControlToValidate="txtFWeek3">*</asp:RequiredFieldValidator>        
        <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtFWeek3"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">To</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTWeek3" runat="server" Width="150px" 
        onchange="javascript:SetFocus(document.getElementById('txtFWeek3'),document.getElementById('txtTWeek3'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="g1" ControlToValidate="txtTWeek3">*</asp:RequiredFieldValidator>        
         <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtTWeek3"> </cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">Hours</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtHWeek3" runat="server" Width="150px" ValidationGroup="g1" MaxLength="2" AutoPostBack="true"
         onfocus="javascript:focEmoty(document.getElementById('txtHWeek3'),document.getElementById('txtFWeek3'))"
        onchange="javascript:setEmpty(document.getElementById('txtHWeek1'),document.getElementById('txtHWeek2'),document.getElementById('txtHWeek3'),document.getElementById('txtHWeek4'),document.getElementById('txtHWeek5'));" ></asp:TextBox>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHWeek3" ValidChars="0123456789" FilterType="Numbers" FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="g1" ControlToValidate="txtHWeek3">*</asp:RequiredFieldValidator>        
        </td>  
        </tr>
        <tr>
      <%--  <td width="2px"></td>
        <td align="left">Week 4 &#9658;</td>--%>
        <td width="5px"></td>
        <td align="left">Week 4 &#9658; &emsp;From</td>
        <td width="5px" align="center"> :</td>
        <td align="left"> <asp:TextBox ID="txtFWeek4" runat="server" Width="150px" onchange="javascript:valid(document.getElementById('txtTWeek4'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="g1" ControlToValidate="txtFWeek4">*</asp:RequiredFieldValidator>        
        <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtFWeek4"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">To</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTWeek4" runat="server" Width="150px" 
         onchange="javascript:SetFocus(document.getElementById('txtFWeek4'),document.getElementById('txtTWeek4'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="g1" ControlToValidate="txtTWeek4">*</asp:RequiredFieldValidator>        
         <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtTWeek4"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">Hours</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtHWeek4" runat="server" Width="150px" AutoPostBack="true" MaxLength="2"
         onfocus="javascript:focEmoty(document.getElementById('txtHWeek4'),document.getElementById('txtFWeek4'))" ValidationGroup="g1"
          onchange="javascript:setEmpty(document.getElementById('txtHWeek1'),document.getElementById('txtHWeek2'),document.getElementById('txtHWeek3'),document.getElementById('txtHWeek4'),document.getElementById('txtHWeek5'));"  ></asp:TextBox>
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHWeek4" ValidChars="0123456789" FilterType="Numbers" FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="g1" ControlToValidate="txtHWeek4">*</asp:RequiredFieldValidator>        
          </td>      
        </tr>        
        <tr>
        <%--<td width="2px"></td>
        <td align="left">Week 5 &#9658;</td>--%>
        <td width="5px"></td>
        <td align="left">Week 5 &#9658; &emsp;From</td>
        <td width="5px" align="center"> :</td>
        <td align="left"> <asp:TextBox ID="txtFWeek5" runat="server" Width="150px" onchange="javascript:valid(document.getElementById('txtTWeek5'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="g1" ControlToValidate="txtFWeek5">*</asp:RequiredFieldValidator>        
        <cc1:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="txtFWeek5"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">To</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTWeek5" runat="server" Width="150px" 
         onchange="javascript:SetFocus(document.getElementById('txtFWeek5'),document.getElementById('txtTWeek5'));"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="g1" ControlToValidate="txtTWeek5">*</asp:RequiredFieldValidator>        
         <cc1:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtTWeek5"></cc1:CalendarExtender>
        </td>
        <td width="5px"></td>
        <td align="left">Hours</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtHWeek5" runat="server" Width="150px" AutoPostBack="true" MaxLength="2"  
             onfocus="javascript:focEmoty1(document.getElementById('txtFWeek5'))" ValidationGroup="g1" OnTextChanged="txtH_Click"></asp:TextBox>
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtHWeek5" ValidChars="0123456789" FilterType="Numbers" FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="g1" ControlToValidate="txtHWeek5">*</asp:RequiredFieldValidator>        
          </td>      
        </tr>
        <%--</table>
        </td>
        </tr>--%>
        <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold">Payment details for <asp:Label ID="lblMonth" runat="server" ></asp:Label> </td></tr>
        <tr>
        <td></td>
        <td align="left" width="130px">Total Hours </td>
          <td width="5px" align="center">:</td>
           <td align="left"> <asp:TextBox ID="txtTHrs" runat="server" Width="150px" Enabled="false" ></asp:TextBox>Hrs.  </td>
           <td></td>
           <td align="left">Total Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtTotGross" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       <td></td>
       <td colspan="3" align="left"> <<< ( (Total Hours) * (Actual Rate) )</td>
              
        </tr>
        <tr>
        <td></td>
        <td align="left">Actual Rate </td>
          <td width="5px" align="center">:</td>
           <td align="left">
            <asp:TextBox ID="txtARate" runat="server" Width="150px" AutoPostBack="true"
             onfocus="javascript:SetFocus5(document.getElementById('txtHWeek5'));"
             OnTextChanged="txtA_Click" ></asp:TextBox>$ 
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtARate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>             
             </td>             
       <td></td>
       <td align="left">IGI Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtIGI" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       <td></td>
             <td align="left">Minus Percentage</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtMinusPer" runat="server" Width="150px" Enabled="false" ></asp:TextBox>%</td>
        </tr>
        <tr>
        <td></td>
        <td align="left">Employee Rate </td>
          <td width="5px" align="center">:</td>
           <td align="left"><asp:TextBox ID="txtEmRate" runat="server" Width="150px" AutoPostBack="true"
            onfocus="javascript:SetFocus6(document.getElementById('txtARate'));"
            OnTextChanged="txtE_Click" ></asp:TextBox>$ 
             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtEmRate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
             </td>
             <td></td>
             <td align="left">Employee Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtEmpGross" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       <td></td>
       <td colspan="3" align="left"> <<< ( (Total Gross) - (IGI Gross) )</td> 
       
        </tr>
        <tr>
        <td></td>
        <td align="left">Per Dium</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtPDium" runat="server" Width="150px" AutoPostBack="true"
        onchange="javascript:Setvalue(document.getElementById('txtEmpGross'),this);" OnTextChanged="FornetSal_change" ></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtPDium" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        <td></td>
            <td align="left" >Ins. Before pay</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtNewrate" runat="server" Width="150px" AutoPostBack="true" 
        onchange="javascript:Setvalue(document.getElementById('txtEmpGross'),this);" OnTextChanged="FornetSal_change"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtNewrate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        <td></td>
        <td align="left">Net Pay</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtNetpay" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
        </tr>
        
        <%--<tr>
        <td colspan="6" style="padding-left:2px" valign="top">
       <table width="490px" style="color:#00277a; font-size:9pt">
       <tr>       
         <td align="left" width="130px">Total Hours </td>
          <td width="5px" align="center">:</td>
           <td align="left"> <asp:TextBox ID="txtTHrs" runat="server" Width="150px" Enabled="false" ></asp:TextBox>Hrs.  </td>
       </tr>
       <tr>
       <td align="left">Actual Rate </td>
          <td width="5px" align="center">:</td>
           <td align="left">
            <asp:TextBox ID="txtARate" runat="server" Width="150px" AutoPostBack="true"
             onfocus="javascript:SetFocus5(document.getElementById('txtHWeek5'));"
             OnTextChanged="txtA_Click" ></asp:TextBox>$ 
          <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtARate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>             
             </td>
       </tr>
       <tr>
        <td align="left">Employee Rate </td>
          <td width="5px" align="center">:</td>
           <td align="left"><asp:TextBox ID="txtEmRate" runat="server" Width="150px" AutoPostBack="true"
            onfocus="javascript:SetFocus6(document.getElementById('txtARate'));"
            OnTextChanged="txtE_Click" ></asp:TextBox>$ 
             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtEmRate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
             </td>
       </tr>
       <tr>
       <td align="left">Per Dium</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtPDium" runat="server" Width="150px" AutoPostBack="true"
        onchange="javascript:Setvalue(document.getElementById('txtEmpGross'),this);" OnTextChanged="FornetSal_change" ></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtPDium" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
       </tr>
       <tr>       
        <td align="left" >Ins. Before pay</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtNewrate" runat="server" Width="150px" AutoPostBack="true" 
        onchange="javascript:Setvalue(document.getElementById('txtEmpGross'),this);" OnTextChanged="FornetSal_change"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtNewrate" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        </tr>
       </table>
        </td>
        <td colspan="6">
       <table width="490px" style="color:#00277a; font-size:9pt">
       <tr>
       <td align="left">Total Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtTotGross" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       </tr>
       <tr>
       <td align="left">Minus Percentage</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtMinusPer" runat="server" Width="150px" Enabled="false" ></asp:TextBox>%</td>
       </tr>
       <tr>
       <td align="left">IGI Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtIGI" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       </tr>
       <tr>
       <td align="left">Employee Gross</td>
       <td width="5px" align="center">:</td>
       <td align="left"><asp:TextBox ID="txtEmpGross" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
       </tr>
       <tr>
        <td align="left">Net Pay</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtNetpay" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
        </tr>
       </table>
        </td>
        </tr>--%>
        <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold">Des of Ded <asp:Label ID="lblNext" runat="server" ></asp:Label> </td></tr>        
        
        <tr>
        <td></td>
        <td align="left">Salary</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtSalary" runat="server" Width="150px" AutoPostBack="true"
         onfocus="javascript:SetFocusBP(document.getElementById('txtNetpay'));"  OnTextChanged="sala_Changed" ></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtSalary" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        <td></td>
        <td align="left">Immigration status</td>
        <td width="5px" align="center">:</td>
        <td align="left">
        <asp:DropDownList ID="ddlImmig" runat="server" Width="150" >
         <asp:ListItem Value="Select" Text="Select" ></asp:ListItem>
        <asp:ListItem Value="Citizen" Text="Citizen" ></asp:ListItem>
         <asp:ListItem Value="Green card holder" Text="Green card holder" ></asp:ListItem>
         <asp:ListItem Value="H-1B Visa" Text="H-1B Visa" ></asp:ListItem>
         <asp:ListItem Value="OPT Visa" Text="OPT Visa" ></asp:ListItem>
         <asp:ListItem Value="EAD Visa" Text="EAD Visa" ></asp:ListItem>
         <asp:ListItem Value="L-2 Visa" Text="L-2 Visa" ></asp:ListItem>
        </asp:DropDownList>        
        <asp:RequiredFieldValidator ID="reqddl" runat="server" InitialValue="Select" ControlToValidate="ddlImmig" ValidationGroup="g1">*</asp:RequiredFieldValidator>
        </td>        
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        </tr>
        <tr>
        <td></td>
        <td align="left">Bonus</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtBonus" runat="server" Width="150px" onfocus="javascript:SetFocus7(document.getElementById('txtBPer'),document.getElementById('txtNetpay'));" 
         AutoPostBack="true" OnTextChanged="Sal_Changed"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtBonus" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        <td></td>
        <td align="left">Pre balance</td>
        <td width="5px">:</td>
        <td align="left"><asp:TextBox ID="txtTotal" runat="server" Width="150" Enabled="false"> </asp:TextBox>$</td>
        <td></td>
        <td align="left">Total advance</td>
        <td align="center">:</td>
        <td align="left"><asp:TextBox ID="txtTAdvance" runat="server" Enabled="false" 
                Width="150px" ></asp:TextBox>$</td>
        </tr>
        <tr>
        <td></td>
        <td align="left" width="130px">Pay advance</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtAdvance" runat="server" Width="150px" AutoPostBack="true"
         onfocus="javascript:SetFocusBP(document.getElementById('txtNetpay'));" OnTextChanged="txtAdvances_Click"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtAdvance" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        <td></td>
        <td align="left">Gross after deduct</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtGDeduct" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>        
        <td></td>
        <td align="left">Total Pay</td>
        <td align="center">:</td>
        <td align="left"><asp:TextBox ID="txtFinalTotal" Width="150px" runat="server" Enabled="false"></asp:TextBox>$</td>
        </tr>
        <%--<tr>
        <td width="450px" style="padding-left:2px;" colspan="6">
        <table width="400px" style="color:#00277a; font-size:9pt">        
        <tr>
        <td align="left" width="130px">Pay advance</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtAdvance" runat="server" Width="150px"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtAdvance" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        </tr>
        <tr>
        <td align="left">Salary</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtSalary" runat="server" Width="150px" AutoPostBack="true" OnTextChanged="Sal_Changed"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtSalary" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        </tr>
        <tr>
        <td align="left">Bonus</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtBonus" runat="server" Width="150px" 
        onfocus="javascript:SetFocus7(document.getElementById('txtSalary'));"  AutoPostBack="true" OnTextChanged="Sal_Changed"></asp:TextBox>$
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtBonus" 
          ValidChars="0123456789." FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>
        </td>
        </tr>
        </table>
        </td> 
        <td colspan="6" valign="top">
        <table width="490" style="color:#00277a; font-size:9pt">
        <tr>
        <td align="left">Total Advance</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtRadvance" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
        </tr>
        <tr>
        <td align="left">Gross after deduct</td>
        <td width="5px" align="center">:</td>
        <td align="left"><asp:TextBox ID="txtGDeduct" runat="server" Width="150px" Enabled="false"></asp:TextBox>$</td>
        </tr>
        <tr>
        <td align="left">Immigration status</td>
        <td width="5px" align="center">:</td>
        <td align="left">
        <asp:DropDownList ID="ddlImmig" runat="server" Width="150" >
         <asp:ListItem Value="Select" Text="Select" ></asp:ListItem>
        <asp:ListItem Value="Citizen" Text="Citizen" ></asp:ListItem>
         <asp:ListItem Value="Green card holder" Text="Green card holder" ></asp:ListItem>
        </asp:DropDownList>        
        <asp:RequiredFieldValidator ID="reqddl" runat="server" InitialValue="Select" ControlToValidate="ddlImmig" ValidationGroup="g1">*</asp:RequiredFieldValidator>
        </td>
        </tr>
        </table>
        </td>       
        </tr>--%>
       <%-- <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold">Total Amount </td></tr> 
        <tr >        
    <td colspan="12" style="padding-left:2px;" align="center">
        <table style="color:#00277a; font-size:9pt">
        <tr>
        <td align="left">   
        </td>
        </tr>       
        </table>
        </td>            
        </tr> --%>
         <tr bgcolor="#eaf9ff"><td colspan="12" align="left" style="font-weight:bold" height="15"></td></tr> 
        <tr ><td colspan="12" align="center" >
        <%-- <asp:Button ID="btnprint" runat="server" Text=" Print " ValidationGroup="g1" />&emsp;&emsp;--%>
       <%--<asp:Button ID="btnprint" runat="server" Text=" Print " ValidationGroup="g1" OnClientClick="PrintGridData()"/>&emsp;&emsp;--%>
        <asp:Button ID="btnsave" runat="server" Text=" Save " ValidationGroup="g1" OnClick="btnSave_Click" />&emsp; &emsp;
        <%--<asp:Button ID="btnps" runat="server" Text=" Print & Save "  ValidationGroup="g1" OnClientClick="PrintGridData()" OnClick="btnSave_Click"/>--%>
        </td></tr> 
        <tr><td >&nbsp;</td></tr>      
        </table>
     </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>                
    </td>
    </tr>           
    </table>
     </center>
     <asp:Label ID="lblusers" runat="server" Visible="false" /> 
     <asp:Label ID="lbladva" runat="server" Visible="false" />
     <asp:Label ID="lblpre" runat="server" Visible="false" />  
     <asp:Label ID="lbltotAdv" runat="server" Visible="false" /> 
     <cc1:ModalPopupExtender ID="mdpop" runat="server" TargetControlID="lbltarget" PopupControlID="tblpop"
      CancelControlID="spn" BackgroundCssClass="modalBackground" >
     </cc1:ModalPopupExtender>
      <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Label3" PopupControlID="Table1"
      CancelControlID="Span1" BackgroundCssClass="modalBackground" >
     </cc1:ModalPopupExtender>
      <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Label4" PopupControlID="Table2"
      CancelControlID="Span2" BackgroundCssClass="modalBackground" >
     </cc1:ModalPopupExtender>
     <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Label5" PopupControlID="Table3"
      BackgroundCssClass="modalBackground" >
     </cc1:ModalPopupExtender>
     <table id="tblpop" runat="server" height="150" width="400"  bgcolor="white">
     <tr>     
     <td align="center" valign="middle" width="390">
     <asp:Label ID="lblpopmessage" runat="server"  ForeColor="Green" Text="Payment details saved successfully !!" 
       Font-Names="Times New Roman, Times, serif"></asp:Label>     
     </td>
     <td valign="top" align="right"><span id="spn" runat="server" style="color:Red; cursor:pointer; font-size:large">X</span></td>
     </tr>
     </table>
     
     <table id="Table1" runat="server" height="150" width="400"  bgcolor="white">
     <tr>     
     <td align="center" valign="middle" width="390">   
     <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Payment details saved fail" Font-Names="Times New Roman, Times, serif"  ></asp:Label> 
     </td>
     <td valign="top" align="right"><span id="Span1" runat="server" style="color:Red; cursor:pointer; font-size:large">X</span></td>
     </tr>
     </table>  
     
     <table id="Table2" runat="server" height="150" width="400"  bgcolor="white">
     <tr>     
     <td align="center" valign="middle" width="390">
     <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Please check the total advance amount" Font-Names="Times New Roman, Times, serif"  ></asp:Label>
     </td>
     <td valign="top" align="right"><span id="Span2" runat="server" style="color:Red; cursor:pointer; font-size:large">X</span></td>
     </tr>
     </table> 
       
      <table id="Table3" runat="server" height="100" width="500"  bgcolor="white">
     <tr>     
     <td align="center" valign="middle" width="390">
     <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Already make a payment for this employee, in this month" Font-Names="Times New Roman, Times, serif"  ></asp:Label>
     </td>
     <td valign="top" align="right">
     <a href="Admin_Paysheet.aspx" style="color:Red; font-size:large">X</a>
     </td>
     </tr>
     </table> 
       
     <asp:Label ID="lbltarget" runat="server" ></asp:Label>
     <asp:Label ID="Label3" runat="server" ></asp:Label>
     <asp:Label ID="Label4" runat="server" ></asp:Label>
    </div>
    </form>
</body>
</html>
