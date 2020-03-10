<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Careers.aspx.cs" Inherits="Careers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no" />
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon' />
    <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>Corporate IT Solutions | IT Business Solution | IT Service Provider | Information Technology Company</title>


    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            padding: 0 !important;
        }

        .cssPager td {
            padding-left: 4px;
            padding-right: 4px;
        }
    </style>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styles1.css" rel="stylesheet" type="text/css" />

    <style>
        .appfont {
            font-family: Segoe UI;
            font-weight: bold;
            vertical-align: top;
            font-size: 20px;
            color: #005086;
        }

            .appfont:hover {
                font-family: Segoe UI;
                font-weight: bold;
                vertical-align: top;
                font-size: 24px;
                color: #005086;
            }

        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .sansserif {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
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


<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="sc1" runat="server"></cc1:ToolkitScriptManager>

        <div class="container-fluide header-inner-wrap">
            <head:Header ID="Header1" runat="server" />
        </div>

        <div style="height: 10px;"></div>

        <section class="about text-left" id="about">
        <div class="container">
          <div class="row">
             <br /><br />
             <table>
              <tr><td>
     
             <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/careers.jpg"/></td></tr>
         <tr>
                <td align="center" valign="top">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td  width="210px" valign="top" bgcolor="#EFEFEF" align="left" style="padding-left:5px;">
                         <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                  <tr><td><br /><br /></td></tr>

              <tr>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead">
                    <span class="head-black">&nbsp;&nbsp;</span><span style="color:black;font-size: 18px">Overview</span></span></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             
             
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead" ><a href="Careers.aspx" style="color:black;font-size: 15px">Careers</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
              <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="hd1"><a href="Benefits.aspx" style="color:black;font-size: 15px">Benefits</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="fulltime_jobs.aspx" style="color:black;font-size: 15px">Fulltime Jobs</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
               <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="seminar.aspx" style="color:black;font-size: 15px">Seminars</a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="3" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="3"></td>
              </tr>
             <tr>
                <td height="1" align="left" valign="top" bgcolor="#DBDBDB"><img src="Images/spacer.gif" alt="Spacer" width="1" height="1"></td>
              </tr>
              <tr>
                <td height="8" align="left" valign="top"><img src="Images/spacer.gif" alt="spacer" width="1" height="8"></td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" width="4" height="8"></td>
                    <td align="left" valign="top" class="mainhead"><a href="Postyour_Resume.aspx" style="color:black;font-size: 15px">Post your Resume</a></td>
                  </tr>
                </table></td>
              </tr>
         
           
            </table>
                        <table width="100%"  >
                            <tr>
                                <td style="padding-top:80px;">
                                    <asp:Label ID="lblk" runat="server" Text="Keywords" Font-Size="18px"  CssClass="sansserif" ></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:TextBox ID="txtk" runat="server" Width="200px" Height="30px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtk" 
      ErrorMessage="Enter Keywords"  ValidationGroup="ser" >*</asp:RequiredFieldValidator>
                                    
                                </td>
                            </tr>
                            <%-- <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Keywords can include Job Title,State or a job ID." 
                                        Font-Size="13px" ></asp:Label>
                                </td>
                            </tr>--%>
                            <tr>
                                <td height="5px"></td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Job Type" Font-Size="18px" CssClass="sansserif"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:DropDownList ID="ddj" runat="server" Width="200px" Height="30px">
                                        <asp:ListItem>Direct Placement</asp:ListItem>
                                        <asp:ListItem>Contract</asp:ListItem>
                                        <asp:ListItem>Right to Hire</asp:ListItem>
                                        <asp:ListItem>Pre-Filled</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px"></td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Country" Font-Size="18px"  CssClass="sansserif"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                     <asp:DropDownList ID="ddcountry" runat="server"  CssClass="lable4"
                                          Width="200px" Height="30px" ForeColor="Black"  AutoPostBack="true"
           OnSelectedIndexChanged="ddcountry_SelectedIndexChanged" ></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddcountry" 
      ErrorMessage="Select Country" InitialValue="Select Country" ValidationGroup="ser">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px"></td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="State" Font-Size="18px"  CssClass="sansserif"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="lable4" Width="200px" 
                                        Height="30px" ForeColor="Black"  
           ></asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList1" 
      ErrorMessage="Select State" InitialValue="Select State" ValidationGroup="ser" >*</asp:RequiredFieldValidator>
                                    <%--<asp:DropDownList ID="dds" runat="server" Width="230px" Height="30px">
                                        <asp:ListItem>-- Select --</asp:ListItem>                                        <asp:ListItem>Alaska</asp:ListItem>
                                        <asp:ListItem>Alabama</asp:ListItem>                                        <asp:ListItem>Arkansas</asp:ListItem>
                                        <asp:ListItem>American Samoa</asp:ListItem>                                        <asp:ListItem>Arizona</asp:ListItem>
                                        <asp:ListItem>California</asp:ListItem>                                        <asp:ListItem>Colorado</asp:ListItem>
                                        <asp:ListItem>Connecticut</asp:ListItem>                                        <asp:ListItem>District of Columbia</asp:ListItem>                                        <asp:ListItem>Delaware</asp:ListItem>
                                        <asp:ListItem>Florida</asp:ListItem>                                        <asp:ListItem>Georgia</asp:ListItem>
                                        <asp:ListItem>Guam</asp:ListItem>                                        <asp:ListItem>Hawaii</asp:ListItem>
                                        <asp:ListItem>Iowa</asp:ListItem>                                        <asp:ListItem>Idaho</asp:ListItem>
                                        <asp:ListItem>Illinois</asp:ListItem>                                        <asp:ListItem>Indiana</asp:ListItem>
                                        <asp:ListItem>Kansas</asp:ListItem>                                        <asp:ListItem>Kentucky</asp:ListItem>
                                        <asp:ListItem>Louisiana</asp:ListItem>                                        <asp:ListItem>Massachusetts</asp:ListItem>
                                        <asp:ListItem>Maryland</asp:ListItem>                                        <asp:ListItem>Maine</asp:ListItem>
                                        <asp:ListItem>Marshall Islands</asp:ListItem>
                                        <asp:ListItem>Michigan</asp:ListItem>                                        <asp:ListItem>Minnesota</asp:ListItem>
                                        <asp:ListItem>Missouri</asp:ListItem>                                        <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                        <asp:ListItem>Mississippi</asp:ListItem>                                        <asp:ListItem>Montana</asp:ListItem>
                                        <asp:ListItem>North Carolina</asp:ListItem>                                        <asp:ListItem>North Dakota<</asp:ListItem>
                                        <asp:ListItem>Nebraska</asp:ListItem>                                        <asp:ListItem>New Hampshire</asp:ListItem>                                        <asp:ListItem>New Jersey</asp:ListItem>                                        <asp:ListItem>New Mexico</asp:ListItem>
                                        <asp:ListItem>Nevada</asp:ListItem>                                        <asp:ListItem>New York</asp:ListItem>
                                        <asp:ListItem>Ohio</asp:ListItem>                                        <asp:ListItem>Oklahoma</asp:ListItem>                                        <asp:ListItem>Oregon</asp:ListItem>
                                        <asp:ListItem>Pennsylvania</asp:ListItem>                                        <asp:ListItem>Puerto Rico</asp:ListItem>                                        <asp:ListItem>Rhode Island</asp:ListItem>
                                        <asp:ListItem>South Carolina</asp:ListItem>                                        <asp:ListItem>South Dakota</asp:ListItem>
                                        <asp:ListItem>Tennessee</asp:ListItem>                                        <asp:ListItem>Texas</asp:ListItem>                                        <asp:ListItem>Utah</asp:ListItem>
                                        <asp:ListItem>Virginia</asp:ListItem>                                        <asp:ListItem>Virgin Islands</asp:ListItem>
                                        <asp:ListItem>Vermont</asp:ListItem>
                                        <asp:ListItem>Washington</asp:ListItem>
                                        <asp:ListItem>Wisconsin</asp:ListItem>
                                        <asp:ListItem>West Virginia</asp:ListItem>
                                        <asp:ListItem>Wyoming</asp:ListItem>
                                    </asp:DropDownList>--%>
                                </td>
                            </tr>
                         
                             <tr>
                                <td height="5px"></td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text="Zip Code" Font-Size="18px"  CssClass="sansserif"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="30px" MaxLength="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td height="5px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnsea" runat="server" Text="Search Jobs" ValidationGroup="ser"  Font-Size="20px" OnClick="btnsea_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="10px" align="right" valign="top">&nbsp;</td>
                    <td width="780px" align="right" valign="top" style="padding:10px;">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" valign="top" ><h3 style="color:#2471a3;">Current Jobs</h3>	</td>
                      </tr>
                      <tr>
                        <td align="left" valign="top">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="2" align="left" valign="top"><img src="Images/spacer.gif" alt="Spacer" width="1" height="2"></td>
                      </tr>
                             
                      <tr>
                        <td align="left" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                            <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                          </tr>
                        </table></td>
                      </tr>
                            <tr>
                        <td  height="10px">&nbsp;</td>
                      </tr>
              
             
                      <tr>
                        <td align="left" valign="top">&nbsp;</td>
                      </tr>
                
            <%--            <tr>
                            <td align="center">
                                <asp:TextBox ID="txttitle" runat="server" placeholder="Keywords" Width="180px" Height="34px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqtitle" runat="server" ValidationGroup="serch" ControlToValidate="txttitle" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtlocation" runat="server" placeholder="Location" Width="180px" Height="34px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="serch" ControlToValidate="txtlocation" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:Button ID="btnseacj" runat="server" Text="Search" Width="100px" Height="34px" OnClick="btnseacj_Click" ValidationGroup="serch"/>
                                <asp:Button ID="btncan" runat="server" Text="Cancel" Width="100px" Height="34px" OnClick="btncan_Click" />
                            </td>
                        </tr>  --%>  
                         <tr><td>&nbsp;</td></tr>
                         <tr>
                        <td align="left">
                             <asp:GridView ID="GridView1" runat="server" Width="900px" AutoGenerateColumns="False" BorderColor="#CCCCCC" 
                                  BorderStyle="Solid"  PagerStyle-Font-Bold="true" PagerStyle-Font-Size="20px"       BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False"  Font-Overline="False" Font-Size="10pt" 
                                 Font-Strikeout="False" PagerStyle-Font-Underline="true"
                            Font-Underline="False"  BackColor="White" AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10"
                                  PagerStyle-HorizontalAlign="Center" 
                            PagerStyle-BackColor="White" PagerStyle-BorderWidth="0"  OnPageIndexChanging="GridView1_PageIndexChanging" 
                                 HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px"   />
                              <Columns>
                                  <asp:TemplateField   HeaderText="Job ID"  ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="aligncenter">                
                                    <ItemTemplate >            
                                     <asp:Label ID="Label3" runat="server"  Text='<%# Bind("JobID") %>' ForeColor="Black" CssClass="aligncenter"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemStyle CssClass="" />
                                     <HeaderStyle  Width="100px" />
                                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Job Title" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                                    <ItemTemplate>            
                                     <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text='<%# Bind("JobName") %>'   CssClass="labledd"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px"  Height="38px" /> 
                                    <HeaderStyle Width="200px" />                                
                                 </asp:TemplateField>

                                  <asp:TemplateField  HeaderText="Job Description"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                                    <ItemTemplate>
                                       &nbsp; <asp:Label ID="Labeljdate" runat="server" Text='<%# Bind("JobDesc") %>' ForeColor="Black"></asp:Label>
                                    </ItemTemplate>                
                                    <ItemStyle HorizontalAlign="Left" />
                                     <HeaderStyle Width="400px"  />
                                 </asp:TemplateField> 
                                      
                                  <asp:TemplateField HeaderText="Location" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                                    <ItemTemplate>            
                                     <asp:Label ID="Labels2" runat="server" ForeColor="Black" Text='<%# Bind("joblocation") %>'  CssClass="labledd"></asp:Label>
                                     <%--<asp:Label ID="Label1" runat="server" ForeColor="Gray" Text='<%# Bind("state") %>'  CssClass="labledd"></asp:Label>,--%>
                                     <%--<asp:Label ID="Label4" runat="server" ForeColor="Gray" Text='<%# Bind("country") %>'  CssClass="labledd"></asp:Label>--%>

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px"  Height="38px" /> 
                                    <HeaderStyle Width="150px" />                                
                                </asp:TemplateField>
                  
                                  <asp:TemplateField   HeaderText="View"  HeaderStyle-CssClass="aligncenter">  
                                    <ItemTemplate>
                                   <asp:HyperLink ID="HyperLink3" runat="server"  Font-Size="9pt"  Target="_blank" Text="View" 
                                                                   ForeColor="Black" CssClass="lable" NavigateUrl='<%# "Fulljobsdes.aspx?jid="+ Eval("ID") %>'></asp:HyperLink>                                            
                                     </ItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="50px" />
                                  </asp:TemplateField>  
                                              
                                  <asp:TemplateField HeaderText="Apply"  HeaderStyle-CssClass="aligncenter">  
                 <ItemTemplate>           
                       <asp:HyperLink ID="Hyperpost" runat="server"  Font-Size="9pt" Target="_blank" Text="Apply" 
                                                ForeColor="Black" CssClass="lable" NavigateUrl='<%# "Postyour_Resume.aspx?jid="+ Eval("ID") %>'></asp:HyperLink>
                 </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="50px" />
                </asp:TemplateField>
                               </Columns>
                            <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
                            <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
                            <PagerStyle CssClass="cssPager" HorizontalAlign="Right"/> 
                        </asp:GridView>          
                        </td>
                    </tr>

                              <tr><td>&nbsp;</td></tr>

                          <tr><td align="left" style="padding-left:35px;" valign="top"> <span style="border:1px solid Gray; height:25px">
                     <img width="98" height="22" src="Images/everify.gif" style="padding:2px;"/></span>&emsp; &emsp;
                    <%-- <img width="120" height="40" src="Images/appo.png"/>--%><span >
                     <asp:LinkButton ID="hyApp" runat="server"  Text="Appointments" CssClass="appfont" 
                                  onclick="hyApp_Click"  />
                     </span>
                     </td></tr>
             
                    </table>
                        </td>
                  </tr>
                </table></td>
              </tr>
   
 
        </table>

             <asp:Label ID="extLbl" runat="server"/>
             <asp:Label ID="Label1" runat="server"/>
             <cc1:ModalPopupExtender ID="modal1" runat="server" TargetControlID="extLbl" PopupControlID="pnlLogin"
                     CancelControlID="btnCancel" BackgroundCssClass="modalBackground" />
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
                     TargetControlID="Label1" PopupControlID="pnlForget"
                     CancelControlID="cancelbtn" BackgroundCssClass="modalBackground" />
             
             <asp:Panel ID="pnlLogin" runat="server" BackImageUrl="Images/login1.png" Width="482px"  >             
                     <table width="280px" border="0" style="line-height:25px" align="left" height="150px">
                               <tr><td  height="5px"></td></tr>
                               <tr><td align="left"><asp:Label ID="lblerLogin" runat="server" ForeColor="Red"></asp:Label></td></tr>
                                <tr>
                                   <%-- <td width="150px" align="left"><asp:Label ID="lblsername" runat="server" Text="Email"></asp:Label></td>
                                    <td width="15px;" align="left"><strong>:</strong></td>--%>
                                    <td  align="left">&nbsp;
                                    <asp:TextBox ID="txtusername" runat="server" Width="150px" BorderColor="#0099ff" 
                                            ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtusername" ValidationGroup="g1" >*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regular1" runat="server" ValidationGroup="g1"
                                     ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                      ControlToValidate="txtusername" ErrorMessage="Invalid EmailId" ></asp:RegularExpressionValidator>
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="true"
                                    TargetControlID="txtusername" WatermarkText="Enter Email Id" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr><td height="5px"></td></tr>
                                <tr>
                                   <%-- <td align="left"><asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label></td>
                                    <td width="15px" align="left"><strong>:</strong></td>--%>
                                    <td align="left">&nbsp;
                                    <asp:TextBox ID="txtpwd" runat="server" Width="150px" TextMode="Password" BorderColor="#0099ff"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                     ValidationGroup="g1" ControlToValidate="txtpwd" >*</asp:RequiredFieldValidator>                            
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="true"
                                    TargetControlID="txtpwd" WatermarkText="Enter Password" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr><td  height="5px"></td></tr>
                                <tr>
                                    <td align="left">&nbsp;
                                    <asp:Button ID="btnlogin" runat="server"  ValidationGroup="g1" Text=" Login " ForeColor="#0099ff" />
                                    <%--<asp:ImageButton ID="btnlogin" runat="server" ImageUrl="images/login.png"
                                        OnClick="btnlogin_Click" ValidationGroup="g1" Width="45" />--%>&emsp;
                                        <asp:Button ID="btnCancel" runat="server" Text=" Cancel " ForeColor="#0099ff" />
                                    </td>
                                    </tr>                          
                                <tr><td  height="5px"></td></tr>
                                <tr><td align="left">&nbsp; 
                                <asp:LinkButton ID="lnkforget" runat="server" Text="Forgot Password?" 
                                        onclick="lnkforget_Click"  />                              
                                        <%--<a href="#" style="font-weight:normal" id="forgot" runat="server">Forgot Password?</a>--%>&emsp;
                                      <%--  <a href="client_change_pwd.aspx" style="font-weight:normal">Change Password?</a><br />--%> 
                                         <asp:LinkButton ID="HyperLink1"  runat="server" Text="Register" 
                                        onclick="HyperLink1_Click" ></asp:LinkButton>
                                        </td>
                                    </tr>                            
                                </table>
                     </asp:Panel>             
            
             <asp:Panel ID="pnlForget" runat="server"  >
                     <table align="center" cellpadding="2" cellspacing="2"  style="width:400px; background-color:White;">
                <tr>
                    <td  align="center" style=" background-image:url(Images/yellowmenubg_1.jpg); background-repeat:repeat-x; border:1px; height:25px; font-weight:bold; color:#fff" valign="top">Forget Password</td>
                </tr>
                <tr >
                     <td  align="left">
                         <font color="000099">Please enter your Email Id.</font><b>Ex:xx@xx.xx</b>
                     </td>
                 </tr>
                 <tr >             
                     <td align="left">
                        <asp:TextBox ID="txtmail" runat="server" Width="200px" ></asp:TextBox> &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter EmailId"
                            ControlToValidate="txtmail"  ValidationGroup="g2">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="Invalid EmailId" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><!--<input type="text" name="ELID" maxlength="40">-->
                              
                     </td>
                 </tr>
                 <tr >
                     <td colspan="2" align="left">
                         <font color="000099">Enter your phone number.</font> <b>(registered ph. No.)</b></td>            
                </tr>
                <tr >             
                     <td align="left">
                        <asp:TextBox ID="txtPhones" runat="server" Width="200px" ></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtPhones" ValidationGroup="g2">*</asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="filter1" runat="server" TargetControlID="txtPhones" ValidChars="0123456789"
                             FilterMode="ValidChars"></cc1:FilteredTextBoxExtender>                 
                     </td>
                 </tr>
                  <tr>
                  <td colspan="2" height="5px"></td>
                </tr>
                <tr>
                     <td >
                       <div align="left">&emsp;
                          <asp:Button ID="submitbtn" runat="server"  Text="Submit" ValidationGroup="g2"  />
                            &emsp;
                          <asp:Button ID="cancelbtn" runat="server" Text="Cancel" ImageUrl="Images/cancel_btn.gif"  />                   
                       </div>
                     </td>
                </tr>
                <%--<tr>
                    <td colspan="2" align="center" bgcolor="f5f5f5">
                            <asp:Label ID="lblMsg" runat="server" CssClass="ErrMsg"></asp:Label>
                    </td>
                </tr>--%>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
              </table>      
                     </asp:Panel>

             <asp:Label ID="Label2" runat="server"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
                     TargetControlID="Label2" PopupControlID="pnlRegister"
                     CancelControlID="btnrCancel" BackgroundCssClass="modalBackground" />      

             <div style="top:-35px;">
                   <asp:Panel ID="pnlRegister" runat="server" style="top:-35px; position:fixed;"  >
                     <table width="70%"  border="0"  style="background-color:White; border-color:Black;">
                         <caption>
                             &nbsp;
                             <tr>
                             <td style="padding:5px;"></td>
                                 <td align="center">
                                     <table border="0" width="100%">
                                         <tr>
                                             <td align="center">
                                                 <table border="0" 
                                                     style="background: url(Images/regiterbg.png) no-repeat; width: 400px; padding: 5px; border: 1px dotted #AFD2FA">
                                                     <tr>
                                                         <td height="30">
                                                             &nbsp;</td>
                                                     </tr>
                                                     <tr>
                                                         <td align="center" colspan="3" height="30">
                                                             <font class="crentopenings"><b>Primary Contact Details</b></font></td>
                                                     </tr>
                                                     <tr><td colspan="3" style="height:10px;"></td></tr>
                                      
                                                     <tr>
                                                         <td align="center" height="30">
                                                           First Name</td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtNames" runat="server" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                                 ControlToValidate="txtNames" 
                                                                 ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" 
                                                                 ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                          Last Name  </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtLname" runat="server" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                 ControlToValidate="txtLname" 
                                                                 ErrorMessage="Please enter the Address for Communication." Font-Size="Smaller" 
                                                                 ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                            Address </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtstreetaddr" runat="server" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                                 ControlToValidate="txtstreetaddr" 
                                                                 ErrorMessage="Please enter the Street Address." Font-Size="Smaller" 
                                                                 ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                          Country   </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;<span style="height:25px ">
                                                             <asp:DropDownList ID="country" runat="server" AutoPostBack="true" 
                                                                 CssClass="textfield" Width="190px" 
                                                                 onselectedindexchanged="country_SelectedIndexChanged">
                                                                 <asp:ListItem Value="Select Country">Select Country</asp:ListItem>
                                                             </asp:DropDownList>
                                                             </span>
                                                             <asp:RequiredFieldValidator ID="rfvcountry" runat="server" 
                                                                 ControlToValidate="country" ErrorMessage="Please Select the Country." 
                                                                 Font-Size="Smaller" InitialValue="Select Country" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                          State   </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:DropDownList ID="state" runat="server" CssClass="textfield" Width="190px" 
                                                                 onselectedindexchanged="state_SelectedIndexChanged">
                                                                 <asp:ListItem Value="Select State">Select State</asp:ListItem>
                                                             </asp:DropDownList>
                                                             <asp:RequiredFieldValidator ID="rfvstate" runat="server" 
                                                                 ControlToValidate="state" ErrorMessage="Please Select the State." 
                                                                 Font-Size="Smaller" InitialValue="Select State" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                           City
                                                         </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                                 ControlToValidate="txtcity" ErrorMessage="Please enter the City." 
                                                                 Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                            Phone </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtphone" runat="server" MaxLength="10" 
                                                                 onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                                 ControlToValidate="txtphone" ErrorMessage="Please enter the Phone Number." 
                                                                 Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="40" align="center">
                                                           Fax  </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtfax" runat="server" MaxLength="10" 
                                                                 onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                             <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                            ControlToValidate="txtfax" ErrorMessage="Please enter the Fax Number." 
                            Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>--%>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td align="center" colspan="3" 
                                                             style="background: url(Images/regiterlinebg.png) repeat-x">
                                                             <font class="crentopenings"><b>User ID &amp; Password</b></font></td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" width="130px" align="center">
                                                            E-mail ID </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtcompanymailid" runat="server" AutoPostBack="true" 
                                                                 Width="200px" OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                                 ControlToValidate="txtcompanymailid" ErrorMessage="Please enter mailid" 
                                                                 Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                                 ControlToValidate="txtcompanymailid" 
                                                                 ErrorMessage="Please Enter Valid Email Address" Font-Size="Smaller" 
                                                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                 ValidationGroup="client">*</asp:RegularExpressionValidator>
                                                             <asp:Image ID="imgstatus" runat="server" Height="17px" 
                                                                 ImageUrl="Images/check.gif" Visible="false" Width="17px" />
                                                             <asp:Image ID="imgUncheck" runat="server" Height="17px" 
                                                                 ImageUrl="Images/delete.png" Visible="false" Width="17px" />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                          Password   </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left" height="30">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtrpwd" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                 ControlToValidate="txtrpwd" ErrorMessage="Please enter the Password" 
                                                                 Font-Size="Smaller" ValidationGroup="client">*</asp:RequiredFieldValidator>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td height="30" align="center">
                                                           Confirm Password  </td>
                                                         <td>
                                                             <strong>:</strong></td>
                                                         <td align="left" height="30">
                                                             &nbsp;
                                                             <asp:TextBox ID="txtconfirmpwd" runat="server" TextMode="Password" 
                                                                 Width="200px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                 ControlToValidate="txtconfirmpwd" ErrorMessage="Please Enter Re-Password" 
                                                                 Font-Size="Smaller" ValidationGroup="client">
                        *</asp:RequiredFieldValidator>
                                                             <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                                 ControlToCompare="txtrpwd" ControlToValidate="txtconfirmpwd" 
                                                                 ErrorMessage="The Password which you entered is incorrect." Font-Size="Smaller" 
                                                                 ValidationGroup="client">*</asp:CompareValidator>
                                                         </td>
                                                     </tr>
                                                <%--     <tr>
                                                         <td>
                                                             &nbsp;</td>
                                                         <td>
                                                             &nbsp;</td>
                                                         <td>
                                                         </td>
                                                     </tr>--%>
                                                     <tr>
                                                         <td align="center" colspan="3" height="30" 
                                                             style="background: url(Images/regiterlinebg.png) repeat-x">
                                                             <font class="crentopenings"><b>Terms &amp; Conditions</b></font></td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="3" valign="top">
                                                             <div align="justify" style="padding:10px">
                                                                 <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="11px" Font-Bold="false"  Checked="false"
                                                                     Text=" I have read and understood and agree to the Terms and Conditions governing the use of careersgen.com. You must agree to the terms and conditions before you can continue." />
                                                                 </div>
                                                           <%--  <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                                 ErrorMessage="Please select the checkbox." 
                                                                 onservervalidate="CustomValidator1_ServerValidate" 
                                                                 Text="Please select the checkbox." ValidationGroup="client"></asp:CustomValidator>--%>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td align="center" colspan="3">
                                                             <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                                                                 ValidationGroup="client" onclick="btnsubmit_Click" />
                                                      
                                                             <asp:Button ID="btnrCancel" runat="server" Text="Cancel" />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                             <asp:Label ID="lblerror" runat="server"></asp:Label>
                                                         </td>
                                                     </tr>
                                                 </table>
                                             </td>
                                             <td align="left" valign="middle">
                                                 <img src="Images/regiter.jpg" width="322" height="307" />
                                             </td>
                                         </tr>
                                     </table>
                                 </td>
                             </tr>
                         </caption>
        </table>             
                     </asp:Panel>
              </div>
    
          </div>
         </div>
       </section>

        <div>
            <foot:footer ID="foot1" runat="server" />
        </div>
    </form>
</body>
</html>
