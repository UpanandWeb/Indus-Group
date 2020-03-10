<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrationforjobseeker.aspx.cs" Inherits="verifyinfo_outside" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style5
        {
            width: 150px;
        }
        .style8
        {
            width: 318px;
        }
        .style9
        {
            width: 123px;
        }
        .style15
        {
            height: 42px;
            width: 82px;
        }
        .style16
        {
            height: 42px;
            width: 71px;
        }
        .style19
        {
            height: 42px;
            width: 75px;
        }
        .style20
        {
            height: 28px;
            width: 302px;
        }
        .style21
        {
            height: 42px;
            width: 302px;
        }
        .style23
        {
            height: 28px;
            width: 222px;
        }
        .style24
        {
            height: 42px;
            width: 222px;
        }
        .style25
        {
            height: 26px;
        }
        .style26
        {
            width: 135px;
        }
        .style32
        {
            width: 455px;
        }
        .style33
        {
            height: 22px;
        }
        .style34
        {
            height: 42px;
            width: 78px;
        }
        .style35
        {
            font-size: 14px;
            font-weight: bold;
            color: #C00;
            width: 964px;
        }
        .style36
        {
            width: 964px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />    
       <asp:Label ID="lblclick" runat="server" Text="click "></asp:Label>
       <asp:LinkButton ID="lnkbtnhere" runat="server" onclick="lnkbtnhere_Click" ForeColor="Blue">here </asp:LinkButton>
       <asp:Label ID="lblloginorregister" runat="server" Text="to login or register"></asp:Label>
       <br />
       <br />
       <asp:Label ID="lblMsg" runat="server" ></asp:Label>                             
       <br /> 
       <br />                        
       <asp:Label ID="lblplzreviewreg" runat="server" Text="Please review the information below for accuracy."></asp:Label>
       <table width="100%">
        <tr>
         <td>
          <table width="100%" style="background-color:#D0EFFF">        
            <tr>
                <td align="center" valign="middle" class="headings" style="background-color:SkyBlue">
                    <asp:Label ID="lblHeadPersInfo" runat="server" Text="PERSONAL INFORMATION" 
                        Font-Bold="True" Font-Names="Arial" Font-Size="Medium"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <table width="100%">
                                                    
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblfname" runat="server" Text="First Name"></asp:Label>
                                <asp:Label ID="lblfnamestar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVfname" runat="server" 
                                    ErrorMessage="Please enter the first name" ControlToValidate="txtfname" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lbllname" runat="server" Text="Last Name"></asp:Label>
                                <asp:Label ID="lbllnamestar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVlname" runat="server" 
                                    ErrorMessage="Please enter the last name" ControlToValidate="txtlname" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lbladdline1" runat="server" Text="Address Line 1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadressline1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lbladdline2" runat="server" Text="Address Line 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadresline2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>                        
                            <td align="right" class="style32">
                                <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                            </td>                         
                            <td>
                                <asp:TextBox ID="txtcity" runat="server" Width="121px" Height="20px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">                            
                               <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>                           
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" Width="150">
                                    <asp:ListItem Selected="True" Value="Select State">Select State </asp:ListItem>
                                    <asp:ListItem Value="Andra Pradesh">Andra Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Arunachal Pradesh">Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Assam">Assam</asp:ListItem>
                                    <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                                    <asp:ListItem Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                                    <asp:ListItem Value="Goa">Goa</asp:ListItem>
                                    <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                                    <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                                    <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Jammu and Kashmir">Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem Value="Jharkhand">Jharkhand</asp:ListItem>
                                    <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                    <asp:ListItem Value="Kerala">Kerala</asp:ListItem>
                                    <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                    <asp:ListItem Value="Manipur">Manipur</asp:ListItem>
                                    <asp:ListItem Value="Meghalaya">Meghalaya</asp:ListItem>
                                    <asp:ListItem Value="Mizoram">Mizoram</asp:ListItem> 
                                    <asp:ListItem Value="Nagaland">Nagaland</asp:ListItem> 
                                    <asp:ListItem Value="Orissa">Orissa</asp:ListItem> 
                                    <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                    <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                                    <asp:ListItem Value="Sikkim">Sikkim</asp:ListItem> 
                                    <asp:ListItem Value="Tamil Nadu">Tamil Nadu</asp:ListItem> 
                                    <asp:ListItem Value="Chennai">Chennai</asp:ListItem> 
                                    <asp:ListItem Value="Tripura">Tripura</asp:ListItem>
                                    <asp:ListItem Value="Uttaranchal">Uttaranchal</asp:ListItem>
                                    <asp:ListItem Value="Uttar Pradesh">Uttar Pradesh</asp:ListItem> 
                                    <asp:ListItem Value="West Bengal">West Bengal</asp:ListItem>                                  
                                </asp:DropDownList>
                             </td>
                        </tr>
                        <tr>
                            <td align="right" class="style33">
                                <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
                            <td class="style33">
                                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" 
                                    onselectedindexchanged="ddlCountry_SelectedIndexChanged" >
                                    <asp:ListItem Value="Select County">Select Country</asp:ListItem>
                                    <asp:ListItem Value="India">India</asp:ListItem>
                                    <asp:ListItem Value="U.S">U.S</asp:ListItem>
                                </asp:DropDownList>                                                          <asp:Label ID="lblzip" runat="server" Text="ZipCode"></asp:Label>                                                        
                               <asp:TextBox ID="txtzipUS" runat="server" Width="50"></asp:TextBox>
                               <asp:TextBox ID="txtpinIndia" runat="server" Width="50"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                   ErrorMessage="Should Enter Valid Pin Code" ControlToValidate="txtpinIndia" 
                                   ValidationExpression="\d{6}" ValidationGroup="PersonalInfoGroup">*</asp:RegularExpressionValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                   ErrorMessage="Enter Valid Zip Code" ControlToValidate="txtzipUS" 
                                   ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="PersonalInfoGroup">*</asp:RegularExpressionValidator>                                                                                                                                 
                           </td>
                        </tr>
                        <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="CC" Width="55"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text="AC" Width="54"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="Ph.No"></asp:Label>
                        </td> 
                        </tr>
                                           
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblhomeph" runat="server" Text="Home Phone"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txthomephCC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label18" runat="server" Text="&nbsp;-&nbsp;" ></asp:Label>
                                <asp:TextBox ID="txthomephAC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label19" runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                                <asp:TextBox ID="txthomephNo" runat="server" Width="75"></asp:TextBox>                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblCellPh" runat="server" Text="Cell Phone"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcellCC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label21" runat="server" Text="&nbsp;-&nbsp;" ></asp:Label>
                                <asp:TextBox ID="txtcellAC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label22" runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                                <asp:TextBox ID="txtcellNo" runat="server" Width="75"></asp:TextBox>                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblWorkPh" runat="server" Text="Work Phone"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtworkphCC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label24" runat="server" Text="&nbsp;-&nbsp;" ></asp:Label>
                                <asp:TextBox ID="txtworkphAC" runat="server" Width="50"></asp:TextBox>
                                <asp:Label ID="Label25" runat="server" Text="&nbsp;-&nbsp;"></asp:Label>
                                <asp:TextBox ID="txtworkphNo" runat="server" Width="75"></asp:TextBox>
                                &nbsp;&nbsp;<asp:Label ID="Label26" runat="server" Text=" Ext."></asp:Label>
                                <asp:TextBox ID="txtworkphExt" runat="server" Width="75"></asp:TextBox>
                                                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblCurSal" runat="server" Text="Current Salary"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcursal" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlCurSalary" runat="server">
                                    <asp:ListItem Selected="True" Value="$/Hour">$/Hour</asp:ListItem>
                                    <asp:ListItem Value="$/Day">$/Day</asp:ListItem>
                                    <asp:ListItem Value="$/Year">$/Year</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblPrefSal" runat="server" Text="Preferred Salary"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtprefsal" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlprefsal" runat="server">
                                    <asp:ListItem Selected="True" Value="$/Hour">$/Hour</asp:ListItem>
                                    <asp:ListItem Value="$/Day">$/Day</asp:ListItem>
                                    <asp:ListItem Value="$/Year">$/Year</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                        <td align="right" class="style32">
                                <asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label>
                                <asp:Label ID="lblEmailstar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtemailaddress" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVemailaddress" runat="server" 
                                    ControlToValidate="txtemailaddress" 
                                    ErrorMessage="Please Enter a valid email address" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ErrorMessage="Eg:mac@ddd.com" ControlToValidate="txtemailaddress" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblPwd" runat="server" Text="Password"></asp:Label>
                                <asp:Label ID="lblpwdstar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVpwd" runat="server" 
                                    ErrorMessage="Please enter a valid password(alphanumeric)" 
                                    ControlToValidate="txtpwd" ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style32">
                                <asp:Label ID="lblConPwd" runat="server" Text="Confirm Password"></asp:Label>
                                <asp:Label ID="lblConpwdstar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtconpwd" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVconpwd" runat="server" 
                                    
                                    ErrorMessage="Please enter a valid password in a confirm password field(alpha numeric)" 
                                    ControlToValidate="txtconpwd" ValidationGroup="PersonalInfoGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="Password and Confirm password fields are not the same" 
                                    ControlToCompare="txtpwd" ControlToValidate="txtconpwd" 
                                    ValidationGroup="PersonalInfoGroup">*</asp:CompareValidator>
                            </td> 
                            </tr> 
                            <tr>                      
                        <td align="center" colspan="2">
                            <asp:Label ID="Label6" runat="server" Text=" Where CC = Country Code , AC =Area Code , Ph.No = Phone Number" ForeColor="#006600"></asp:Label>
                        </td>
                      </tr>
                     </table>
                    </td>
                   </tr>
                  </table>
                 </td>
                </tr> 
                <tr><td colspan="2"></td></tr> 
                <tr>
                <td>                   
                   <table width="100%" border="0">
                     <tr>
                        <td colspan="6" align="center" style="background-color:SkyBlue" class="headings">
                           <asp:Label ID="lblWorkExp" runat="server" Text="WORK EXPERIENCE" Font-Bold="True" 
                                    Font-Names="Arial" Font-Size="Medium"></asp:Label>
                        </td>
                     </tr>
                     <tr><td></td></tr>
                     <tr>
                        <td colspan="6">
                           <table width="100%" border="0">
                             <tr>
                               <td colspan="2" align="center" style="background-color:#D0EFFF">
                                  <asp:Label ID="lblExpfrom" runat="server" Text="From" Font-Bold="True" 
                                  Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                               </td>                
                               <td colspan="2" align="center" style="background-color:#D0EFFF">
                                  <asp:Label ID="lblExpTo" runat="server" Text="To" Font-Bold="True" 
                                   Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                               </td>
                               <td  align="center" style="background-color:#D0EFFF">    
                                  <asp:Label ID="lblExpTitle" runat="server" Text="Title/Employer" Font-Bold="True" 
                                  Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                               </td>
                               <td align="center" style="background-color:#D0EFFF">
                                  <asp:Label ID="lblExpDetails" runat="server" Text="Work Experience" Font-Bold="True" 
                                  Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                               </td>                 
                    </tr>
                    <tr>
                     <td  align="center">
                       <asp:DropDownList ID="ddlfrom" runat="server" Width="50">
                        <asp:ListItem Value="Jan">Jan</asp:ListItem>
                        <asp:ListItem Value="Feb">Feb</asp:ListItem>
                        <asp:ListItem Value="Mar">Mar</asp:ListItem>
                        <asp:ListItem Value="Apr">Apr</asp:ListItem>
                        <asp:ListItem Value="May">May</asp:ListItem>
                        <asp:ListItem Value="Jun">Jun</asp:ListItem>
                        <asp:ListItem Value="Jul">Jul</asp:ListItem>
                        <asp:ListItem Value="Aug">Aug</asp:ListItem>
                        <asp:ListItem Value="Sep">Sep</asp:ListItem>
                        <asp:ListItem Value="Oct">Oct</asp:ListItem>
                        <asp:ListItem Value="Nov">Nov</asp:ListItem>
                        <asp:ListItem Value="Dec">Dec</asp:ListItem>                        
                       </asp:DropDownList>
                   </td>
                   <td  align="center">
                    <asp:TextBox ID="txtfromyr" runat="server" Width="50px" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtfromyr" EnableTheming="True" 
                        ErrorMessage="Please use the format yyyy" ValidationExpression="\d{4}" 
                        ValidationGroup="WorkExpGroup">*</asp:RegularExpressionValidator>
                 </td>                
                 <td align="center">
                    <asp:DropDownList ID="ddlto" runat="server" Width="50">                        
                        <asp:ListItem Value="Jan">Jan</asp:ListItem>
                        <asp:ListItem Value="Feb">Feb</asp:ListItem>
                        <asp:ListItem Value="Mar">Mar</asp:ListItem>
                        <asp:ListItem Value="Apr">Apr</asp:ListItem>
                        <asp:ListItem Value="May">May</asp:ListItem>
                        <asp:ListItem Value="Jun">Jun</asp:ListItem>
                        <asp:ListItem Value="Jul">Jul</asp:ListItem>
                        <asp:ListItem Value="Aug">Aug</asp:ListItem>
                        <asp:ListItem Value="Sep">Sep</asp:ListItem>
                        <asp:ListItem Value="Oct">Oct</asp:ListItem>
                        <asp:ListItem Value="Nov">Nov</asp:ListItem>
                        <asp:ListItem Value="Dec">Dec</asp:ListItem>                        
                    </asp:DropDownList>
                    
                </td>
                <td align="center">
                    <asp:TextBox ID="txttoyr" runat="server" Width="50"></asp:TextBox>                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txttoyr" ErrorMessage="Please use the format yyyy" 
                        ValidationExpression="\d{4}" ValidationGroup="WorkExpGroup">*</asp:RegularExpressionValidator>                    
                </td>
                <td align="center">
                    <asp:TextBox ID="txttitle" runat="server" Width="200px"></asp:TextBox>                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txttitle" ErrorMessage="You must fill Title" 
                        ValidationGroup="WorkExpGroup">*</asp:RequiredFieldValidator>                    
                </td>
                <td align="center">
                    <asp:TextBox ID="txtexp" runat="server" TextMode="MultiLine" Width="420px"></asp:TextBox>
                </td>
             </tr>
             <tr>
                <td colspan="6" align="center" >  
                    <br />                  
                    <asp:Button ID="btnexpsubmit" runat="server" onclick="btnexpsubmit_Click" 
                        Text="Add Experience" ValidationGroup="WorkExpGroup" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium" />
                </td>
            </tr>            
          </table>  
                        </td>
                    </tr>
      <tr>
        <td align="center" colspan="6">                        
            <table width="100%">
              <tr>
                 <td colspan="3">
                     &nbsp;
                 </td>
              </tr>
              <tr>
                 <td style="width:100px">
                      <asp:GridView ID="gvWorkExp" runat="server" AutoGenerateColumns="False"                                     
                                    Width="935px" DataKeyNames="id" OnRowEditing="gvWorkExp_RowEditing" 
                                    OnRowUpdating="gvWorkExp_RowUpdating" 
                                    OnRowCancelingEdit="gvWorkExp_RowCancelingEdit" 
                                    OnRowDeleting="gvWorkExp_RowDeleting" 
                                    OnPageIndexChanging="gvWorkExp_PageIndexChanging" CellPadding="4" 
                                    ForeColor="#333333" GridLines="None">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>                                     
                                        <asp:BoundField DataField="id" HeaderText="S.No" />
                                        <asp:BoundField DataField="frommonth" HeaderText="From Month" />
                                        <asp:BoundField DataField="fromyear" HeaderText="From Year" />
                                        <asp:BoundField DataField="tomonth" HeaderText="To Month" />
                                        <asp:BoundField DataField="toyear" HeaderText="To Year" />
                                        <asp:BoundField DataField="title" HeaderText="Title" />
                                        <asp:BoundField DataField="workexperience" HeaderText="Work Experience" />                                       
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />                                       
                                    </Columns>                                    
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />                                    
                      </asp:GridView>  
                  </td>
                 </tr>
               </table>
              </td>
            </tr>
          </table>
         </td>
        </tr>
        <tr><td></td></tr> 
        <tr>
            <td>            
               <table width="100%" border="0">
                  <tr>
                     <td align="center" style="background-color:SkyBlue">
                         <asp:Label ID="lblHeadEdu" runat="server" Text="EDUCATION" Font-Bold="True" 
                                    Font-Names="Arial" Font-Size="Medium"></asp:Label>
                     </td>
                  </tr>
                  <tr><td></td></tr>
                  <tr>
                    <td>
                      <table width="100%" border="0">
                        <tr>
                          <td align="center" style="background-color:#D0EFFF">
                            <asp:Label ID="lblEduYear" runat="server" Text="Year" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                          </td>
                
                          <td align="center" style="background-color:#D0EFFF">
                            <asp:Label ID="lblEduDegree" runat="server" Text="Degree" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                          </td>
                          <td class="style9" align="center" style="background-color:#D0EFFF">
                            <asp:Label ID="lblEduSchool0" runat="server" Text="School" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                          </td>
                          <td align="center" style="background-color:#D0EFFF">
                            <asp:Label ID="lblEduMajor" runat="server" Text="Major" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"></asp:Label>
                          </td>
                        </tr>
                        <tr>
                          <td class="style26" align="center">
                            <asp:TextBox ID="txtyear" runat="server" Width="103px"></asp:TextBox>                    
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="Please use the format yyyy" ValidationExpression="\d{4}" 
                        ControlToValidate="txtyear" ValidationGroup="EducationGroup">*</asp:RegularExpressionValidator>
                    
                         </td>                
                        <td class="style5" align="center">
                           <asp:TextBox ID="txtdegree" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td class="style9" align="center">
                           <asp:TextBox ID="txtschool" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td class="style8" align="center">
                            <asp:TextBox ID="txtmajor" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="You must fill Major" ControlToValidate="txtmajor" 
                        ValidationGroup="EducationGroup">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>            
                    <tr>
                        <td colspan="4" align="center">
                            <br />
                            <asp:Button ID="btneducationsubmit" runat="server" Text="Add Education" 
                        onclick="btneducationsubmit_Click" ValidationGroup="EducationGroup" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"/>&nbsp;&nbsp;
                        </td>
                    </tr>            
                  </table>
                    </td>
                </tr>
                <tr>
                  <td colspan="2" class="style36">                                
                     <table width="100%">
                        <tr>
                           <td style="width:100px" colspan="6" align="center"> 
                                <asp:GridView ID="gvEdu" runat="server" AutoGenerateColumns="False"  
                                     CellPadding="4" ForeColor="#333333" GridLines="None"                                      
                                    Width="935px"  OnRowEditing="gvEdu_RowEditing" DataKeyNames="id"
                                    OnRowUpdating="gvEdu_RowUpdating" 
                                    OnRowCancelingEdit="gvEdu_RowCancelingEdit" 
                                    OnRowDeleting="gvEdu_RowDeleting" 
                                    OnPageIndexChanging="gvEdu_PageIndexChanging">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>                                                                           
                                        <asp:BoundField DataField="id" HeaderText="S.No." />                                        
                                        <asp:BoundField DataField="year" HeaderText="Year" />
                                        <asp:BoundField DataField="degree" HeaderText="Degree" />
                                        <asp:BoundField DataField="school" HeaderText="School" />
                                        <asp:BoundField DataField="major" HeaderText="major" />                                        
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />                                        
                                    </Columns>                                
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>                                
                          </td>
                        </tr>
                       </table>
                      </td>
                    </tr>                                             
                 </table>            
               </td>
            </tr>
            <tr>
               <td colspan="2" align="right">
                     <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                    onclick="btnSubmit_Click" ValidationGroup="PersonalInfoGroup" Font-Bold="True" 
                        Font-Names="Californian FB" Font-Size="Medium"/>  
               </td>                           
            </tr>
            <tr>
               <td>
                     <asp:ValidationSummary ID="validsumpersonalinfo" runat="server" 
                                EnableViewState="False" ShowMessageBox="True" ShowSummary="False" 
                                ValidationGroup="PersonalInfoGroup" />
                     <asp:ValidationSummary ID="validsumworkexp" runat="server" 
                                ValidationGroup="WorkExpGroup" ShowMessageBox="True" ShowSummary="False" />
                     <asp:ValidationSummary ID="validsumeducation" runat="server" 
                                ValidationGroup="EducationGroup" ShowMessageBox="True" 
                                ShowSummary="False" />
               </td>
                        
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
