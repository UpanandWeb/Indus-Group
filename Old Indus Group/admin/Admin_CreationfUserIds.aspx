<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_CreationfUserIds.aspx.cs" Inherits="admin_Admin_CreationfUserIds" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> : : Indus Group : : - Admin Control Panel - CreationofUserIds</title>
     <link rel="stylesheet" href="Styles/stylesheet.css" />  
    <script language="Javascript" type="text/javascript">
       <!--        Users_Information
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
       //-->
    </script>
    <script language="javascript" type="text/javascript" >
function Sample()
{
var n = document.getElementById("gvusers").rows.length;
var i; 
var j=0; 
for(i=2;i<=n;i++)
{
if(i<10)
{
if(document.getElementById("gvusers_ctl0"+i+"_CheckBoxreq").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvusers_ctl0"+i+"_CheckBoxreq").checked=false;
}
else
{
j++;
}
}
}
else
{
if(document.getElementById("gvusers_ctl"+i+"_CheckBoxreq").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvusers_ctl0"+i+"_CheckBoxreq").checked=false;
}
else
{
j++;
}
}
}
}
}
</script>
<style type="text/css">
       .modalBackground
       {  
    	background-color: Gray;  
    	filter: alpha(opacity=50);  
    	opacity: 0.50;
       }
       .updateProgress
       {  
       	border-width: 1px; 
        border-style: solid; 
        background-color: White;  
        position: absolute;  
        width: 180px;  
        height: 65px;
       }
       #gvusers td
        {
        	border:0.1px solid #CCCCCC;
        }
        #gvusers th
        {
        	border-right:0.1px solid #CCCCCC;
        }
</style>
<script type="text/javascript" language="javascript">
    function selectOne(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked) 
       {
         return true;
       }
     }
    alert('select atleast one Checkbox for Edit!');
      return false;
    }
</script>
<script type="text/javascript" language="javascript">
    function selectOneenable(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return true;
            }
        }
        alert('select atleast one Checkbox to enable the user!');
        return false;
    }
</script>
<script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>
<script type="text/javascript" language="javascript">
    function selectOnedisable(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return true;
            }
        }
        alert('select atleast one Checkbox to disable the user!');
        return false;
    }
