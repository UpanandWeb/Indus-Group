<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Appointments.aspx.cs" Inherits="admin_Admin_Appointments" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - Appointments</title>

<link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
<link href="Styles/style.css" rel="stylesheet" type="text/css" />
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
function textCounter(field, countfield, maxlimit)
{
if (field.value.length > maxlimit)
   field.value = field.value.substring(0, maxlimit);
else
   countfield.value = maxlimit - field.value.length;
}
</script>
<script>
function Booked()
{
alert(" Appointment booked sucessfully ");
}
</script>
<script>
function Update()
{
alert(" Appointment updated sucessfully ");
}
</script>
<script>
function Error()
{
alert("Error! Make sure your internet connection");
}
</script>
<script>
function CanelApp()
{
alert("Appointment cancel sucessfully");
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" rightmargin="0" style="background-color:white">
    <form id="form1" runat="server">
    <div>
    <center>
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
                    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;">Appointments</td>
                     
                </tr>
                <tr>
                <td>&nbsp;</td>
                </tr>
               
                <tr>
                <td>
                <table width="998px" style="color:#174eb4"  >
                <tr>
                
                <td  align="left">Select Date : <asp:DropDownList ID="ddlDates" runat="server" Width="140px" OnSelectedIndexChanged="ddlDates_bind" AutoPostBack="true" />               
                 <span style="font-size:8pt">(for appointments)</span>
                </td>
                
                <td align="right" valign="top" style="padding-right:5px">
                &emsp;
                <span style="font-size:9pt">Welcome</span> &emsp;
                <asp:Label ID="lblUser" runat="server" Font-Bold="true" ForeColor="#174eb4" />
                &emsp;<span style="color:Maroon">
                <asp:LinkButton ID="lnkMyapntmt" runat="server"  Text="[My Appointment]" OnClick="lnkMyapntmt_Click" /></span>              
                
                </td>
                </tr>
                <tr>
                <td colspan="2">
                <div style="width:998px; text-align:center; font-size:medium; background-color:AliceBlue">
                <asp:Label ID="lblFullDate" runat="server"  />
                </div>
                <div style="text-align:right; font-size:8pt; color:Green; padding-right:10px;"><span>Please Click on Available</span></div>
                </td>
                </tr>
                <tr>
                <td colspan="2">
                <asp:GridView ID="Gridview1" runat="server" OnRowDataBound="MyGrid_RowDataBound"
                 Width="998px" DataKeyNames="id"  AutoGenerateColumns="false">
                <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
                <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
                <PagerStyle CssClass="GridviewScrollPager" /> 
                <Columns>
                <asp:TemplateField>
                <HeaderStyle Width="15px" />                
                <ItemTemplate>
                <asp:ImageButton ID="imgCal" Width="10" Height="10" runat="server" ImageUrl="~/images/calender.gif" OnCommand="immg_command"
                  Visible="false" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time (EST)">
                <ItemTemplate >
                <asp:Label ID="lblEst" runat="server" Text='<%#Eval("time_est") %>'  />
                </ItemTemplate>
                <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Appointment">
                <ItemStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                <ItemTemplate>               
                <asp:Label ID="lblBooked" runat="server" Visible="false" Text="Booked" ForeColor="Red" />
                <asp:LinkButton ID="lnkAvilable" runat="server" Text="Available"  Enabled="false"  Visible="false" ForeColor="Green" OnCommand="avil_command" />
                &emsp;&emsp;
               <%-- <asp:Label ID="txtAppoint" runat="server"  Text='<%#Eval("app_titile") %>' Visible="false" />  --%>
                 <asp:Label ID="txtAppoint" runat="server"  Visible="false" />        
                </ItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Phone">
                <ItemTemplate>
               <%-- <asp:Label ID="txtPhone" runat="server"  Text='<%#Eval("phone") %>' Visible="false" /> &nbsp;
                <asp:Label ID="txtmobile" runat="server"  Text='<%#Eval("mobile") %>' Visible="false" />--%>
                 &nbsp;<asp:Label ID="txtPhone" runat="server"  Visible="false" /> &nbsp;
                <asp:Label ID="txtmobile" runat="server"  Visible="false" />
                </ItemTemplate>
                <ItemStyle Width="100px" />                
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Comments">
                <ItemTemplate>
               <%-- <asp:Label ID="lblComments" runat="server" Text='<%#Eval("app_descr") %>' Visible="false" />--%>
                 <asp:Label ID="lblComments" runat="server" Visible="false" />
                </ItemTemplate>
                <HeaderStyle Width="150px" />
                <ItemStyle Width="150px" />
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Appointment Type" >
                <ItemTemplate >
                <%--<asp:Label ID="lblType" runat="server" Text='<%#Eval("app_type") %>' Visible="false"  />--%>
                <asp:Label ID="lblType" runat="server" Visible="false"  />
                </ItemTemplate>
                <ItemStyle Width="100px" />
                </asp:TemplateField>            
                </Columns>
                </asp:GridView>
                </td>
                </tr>
                </table>
                </td>
                </tr>                
    </table> 
    <cc1:ToolkitScriptManager ID="scrst" runat="server"></cc1:ToolkitScriptManager>
    <asp:Label ID="lbltest1" runat="server"  ></asp:Label>
    <asp:Label ID="lbltest2" runat="server"  ></asp:Label>
      <cc1:ModalPopupExtender ID="modal1" runat="server" TargetControlID="lbltest1" PopupControlID="popDiv"
       CancelControlID="btnBack" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>               
      <cc1:ModalPopupExtender ID="modal2" runat="server" TargetControlID="lbltest2" PopupControlID="popEditdiv" 
        CancelControlID="btnEBack" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<div id="popDiv" runat="server" style="border:1px solid Gray; width:455px; background-color:White">
    <table id="Table1" width="450px" runat="server" >
    <tr>
    <td colspan="3" align="center" height="30" valign="middle" style="font-weight:bold; font-size:11pt; background-color:#DBD0DD">
    Add Appointment <asp:Label ID="lbladdDate" runat="server" />    
    </td>
    </tr>
    <tr>
    <td align="left" width="40%">Phone No</td>
    <td width="10px" ><b>:</b></td>
    <td align="left" width="55%">
    <asp:TextBox ID="txtphno" runat="server" Width="200" MaxLength="10" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="req1"  runat="server" ControlToValidate="txtphno" ValidationGroup="g1" >*</asp:RequiredFieldValidator>
    <cc1:FilteredTextBoxExtender ID="filter1" runat="server" FilterMode="ValidChars" TargetControlID="txtphno" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphno" ValidationGroup="g1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
    
    </td>
    </tr>
    <tr>
    <td align="left" >Mobile No</td>
    <td  ><b>:</b></td>
    <td align="left">
    <asp:TextBox ID="txtmbno" runat="server" Width="200" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ControlToValidate="txtmbno" ValidationGroup="g1" >*</asp:RequiredFieldValidator>
    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterMode="ValidChars" TargetControlID="txtmbno" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtmbno" ValidationGroup="g1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
    
    </td>
    </tr>
    <tr>
    <td align="left">Appointment Title</td>
    <td  ><b>:</b></td>
    <td align="left">
    <asp:TextBox ID="txtapptitle" runat="server" Width="200" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ControlToValidate="txtapptitle" ValidationGroup="g1" >*</asp:RequiredFieldValidator>
    
    </td>
    </tr>
    <tr>
    <td align="left" >Appointment Type</td>
    <td ><b>:</b></td>
    <td align="left" >
   <asp:DropDownList ID="ddlType" runat="server" Width="200">
   <asp:ListItem Text="Select Type" />
   <asp:ListItem Value="Office Appointment" Text="Office Appointment" />
   <asp:ListItem Value="Training Appointment" Text="Training Appointment" />
   <asp:ListItem Value="Travel Appointment" Text="Travel Appointment" />
   <asp:ListItem Value="Consulting Appointment" Text="Consulting Appointment" />
   </asp:DropDownList> 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  runat="server" ControlToValidate="ddlType" 
      InitialValue="Select Type" ValidationGroup="g1" >*</asp:RequiredFieldValidator>   
    </td>
    </tr>
    <tr>
    <td align="left" >Description </td>  
    <td width="10px" ><b>:</b></td>  
    <td></td>
    </tr>
    <tr>
    <td align="left" colspan="3">
   <%-- <asp:TextBox ID="txtDescription" runat="server" Width="500px" MaxLength="500" TextMode="MultiLine" />--%>
    <asp:TextBox ID="txtDescr" TextMode="MultiLine" Width="450" Height="150"
                runat="server" onkeyup='textCounter(this, this.form.remLen, 500);'
                onkeydown="textCounter(this, this.form.remLen, 500);" />
        <br />
        <div style="width:100%; text-align:right; padding-right:10px">
        <input readonly="readonly" type="text" style="text-align:right" name="remLen" size="3" maxlength="3" value="500" /> characters left &nbsp;&nbsp;
        </div>  <br />        
        <div>
        Time: &nbsp;(EST) <asp:TextBox ID="txtEstInsert" runat="server" Enabled="false" />
        </div>  
        <hr />
    </td> 
    </tr>
    <tr>
    <td colspan="3" align="right" style="padding-right:10px">
    <asp:Button ID="btnAdd" runat="server" Text=" Add Appointment " OnClick="btnAdd_click" ValidationGroup="g1" />&emsp;&emsp;
    <asp:Button ID="btnBack" runat="server" Text=" Back " />&emsp;
    </td>
    </tr>   
    </table>
    </div>
 <br />
 <div id="popEditdiv" runat="server" style="border:1px solid Gray; width:455px; background-color:White">
 <div style="width:100%"> <span style="color:Red; font-size:8pt">Please provide 24 hour notice for cancellations</span> 
  <asp:LinkButton ID="LnkCancel" Text="Click here to cancel" Font-Underline="true" runat="server" OnClick="cancelEdit_Click" />
  </div>
    <table id="Table2" width="450px" runat="server" >
    <tr>
    <td colspan="3" align="center" height="30" valign="middle" style="font-weight:bold; font-size:11pt; background-color:#DBD0DD">
    Edit Appointment <asp:Label ID="lblEditDate" runat="server" />    
    </td>
    </tr>
    <tr>
    <td align="left" width="40%">Phone No</td>
    <td width="10px" ><b>:</b></td>
    <td align="left" width="55%">
    <asp:TextBox ID="txtEditPhone" runat="server" Width="200" MaxLength="10" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ControlToValidate="txtEditPhone" ValidationGroup="g2" >*</asp:RequiredFieldValidator>
    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterMode="ValidChars" TargetControlID="txtEditPhone" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
    <asp:RegularExpressionValidator ID="regu1" runat="server" ControlToValidate="txtEditPhone" ValidationGroup="g2" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr>
    <td align="left" >Mobile No</td>
    <td  ><b>:</b></td>
    <td align="left">
    <asp:TextBox ID="txtEditMobil" runat="server" Width="200" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txtEditMobil" ValidationGroup="g2" >*</asp:RequiredFieldValidator>
    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterMode="ValidChars" TargetControlID="txtEditMobil" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEditMobil" ValidationGroup="g2" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
    
    </td>
    </tr>
    <tr>
    <td align="left">Appointment Title</td>
    <td  ><b>:</b></td>
    <td align="left">
    <asp:TextBox ID="txtEditApmt" runat="server" Width="200" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ControlToValidate="txtEditApmt" ValidationGroup="g2" >*</asp:RequiredFieldValidator>
    
    </td>
    </tr>
    <tr>
    <td align="left" >Appointment Type</td>
    <td ><b>:</b></td>
    <td align="left" >
   <asp:DropDownList ID="ddlEditType" runat="server"  Width="200">
   <asp:ListItem Text="Select Type" />
   <asp:ListItem Value="Office Appointment" Text="Office Appointment" />
   <asp:ListItem Value="Training Appointment" Text="Training Appointment" />
   <asp:ListItem Value="Travel Appointment" Text="Travel Appointment" />
   <asp:ListItem Value="Consulting Appointment" Text="Consulting Appointment" />
   </asp:DropDownList>   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ControlToValidate="ddlEditType" 
      InitialValue="Select Type" ValidationGroup="g2" >*</asp:RequiredFieldValidator>    
    </td>
    </tr>
    <tr>
    <td align="left" >Description </td>  
    <td width="10px" ><b>:</b></td>  
    <td></td>
    </tr>
    <tr>
    <td align="left" colspan="3">
   <%-- <asp:TextBox ID="txtDescription" runat="server" Width="500px" MaxLength="500" TextMode="MultiLine" />--%>
    <asp:TextBox ID="txtEditDesc" TextMode="MultiLine" Width="450" Height="150"
                runat="server" onkeyup='textCounter(this, this.form.remELen, 500);'
                onkeydown="textCounter(this, this.form.remELen, 500);" />
        <br />
        <div style="width:100%; text-align:right; padding-right:10px">
        <input readonly="readonly" type="text" style="text-align:right" name="remELen" size="3" maxlength="3" value="500" /> characters left &nbsp;&nbsp;
        </div>  <br />
        
        <div>
        Time: &nbsp;(EST) <asp:TextBox ID="txtEditEst" runat="server" Enabled="false" />
        </div>  
        <hr />
    </td> 
    </tr>
    <tr>
    <td colspan="3" align="right" style="padding-right:10px">
    <asp:Button ID="btnEdit" runat="server" Text=" Update Appointment " OnClick="btnEdit_Click" ValidationGroup="g2" />&emsp;&emsp;
    <asp:Button ID="btnEBack" runat="server" Text=" Back " />&emsp;
    </td>
    </tr>   
    </table>
    </div>
    <asp:Label ID="lblExtra" runat="server" Visible="false" />
     </center>
    </div>
    </form>
</body>
</html>