<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_viewvendor.aspx.cs" Inherits="admin_Admin_viewvendor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Company_Create</title>
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
<link rel="stylesheet" href="Styles/stylesheet.css" /> 
    <style type="text/css">
        .style1
        {
            width: 143px;
        }
        .style13
        {
            height: 330px;
        }
        .class123
        {
        font-family:Verdana;font-size: 18px;
        } 
    </style>
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
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript1.2" src="js/statesopt.js" type="text/javascript">
</script>
<script language="JavaScript1.2" src="Jscripts/empregvalidation.js" type="text/javascript"></script>
    
    <script type="text/javascript">
function allowonlynumbers() 
{
if(event.keyCode >= 48 && event.keyCode <= 57) 
{
return true; 
}
else
{
alert('Only numbers can be entered.');return false; 
} 
}

</script>
<script type="text/javascript">
    function ValidateModuleList(source, args)
{
  var chkListModules= document.getElementById ('CheckBoxList1');
  var chkListinputs = chkListModules.getElementsByTagName("input");
  var count=0;
  for (var i=0;i<chkListinputs.length;i++)
  {
    if (chkListinputs [i].checked)
    {
     count++;      
    }
    if(count>1)
    {    
    args.IsValid = false;
    alert('Please Select only  one');
      return;
      }
        if(count==0)
        {
         args.IsValid = false;
         alert('Select Checkbox');
        }
    
  }
  args.IsValid = true;
}
    
    </script>
</head>