</script>
<script type="text/javascript" language="javascript">
    function confirmMessageDelete(frm)
    {
        for(i = 0; i < frm.length; i++)
        {
            if(frm.elements[i].checked)
            {
                return confirm("Are you sure you want to delete the selected record?");
                return true;
            }            
        }        
      alert('select atleast one Checkbox for Delete!');
      return false;
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

<body id="body1" runat="server" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server" style="left:10px; right:10px">
    <center>
         <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
                <tr width="998px">
                    <td valign="top" width='100%' class="lblog" > 
                         <table width="100%">
                            <tr>
                                <td>                                    
                                    <uc1:TopMenu ID="Topmenu1" runat="server" />
                                    
                                </td>
                            </tr>
                        </table>                  
                   </td>
                </tr>    
                <tr height="15"> 
                <td>&nbsp; </td>
                </tr>           
                <tr>
                    <td align="center" valign="top">
                        <font size="5" color="#0e4860"><strong></strong></font>
                    </td>
                </tr>   
                <tr>
                    <td align="right" valign="top">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr width="100%">
                  <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
                    <table border="0" width="100%">
                    <tr><td align="right" style="padding-right:20px">
                            <asp:LinkButton ID="lnkview" 
                            runat="server" ForeColor="Blue" Text="View Users" Font-Size="Medium" 
                            onclick="lnkview_Click"></asp:LinkButton>
                            
                            </td></tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" id="create" runat="server">                    
                                    <tr>
                                        <td>
                                            <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
                                            </cc1:ToolkitScriptManager>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">                                                
                                            <font size="5" color="#0e4860"><strong>Create User</strong></font>
                                        </td>
                                    </tr>
                                    <tr><td colspan="6" style="height:20px" ></td></tr>
                                    <tr>
                                        <td class="datab" align="right" width="25%" >
                               <span style="font-size:17px;"   >          First Name</span>
                                        </td>
                                        <td width="5%">:</td>
                                        <td align="left" width="20%">
                                            <asp:TextBox ID="txtFName" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                        </td>
                                        <td class="datab" align="right" width="10%">
                                          <span style="font-size:17px;"   >     Last Name</span>
                                        </td>
                                        <td width="5%">:</td>
                                        <td align="left" width="35%">
                                            <asp:TextBox ID="txtLName" runat="server" Width="180px" Height="20px"></asp:TextBox>
                                            
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px"> 
                                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" 
                                                ErrorMessage="Please enter First Name" ControlToValidate="txtFName" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                                                ControlToValidate="txtLName" ErrorMessage="Please enter Last Name" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                       <span style="font-size:17px;"   >        Designation</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlUserType" runat="server" Width="183px" Height="29px" OnTextChanged="ddlUserType_TextChanged" AutoPostBack="true">
                                            </asp:DropDownList>                                                                                                                                                  
                                        </td> 
                                         <td class="datab" align="right">
                                       <span style="font-size:17px;"   >        Country</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlCountry" runat="server" Width="183px" Height="29px">
                                            <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                                            <asp:ListItem Value="India">India</asp:ListItem>
                                            <asp:ListItem Value="USA">USA</asp:ListItem>
                                            </asp:DropDownList>                                                                                                                                                  
                                        </td>                                         
                                    </tr>                                             
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvddlUserType" runat="server" 
                                                ControlToValidate="ddlUserType" ErrorMessage="Please select designation" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select User Type"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="ddlCountry" ErrorMessage="Please select Country" 
                                                ValidationGroup="UserIdCreation" InitialValue="Select Country"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                      <span style="font-size:17px;"   >         User </span>
                                        </td>
                                        <td>:</td>
                                        <td align="left" >
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                         <ContentTemplate> 
                                            <asp:TextBox ID="txtUserId" runat="server" ontextchanged="txtUserId_TextChanged" AutoPostBack="true" Width="180px" Height="20px"></asp:TextBox>                                
                                              
                                                <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>                                          
                                       </ContentTemplate>
                                       </asp:UpdatePanel>
                                        </td>           
                                          <td class="datab" align="right">
                                       <span style="font-size:17px;"   >        Employee ID</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="ssemp" runat="server" Width="183px" Height="29px" Enabled="false">
                                            </asp:TextBox>                                                                                                                                                  
                                        </td>                             
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                        <asp:RequiredFieldValidator ID="rfvtxtUserId" runat="server"  Display="Dynamic"
                                                ControlToValidate="txtUserId" ErrorMessage="Please enter User" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                 ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx"  Display="Dynamic"
                                                 ControlToValidate="txtUserId" 
                                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                 ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                         </td>
                                        <td></td>
                                        <td style="height:5px"></td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                     <span style="font-size:17px;"   >          Password</span></td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="180px" Height="20px"></asp:TextBox>
                                                                                                                              
                                        </td>
                                        <td class="datab" align="right">
                                    <span style="font-size:17px;"   >          Confirm Password</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtconPwd" runat="server" TextMode="Password" Width="180px" Height="20px"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvPwd" runat="server" 
                                                ControlToValidate="txtPwd" ErrorMessage="Please enter password" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rftxtconPwd" runat="server" 
                                                ControlToValidate="txtconPwd" ErrorMessage="Please Confirm Password" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator><br />
                                            <asp:CompareValidator ID="cmvalPwd" runat="server" 
                                                ErrorMessage="Please enter password correctly" ControlToCompare="txtPwd" 
                                                ControlToValidate="txtconPwd" ValidationGroup="UserIdCreation"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                    <span style="font-size:17px;"   >           Address</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtAddress" runat="server" Width="180px" Height="20px"></asp:TextBox>                                
                                        </td>  
                                         <td class="datab" align="right">
                                      <span style="font-size:17px;"   >         Mobile</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtMobile" runat="server" Width="180px" Height="20px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;&nbsp; Eg:9xxxxxxxxx                               
                                        </td>                                       
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtAddress" runat="server" 
                                                ControlToValidate="txtAddress" ErrorMessage="Please enter address" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">                                            
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtMobile" ErrorMessage="Please enter mobile number" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="datab" align="right">
                                     <span style="font-size:17px;"   >          Contact Number</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">                                        
                                            <asp:TextBox ID="txtConNumber" runat="server" onkeypress="return isNumberKey(event)" MaxLength="11" Width="180px" Height="20px"></asp:TextBox>                                                                                                                                                  
                                        </td>
                                        <td class="datab" align="right">
                                       <span style="font-size:17px;"   >        Email Id</span>
                                        </td>
                                        <td>:</td>
                                        <td align="left">
                                            
                                            <asp:TextBox ID="txtEmailId" runat="server" Width="180px" Height="20px"></asp:TextBox>                                                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                            <asp:RequiredFieldValidator ID="rfvtxtConNumber" runat="server" 
                                                ControlToValidate="txtConNumber" ErrorMessage="Please enter contact number" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td align="left" style="height:5px">
                                             <asp:RequiredFieldValidator ID="rfvtxtEmailId" runat="server" 
                                                ControlToValidate="txtEmailId" ErrorMessage="Please enter Email Id" 
                                                ValidationGroup="UserIdCreation"></asp:RequiredFieldValidator> <br />
                                            <asp:RegularExpressionValidator ID="rfvEmailid" runat="server" 
                                                 ErrorMessage="Please Enter valid Email Id Eg:xxx@xx.xx" 
                                                 ControlToValidate="txtEmailId" 
                                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                 ValidationGroup="UserIdCreation"></asp:RegularExpressionValidator>
                                                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">
                                             <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate> 
                                                    <table border="0">
                                                        <tr>
                                                            <td class="datab" width="30%" valign="top">                    
                                                                <table border="0" id="tblImmig">
                                                                    <tr>
                                                                        <td class="datab" style="width: 140px;font-size:14px;">Immigration Docs</td>
                                                                        <td class="style4" style="width: 140px">
                                                                            <asp:RadioButton ID="rbImmigYes" runat="server" GroupName="gImmig" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                            <asp:RadioButton ID="rbImmigNo" Checked="true" runat="server" GroupName="gImmig" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                                        </td>
                                                                    </tr>  
                                                                    <tr id="trImmig" runat="server">
                                                                        <td colspan="2" style="padding-left:10px">
                                                                            <table border="0">                                                                    
                                                                                <tr id="trImmigAll" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblImmigAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px" align="center">
                                                                                       <asp:CheckBox ID="chkImmigAll" runat="server"  AutoPostBack="true" OnCheckedChanged="chkImmigAll_CheckedChanged" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trImmigPreview" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblImmigPreview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                         <asp:CheckBox ID="chkbxImmigview" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trImmigPost" runat="server">
                                                                                    <td class="datap5" align="left" >
                                                                                        <asp:Label ID="lblImmigPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                       <asp:CheckBox ID="chkbxImmigPost" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trImmigEdit" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblImmigEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxImmigEdit" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trImmigDel" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblImmigDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxImmigDel" runat="server" />
                                                                                    </td>
                                                                                </tr>                                                                           
                                                                                <tr id="trImmigDown" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblImmigDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                         <asp:CheckBox ID="chkbxImmigDown" runat="server" />
                                                                                    </td>
                                                                                </tr>  
                                                                            </table>
                                                                        </td>
                                                                    </tr>                                                                              
                                                                </table>                        
                                                            </td>
                                                            <td class="datab" width="30%" valign="top">                    
                                                                <table id="tblAcc" border="0">
                                                                    <tr>
                                                                        <td class="datab" style="width: 140px;font-size:14px;">Accounting Docs      </td>
                                                                        <td class="style4" style="width: 140px">
                                                                            <asp:RadioButton ID="rbAccYes" runat="server" GroupName="gAcc" Text="Yes" AutoPostBack="True" Font-Size="13px" />
                                                                            <asp:RadioButton ID="rbAccNo" Checked="true" runat="server" GroupName="gAcc" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="trAcc" runat="server">
                                                                        <td colspan="2" style="padding-left:10px">
                                                                            <table border="0">
                                                                                <tr id="trAccAll" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                       <asp:CheckBox ID="chkAccAll" runat="server" 
                                                                                            oncheckedchanged="chkAccAll_CheckedChanged" AutoPostBack="true" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trAccPreview" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxAccview" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trAccPost" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxAccPost" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trAccEdit" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td style="height: 20px; width: 100px;">
                                                                                        <asp:CheckBox ID="chkbxAccEdit" runat="server" />
                                                                                    </td>
                                                                                </tr>                                                                                                                                                                    
                                                                                <tr id="trAccDel" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                         <asp:CheckBox ID="chkbxAccDel" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trAccDown" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblAccDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                         <asp:CheckBox ID="chkbxAccDown" runat="server" />
                                                                                    </td>
                                                                                </tr> 
                                                                            </table>
                                                                        </td>
                                                                    </tr>                                                        
                                                                </table>                        
                                                            </td>
                                                            <td class="datab" width="30%" valign="top">                   
                                                                 <table id="tblHR"  border="0">
                                                                    <tr>
                                                                        <td class="datab" style="width: 140px;font-size:14px;"> HR Docs     </td>
                                                                        <td class="style4" style="width: 140px">
                                                                            <asp:RadioButton ID="rbHRYes" runat="server" GroupName="gHR" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                            <asp:RadioButton ID="rbHRNo" Checked="true" runat="server" GroupName="gHR" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="trHR" runat="server">
                                                                        <td colspan="2" style="padding-left:10px">
                                                                            <table border="0">
                                                                                <tr id="trHRAll" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHRAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                       <asp:CheckBox ID="chkHRAll" runat="server" 
                                                                                            oncheckedchanged="chkHRAll_CheckedChanged" AutoPostBack="true"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trHRPreview" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHRview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxHRview" runat="server" AutoPostBack="true" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trHRPost" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHRPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxHRPost" runat="server" AutoPostBack="true" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trHREdit" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHREdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxHREdit" runat="server" AutoPostBack="true" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trHRDel" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHRDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                        <asp:CheckBox ID="chkbxHRDel" runat="server"  AutoPostBack="true"/>
                                                                                    </td>
                                                                                </tr>                                                                                
                                                                                <tr id="trHRDown" runat="server">
                                                                                    <td class="datap5" align="left">
                                                                                        <asp:Label ID="lblHRDown" runat="server" Text="Approval" Font-Size="13px"></asp:Label>
                                                                                    </td>
                                                                                    <td class="style4" style="width: 100px">
                                                                                         <asp:CheckBox ID="chkbxHRDown" runat="server" AutoPostBack="true"/>
                                                                                    </td>
                                                                                </tr>                 
                                                                            </table>
                                                                        </td>
                                                                    </tr>                           
                                                                </table>                       
                                                            </td>
                                                        </tr>
                                                   </table>
                                                </ContentTemplate>
                                             </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                             <ContentTemplate> 
                                                <table border="0">
                                                    <tr>
                                                        <td class="datab" width="30%" valign="top">
                                                            <table id="tblARP"  border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">ARP Docs</td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbARPYes" runat="server" GroupName="gARP" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbARPNo" Checked="true" runat="server" GroupName="gARP" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                                    </td>
                                                                </tr>
                                                                <tr id="trARP" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table  border="0">
                                                                             <tr id="trARPAll" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblARPAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkARPAll" runat="server" 
                                                                                        oncheckedchanged="chkARPAll_CheckedChanged" AutoPostBack="true" Font-Size="13px"/>
                                                                                </td>
                                                                             </tr>
                                                                             <tr id="trARPPreview" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblARPview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxARPview" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr> 
                                                                             <tr id="trARPPost" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblARPPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxARPPost" runat="server"  AutoPostBack="true"/>
                                                                                </td>
                                                                            </tr>
                                                                             <tr id="trARPEdit" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblARPEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxARPEdit" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                             <tr id="trARPDel" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblARPDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxARPDel" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>                                                                            
                                                                             <tr id="trARPDown" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblARPDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxARPDowm" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>  
                                                                        </table>
                                                                    </td>
                                                                </tr>                                                 
                                                            </table>
                                                        </td>
                                                        <td class="datab" width="30%" valign="top">
                                                            <table id="tblDR"  border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">  Daily Reports   </td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbDRYes" runat="server" GroupName="gDR" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbDRNo" Checked="true" runat="server" GroupName="gDR" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                                    </td>
                                                                </tr>
                                                                <tr id="trDR" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table border="0">
                                                                             <tr id="trDRAll" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDRAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkDRAll" runat="server" 
                                                                                        oncheckedchanged="chkDRAll_CheckedChanged" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                             <tr id="trDRPreview" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDRview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxDRview" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                             <tr id="trDRPost" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDRPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxDRPost" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr> 
                                                                             <tr id="trDREdit" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDREdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td style="height: 20px; width: 100px;">
                                                                                    <asp:CheckBox ID="chkbxDREdit" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>                                        
                                                                             <tr id="trDRDel" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDRDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxDRDel" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>                                          
                                                                             <tr id="trDRDown" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblDRDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxDRDown" runat="server"  AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>  
                                                                            
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                                        
                                                            </table>
                                                        </td>
                                                        <td class="datab" width="30%" valign="top">
                                                            <table id="tblLS" border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">   Time & attendance      </td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbLSYes" runat="server" GroupName="gLS" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbLSNo" Checked="true" runat="server" GroupName="gLS" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trLS" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table border="0">
                                                                            <tr id="trLSAll" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkLSAll" runat="server" 
                                                                                        oncheckedchanged="chkLSAll_CheckedChanged" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trLSPreview" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxLSview" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trLSPost" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxLSPost" runat="server" AutoPostBack="true"/>
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trLSEdit" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxLSEdit" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trLSDel" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxLSDel" runat="server" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>                                        
                                                                            <tr id="trLSDown" runat="server">
                                                                                <td class="datap5">
                                                                                    <asp:Label ID="lblLSDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxLSDown" runat="server" Enabled="false" />
                                                                                </td>
                                                                            </tr>  
                                                                        </table>
                                                                    </td>
                                                                </tr>                                                                    
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                             </ContentTemplate>
                                            </asp:UpdatePanel>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="center">
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                             <ContentTemplate>
                                                <table border="0">
                                                    <tr>
                                                        <td class="datab" width="30%" valign="top">                  
                                                            <table id="tblExcel"  border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">Excel Docs</td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbExcelYes" runat="server" GroupName="gExcel" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbExcelNo" Checked="true" runat="server" GroupName="gExcel" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                                    </td>
                                                                </tr>
                                                                <tr id="trExcel" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table border="0">
                                                                            <tr id="trExcelAll" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkExcelAll" runat="server" 
                                                                                        oncheckedchanged="chkExcelAll_CheckedChanged" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trExcelView" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelView" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxExcelview" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trExcelPost" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxExcelPost" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trExcelEdit" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxExcelEdit" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trExcelDel" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxExcelDel" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                                  
                                                                            <tr id="trExcelDown" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblExcelDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxExcelDown" runat="server" />
                                                                                </td>
                                                                            </tr>         
                                                                        </table>
                                                                    </td>
                                                                </tr>                                                       
                                                            </table>                        
                                                        </td>
                                                        <td class="datab" width="30%" valign="top">  
                                                           <table id="tblEmpDoc"  border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">Employee Docs</td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbEmpDocYes" runat="server" GroupName="gEmpDoc" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbEmpDocNo" Checked="true" runat="server" GroupName="gEmpDoc" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trEmpDoc" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table border="0">
                                                                            <tr id="trEmpDocAll" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkEmpDocAll" runat="server" 
                                                                                        oncheckedchanged="chkEmpDocAll_CheckedChanged" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trEmpDocView" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocView" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxEDocview" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trEmpDocPost" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxEDocPost" runat="server" />
                                                                                </td>
                                                                            </tr> 
                                                                              <tr id="trEmpDocEdit" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxEDocEdit" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trEmpDocDel" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxEDocDel" runat="server" Enabled="false" />
                                                                                </td>
                                                                            </tr>
                                                                                                                                                                    
                                                                            <tr id="trEmpDocDown" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblEmpDocDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxEDocDown" runat="server" />
                                                                                </td>
                                                                            </tr> 
                                                                           
                                                                        </table>
                                                                    </td>
                                                                </tr>                                                       
                                                            </table>                           
                                                        </td>
                                                        <td class="datab" width="30%" valign="top">  
                                                              <table id="tblWrdDoc"  border="0">
                                                                <tr>
                                                                    <td class="datab" style="width: 140px;font-size:14px;">Word Documents</td>
                                                                    <td class="style4" style="width: 140px">
                                                                        <asp:RadioButton ID="rbWrdDocYes" runat="server" GroupName="gWrdDoc" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                        <asp:RadioButton ID="rbWrdDocNo" Checked="true" runat="server" GroupName="gWrdDoc" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trWrdDoc" runat="server">
                                                                    <td colspan="2" style="padding-left:10px">
                                                                        <table border="0">
                                                                            <tr id="trWrdDocAll" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocAll" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkWrdDocAll" runat="server" 
                                                                                        oncheckedchanged="chkWrdDocAll_CheckedChanged" AutoPostBack="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trWrdDocView" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocView" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxWDocview" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trWrdDocPost" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                   <asp:CheckBox ID="chkbxWDocPost" runat="server" />
                                                                                </td>
                                                                            </tr> 
                                                                              <tr id="trWrdDocEdit" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxWDocEdit" runat="server"  />
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trWrdDocDel" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocDel" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                    <asp:CheckBox ID="chkbxWDocDel" runat="server" Enabled="false" />
                                                                                </td>
                                                                            </tr>
                                                                                                                                                                    
                                                                            <tr id="trWrdDocDown" runat="server">
                                                                                <td class="datap5" align="left">
                                                                                    <asp:Label ID="lblWrdDocDown" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                                </td>
                                                                                <td class="style4" style="width: 100px">
                                                                                     <asp:CheckBox ID="chkbxWDocDown" runat="server" />
                                                                                </td>
                                                                            </tr> 
                                                                           
                                                                        </table>
                                                                    </td>
                                                                </tr>                                                       
                                                            </table>                        
                                                        </td>
                                                    </tr>
                                                </table>
                                             </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr> 
                                    
                                     <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="tblResume"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Resumes</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rbResumeYes" runat="server" GroupName="gResume" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rbResumeNo" Checked="true" runat="server" GroupName="gResume" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="trRDoc" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr2" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label2" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="chkRDocAll" runat="server" 
                                                                                oncheckedchanged="chkRDocAll_CheckedChanged" AutoPostBack="true" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr3" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="lblRDocPreview" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="chkbxRDocPreview" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr4" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="lblRDocPost" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="chkbxRDocPost" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr5" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="lblRDocEdit" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="chkbxRDocEdit" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr6" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="lblRDocDelete" runat="server" Text="Delete" Font-Size="13px"> </asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="chkbxRDocDelete" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr7" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="lblRDocDownload" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="chkbxRDocDownload" runat="server" />
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                     
                                    <tr>
                                        <td><br /><br /></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="6"> 
                                            <asp:LinkButton ID="lnkmenu" runat="server" Text="Add Menu To Assigned User" Font-Underline="false" Font-Size="18px"  ValidationGroup="UserIdCreation"
                                                OnClick="lnkmenu_Click"></asp:LinkButton>
                                        </td>
                                         <td>&nbsp;</td>
                                    </tr>

                                     <tr>
                                        <td><br /><br /></td>
                                    </tr>
                                    <tr id="menu" runat="server" visible="false">
                                        <td colspan="6"  align="center">

                                            <table >
                                       <tr>
                                            <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                             <table border="0">
                                            <tr>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table1"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Employee List</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdempyes" runat="server" GroupName="employeelist" Text="Yes"     AutoPostBack="True"  Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdempno" Checked="true" runat="server" GroupName="employeelist" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr1" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr8" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label3" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox1" runat="server"   AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr9" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label4" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="true" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr10" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label5" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="true" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr11" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label6" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox4" runat="server" OnCheckedChanged="CheckBox4_CheckedChanged" AutoPostBack="true" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr12" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label7" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="CheckBox5_CheckedChanged"  AutoPostBack="true"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table2"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Current H1B List</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdh1byes" runat="server" GroupName="rdh1b" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdh1bno" Checked="true" runat="server" GroupName="rdh1b" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr14" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr15" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label9" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox7" runat="server"   AutoPostBack="true" OnCheckedChanged="CheckBox7_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr16" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label10" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox8" runat="server" AutoPostBack="true"  OnCheckedChanged="CheckBox8_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                   
                                                                    <tr id="tr18" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label12" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox10" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox10_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr19" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label13" runat="server" Text="Delete" Font-Size="13px" ></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox11" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox11_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                     
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table21"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Profile</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Profileyes" runat="server" GroupName="Profile" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Profileno" Checked="true" runat="server" GroupName="Profile" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr126" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr127" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label56" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox54" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox54_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr128" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label62" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox60" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox60_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr129" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label68" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox66" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox66_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr130" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label105" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox103" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox103_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr131" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label106" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox104" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox104_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                      
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                   </tr>
                                        </table>
                                                </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                            </tr>

                                      <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table3"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Careers</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Careersyes" runat="server" GroupName="Careers" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Careersno" Checked="true" runat="server" GroupName="Careers" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr21" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr22" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label15" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox13" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox13_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr23" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label16" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox14" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox14_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr24" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label17" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox15" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox15_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr25" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label18" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox16" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox16_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr26" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label19" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox17" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox17_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table4"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Monthly TimeSheet</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="TimeSheetyes" runat="server" GroupName="TimeSheet" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="TimeSheetno" Checked="true" runat="server" GroupName="TimeSheet" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr28" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr29" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label21" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox19_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr30" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label22" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox20" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox20_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr31" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label23" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox21" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox21_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                       
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table5"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Documents</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Documentsyes" runat="server" GroupName="Documents" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Documentsno" Checked="true" runat="server" GroupName="Documents" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr35" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr36" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label27" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox25" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox25_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr37" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label28" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox26" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox26_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr38" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label29" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox27" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox27_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    
                                                                    <tr id="tr40" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label31" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox29" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox29_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr41" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label32" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox30" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox30_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                     <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table6"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Seminars</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Seminarsyes" runat="server" GroupName="Seminars" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Seminarsno" Checked="true" runat="server" GroupName="Seminars" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr42" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr43" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label33" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox31" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox31_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr44" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label34" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox32" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox32_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr45" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label35" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox33" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox33_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr46" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label36" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox34" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox34_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr47" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label37" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox35" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox35_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table7"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Feedback</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Feedbackyes" runat="server" GroupName="Feedback" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Feedbackno" Checked="true" runat="server" GroupName="Feedback" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr49" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr50" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label39" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox37" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox37_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr51" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label40" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox38" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox38_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                             
                                                                    <tr id="tr54" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label43" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox41" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox41_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                     
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table8"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Performance</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Performanceyes" runat="server" GroupName="Performance" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Performanceno" Checked="true" runat="server" GroupName="Performance" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr56" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr59" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label47" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox45" runat="server" AutoPostBack="true"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                     <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table9"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Roles</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Rolesyes" runat="server" GroupName="Roles" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Rolesno" Checked="true" runat="server" GroupName="Roles" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr63" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr64" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label51" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox49" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox49_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr65" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label52" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox50" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox50_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr66" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label53" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox51" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox51_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                 
                                                                    <tr id="tr68" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label55" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox53" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox53_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                     
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table10"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Company</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Companyyes" runat="server" GroupName="Company" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Companyno" Checked="true" runat="server" GroupName="Company" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr70" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr71" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label57" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox55" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox55_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr72" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label58" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox56" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox56_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr73" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label59" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox57" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox57_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr74" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label60" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox58" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox58_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr75" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label61" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox59" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox59_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table11"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Projects</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Projectsyes" runat="server" GroupName="Projects" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Projectsno" Checked="true" runat="server" GroupName="Projects" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr77" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr78" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label63" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox61" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox61_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr79" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label64" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox62" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox62_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr80" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label65" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox63" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox63_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr81" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label66" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox64" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox64_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr82" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label67" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox65" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox65_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                                                                                    
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                     <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table12"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Departments</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Departmentsyes" runat="server" GroupName="Departments" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Departmentsno" Checked="true" runat="server" GroupName="Departments" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr84" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr85" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label69" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox67" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox67_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr86" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label70" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox68" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox68_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr87" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label71" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox69" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox69_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr88" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label72" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox70" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox70_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr89" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label73" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox71" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox71_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                        
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table13"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Client</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Clientyes" runat="server" GroupName="Client" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Clientno" Checked="true" runat="server" GroupName="Client" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr91" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr92" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label75" runat="server" Text="Select All"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox73" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox73_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr93" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label76" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox74" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox74_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr94" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label77" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox75" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox75_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr95" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label78" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox76" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox76_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr96" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label79" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox77" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox77_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                        
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table14"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Vendor</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Vendoryes" runat="server" GroupName="Vendor" Text="Yes"    AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Vendorno" Checked="true" runat="server" GroupName="Vendor" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr98" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr99" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label81" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox79" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox79_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr100" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label82" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox80" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox80_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr101" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label83" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox81" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox81_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr102" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label84" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox82" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox82_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                     <tr id="tr90" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label74" runat="server" Text="Status" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox72" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox72_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>

                                                                    <tr id="tr103" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label85" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox83" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox83_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                            
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                     <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table15"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Appointments</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Appointmentsyes" runat="server" GroupName="Appointments" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Appointmentsno" Checked="true" runat="server" GroupName="Appointments" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr105" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr106" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label87" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox85" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox85_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr107" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label88" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox86" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox86_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr108" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label89" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox87" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox87_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                     
                                                                      
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table16"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Pay Roll</td>
                                                            <td class="style4" style="width: 140px"> 
                                                                <asp:RadioButton ID="Pay_Rollyes" runat="server" GroupName="PayRoll" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Pay_Rollno" Checked="true" runat="server" GroupName="PayRoll" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr112" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr113" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label93" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox91" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox91_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr114" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label94" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox92" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox92_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr115" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label95" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox93" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox93_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                  
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table17"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">News & Events</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="News_Eventsyes" runat="server" GroupName="News_Events" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="News_Eventsno" Checked="true" runat="server" GroupName="News_Events" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr119" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr120" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label99" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox97" runat="server" 
                                                                                 AutoPostBack="true" OnCheckedChanged="CheckBox97_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr121" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label100" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox98" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox98_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr122" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label101" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox99" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox99_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr123" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label102" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox100" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox100_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr124" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label103" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox101" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox101_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                       <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table18"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Users</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Usersyes" runat="server" GroupName="Users" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Usersno" Checked="true" runat="server" GroupName="Users" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr13" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr17" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label8" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox6" runat="server" 
                                                                                AutoPostBack="true" OnCheckedChanged="CheckBox6_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr20" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label11" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox9" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox9_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr27" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label14" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox12" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox12_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr32" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label20" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox18" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox18_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr33" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label24" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox22" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox22_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr34" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label25" runat="server" Text="Status" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox23" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox23_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table19"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Emp Contacts</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Emp_Contactsyes" runat="server" GroupName="Emp_Contacts" Text="Yes" AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Emp_Contactsno" Checked="true" runat="server" GroupName="Emp_Contacts" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr39" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr48" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label26" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox24" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox24_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr52" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label30" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox28" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox28_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr53" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label38" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox36" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox36_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr55" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label41" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox39" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox39_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr57" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label42" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox40" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox40_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                             
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table20"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Support</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="Supportyes" runat="server" GroupName="Support" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="Supportno" Checked="true" runat="server" GroupName="Support" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr60" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr61" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label45" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox43" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox43_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                   
                                                                    <tr id="tr76" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label50" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox48" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox48_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr83" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label54" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox52" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox52_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                               <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table22"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Daily Timesheet</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rddailyy" runat="server" GroupName="Daily" Text="Yes"     AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rddaiilyn" Checked="true" runat="server" GroupName="Daily" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr58" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr62" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label44" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox42" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox42_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr67" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label46" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox44" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox44_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr97" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label49" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox47" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox47_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr104" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label80" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox78" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox78_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table23"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Invoicing</td>
                                                            <td class="style4" style="width: 140px"> 
                                                                <asp:RadioButton ID="rdInvoicingy" runat="server" GroupName="Invoicing" Text="Yes"  AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdInvoicingn" Checked="true" runat="server" GroupName="Invoicing" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr110" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr111" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label90" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox88" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox88_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr116" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label91" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox89" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox89_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr117" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label92" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox90" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox90_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr118" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label96" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox94" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox94_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr125" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label97" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox95" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox95_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                             
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table24"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Principles</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdpriny" runat="server" GroupName="Principles" Text="Yes"   AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdprinn" Checked="true" runat="server" GroupName="Principles" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr132" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr133" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label98" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox96" runat="server"   AutoPostBack="true" OnCheckedChanged="CheckBox96_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                   
                                                                    <tr id="tr134" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label104" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox102" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox102_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                      <tr id="tr69" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label48" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox46" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox46_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr135" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label107" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox105" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox105_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                    <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table25"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Calender</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdcalendery" runat="server" GroupName="Calender" Text="Yes"     AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdcalendern" Checked="true" runat="server" GroupName="Calender" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr136" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr137" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label108" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox106" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox106_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr138" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label109" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox107" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox107_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr139" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label110" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox108" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox108_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr140" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label111" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox109" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox109_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr141" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label112" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox110" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox110_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                 <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table26"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Reports</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdreportsy" runat="server" GroupName="Reports" Text="Yes"    AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdreportsn" Checked="true" runat="server" GroupName="Reports" Text="No" AutoPostBack="True" Font-Size="13px" />
                                                            </td>
                                                        </tr>
                                                        <tr id="tr143" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr144" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label114" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox112" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox112_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr145" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label115" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox113" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox113_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr146" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label116" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox114" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox114_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr147" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label117" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox115" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox115_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr148" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label118" runat="server" Text="Download" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox116" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox116_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                             
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table27"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Salary Stmt</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdSalaryy" runat="server" GroupName="Salary" Text="Yes"      AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdSalaryn" Checked="true" runat="server" GroupName="Salary" Text="No" AutoPostBack="True" Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr149" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr150" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label119" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox117" runat="server"       AutoPostBack="true" OnCheckedChanged="CheckBox117_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                   
                                                                    <tr id="tr151" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label120" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox118" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox118_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                                  
                                                                    <tr id="tr152" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label121" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox119" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox119_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>  
                                                                    <tr id="tr109" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label86" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                                <asp:CheckBox ID="CheckBox84" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox84_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>         
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>


                                   <tr>
                                      <td colspan="6" align="center">
                                       <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                        <ContentTemplate>
                                        <table border="0">
                                            <tr>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="Table28"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">Current Resumes</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdcurrenty" runat="server" GroupName="Current" Text="Yes"    AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdcurrentn" Checked="true" runat="server" GroupName="Current" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr153" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr154" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label122" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox120" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox120_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr155" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label123" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox121" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox121_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr156" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label124" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox122" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox122_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr157" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label125" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox123" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox123_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr158" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label126" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox124" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox124_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                                <td class="datab" width="30%" valign="top">                  
                                                    <table id="tablecheck"  border="0">
                                                        <tr>
                                                            <td class="datab" style="width: 140px;font-size:14px;">H1B Checklist</td>
                                                            <td class="style4" style="width: 140px">
                                                                <asp:RadioButton ID="rdChecklistyes" runat="server" GroupName="Checklist" Text="Yes"    AutoPostBack="True" Font-Size="13px"/>
                                                                <asp:RadioButton ID="rdChecklistno" Checked="true" runat="server" GroupName="Checklist" Text="No" AutoPostBack="True"  Font-Size="13px"/>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr142" runat="server">
                                                            <td colspan="2" style="padding-left:10px">
                                                                <table border="0">
                                                                    <tr id="tr159" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label1" runat="server" Text="Select All" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox111" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckBox111_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr160" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label113" runat="server" Text="Preview" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox125" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox125_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr161" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label127" runat="server" Text="Post" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox126" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox126_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr162" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label128" runat="server" Text="Edit" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox127" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox127_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr163" runat="server">
                                                                        <td class="datap5" align="left">
                                                                            <asp:Label ID="Label129" runat="server" Text="Delete" Font-Size="13px"></asp:Label>
                                                                        </td>
                                                                        <td class="style4" style="width: 100px">
                                                                            <asp:CheckBox ID="CheckBox128" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox128_CheckedChanged"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>                                                       
                                                    </table>                        
                                                </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </td>
                                    </tr>

                                            </table>
                                        </td>
                                    </tr>
                                 
                                                                          
                                    <tr>
                                        <td colspan="6" style="height:50px" align="center">
                                            <asp:Button ID="btnCreate" runat="server" Text="Create User"  Visible="false"
                                                onclick="btnCreate_Click" ValidationGroup="UserIdCreation" Font-Size="18px" Width="120px" Height="25px"  />

                                               <asp:Button ID="Button1" runat="server" Text="Cancel "  Visible="false" Font-Size="18px" Width="80px" Height="25px" 
                                                onclick="Button1_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr><td align="center" id="View" runat="server">
                        <font size="5" color="#00277a"><strong>Manage Users List</strong></font>
                        </td></tr>
                        <tr align="left">
                        <td height="10px" style="padding-left:20px">
                        <table width="100%">
                        <tr><td width="75%">
                         <asp:Button ID="editbtn" runat="server" Text="View/Edit" onclick="editbtn_Click" OnClientClick="return selectOne(this.form)"  Height="30px" Font-Size="17px"/>&nbsp;
                         <asp:Button ID="deletebtn" runat="server" Text="Delete" onclick="deletebtn_Click" OnClientClick="return confirmMessageDelete(this.form)"  Height="30px" Font-Size="16px"/>&nbsp;  
                         <asp:Button ID="disablebtn" runat="server" Text="Disable" onclick="disablebtn_Click" OnClientClick="return selectOnedisable(this.form)" Height="30px" Font-Size="16px"/>&nbsp;
                         <asp:Button ID="enablebtn" runat="server" Text="Enable" onclick="enablebtn_Click" OnClientClick="return selectOneenable(this.form)" Height="30px" Font-Size="16px"/>  &nbsp;
                        </td>
                        <td width="25%" align="right" style="padding-right:20px">
                         <asp:Button ID="lnkcreate" runat="server" Text="Create New user" OnClick="lnkcreate_Click" Height="30px" Font-Size="16px"></asp:Button>
                        </td></tr></table>
                
                        </td></tr>
                        <tr id="View1" runat="server"><td height="100px" style="padding-left:20px; padding-right:20px">                        
                       <asp:GridView ID="gvusers" runat="server" DataKeyNames="uid"  Width="96%" 
                     AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages"  
                   PagerStyle-BackColor="White"  OnRowDataBound="gvusers_RowDataBound" PageSize="25" OnPageIndexChanging="gvusers_PageIndexChanging">
                   
                    <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Size="Small"
                    ForeColor="#00277a" Height="20px" />
                    <Columns>
                        <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%"  ItemStyle-Width="4%">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxreq" runat="server" onclick="Sample();"/>
                            </ItemTemplate>
                         </asp:TemplateField>
                        <asp:HyperLinkField DataTextField="UserId" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="User" HeaderStyle-Width="10%"  ItemStyle-Width="10%"   />
                        <asp:HyperLinkField DataTextField="Password" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="Password"  HeaderStyle-Width="10%"  ItemStyle-Width="10%"   />
                        <asp:BoundField DataField="FName"  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="FirstName" SortExpression="FName" HeaderStyle-Width="10%"  ItemStyle-Width="10%" />
                        <asp:BoundField DataField="LName" ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC"  HeaderText="LastName" HeaderStyle-Width="7%"  ItemStyle-Width="7%"/>
                        <asp:BoundField DataField="Designation"  ItemStyle-ForeColor="Gray" ItemStyle-BorderColor="#CCCCCC"  HeaderText="Designation" HeaderStyle-Width="8%"  ItemStyle-Width="8%"/>
                        <asp:BoundField DataField="Country"   ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Country" HeaderStyle-Width="5%"  ItemStyle-Width="5%"/>
                        <asp:BoundField DataField="Address"    ItemStyle-ForeColor="Gray" ItemStyle-BorderColor="#CCCCCC" HeaderText="Address" HeaderStyle-Width="12%"  ItemStyle-Width="12%"/>
                         <asp:TemplateField ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="5%"  ItemStyle-Width="5%">
                         <HeaderTemplate>
                         Status
                         </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblstatus"  ForeColor="Gray" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                            </ItemTemplate>
                         </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        </td></tr>
                        <tr>
                            <td>
                                <asp:Label ID="checked_label" runat="server"></asp:Label>&nbsp; 
                                <asp:Label ID="lblId" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                   </td>
                </tr> 
            </table>
            
            <asp:Label ID="lblAcess" runat="server" Visible="false" />
    </center>
   </form>
</body>
</html>
