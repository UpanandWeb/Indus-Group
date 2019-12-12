<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EditForm3.aspx.cs" Inherits="admin_Admin_EditForm3" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title> : : Indus Group : : - Admin Control Panel - EditForm3</title>
    
<script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
<script type="text/javascript">
    function allowonlynumbers() {
        if (event.keyCode >= 48 && event.keyCode <= 57) {
            return true;
        }
        else {
            alert('Only numbers can be entered.'); return false;
        }
    }

</script>
<script language="Javascript" type="text/javascript">
       <!--    Users_Information
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
       //-->
    </script>
<script language="javascript" type="text/javascript">
function alertedit()
{
    alert("Employee Details has been updated Successfully");
}

function alertdelete()
{
    alert("Employee Details has been deleted Successfully");
}
</script>
    
    
<link rel="stylesheet" href="Styles/stylesheet.css" />   
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
    <center>
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr><td height="20px"></td></tr>
    <tr>
      <td id="tdcontent" runat="server" align="left" valign="top" width="100%" class="lable"> 
        <table border="0" class="lable" cellpadding="3" cellspacing="5" width="95%" align="center">
            <tr>
                <td colspan="2" align="center" class="headings"><u>EDIT PROSPECTIVE EMPLOYEE DATA SHEET</u></td>
            </tr>
            <tr><td colspan="2" height="10px"></td></tr>
            <tr>
                <td>
                    <table border="0" width="45%">
                        <tr>
                            <td class="lable">Email ID</td>
                            <td>&nbsp;:&nbsp;</td>
                            <td>
                                <asp:Label ID="idi" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="lable">
                                Contact Numbers in USA
                            </td>
                            <td>&nbsp;:&nbsp;</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="cousa" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lable">
                                Contact Numbers in Foreign Country
                            </td>
                            <td>&nbsp;:&nbsp;</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="cof" runat="server" Width="200px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lable">
                                Email id For Communication
                            </td>
                            <td>&nbsp;:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="email" runat="server" Width="200px"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Please Enter Your Email Address." ControlToValidate="email"  
                                    Font-Size="Smaller" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="Please Enter Valid Email Address" 
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="email" Font-Size="Smaller" ValidationGroup="edit"
                                    >*</asp:RegularExpressionValidator>
                            </td>
                        </tr>        
                    </table>
                    <table width="60%">
                    <tr>
                <td style="height: 21px" class="lableb" colspan="6">
                    <b>Please provide following information</b></td>
            </tr>
            <tr>
            <td align="right" class="lable">H-1B - EAC Number</td>
            <td><b>:</b></td>
            <td align="left" width="155px">
            <asp:TextBox ID="txteac" runat="server" Width="150px"></asp:TextBox>
            </td> 
               <td align="right" width="85px" class="lable">Valid Untill</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="valid1" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender1" runat="server" TargetControlID="valid1">
                    </cc1:calendarextender>
            </td>          
            </tr>
            <tr>
            <td align="right" class="lable">EAD  Number</td>
            <td><b>:</b></td>
            <td align="left" width="155px">
            <asp:TextBox ID="txtEad" runat="server" Width="150px"></asp:TextBox>
            </td> 
               <td align="right" width="85px" class="lable">Valid Untill</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="txtEadValid" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender5" runat="server" TargetControlID="txtEadValid">
                    </cc1:calendarextender>
            </td>          
            </tr>
              <tr>
            <td align="right" class="lable">I - 140 EAC Number</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="textIeac" runat="server" Width="150px"></asp:TextBox>
            
            </td>  
            <td align="right" class="lable">Valid Untill</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="valid2" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender2" runat="server" TargetControlID="valid2">
                    </cc1:calendarextender>
            </td>           
            </tr>
            <tr>
            <td align="right" class="lable">I - 485 EAC Number</td>
            <td><b>:</b></td>
            <td align="left" width="155px">
            <asp:TextBox ID="txtI485" runat="server" Width="150px"></asp:TextBox>
            </td> 
               <td align="right" width="85px" class="lable">Valid Untill</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="txtIValid" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender6" runat="server" TargetControlID="txtIValid">
                    </cc1:calendarextender>
            </td>          
            </tr>
              <tr>
            <td align="right" class="lable">DOL - LCA Number</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="txtlca" runat="server" Width="150px"></asp:TextBox>
            </td> 
             <td align="right" class="lable">Valid Untill</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="valid3" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender3" runat="server" TargetControlID="valid3">
                    </cc1:calendarextender>
            </td>              
            </tr>
              <tr>
            <td align="right" class="lable">DOL - PERM Number</td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="txtperm" runat="server" Width="150px"></asp:TextBox>
            </td> 
            <td align="right" class="lable">Valid Untill </td>
            <td><b>:</b></td>
            <td align="left">
            <asp:TextBox ID="valid4" runat="server" Width="150px"></asp:TextBox>
             <cc1:calendarextender
                        ID="CalendarExtender4" runat="server" TargetControlID="valid4">
                    </cc1:calendarextender>
            </td>           
            </tr>
            </table>
                </td>
            </tr>
            <tr><td colspan="2" height="10px"></td></tr>
            <tr>
                <td class="style19" colspan="2">Additional Information for Visa Processing:</td>
            </tr>
            <tr>
                <td colspan="2">1.	If the Beneficiary ever in the U.S., was he/she ever in exclusion or deportation proceedings?</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnyes" runat="server" Text="Yes" 
                                    oncheckedchanged="rbtnyes_CheckedChanged" AutoPostBack="True" /></td>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnno"  runat="server" Text="No" Checked="true"
                                    oncheckedchanged="rbtnno_CheckedChanged" AutoPostBack="True" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtbenficiary" Visible="false" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>    
                <td colspan="2">2.	Within the past 7 years, whether the Beneficiary or spouse ever been given H classification? If yes, period of stay in the U.S. in that status:</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnyes1" runat="server" Text="Yes" 
                                    oncheckedchanged="rbtnyes1_CheckedChanged" AutoPostBack="True" /></td>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnno1"  runat="server" Text="No" Checked="true"
                                    oncheckedchanged="rbtnno1_CheckedChanged" AutoPostBack="True" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtbenficiary1" Visible="false" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>    
                <td colspan="2">3.	Within the past 7 years, whether the Beneficiary or spouse ever been denied H-1B classification?</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnyes2" runat="server" Text="Yes" 
                                    oncheckedchanged="rbtnyes2_CheckedChanged" AutoPostBack="True" /></td>
                            <td class="lable">
                                <asp:RadioButton ID="rbtnno2"  runat="server" Text="No" Checked="true" 
                                    oncheckedchanged="rbtnno2_CheckedChanged" AutoPostBack="True" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtbenficiary2" Visible="false" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr><td colspan="2" height="10px"></td></tr>
            <tr>
                <td colspan="2" class="style19">Please send to us copies of the following documents also:</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left:10px" class="lable1">
                    	Diploma/Degree earned within or outside the U.S.<br />
                    <br />
                    <br />
                    	Educational Evaluation Report (If you have one) 
                    <br />
                    <br />

                    	If the Beneficiary is on H4 status please provides spouse H1-B approval copy of I797, 2 recent pay stubs passport copies and Marriage Registration certificate. 
                    <br />
                    <br />

                    	Transcripts for college or university work supporting the 10th Grade, Intermediate or Higher Secondary School or plus Two, Degrees, Diplomas, any other Certificates etc., (even if a degree was not awarded).
                    <br />
                    <br />

                    	Drivers License, Social Security Card, ITIN card copies. 
                    <br />
                    <br />

                    	All previous I-20 papers if the beneficiary is on F1 visa status.
                    <br />
                    <br /> 

                    	All Previous L1 or B1 papers or any INS related document copies. 
                    <br />
                    <br />

                    	Licenses, certificates, awards, commendations, or any other documents relating to professional, technical, or vocational training the Beneficiary has received
                    <br />
                    <br />

                    	Experience letters/testimonials from previous employers/supervisors or clients
                    <br />
                    <br />

                    	Current resume<br />
                    <br />

                    	Most recent I-94 card (front & back) if currently in the U.S.
                    <br />
                    <br />

                    	Passport all informational pages (all pages with endorsements/visas/notes)
                    <br />
                    <br />

                    	If the Beneficiary is in currently in the U.S. in H-1B status, please send us the following documents also:
                </td>
             </tr>
             <tr>
                <td colspan="2" style="padding-left:10px" class="lable1">
                    -	All previous and current H-1B approval notice  (I-797) from the INS<br /><br />
                    -	most recent two or three pay stubs
                </td>
            </tr>
            <tr><td colspan="2" height="10px"></td></tr>
            <tr>
                <td colspan="2" class="style19">Please send to us copies of the following documents for the Dependants:</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left:10px" class="lable1">
                    •	H-4 Document from INS<br />
                    •	Passport pages (all pages with endorsements/visas/notes)<br />
                    •	Most recent I-94 card (front & back) if currently in the U.S.<br />
                    •	Social security Card copy if they have any<br />
                    •	Drivers License or Government ID Copy <br />
                    •	Marriage Registration Certificate<br />
                    •	Any other documents related to immigration or etc.<br />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style19">If you already in the Green Card Process : </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left:10px" class="lable1">
                    •	Labor filing letter and approved copy of Labor.<br />
                    •	I-140 filing receipt and approved copy <br />
                    •	I-485 filing receipts and approvals<br />
                    •	Copy of Employment Authorization Card<br />
                    •	Copy of any other document or Travel Document. <br />
                    •	Of H1-B and the status<br /> 
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style19">Please mail either USPS or Courier all the copies to:</td>
            </tr>
            <tr>
                <td colspan="2">
                    igiit Inc. 1033 Sterling Road, Ste. 204, Herndon-VA-20170. USA. <br />
                    Direct: 703-593-1234   Fax:  703-842-8746 /  <a href="mailto:ravi@acsgit.com" class="menu">ravi@acsgit.com</a> / <a href="http://www.acsgit.com" class="menu" target="_blank">http://www.acsgit.com</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 973px" align="center">
                    <asp:Button ID="btnedit" runat="server" Text="Update" OnClick="btnedit_Click" Width="98px"  ValidationGroup="edit"/></td>
            </tr>
        </table>
        <table style="width: 975px">
            <tr>
                <td align="center" class="lable"> 1033
                    Sterling Road,Ste.204,Herndon-VA-201701 USA. Phone:703-593-1234 Fax:703-842-8746</td>
            </tr>
            <tr>
            <td>
            <asp:ValidationSummary ID="valsumm" runat="server" ValidationGroup="edit" ShowMessageBox="true" ShowSummary="false" />
            </td>
            </tr>
        </table>
    
      </td>
    </tr>
    </table>
  </center>
  </form>
</body>
</html>