<body id="body1" runat="server" oncontextmenu="return false;" onselectstart="return false">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div>
    <center>
   <table width="80%"> 
   <tr width="100%">
        <td valign="top" width='100%' class="lblog" colspan="2" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
     
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog" colspan="2">
        </td>
       </tr>
      
     <tr>
     <td class="style13">
        
     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="center" colspan="2"> </td>
  </tr>
  <tr>
    <td height="25" align="center" style="width:90%"><h3 style="color:#003399;font-size:22px;">Vendor Information Sheet</h3> <br />
    </td> <td align="right" valign="bottom"><a href="Admin_vendors.aspx" ><< Back</a></td>
  </tr>
  <tr>
    <td height="25" colspan="2" >
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#dcdddf solid 1px;">
      <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="font-family:Verdana;font-size: 18px; width:45%" height="35" align="right" valign="middle"> Name of Firm :</td>
                <td  height="35" align="left" valign="middle">&nbsp;<asp:TextBox ID="txtname" Font-Size="18px" Width="240px" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtname" ValidationGroup="1"  
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>  </td>
                                        </tr>
                                        <tr>
                <td style="font-family:Verdana;font-size: 18px"   height="30" align="right">Tax ID : </td>
                <td align="left">&nbsp;<asp:TextBox ID="txtTax" runat="server" Font-Size="18px" Width="240px"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="1"  runat="server" ControlToValidate="txtTax" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                </td>
              </tr>
                                        <tr>
                                        <td align="left" colspan="2">
                                        <span style="border-bottom:1px solid Gray; font-size:small; margin-left:10%; width:80%">Contact Information</span>
                                        <center>
                                        <div style="border: 1px dotted Gray; width:80%">
                                       
                                        <table id="Table1" width="100%" runat="server">
                                        <tr>
                                        
                                        <td style="width:60%">
                                        <table width="100%" >
                                        
                                        <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Contact Name</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtCName" runat="server" Font-Size="18px" Width="240px"></asp:TextBox> 
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtCName" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                        
                                        </tr>
                                         <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Title</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtTitle" runat="server" Font-Size="18px" Width="240px"></asp:TextBox><span style="font-family:Verdana;font-size:10px">
                                         (Ex:- CEO/Manger etc.)</span>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtTitle" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                        
                                        </tr>
                                        <tr>
                                       <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Email</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtMail" runat="server" Font-Size="18px" Width="240px"></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtMail" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>                                        
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUrl"
                                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" >*</asp:RegularExpressionValidator>                                        
                                        --%></td>                                        
                                        </tr>
                                        <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Website</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                         <asp:TextBox ID="txtUrl" runat="server" Font-Size="18px" Width="240px"></asp:TextBox> 
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtUrl" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>                                        
                                        <asp:RegularExpressionValidator ID="regular1" runat="server" ControlToValidate="txtUrl"
                                         ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
                                         --%></td>
                                         </tr>
                                        </table>
                                        </td>                                        
                                        <td style="width:40%">
                                        <table width="100%">
                                         <tr>
                                                       <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Phone </td>
                                                       <td><strong>:</strong></td>
                <td  height="35" align="left" valign="middle"><asp:TextBox ID="txtmobile"  MaxLength="12" runat="server" Font-Size="18px" Width="240px"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="1"  runat="server" ControlToValidate="txtmobile" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
        <cc1:FilteredTextBoxExtender ID="fil12" runat="server" FilterType="Numbers" TargetControlID="txtmobile"></cc1:FilteredTextBoxExtender>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtmobile"
         ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>  --%>
                                                
                </td>
                                        </tr>
                                        <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Work </td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtWork" runat="server" MaxLength="12" Font-Size="18px" Width="240px"></asp:TextBox> 
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtWork" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
        FilterType="Numbers" TargetControlID="txtWork"></cc1:FilteredTextBoxExtender> 
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtWork" 
         ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>  --%>
                                               
                </td>                 
                                        </tr>
                                         <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Direct Phone </td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtDirect" runat="server" MaxLength="12" Font-Size="18px" Width="240px"></asp:TextBox> 
                                     <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtDirect" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
        FilterType="Numbers" TargetControlID="txtDirect"></cc1:FilteredTextBoxExtender> 
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDirect"
          ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>  --%>
                                               
                </td>           
                                        </tr>
                                         <tr>
                                        <td  style="font-family:Verdana;font-size: 18px"  height="35" align="right" valign="middle">Fax </td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtFax" runat="server" MaxLength="12" Font-Size="18px" Width="240px"></asp:TextBox> 
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtFax" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
        FilterType="Numbers" TargetControlID="txtFax"></cc1:FilteredTextBoxExtender>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFax"
          ValidationGroup="1" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator> --%> 
                                                                             
                </td>                                      
                                        
                                        </tr>
                                        </table>
                                        
                                        </td>
                                          </tr>
                                        </table>
                                        </div>
                                        </center>
                                        </td>                                        
                                        </tr>
                                        <tr>
                                        <td>&nbsp;</td>
                                        </tr>
              
              <tr>
              <td colspan="2" align="left">
              <span style="border-bottom:1px solid Gray; font-size:small; margin-left:10%; width:100%">Address Details</span>
              <center>
                                        <div style="border: 1px dotted Gray; width:80%">
              <table width="100%">
              <tr>
              <td style="width:60%">
              <table width="100%">
              <tr>
               <td style="font-family:Verdana;font-size: 18px; width:23%" height="30" align="right">Address Line1</td>
               <td><strong>:</strong></td>
                <td align="left">&nbsp;<asp:TextBox ID="txtaddress1" Height="60" Width="80%" TextMode="MultiLine" runat="server"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="1"  runat="server" ControlToValidate="txtaddress1" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                </td>
              </tr>
              <tr>
               <td style="font-family:Verdana;font-size: 18px" height="30" align="right">Address Line2</td>
               <td><strong>:</strong></td>
                <td align="left">&nbsp;<asp:TextBox ID="txtaddress2" Height="60" Width="80%" TextMode="MultiLine" runat="server"></asp:TextBox>
               
                </td>
              </tr>
              </table>
              </td>
              <td style="width:40%">
              <asp:UpdatePanel ID="updateAddress" runat="server"><ContentTemplate>
              <table width="100%">
               <tr>
                                        <td style="font-family:Verdana;font-size: 18px; width:30%" height="30" align="right">Country</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                       <asp:DropDownList ID="ddlCountry" runat="server" class="inpt" Font-Size="18px" Width="242px">
                         <asp:ListItem >Select Country</asp:ListItem>
                        </asp:DropDownList>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" InitialValue="Select Country" ControlToValidate="ddlCountry" 
                                 ErrorMessage="" ValidationGroup="1">*</asp:RequiredFieldValidator>--%>
                                        </td>
                                        
                                        </tr>
                                        <tr>
                                        <td style="font-family:Verdana;font-size: 18px" height="30" align="right">State</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                       <asp:DropDownList ID="ddlstate" runat="server" class="inpt" Font-Size="18px" Width="242px">
                       <asp:ListItem >Select State</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="req5" ValidationGroup="1" runat="server" InitialValue="Select State" ControlToValidate="ddlstate" 
                                 ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                        </td>                                        
                                        </tr>
                                        <tr>
                                        <td style="font-family:Verdana;font-size: 18px" height="30" align="right" valign="top">City</td>
                                        <td valign="top"><strong>:</strong></td>
                                        <td align="left">
                                       <asp:DropDownList ID="ddlcity" runat="server" class="inpt"  Font-Size="18px" Width="242px">
                       <asp:ListItem >Select City</asp:ListItem>
                        </asp:DropDownList><br />
                      <%-- <asp:TextBox ID="txtcity" runat="server" Visible="false" />--%>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator24" InitialValue="Select City" runat="server" ControlToValidate="ddlcity" 
                                    ErrorMessage="select city">*</asp:RequiredFieldValidator>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ValidationGroup="1" runat="server" ControlToValidate="txtcity" 
                                     ErrorMessage="">*</asp:RequiredFieldValidator>--%>
                                        </td>                                        
                                        </tr>
                                        <tr>
                                        <td style="font-family:Verdana;font-size: 18px" height="30" align="right">Zip</td>
                                        <td><strong>:</strong></td>
                                        <td align="left">
                                        <asp:TextBox ID="txtZip" runat="server" MaxLength="5" Font-Size="18px" Width="240px"></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ValidationGroup="1"  runat="server"
                                         ControlToValidate="txtZip" 
                                        ErrorMessage="">*</asp:RequiredFieldValidator>
        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" 
        FilterType="Numbers" TargetControlID="txtZip"></cc1:FilteredTextBoxExtender>
        <asp:RegularExpressionValidator ID="regZip" runat="server" ControlToValidate="txtZip"
          ValidationGroup="1" ValidationExpression="\d{6}">*</asp:RegularExpressionValidator>  --%>
                                        </td>
                                        </tr>
              </table>
              </ContentTemplate></asp:UpdatePanel>
              </td>
             
              
              </tr>
              </table>
              </div>
              </center>
              </td>
                
              </tr>
              <tr>
              <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="font-family:Verdana;font-size: 18px"   height="30" align="right">Headquarters Office : </td>
                <td align="left">&nbsp;<asp:TextBox ID="txthead"   runat="server" Font-Size="18px" Width="240px"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="1"  runat="server" ControlToValidate="txthead" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                </td>
              </tr>
              <%--<tr><td colspan="2"  align="center"><hr style="width:80%"/></td></tr>--%>
             <tr>
              <td align="right" style=" font-size: 18px; font-family:Verdana" >
              <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" 
                     ValidationGroup="1">
                                    <asp:ListItem>Corporation</asp:ListItem>
                                    <asp:ListItem>Partnership</asp:ListItem>
                                    <asp:ListItem>Individual</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:CheckBoxList>
                                
                          <%-- <asp:CustomValidator runat="server" ID="cvmodulelist"
  ClientValidationFunction="ValidateModuleList"
  ErrorMessage=" " ValidationGroup="1" ></asp:CustomValidator>--%>      
                                
                                  </td><td align="left">&nbsp;<asp:TextBox ID="txtother" runat="server" Font-Size="18px" Width="240px"></asp:TextBox></td>
                                  </tr>
                                 <%--<tr><td colspan="2"  align="center"><hr style="width:80%" /></td></tr>--%>

            
              <tr>
                <td  style="font-family:Verdana;font-size: 18px" align="right" height="30">Date Business Started :</td>
                <td align="left">&nbsp;<asp:TextBox ID="txtdatabusiness"  Font-Size="18px" Width="240px"  runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="1"  ControlToValidate="txtdatabusiness" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                </td>
              </tr>
               <tr>
                <td  style="font-family:Verdana;font-size: 18px" align="right" height="30">President/Principal Owner :</td>
                <td align="left">&nbsp;<asp:TextBox ID="txtpre"  Font-Size="18px" Width="240px"  runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="1" runat="server" ControlToValidate="txtpre" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
                </td>
              </tr>
               <tr>
                <td style="font-family:Verdana;font-size: 18px" height="30" align="right">Other Officers :</td>
                <td align="left">&nbsp;<asp:TextBox ID="txtotherofficers"  Font-Size="18px" Width="240px"   runat="server"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="1"  runat="server" ControlToValidate="txtotherofficers" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
               --%> </td>
              </tr>
              <tr>            
                <td  style="font-family:Verdana;font-size: 18px" align="right" height="30">Has this company provided products or services to our company before?</td>
                <td  align="left" style="font-family:Verdana;font-size: 18px"> &nbsp;             
                 <asp:RadioButton ID="rbtnyes" Text="Yes" GroupName="check" runat="server" />                
                <asp:RadioButton ID="rbtnno" Text="No" GroupName="check"  runat="server" />
                </td>              
          </tr>
          <tr>
            <td style="font-family:Verdana;font-size: 18px" align="right" height="35">If so, when and what type?</td>
            <td align="left">&nbsp;<asp:TextBox ID="txttype"  Font-Size="18px" Width="240px"   runat="server">
            </asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ValidationGroup="1" runat="server" ControlToValidate="txttype" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
            </td>
          </tr>
          
            
          <tr>
            <td style="font-family:Verdana;font-size: 18px" align="right" height="35">List current customers and their approximate purchase value :
           </td><td align="left">&nbsp;<asp:TextBox ID="txtpurchasevalue"  Font-Size="18px" Width="240px"    runat="server"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="1"  runat="server" ControlToValidate="txtpurchasevalue" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
            </td>
          </tr>
          
          <tr>
            <td style="font-family:Verdana;font-size: 18px" align="right" height="35">List trade references (name, phone) :</td> 
            <td align="left">&nbsp;<asp:TextBox ID="txtrefrences"  Font-Size="18px" Width="240px"   runat="server"></asp:TextBox>
           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="1"  runat="server" ControlToValidate="txtrefrences" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>--%>
            </td>
          </tr>
          <tr>
            <td style="font-family:Verdana;font-size: 18px" align="right" height="35">list bank references (name, branch, phone) :
            </td><td align="left">&nbsp;<asp:TextBox ID="txtlistofbank" Font-Size="18px" Width="240px"    runat="server"></asp:TextBox>
           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="1"  runat="server" ControlToValidate="txtlistofbank" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
            --%>
            </td>
          </tr>
           
          <tr>
            <td height="35" colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="font-family:Verdana;font-size: 18px"  width="450" height="35" align="right" valign="middle">Completed by :</td>
                <td  width="180" height="35" align="left" valign="middle">
                  &nbsp;<asp:TextBox ID="txtcompleteby"   runat="server"></asp:TextBox>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12"  ValidationGroup="1" runat="server" ControlToValidate="txtcompleteby" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
               --%> </td>
                <td  style="font-family:Verdana;font-size: 18px" width="100"  height="35" align="left" valign="middle">Date :</td>
                <td  height="35" align="left" valign="middle">
                  &nbsp;<asp:TextBox ID="txtcomby"   runat="server"></asp:TextBox>
                 <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator13"  ValidationGroup="1"  runat="server" ControlToValidate="txtcomby" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
                  <cc1:CalendarExtender ID="cal1" runat="server" TargetControlID="txtcomby" ></cc1:CalendarExtender>
                --%></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="35" colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td  style="font-family:Verdana;font-size: 18px" width="450" height="35" align="right" valign="middle">Approved by :</td>
                <td width="180" height="35" align="left" valign="middle">
                  &nbsp;<asp:TextBox ID="txtapporvedby"  runat="server"></asp:TextBox>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="1"  ControlToValidate="txtapporvedby" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
                --%></td>
                <td width="100" height="35" style="font-family:Verdana;font-size: 18px" align="left" valign="middle">Date :</td>
                <td height="35" align="left" valign="middle">
                  &nbsp;<asp:TextBox ID="txtapby"   runat="server"></asp:TextBox>
                 <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="1"  runat="server" ControlToValidate="txtapby" 
                                        ErrorMessage="Enter Jobid">*</asp:RequiredFieldValidator>
                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtapby" ></cc1:CalendarExtender>
                --%></td>
              </tr>
            </table></td>
          </tr>
           <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="2">
            <%--<asp:Button ID="btnsubmit" ValidationGroup="1" runat="server" Width="90px" Height="30px" Text="Save" 
            onclick="btnsubmit_Click" />
                <asp:ValidationSummary ID="val1" runat="server"   ShowSummary="false" ValidationGroup="1" />   </td>

           --%>
          </tr>
          <tr>
            <td colspan="2">&nbsp;
             </td>
          </tr>
          </table>
          </td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td align="center" valign="middle">&nbsp;
    <asp:Label ID="lblid" runat="server" Visible="false" />
    </td>
  </tr>
</table>
       
     
     </td>
     </tr>
     </table>
    </center>
      </div>
     
 </form>
</body>
</html>