<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_EmpNewFrmCreate1.aspx.cs" Inherits="admin_Admin_EmpNewFrmCreate1" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - EmpNewFrmCreate</title>
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
<body>
    <form id="form1" runat="server">
   <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" align="center">
    <tr>
        <td valign="top" width='100%' class="lblog" >
        <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
        <table style="width: 980px" border="0">
            <tr><td colspan="3" height="20px"></td></tr>
            <tr>
                <td align='center' colspan="3"><font color='#003399' size='3pt'><b>PROSPECTIVE EMPLOYEE DATA SHEET</b></font> </td>
            </tr>
            <tr><td colspan="3" height="10px"></td></tr>
            <tr>
                <td style="width: 100px" class="lable">
                    Expiry date of the I-94 Card (MM/DD/YYYY):&nbsp;</td>
                <td style="width: 97px" class="lable">
                    <asp:TextBox ID="i94exp" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="i94exp">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvexp" runat="server" 
                        ErrorMessage="Please select Expire Date" ControlToValidate="i94exp" ValidationGroup="emp2">*</asp:RequiredFieldValidator>  
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 109px" class="lable">
                    Passport Number:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ppno" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpnum" runat="server"
                    ControlToValidate="ppno" ErrorMessage="Enter Passport Number" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="revpnum" runat="server"
                    ControlToValidate="ppno" ValidationExpression="^[0-9]{10}GBR[0-9]{7}[U,M,F]{1}[0-9]{9}$" >*</asp:RegularExpressionValidator>--%>
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 109px" class="lable">
                    Country Passport Issued:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ppcoun" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvcntry" runat="server"
                    ControlToValidate="ppcoun" ErrorMessage="Please Enter Country" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 109px" class="lable">
                    Date Passport Issued(MM/DD/YYYY):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="passissue" runat="server" contenteditable="false" 
                        Height="22px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="passissue">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvcal1" runat="server" 
                        ErrorMessage="Please select Issue Date  " ControlToValidate="passissue" ValidationGroup="emp2">*</asp:RequiredFieldValidator>  
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 109px" class="lable">
                    Date Passport Expired(MM/DD/YYYY):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="passexpiry" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="passexpiry">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvexpdate" runat="server" 
                        ErrorMessage="Please select Date  " ControlToValidate="passexpiry" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="height: 21px" class="lable" colspan="2">
                    Period of stay in the U.S:Please provide us actual dates of stay in the U.S&nbsp;
                    in Various Visa categories.Submit Photocopies of all
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 976px; height: 21px;" class="lable" colspan="2">
                    I-94 Cards or USCIS Approval Notices issued to you.&nbsp;</td>
                <td width="20%"> </td>
            </tr>
        </table>
       
        <table style="width: 980px; height: 94px">
            <tr>
             
                <td class="lable" >
                    &nbsp;Visa Type</td>
                <td class="lable" >
                    Date of Admission</td>
                <td class="lable" >
                    Date of Departure (Present)</td>
                <td width="20%"> </td>
            </tr>
            <tr>
                
                <td style="width: 74px" class="lable">
                    <asp:TextBox ID="visa1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvvisa" runat="server"
                    ControlToValidate="visa1" ErrorMessage="Enter Type Of Visa" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                    </td>
                <td style="width: 95px" class="lable">
                    <asp:TextBox ID="admm1" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="admm1">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvaddate" runat="server" 
                        ErrorMessage="Please select Date  " ControlToValidate="admm1" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                    </td>
                <td style="width: 32px" class="lable">
                    <asp:TextBox ID="depa1" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="depa1">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvdeptdate" runat="server" 
                        ErrorMessage="Please select Date  " ControlToValidate="depa1" ValidationGroup="emp2">*</asp:RequiredFieldValidator>
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
             
                <td style="width: 74px" class="lable">
                    <asp:TextBox ID="visa2" runat="server"></asp:TextBox></td>
                <td style="width: 95px" class="lable">
                    <asp:TextBox ID="admm2" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="admm2">
                    </cc1:CalendarExtender>
                    <%--<asp:RequiredFieldValidator ID="rfvaddate1" runat="server" 
                        ErrorMessage="Please select Date  " ControlToValidate="admm2" >*</asp:RequiredFieldValidator>--%>
                    </td>
                <td style="width: 32px" class="lable">
                    <asp:TextBox ID="depa2" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="depa2">
                    </cc1:CalendarExtender>
                    <%--<asp:RequiredFieldValidator ID="rfvdepdate1" runat="server" 
                        ErrorMessage="Please select Date  " ControlToValidate="depa2" >*</asp:RequiredFieldValidator>--%>
                </td>
                <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 74px; height: 26px;" class="lable">
                    <asp:TextBox ID="visa3" runat="server"></asp:TextBox></td>
                <td style="width: 95px; height: 26px;" class="lable">
                    <asp:TextBox ID="admm3" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="admm3">
                    </cc1:CalendarExtender>
                    
                    </td>
                <td style="width: 32px; height: 26px;" class="lable">
                    <asp:TextBox ID="depa3" runat="server" contenteditable="false"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="depa3">
                    </cc1:CalendarExtender>
                </td>
                <td width="20%"> </td>
            </tr>
        </table><br />
        <table style="width: 978px">
            <tr>
                <td class="lableb"><b> IF YOU ARE OUTSIDE UNITED STATES OR IF YOU ARE IN THE UNITED STATES AND NOT SEEKING
                    A CHANGE OF STATUS </b></td>
            </tr>
        </table>
        <table style="width: 978px">
            <tr>
                <td style="height: 21px" class="lableb"><b>
                    OR EXTENSION OF STAY, please provide the following information </b> </td>
            </tr>
        </table><br />
        <table style="width: 977px">
            <tr>
             <td class="lable">
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="us" Text="YES" />&nbsp;
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="us" Text="NO" /></td>
            </tr>
        </table>
        <table style="width: 630px; height: 48px">
            <tr>
                <td style="width: 100px" class="lable">
                    US Consulate Where you will apply for visa<br />
                    (City/State/Country)&nbsp;</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="usconsulate" runat="server" Height="30px"></asp:TextBox></td>
                    <td width="20%"> </td>
            </tr>
            <tr>
                <td style="width: 100px" class="lable">
                    Your Foreign Address:<br />
                    (Street/City/State/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="foreignaddr" runat="server" Height="27px"></asp:TextBox></td>
                <td width="20%"> </td>
            </tr>
        </table><br />
        <table style="width: 974px">
            <tr>
                <td style="height: 21px" class="lableb" ><b>
                    IF YOU WERE EVER DENIED H-1B CLASSIFICATION ,please provide us with detailed explanation: </b> </td>
            </tr>
        </table>
        <table style="width: 973px; height: 32px">
            <tr>
             <td width="20%"> </td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="h1b" runat="server" Height="49px" TextMode="MultiLine" Width="950px"></asp:TextBox>
                    <br />
                </td>
            </tr>
        </table><br />
        <table style="width: 973px">
            <tr>
                <td class="lableb"><b>
                    IF THE BENIFICIARY HAS ANY DEPENDENTS IN THE U.S., please provide the following
                    information: </b> </td>
            </tr>
        </table>
        <table style="width: 969px">
            <tr>
           
                <td class="lable" >
                    &nbsp;<asp:RadioButton ID="RadioButton3" runat="server" GroupName="benif" Text="YES" />&nbsp;
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="benif" Text="NO" /></td>
            </tr>
        </table>
        <table style="width: 969px; height: 117px">
            <tr>
             
                <td class="lable" >
                    &nbsp;Name
                </td>
                <td class="lable" >
                    &nbsp;Visa Type</td>
                <td class="lable" >
                    &nbsp;I-94 Number</td>
                <td class="lable" >
                    &nbsp;Passport Number</td>
                <td class="lable">
                    &nbsp;Country of Passport</td>
            </tr>
            <tr>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="name1" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="vt1" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ino1" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="pass1" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="cp1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="name2" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="vt2" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ino2" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="pass2" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="cp2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="name3" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="vt3" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ino3" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="pass3" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="cp3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="name4" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="vt4" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ino4" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="pass4" runat="server"></asp:TextBox></td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="cp4" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <table style="width: 967px">
            <tr>
                <td class="lable" > &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save & Continue" Width="196px" OnClick="btnedit2_Click" ValidationGroup="emp2" /> </td>
            </tr>    
        </table>
        <table style="width: 964px">
            <tr>
                <td class="lable">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; 1033 Sterling Road, Ste.204, Herndon-VA-201701 USA. Phone:703-957-7829
                    Fax:703-842-8746</td>
            </tr>
        </table>
      </td>
    </tr>
    </table>
    </form>
</body>
</html>
