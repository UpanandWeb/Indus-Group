<%@ Page Language="C#" AutoEventWireup="true" CodeFile="account_register.aspx.cs" Inherits="account_register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <table width="560" border="0" align="center">
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td><img src="images/logo.png" width="199" height="46" /></td>
      </tr>
      <tr>
        <td height="146" align="center"><table  width="60%" >
          <tr>
            <td>Create your account so you can:</td>
          </tr>
          <tr>
            <td> </td>
          </tr>
          <tr>
            <td><li>Upload or build your resume</li></td>
          </tr>
          <tr>
            <td><li>Apply online for open positions and track your applications</li></td>
          </tr>
          <tr>
            <td><li>Ask the system to suggest ideal job positions based on your resume experience and skill profile</li></td>
          </tr>
          <tr>
            <td> </td>
          </tr>
          <tr>
            <td> TO CREATE A NEW ACCOUNT: </td>
          </tr>
          <tr>
            <td nowrap="nowrap" valign="top" width="975"><p>You  have a choice of four methods to input your resume. Don't worry about    <br />         personal info, our intelligent robot will fill in the details for you.  <br />           Or you can choose to make a new resume.</p></td>
          </tr>
          <tr>
            <td nowrap="nowrap" valign="top">
            <form action="" method="post" name="form1" id="form2">
            
            <table border="0" width="600" cellpadding="0" cellspacing="0" style="margin-left:20px;">
                <tr align="center">
                    <td align="center" style="font-size:14px; color:#036; font-family:Arial Black;">
                        <asp:RadioButton ID="rbtupload" runat="server" GroupName="group" Checked="true" Text="Upload" AutoPostBack="true" 
                            oncheckedchanged="rbtupload_CheckedChanged" />
                    </td>
                    <td align="center" style="font-size:14px; color:#036; font-family:Arial Black;">
                        <asp:RadioButton ID="rbtpaste" runat="server" Text="Paste" GroupName="group" AutoPostBack="true" 
                            oncheckedchanged="rbtpaste_CheckedChanged" />
                    </td>
                    <td align="center" style="font-size:14px; color:#036; font-family:Arial Black;">
                        <asp:RadioButton ID="rbtresumemaker" runat="server" GroupName="group" Text="Resume Maker" AutoPostBack="true" 
                            oncheckedchanged="rbtresumemaker_CheckedChanged" />
                    </td>
                    <td align="center" style="font-size:14px; color:#036; font-family:Arial Black;">
                        <asp:RadioButton ID="rbtregisterwithoutresume" runat="server" Text="REGISTER WITHOUT A RESUME " GroupName="group" AutoPostBack="true" 
                            oncheckedchanged="rbtregisterwithoutresume_CheckedChanged" />
                    </td>
               </tr>
            </table>
            
            <asp:Panel ID="pnlupload" runat="server" Visible="true">
                 <table>
                    <tr>
                        <td colspan="2">
                            <p><center>UPLOAD RESUME:</center></p>
                            <p>Just choose the resume file you wish to upload using the browse button, then hit Upload to transfer the file.</p>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Label1" runat="server" Text="Resume"></asp:Label></td>
                        <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                    </tr>
                </table>
            </asp:Panel> 
            
            <asp:Panel ID="pnlpaste" runat="server" Visible="true">
                <table width="560" border="0" align="center">
                  <tr>
                    <td>Just paste in your resume into the text box below and then click on submit. 
                      <textarea name="textarea" id="textarea" cols="45" rows="10" style="width:100%"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td align="center">
                        <input type="button" value="Submit" />
                    </td>
                  </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlresumemaker" runat="server" Visible="true">
                <table width="560" border="0" align="center">
                  <tr>
                    <td>
                        <table width="100%" border="0">
                        <tr>
                            <td><img src="images/logo.png" width="199" height="46" /></td>
                        </tr>
                        <tr>
                            <td height="146" align="center" valign="top">
                                <b>Let's begin by entering some of the personal details that will appear on your resume.</b><br />
                                  <br />
                                <table  border="0">
                              <tbody>
                                <tr>
                                  <td height="28" nowrap="nowrap"> EmailAddress </td>
                                  <td nowrap="nowrap" valign="top"><input name="emailaddress" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td height="18">Password</td>
                                  <td height="18"><input name="password" value="" type="password" /></td>
                                </tr>
                                <tr>
                                  <td height="26"> Confirm Password </td>
                                  <td height="26"><input name="passwordconfirm" value="" type="password" /></td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td colspan="2" height="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td nowrap="nowrap"> First Name </td>
                                  <td><input name="firstname" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td nowrap="nowrap">Last Name</td>
                                  <td><input name="lastname" value="" type="text" /></td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td colspan="2" height="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="2" nowrap="nowrap">Address Line1</td>
                                  <td height="2" nowrap="nowrap"><input name="address1" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td height="20" nowrap="nowrap">Address Line2 </td>
                                  <td height="20"><input name="address2" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td>City </td>
                                  <td colspan="1" height="22"><input name="city" value="" size="15" type="text" />
                                    State     	                                                                                                                                                                                                                             ZipCode   
                                    <input name="zipcode" value="" size="5" type="text" /></td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td colspan="2" height="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="16" nowrap="nowrap">HomePhone</td>
                                  <td height="16"><input name="hphone1" value="" size="3" maxlength="3" type="text" />
                                    -
                                    <input name="hphone2" size="3" maxlength="3" value="" type="text" />
                                    -
                                    <input name="hphone3" size="4" maxlength="4" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td height="16" nowrap="nowrap">CellPhone</td>
                                  <td height="16"><input name="cphone1" size="3" maxlength="3" value="" type="text" />
                                    -
                                    <input name="cphone2" size="3" maxlength="3" value="" type="text" />
                                    -
                                    <input name="cphone3" size="4" maxlength="4" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td height="16" nowrap="nowrap">WorkPhone</td>
                                  <td height="16" nowrap="nowrap"><input name="wphone1" size="3" maxlength="3" value="" type="text" />
                                    -
                                    <input name="wphone2" size="3" maxlength="3" value="" type="text" />
                                    -
                                    <input name="wphone3" size="4" maxlength="4" value="" type="text" />
                                    Ext.
                                    <input name="wphoneext" size="4" maxlength="5" value="" type="text" /></td>
                                </tr>
                                <tr bgcolor="#FFFFFF">
                                  <td colspan="2" height="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="24" nowrap="nowrap">Current Salary </td>
                                  <td height="24" nowrap="nowrap"><input name="currentsalary" size="12" maxlength="12" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td nowrap="nowrap">Preferred Salary</td>
                                  <td><input name="preferredsalary1" size="12" maxlength="12" value="" type="text" /></td>
                                </tr>
                                <tr>
                                  <td>Date Available</td>
                                  <td><input name="availabledate" id="availabledate" size="8" maxlength="10" value="10/14/2011" type="text" />
                                  <img id="availabledatetrigger" src="http://jobs.avit.net/images/cal.gif" alt="Click here to choose the date on which you are available" border="0" height="16" width="16" /></td>
                                </tr>
                                <tr>
                                  <td colspan="2">
                                      <asp:Button ID="Button1" runat="server" Text="Resume Maker" 
                                          onclick="btnresumemaker_Click" />
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="2"></td>
                                </tr>
                              </tbody>
                            </table>
                            </td>
                        </tr>
                        </table>
                    </td>
                  </tr>
                 </table>       
            </asp:Panel>
            
            <asp:Panel ID="Pnlregisterwithoutresume" runat="server" Visible="true">
                <table id="table1" border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td colspan="2" valign="top"><table id="table2" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                          <tr>
                            <td colspan="2" align="center"><img src="images/logo.png" width="199" height="46" /></td>
                          </tr>
                          <tr><td height="10px"></td></tr>
                          <tr>
                            <td height="30"> Email :</td>
                            <td><input name="email" value="" size="25" type="text" /></td>
                          </tr>
                          <tr>
                            <td height="30">  Password :</td>
                            <td><input name="pass1" value="" size="25" type="password" /></td>
                          </tr>
                          <tr>
                            <td height="30">  Password confirm :</td>
                            <td><input name="pass2" value="" size="25" type="password" /></td>
                          </tr>
                          <tr>
                            <td height="30">  Name :</td>
                            <td><input name="firstname" value="" size="10" type="text" />
                              <input name="lastname" value="" size="10" type="text" /></td>
                            <td rowspan="9" align="left" nowrap="nowrap" valign="top"><div id="docsdiv">
                              <table id="docstable" name="docstable" border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                </tbody>
                              </table>
                            </div></td>
                          </tr>
                          <tr>
                            <td></td>
                            <td></td>
                          </tr>
                          <tr>
                            <td height="30">  Address:</td>
                            <td nowrap="nowrap"><input name="address1" value="" type="text" /></td>
                          </tr>
                          <tr>
                            <td ></td>
                            <td height="30"><input name="address2" value="" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">  <span id="lb_city">City</span>:  </td>
                            <td nowrap="nowrap"><input name="city" id="city" value="" size="15" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">  <span id="lb_state">State</span>:  </td>
                            <td nowrap="nowrap">  <span id="lb_zip">Zip Code</span>:  
                              <input name="zipcode" id="zipcode" value="" size="5" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">  Home#:   </td>
                            <td nowrap="nowrap"><input name="homephone" value="" size="10" maxlength="10" type="text" />
                              Work#:
                              <input name="workphone" value="" size="10" maxlength="17" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">  Cell#:</td>
                            <td nowrap="nowrap"><input name="cellphone" size="10" maxlength="10" value="" type="text" />
                              Fax#:
                              <input name="fax" size="10" maxlength="10" value="" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">  Current Salary: </td>
                            <td nowrap="nowrap"><input name="currentsalary" value="" size="10" maxlength="10" type="text" /></td>
                          </tr>
                          <tr>
                            <td nowrap="nowrap" height="30">   Preferred Salary:</td>
                            <td nowrap="nowrap"><input name="preferredsalary1" value="" size="10" maxlength="10" type="text" /></td>
                          </tr>
                          <tr>
                            <td>  Narrative</td>
                            <td colspan="2" nowrap="nowrap"><textarea cols="50" rows="4" name="narrative" id="narrative" size="25"></textarea></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="30">  Titles,Skills,Certifications:</td>
                          </tr>
                          <tr>
                            <td colspan="2" nowrap="nowrap" valign="top"><div id="lookuplayer">   
                              <textarea name="titles0" id="titles0" cols="50" rows="1"></textarea>
                              <input name="Ayear0" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear0" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years0" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles1" id="titles1" cols="50" rows="1"></textarea>
                              <input name="Ayear1" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear1" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years1" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles2" id="titles2" cols="50" rows="1"></textarea>
                              <input name="Ayear2" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear2" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years2" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles3" id="titles3" cols="50" rows="1"></textarea>
                              <input name="Ayear3" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear3" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years3" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles4" id="titles4" cols="50" rows="1"></textarea>
                              <input name="Ayear4" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear4" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years4" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles5" id="titles5" cols="50" rows="1"></textarea>
                              <input name="Ayear5" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear5" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years5" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles6" id="titles6" cols="50" rows="1"></textarea>
                              <input name="Ayear6" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear6" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years6" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles7" id="titles7" cols="50" rows="1"></textarea>
                              <input name="Ayear7" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear7" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years7" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles8" id="titles8" cols="50" rows="1"></textarea>
                              <input name="Ayear8" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear8" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years8" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                              
                              <textarea name="titles9" id="titles9" cols="50" rows="1"></textarea>
                              <input name="Ayear9" value="" maxlength="4" size="4" type="text" />
                              to:  
                              <input name="Byear9" value="" maxlength="4" size="4" type="text" />
                              OR
                              <input name="years9" value="" maxlength="4" size="4" type="text" />
                              Years <br />
                            </div></td>
                          </tr>
                          <tr>
                            <td colspan="2">&nbsp; 
                              <table width="100%" border="0">
                                <tr>
                                  <td align="left"><input type="button" value="save" /></td>
                                  <td>&nbsp;</td>
                                  <td align="right"><input type="button" value="save" /></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td></td>
                            <td align="right"></td>
                          </tr>
                        </tbody>
                      </table></td>
                    </tr>
                  </tbody>
                </table>
            </asp:Panel>   
            </form>
           </td>
          </tr>
        </table></td>
      </tr>
      
    </table></td>
  </tr>
</table>
                

    </div>
    </form>
</body>
</html>
