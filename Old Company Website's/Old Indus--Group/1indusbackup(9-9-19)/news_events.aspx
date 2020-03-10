<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_events.aspx.cs" Inherits="news_events" %>

<%@ Register Src="usercontrols/Header1.ascx" TagName="Header" TagPrefix="head" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="foot" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <link href="Images/favicon.png" rel='shortcut icon' type='image/i-icon'/>
	 
  
  <script>      (function (html) { html.className = html.className.replace(/\bno-js\b/, 'js') })(document.documentElement);</script>
    <title>:  : 1indus.com :  : </title>
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
	background: none !important;
	padding: 0 !important;
}
 .aligncenter {
          text-align:center;
      }
</style>
<script src="jquery.js" type="text/javascript"></script>

<style media="screen" type="text/css">
    .defaultText { width: 300px; }
    .defaultTextActive { color: #a1a1a1; font-style: italic; }
</style>

<script language="javascript">
<!--
    $(document).ready(function () {
        $(".defaultText").focus(function (srcc) {
            if ($(this).val() == $(this)[0].title) {
                $(this).removeClass("defaultTextActive");
                $(this).val("");
            }
        });

        $(".defaultText").blur(function () {
            if ($(this).val() == "") {
                $(this).addClass("defaultTextActive");
                $(this).val($(this)[0].title);
            }
        });

        $(".defaultText").blur();
    });
//-->
</script>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
   
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/header.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />

    <link href="css/styles1.css" rel="stylesheet" type="text/css" />



  

<style type="text/css">.recentcomments a{display:inline !important; padding:0 !important;margin:0 !important;}
 </style>
</head>
<script type="text/javascript">
    function entries(val) {
        if (val == '') {
            window.location.href = "#";
        }
        else if (val == 'middle-east') {
            window.open('#', '_blank');
        }
        else {
            window.location.href = "#" + val;
        }

    }

</script>
<body class="home page page-id-476 page-template page-template-page-home page-template-page-home-php">
    <form id="form1" runat="server">
   

    <header id="header">
   <div class="container-fluide header-inner-wrap">
    <head:Header ID="Header1" runat="server" />
    </div>
  </header>
  <div style="height:10px;"></div>
   <section class="about text-left" id="about">
    <div class="container">
     <div class="row">
     <br />
      <table>
      <tr><td>
     
     <asp:Image ID="corp1" runat="server" Width="100%"   ImageUrl="Images/news andevents-banner.jpg"/></td></tr>

    
      <tr>
        <td  height="650px" align="center" valign="top">
        <table height="650px" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  width="180" valign="top" bgcolor="#EFEFEF" align="left">
                  <table width="95%" border="0" align="right" cellpadding="0" cellspacing="0">
                                                  <tr><td><br /><br /></td></tr>
                                                        <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  
                    <td height="28" align="left" valign="middle" bgcolor="#DBDBDB"><span class="mainhead"><span class="head-black">
                        &nbsp;&nbsp;</span><span class="head-black" style="color:black;font-size:18px;">Overview</span></span></td>
                  </tr>
                </table></td>
              </tr>
                                                  <tr><td><br /></td></tr>

                       <tr>
                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top"><a href="Corporate.aspx"  style="color:black;font-size: 15px">Corporate</a></td>
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
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="Management.aspx" style="color:black;font-size: 15px">Management</a></td>
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
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="Indus_Vision.aspx" style="color:black;font-size: 15px">Indus Vision</a></td>
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
                        <td width="12" align="left" valign="middle"><img src="Images/arrow-red.gif" alt="Arrow" width="4" height="8"></td>
                        <td align="left" valign="top" class="mainhead"><a href="news_events.aspx" style="color:black;font-size: 15px">News &amp; Events</a></td>
                      </tr>
                    </table></td>
                  </tr>

                </table>

            </td>
            <td width="5" align="right" valign="top">&nbsp;</td>
            <td width="863" align="right" valign="top" style="padding:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
             
              <tr>
                <td align="center" valign="top" class="head-black" width="100%" ><h3 style="color:#2471a3;">News & Events</h3></td>
              </tr>
              <tr>
                <td height="2" align="left" valign="top"><img src="images/spacer.gif" alt="Spacer" width="1" height="2"></td>
              </tr>
              <tr>
                <td align="left" valign="top" width="100%" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td background="Images/line_01.gif"><img src="Images/line_01.gif" width="7" height="5"></td>
                    <td width="9"><img src="Images/line_02.gif" width="9" height="5"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top">
                
                    <%--<asp:Image ID="img1" runat="server"  ImageUrl="images/under_construction.jpg" />--%>
                       <asp:GridView ID="GridView1" runat="server" Width="860px" 
    AutoGenerateColumns="False" BorderColor="#CCCCCC"  BorderStyle="Solid" 
                BorderWidth="1" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False"  
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="10" PagerStyle-HorizontalAlign="Center" 
                   PagerStyle-BackColor="White" PagerStyle-BorderWidth="0" 
           onpageindexchanging="GridView1_PageIndexChanging" HeaderStyle-HorizontalAlign="Center">
           <HeaderStyle BackColor="#2471a3" ForeColor="White" Height="30px"  />
        <Columns>
         <asp:TemplateField   HeaderText="Event Name"  ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="aligncenter">                
                <ItemTemplate >            
                 <asp:Label ID="Label3" runat="server"  Text='<%# Bind("jobtitle") %>' ForeColor="Gray" CssClass="aligncenter"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <ItemStyle CssClass="" />
                 <HeaderStyle  Width="100px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Event Description" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                <ItemTemplate>            
                 <asp:Label ID="Label2" runat="server" ForeColor="Gray" Text='<%# Bind("jobdesc") %>'  CssClass="labledd"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="150px"  Height="38px" /> 
                <HeaderStyle Width="200px" />                                
            </asp:TemplateField>
        
             <asp:TemplateField HeaderText="Location" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                <ItemTemplate>            
                 <asp:Label ID="Labels2" runat="server" ForeColor="Gray" Text='<%# Bind("address") %>'  CssClass="labledd"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="150px"  Height="38px" /> 
                <HeaderStyle Width="200px" />                                
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Event Date" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="aligncenter">                
                <ItemTemplate>            
                 <asp:Label ID="Labddels2" runat="server" ForeColor="Gray" Text='<%# Bind("sdate") %>'  CssClass="labledd"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="150px"  Height="38px" /> 
                <HeaderStyle Width="200px" />                                
            </asp:TemplateField>
        </Columns>
   
        <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right"/> 
    </asp:GridView>
                </td>
              </tr>
      
            </table></td>
          </tr>
         
      
        </table></td>
      </tr>
    
     </table>
     </div></div></section>
     <div>
     <foot:footer ID="foot1" runat="server" />
     </div>

    </form>
</body>
</html>