<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Company" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - Company</title>
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
     <style type="text/css">
        .style2
        {
            color: #174eb4;
            font-size: 12px;
            font-weight: normal;
            font-family: Geneva, Arial, Helvetica, sans-serif;
            height: 15px;
            vertical-align: baseline;
            width: 137px;
            border-bottom: 1px solid #DBDDDD;
            padding-left: 5px;
            background-color: #ffffff;
        }
        #gvedit td
        {
        	border:0.1px solid #CCCCCC;
        }
        #gvedit th
        {
        	border-right:0.1px solid #CCCCCC;
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
    <link rel="stylesheet" href="Styles/stylesheet.css" /> 
    
<script language="javascript" type="text/javascript" >
function Sample()
{
var n = document.getElementById("gvedit").rows.length;
var i; 
var j=0; 
for(i=2;i<=n;i++)
{
if(i<10)
{
if(document.getElementById("gvedit_ctl0"+i+"_chkselect").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvedit_ctl0"+i+"_chkselect").checked=false;
}
else
{
j++;
}
}
}
else
{
if(document.getElementById("gvedit_ctl"+i+"_chkselect").checked==true)
{
if(j>0)
{
alert('you can select only one...');
document.getElementById("gvedit_ctl0"+i+"_chkselect").checked=false;
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
    function selectOneView(frm)
    {
     for(i=0;i<frm.length;i++)
     {
       if(frm.elements[i].checked)
       {
         return true;
       }
     }
    alert('select atleast one Checkbox to View the details!');
      return false;
    }
    </script>
    <script language="javascript" type="text/javascript">
	  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script>

    
</head>

<body id="body1" runat="server">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="script1" runat="server"></cc1:ToolkitScriptManager>
    <center>
    <div>
    
   <table width="100%"> 
   <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
       <tr>
           <td>
           </td>
       </tr>
       
       <tr>
       <td id="crtopt" runat="server" align="right" class="lblog">
        </td>
       </tr>
       
       <tr>
      <td  >
      <center>
       <table style="width: 99px">
      
      <tr id="trbuttons" runat="server">
      <td>
      <asp:ImageButton ID="imgnew" runat="server" ToolTip="New" AlternateText="New" Height="20px" ImageUrl="images/new.jpg"
              Width="17px" onclick="imgnew_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgedit" runat="server" ToolTip="Edit" 
              OnClientClick="return selectOne(this.form)" AlternateText="Edit" Height="20px" ImageUrl="images/edit.jpg"
              Width="17px" onclick="imgedit_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgdelete" runat="server" ToolTip="Delete" 
              OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete" 
              Height="20px" ImageUrl="images/1371_normalDelete_20_n_g.gif"
              Width="17px" onclick="imgdelete_Click" />
      </td>
      <td>
      <asp:ImageButton ID="imgview" runat="server" ToolTip="View"
              OnClientClick="return selectOneView(this.form)" AlternateText="View" 
              ImageUrl="images/view.jpg" Height="20px" Width="21px" 
              onclick="imgview_Click" />
      </td>
      </tr>
      </table>
    
    <table>
    <tr id="trmenu" runat="server">
    <td><asp:Button ID="btnclient" runat="server" Text="Client" 
            CssClass="wr_login_title" onclick="btnclient_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnvendor" runat="server" Text="Vendor" 
            CssClass="wr_login_title" onclick="btnvendor_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btncompany" runat="server" Text="Company" 
            CssClass="wr_login_title" onclick="btncompany_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnsupplier" runat="server" Text="Supplier" 
            CssClass="wr_login_title" onclick="btnsupplier_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btngovt" runat="server" Text="Government" 
            CssClass="wr_login_title" onclick="btngovt_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btninternal" runat="server" Text="Internal" 
            CssClass="wr_login_title" onclick="btninternal_Click" />&nbsp;&nbsp;</td>
    <td><asp:Button ID="btnnotapp" runat="server" Text="NotApplicable" 
            CssClass="wr_login_title" onclick="btnnotapp_Click" />&nbsp;&nbsp;</td>
    </tr>
    </table>
    
    <table width="80%" cellpadding="0" cellspacing="0"  >
     
     <tr>      
     <td valign="top">
     <asp:Panel ID="pnlgrid" runat="server" 
             Width="100%">
     <table  width="100%">
      <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>
     <tr><td align="left" >
     <asp:Label ID="lblcomp" runat="server" ForeColor="#00277a"  Font-Size="Medium"></asp:Label></td>
     </tr>
    
     <tr>
     <td align="center" >
     <asp:GridView  ID="gvedit" runat="server" Width="950px" 
    AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White" DataKeyNames="CID"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
             onpageindexchanging="gvedit_PageIndexChanging"  >
     <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Size="Small" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" />
      <Columns>
      <asp:TemplateField  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#CCCCCC">
      <ItemTemplate>
      <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
      </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="CompanyName"  ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Company Name" />
      <asp:BoundField DataField="CompanyOwner"  ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Contact Name" />
      <asp:BoundField DataField="Address1"  ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Address" />
      <asp:BoundField DataField="Website"  ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Webiste" />
      <asp:BoundField DataField="EmailID"   ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="EmailID" />
      <asp:BoundField DataField="PhoneNo"  ItemStyle-ForeColor="#515151"  ItemStyle-BorderColor="#CCCCCC" HeaderText="Mobile Number" />
      </Columns>
     </asp:GridView>
     </td>
     </tr>
     </table>
     </asp:Panel>
     </td><td width="10px">&nbsp;</td>
     </tr>
        <tr><td>&nbsp;</td></tr>
           <tr><td>&nbsp;</td></tr>
     <tr id="trlbl" runat="server">
     <td>
     <asp:Label ID="lblerr" runat="server" ForeColor="IndianRed" Font-Size="Larger"></asp:Label>
     </td>
     </tr>
     
     <tr>
     <td>
     <asp:Panel ID="pnlcompany" runat="server">
     <table cellspacing="0" cellpadding="0" style="width: 77%" align="center">
     <tr>
     <td style="color:Blue;font-weight:bold;text-align:center" class="header">
      Company Information
     </td>
     </tr>
     <tr>
     <td>
     <table width="40%"  border="0" align="center" style="background-color:#E5E0E0">
          
          <tr>
            <td height="30" colspan="3" ><font class="crentopenings"><b>User ID & Password</b></font></td>
          </tr>
          <tr>
            <td  width="35%" align="right" >User Name</td>
            <td width="4%"><strong>:</strong></td>
            <td width="186" height="30">
            <asp:TextBox ID="txtusername" runat="server" Width="200px" Height="20px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" 
                        Font-Size="Smaller" Display="Static" Font-Overline="False" SetFocusOnError="True" ValidationGroup="client">*</asp:RequiredFieldValidator>                          
          <%--  <input type="text" style="width:180px; height:20px" />--%></td>
          </tr>
          
          <tr>
            <td height="30" align="right">Password</td>
            <td><strong>:</strong></td>
            <td height="30">
            <asp:TextBox ID="txtpwd" runat="server" Width="200px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="Please enter the Password" 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator></td>
          </tr>
          
          <tr>
            <td height="30" align="right">Confirm Password</td>
            <td><strong>:</strong></td>
            <td height="30">
             <asp:TextBox ID="txtconfirmpwd" runat="server" Width="200px" 
                   ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" Font-Size="Smaller" ErrorMessage="Please Enter Re-Password" ValidationGroup="client">
                *</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" 
                    ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" ValidationGroup="client">*</asp:CompareValidator>
             </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Company Name</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcompanyname" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtcompanyname" ErrorMessage="Please enter the Company Name" 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
        
          <tr>
            <td height="30" align="right">Company Mail ID</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtcompanymailid" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Font-Size="Smaller" ErrorMessage="Please enter mailid" ControlToValidate="txtcompanymailid"
                 ValidationGroup="client">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="Please Enter Valid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="txtcompanymailid" Font-Size="Smaller" ValidationGroup="client">*</asp:RegularExpressionValidator>
              </td>
          </tr>
          
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Company Information</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right">Company Type</td>
            <td><strong>:</strong></td>
            <td>
            <asp:DropDownList ID="ddctype" runat="server" Width="200px" CssClass="lable4">
            <asp:ListItem Selected="True">Select Type</asp:ListItem>         
            <asp:ListItem Text="Client">Client</asp:ListItem>
            <asp:ListItem Text="Vendor">Vendor</asp:ListItem>
            <asp:ListItem Text="Company">Comapny</asp:ListItem>
            <asp:ListItem Text="Supplier">Supplier</asp:ListItem>
            <asp:ListItem Text="Government">Government</asp:ListItem>
            <asp:ListItem Text="Internal">Internal</asp:ListItem>
            <asp:ListItem Text="Not Applicable">Not Applicable</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="ddctype" InitialValue="Select Type" 
                        ErrorMessage="Please Select Type." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
          </td>
          </tr>
         
          <tr>
            <td height="30" align="right">Contact Person</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtcontactperson" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcontactperson" 
                    ErrorMessage="Please enter the Contact Person" Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
          
          <tr>
            <td height="30" align="right">Contact Person's Designation</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtcontactpersondesg" runat="server" Width="200px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtcontactpersondesg" 
                        ErrorMessage="Please enter the Designation." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
          
          <tr>
            <td height="30" align="right">URL</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtulr" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtulr" ErrorMessage="Please enter the URL." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtulr" ErrorMessage="Please enter valid URL"                          
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
              </td>
          </tr>
        
          <tr>
            <td height="30" align="right">Brief Description </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="100px" Width="200px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtdesc" ErrorMessage="Please enter the Description." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>         
          <tr>
            <td height="30" colspan="3" style="background:url(images/regiterlinebg.png) repeat-x"><font class="crentopenings"><b>Primary Contact Details</b></font></td>
          </tr>
          <tr>
            <td height="30" align="right"> Address for Communication</td>
            <td><strong>:</strong></td>
            <td>
              <asp:TextBox ID="txtaddrforcommunication" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtaddrforcommunication" 
                    ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
              </td>
          </tr>
         <%--
          <tr>
            <td height="30" align="right">Street Address</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtstreetaddr" runat="server" Width="200px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtstreetaddr" 
                    ErrorMessage="Please enter the Street Address." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
        --%>
          <tr>
            <td height="30" align="right">Country</td>
            <td><strong>:</strong></td>
            <td><span style="height:25px ">
             <asp:DropDownList ID="country" runat="server" CssClass="textfield" Width="190px"   AutoPostBack="true" OnSelectedIndexChanged="country_SelectedIndexChanged">             
              <asp:ListItem Text="Select Country">Select Country</asp:ListItem>
            </asp:DropDownList>
            </span>
            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" 
                        ControlToValidate="country" InitialValue="Select Country" 
                        ErrorMessage="Please Select the Country." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
           
            <tr>
            <td height="30" align="right"> State</td>
            <td><strong>:</strong></td>
            <td>
               <asp:Dropdownlist ID="state" runat="server" CssClass="textfield" Width="190px"   >
              <asp:ListItem Text="Select State">Select State</asp:ListItem>
              </asp:Dropdownlist>
               <asp:RequiredFieldValidator ID="rfvstate" runat="server" 
                    ControlToValidate="state" InitialValue="Select State" 
                    ErrorMessage="Please Select the State." Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
            </td>
          </tr>
          
          <tr>
            <td height="30" align="right">City </td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
         
              <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="txtcity" ErrorMessage="Please Enter City." 
                        Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
             
          <tr>
            <td height="30" align="right">Phone</td>
            <td><strong>:</strong></td>
            <td>
               <asp:TextBox ID="txtphone" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
               </td>
          </tr>
       
          <tr>
            <td height="40" align="right">Fax</td>
            <td><strong>:</strong></td>
            <td>
             <asp:TextBox ID="txtfax" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number." 
                    Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
             </td>
          </tr>
         
          <tr>
            <td height="30" colspan="3" align="center">
                <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" CausesValidation="false"  ValidationGroup="client"/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%-- <asp:Button ID="btncancel" runat="server" Text="Cancel"  />--%></td>
          </tr>
                     
          <tr>
          <td><asp:Label ID="lblerror" Visible="false" runat="server" Text="lblerror"></asp:Label>
          <asp:Label ID="lblAcess" runat="server" Visible="false" />
          </td>
          </tr>
        </table>
     </td>
     </tr>
     </table>
     
      
    
     </asp:Panel>
     </td>
     </tr>
     
     </table>
     </center>
      
      </td>
      </tr>
      
      
      </table>
      </div>
     </center>
 </form>
</body>
</html>
