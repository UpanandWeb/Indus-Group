<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_Newform.aspx.cs" MasterPageFile="indus.master" Inherits="Employee_Newform" %>
 <%-- <%@ Register Src="usercontrols/Careers_LeftMenu.ascx" TagName="Careers_left" TagPrefix="LeftMenu" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
    <tr>
        <td style="background:#CCC"><div style="line-height:0px;"><img src="images/new_banners/careers.jpg" width="1115" height="150"></div></td>
      </tr>
    
      <tr>
        <td align="center" valign="top">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="180" valign="top" bgcolor="#EFEFEF" align="left">
                <%--<LeftMenu:Careers_left id="Careers_left1" runat="server"></LeftMenu:Careers_left>--%>
                <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="left" valign="top" class="mainhead"><span class="head-black">Careers</span></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             
             
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="hd1" ><a href="AboutCareers.aspx" class="sublink">Overview</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="benefits.aspx" class="sublink">Benefits</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" class="sublink">Fulltime Jobs</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="post_resume.aspx" class="sublink">Post your Resume</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Employee_Newform.aspx" class="sublink">New Employee Form</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
            </table>
             </td>
            <td width="5" align="left" valign="top">&nbsp;</td>
            <td width="863" align="left" valign="top" >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">            
                <tr>
                <td align='center' width='100%' colspan="3"><font color='#003399' size='3pt'><b>PROSPECTIVE EMPLOYEE DATA SHEET</b></font> </td>
            </tr>
            <tr>
                <td style="width: 100px;" colspan="3">
                    <asp:Label ID="lblmessage" runat="server" Text="Label" ></asp:Label>
                </td>
            </tr>
            <tr>
             <td style="width: 15%"></td>
             <td class="lable">
                    Family Name (Last Name):
             </td>
             <td style="width: 100px" class="lable">
                    <asp:TextBox ID="faname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvlname" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Last name" ControlToValidate="faname">*</asp:RequiredFieldValidator>
             </td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td class="lable">
                    First Name:
                </td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="fname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvfname" runat="server"  ValidationGroup="empreg"
                        ErrorMessage="Please Enter First name" ControlToValidate="fname">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td class="lable">
                    Full Middle Name:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="mname" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable" >
                    All Other Names Used(Include maiden name and names from<br />
                    all previous marriages)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="othernames" runat="server" Height="32px" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvoname" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Other Name Before or After Marriage" ControlToValidate="othernames">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Present Address(Street/City/State/Zip/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="presaddr" runat="server" Height="28px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvaddr" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Address" ControlToValidate="presaddr">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Permenant Address
                    (Street/City/State/Zip/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="permaddr" runat="server" Height="31px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpadd" runat="server" ValidationGroup="empreg"
                    ErrorMessage="Please Enter Permanent Address" ControlToValidate="permaddr">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="lable">
                    Permenat Address in Foreign Country:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="permaddr_f" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Birth Date (MM/DD/YYYY):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="dob" runat="server" ReadOnly="false" Width="180px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dob">
                    </cc1:CalendarExtender>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Birth Place
                    (City/Town/State/Country)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="bplace" runat="server" Height="28px" TextMode="MultiLine" 
                        Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvbplace" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Birth Place" ControlToValidate="bplace">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Country of Citizenship:</td>
                <td style="width: 100px" class="lable">
                    <asp:DropDownList ID="ccitizen" runat="server" Width="180px" OnSelectedIndexChanged="ccitizen_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Selected="True" Value="Select Country">Select Country</asp:ListItem>
                    </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="rfvcountry" runat="server"
                 ErrorMessage="please select country" ValidationGroup="empreg" InitialValue="Select Country"
                 ControlToValidate="ccitizen" >*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr id="trsocial" runat="server" visible="false">
                <td style="width: 15%">
                    &nbsp;</td>
                <td class="lable">
                    Social Security Number(if any):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="ssno" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
                        <tr id="trRnum" runat="server" visible="false">
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Alien Registration Number(if any):&nbsp;</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="arno" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvregnum" runat="server"  ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="arno">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
                       <tr id="trDTInum" runat="server" visible="false">
                <td style="width: 15%">
                 </td>
                <td class="lable">
                    Dependendant Tax Identification Number(if any):</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="taxno" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtin" runat="server" ValidationGroup="empreg"
                ErrorMessage="Please Enter Only Digits" ControlToValidate="taxno">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
             <tr><td colspan="3" height="20px"></td></tr>
                        <tr id="trHTitle" runat="server" visible="false">

                <td colspan="3" class="lableb" align="center"><b>IF THE BENEFICIARY IS IN THE U.S ., please provide the following information</b></td>
            </tr>
             <tr><td colspan="3" height="10px"></td></tr>
                       <tr id="trNomini" runat="server" visible="false">

                <td width="15%">
                 </td>
                <td class="style25">
                    Current Nonimmigrant Status:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="nonimm" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
                       <tr id="trUsAdmission" runat="server" visible="false">

                <td width="15%">
                 </td>
                <td class="style25">
                    Date Of most recent Admission to the U.S.
                    (MM/DD/YYYY)</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="usaddmission" runat="server" ReadOnly="false" Width="180px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="usaddmission">
                    </cc1:CalendarExtender>
                </td>
            </tr>
                        <tr id="trI94num" runat="server" visible="false">
            <td width="15%">
             </td>
                <td class="style25">
                    I-94 Number:</td>
                <td style="width: 100px" class="lable">
                    <asp:TextBox ID="i94no" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
            <td align="center" colspan="3">
              <asp:Button Text="Submit" ID="btnsubmit" runat="server" Width="204px" 
                 ValidationGroup="empreg" onclick="btnsubmit_Click"  />
            </td>
            </tr>
            </table>          
          
            </td>
          </tr>
         
      
        </table>    
         </td>
     </tr>
</asp:Content>

