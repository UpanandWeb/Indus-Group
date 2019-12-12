<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpNewFrmCreate2.aspx.cs" Inherits="admin_Admin_EmpNewFrmCreate2" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>: : Indus Group : : Admin Control Panel - H1-B Form</title>
    <script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
    <script language="javascript" type="text/javascript">
	function alertedit()
    {
        alert("Employee Details has been edited Successfully");
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
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
            <tr width="100%">
              <td valign="top" width='100%' class="lblog" >
                <uc1:TopMenu ID="Topmenu1" runat="server" />
              </td>
            </tr>
            <tr><td style="padding-top:10px"></td></tr>
            <tr>
                <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
                    <table>
                        <tr>
                            <td class="style19"><h3>PROSPECTIVE EMPLOYEE DATA SHEET</h3></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <table style="width: 100%" border="0" align="center">
                        <tr>
                            <td style="width: 20%">
                                Contact Numbers in USA:</td>
                            <td style="width: 40%">
                                <asp:TextBox ID="cousa" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvnumus" runat="server"
                                ControlToValidate="cousa" ErrorMessage="Please Enter Contact Number">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revcnum" runat="server" ControlToValidate="cousa"
                                ErrorMessage="Please Enter Valid Contact Number" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%">
                                Contact Numbers in Foreign Country:</td>
                            <td style="width: 40%">
                                <asp:TextBox ID="cof" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvfornum" runat="server"
                                ControlToValidate="cof" ErrorMessage="Please Enter Contact Number">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revfnum" runat="server" ControlToValidate="cof"
                                ErrorMessage="Please Enter Valid Contact Number" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                           </td>
                        </tr>
                        <tr>
                            <td style="width: 20%">
                                Email id For Communication:</td>
                            <td style="width: 40%">
                                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvemail" runat="server"
                                ControlToValidate="email" ErrorMessage="Enter Valid Email">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revemail" runat="server" 
                                   ErrorMessage="Please enter valid email Id" ControlToValidate="email" 
                                   ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator> 
                                </td>
                        </tr>
                    </table>
                    <br /><br />
        <table border="0" width="100%" align="left" cellpadding="5" cellspacing="5">
            <tr>
                <td class="style19">Additional Information for Visa Processing:</td>
            </tr>
            <tr>
                <td>1.	If the Beneficiary ever in the U.S., was he/she ever in exclusion or deportation proceedings?</td>
            </tr>
            <tr>
                <td>
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
                <td>2.	Within the past 7 years, whether the Beneficiary or spouse ever been given H classification? If yes, period of stay in the U.S. in that status:</td>
            </tr>
            <tr>
                <td>
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
                <td>3.	Within the past 7 years, whether the Beneficiary or spouse ever been denied H-1B classification?</td>
            </tr>
            <tr>
                <td>
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
            <tr>
                <td class="style19">Please send to us copies of the following documents also:
                    <%--<ul>
                        <li>Diploma/Degree earned within or outside the U.S.</li>
                        <li>Educational Evaluation Report (If you have one)</li> 
                        <li>If the Beneficiary is on H4 status please provides spouse H1-B approval copy of I797, 2 recent pay stubs passport copies and Marriage Registration certificate. </li>
                        <li>Transcripts for college or university work supporting the 10th Grade, Intermediate or Higher Secondary School or plus Two, Degrees, Diplomas, any other Certificates etc., (even if a degree was not awarded).</li>
                        <li>Drivers License, Social Security Card, ITIN card copies.</li> 
                        <li>All previous I-20 papers if the beneficiary is on F1 visa status.</li> 
                        <li>All Previous L1 or B1 papers or any INS related document copies.</li> 
                        <li>Licenses, certificates, awards, commendations, or any other documents relating to professional, technical, or vocational training the Beneficiary has received
                        <li>Experience letters/testimonials from previous employers/supervisors or clients</li>
                        <li>Current resume</li>
                        <li>Most recent I-94 card (front & back) if currently in the U.S.</li>
                        <li>Passport all informational pages (all pages with endorsements/visas/notes)</li>
                        <li>If the Beneficiary is in currently in the U.S. in H-1B status, please send us the following documents also:
                            <ul>
                                <li> All previous and current H-1B approval notice  (I-797) from the INS</li>
                                <li> most recent two or three pay stubs</li>
                            </ul>    
                        </li>
                    </ul>--%>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px" class="lable1">
                    	Diploma/Degree earned within or outside the U.S.<br />
                    <br />
                    <br />
                    	Educational Evaluation Report (If you have one) 
                    <br />
                    <br />

                    	If the Beneficiary is on H4 status please provides spouse H1-B approval copy of I797, 2 recent pay stubs passport copies and Marriage Registration certificate. 
                    <br />
                    <br />

                    	Transcripts for college or university work supporting the 10th Grade, Intermediate or Higher Secondary School or plus Two, Degrees, Diplomas, any other Certificates etc., (even if a degree was not awarded).<br />
                    <br />

                    	Drivers License, Social Security Card, ITIN card copies. 
                    <br />
                    <br />

                    	All previous I-20 papers if the beneficiary is on F1 visa status.<br />
                    <br /> 

                    	All Previous L1 or B1 papers or any INS related document copies. 
                    <br />
                    <br />

                    	Licenses, certificates, awards, commendations, or any other documents relating to professional, technical, or vocational training the Beneficiary has received<br />
                    <br />

                    	Experience letters/testimonials from previous employers/supervisors or clients<br />
                    <br />

                    	Current resume<br />
                    <br />

                    	Most recent I-94 card (front & back) if currently in the U.S.<br />
                    <br />

                    	Passport all informational pages (all pages with endorsements/visas/notes)<br />
                    <br />

                    	If the Beneficiary is in currently in the U.S. in H-1B status, please send us the following documents also:
                </td>
             </tr>
             <tr>
                <td style="padding-left:10px" class="lable1">
                    -	All previous and current H-1B approval notice  (I-797) from the INS<br /><br />
                    -	most recent two or three pay stubs
                </td>
            </tr>
            <tr>
                <td class="style19">Please send to us copies of the following documents for the Dependants:</td>
            </tr>
            <tr>
                <td style="padding-left:10px" class="lable1">
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
                <td class="style19"><u>If you already in the Green Card Process : </td>
            </tr>
            <tr>
                <td style="padding-left:10px" class="lable1">
                    •	Labor filing letter and approved copy of Labor.<br />
                    •	I-140 filing receipt and approved copy <br />
                    •	I-485 filing receipts and approvals<br />
                    •	Copy of Employment Authorization Card<br />
                    •	Copy of any other document or Travel Document. <br />
                    •	Of H1-B and the status<br /> 
                </td>
            </tr>
            <tr>
                <td class="style19">Please mail either USPS or Courier all the copies to:</td>
            </tr>
            <tr>
                <td>
                    igiit Inc. 1033 Sterling Road, Ste. 204, Herndon-VA-20170. USA. <br />
                    Direct: 703-593-1234   Fax:  703-842-8746 /  <a href="mailto:ravi@acsgit.com">ravi@acsgit.com</a> / <a href="http://www.acsgit.com" target="_blank">http://www.acsgit.com.</a>
                </td>
            </tr>
         </table>      
     </td>
  </tr>
        </table>
        <table>
            <tr>
                <td style="width: 973px" >&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="btnedit" runat="server" Text="Save" OnClick="btnedit_Click" Width="98px" /></td>
            </tr>
        </table>
        <table style="width: 975px">
            <tr>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1033
                    Sterling Road,Ste.204,Herndon-VA-201701 USA. Phone:703-957-7829 Fax:703-842-8746</td>
            </tr>
        </table>
    </form>
</body>
</html>
