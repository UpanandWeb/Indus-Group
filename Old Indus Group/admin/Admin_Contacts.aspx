<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Contacts.aspx.cs" Inherits="admin_Admin_Contacts" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : - Admin Control Panel - Vendors</title>
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
<script language="javascript" type="text/javascript" src="js/calendar.js"></script>    
    <link rel="stylesheet" href="Styles/stylesheet.css" />       
    <style type="text/css">
        .style24
        {
            width: 965px;
        }  
        .btnround
        {
            border-radius:5px;
        }      
    </style>     
     <script type="text/javascript">
         function ConfirmationBox(username) {
             var result = confirm('Are you sure you want to delete Employee Contact ');
             if (result) {
                 return true;
             }
             else {
                 return false;
             }
         }
</script>
    <style type="text/css">
        .modalBackground
        {  
        	background-color: Black;  
        	filter: alpha(opacity=50);  
        	opacity: 0.50;
        }
       
    
</style>
<script language="javascript" type="text/javascript" src="js/calendar.js"></script> 
<script language="javascript" type="text/javascript" >
    function Sample() {
        var n = document.getElementById("MyGrid").rows.length;
        var i;
        var j = 0;
        for (i = 2; i <= n; i++) {
            if (i < 10) {
                if (document.getElementById("MyGrid_ctl0" + i + "_chkselect").checked == true) {
                    if (j > 0) {
                        alert('you can select only one...');
                        document.getElementById("MyGrid_ctl0" + i + "_chkselect").checked = false;
                    }
                    else {
                        j++;
                    }
                }
            }
            else {
                if (document.getElementById("MyGrid_ctl" + i + "_chkselect").checked == true) {
                    if (j > 0) {
                        alert('you can select only one...');
                        document.getElementById("MyGrid_ctl" + i + "_chkselect").checked = false;
                    }
                    else {
                        j++;
                    }
                }
            }
        }
    }
</script>
<script language="javascript" type="text/javascript" >
    function Sample1() {
        var n = document.getElementById("GridView1").rows.length;
        var i;
        var j = 0;
        for (i = 2; i <= n; i++) {
            if (i < 10) {
                if (document.getElementById("GridView1_ctl0" + i + "_chkselect").checked == true) {
                    if (j > 0) {
                        alert('you can select only one...');
                        document.getElementById("GridView1_ctl0" + i + "_chkselect").checked = false;
                    }
                    else {
                        j++;
                    }
                }
            }
            else {
                if (document.getElementById("GridView1_ctl" + i + "_chkselect").checked == true) {
                    if (j > 0) {
                        alert('you can select only one...');
                        document.getElementById("GridView1_ctl" + i + "_chkselect").checked = false;
                    }
                    else {
                        j++;
                    }
                }
            }
        }
    }
</script>

  <script language="javascript" type="text/javascript">

      function alertdelete() {
          alert("You don't have rights to done this task !!!");
      }    
    </script> 

<script type="text/javascript" language="javascript">
    function confirmMessageDelete(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return confirm("Are you sure you want to delete the selected Contact?");
                return true;
            }
        }
        alert('select atleast one Checkbox for Delete!');
        return false;
    }
    </script>
    
<script type="text/javascript" language="javascript">
    function selectOne(frm) {
        for (i = 0; i < frm.length; i++) {
            if (frm.elements[i].checked) {
                return true;
            }
        }
        alert('select atleast one Checkbox for Edit!');
        return false;
    }
    </script>

    <script language="javascript" type="text/javascript">

        function alertnot() {
            alert("Please select option from proper list !!!");
        }
        function alertdelete() {
            alert("You don't have rights to done this task !!!");
        }    
    </script>  
    <link rel="stylesheet" href="Styles/stylesheet.css" />       
    <style type="text/css">
        .style24
        {
            width: 965px;
        }
       
       .pnlbg
    {
    	border:1px solid Gray;
    	
    }
      #MyGrid, #GridView1, #MyGridDeactivate
      {
      	border:1px solid Gray;
	padding:2px;
      }
     .GridviewScrollHeader TH, .GridviewScrollHeader TD 
{ 
	color: #00277a;
    padding: 5px; 
    font-weight: bold; 
    white-space: nowrap; 
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: #EFEFEF; 
    text-align: center; 
    vertical-align: bottom; 
} 
.GridviewScrollItem TD 
{ 
    padding: 5px; 
    white-space: nowrap; 
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: White; 
} 
.GridviewScrollPager  
{ 
    border-top: 1px solid #AAAAAA; 
    background-color: #FFFFFF; 
} 
.GridviewScrollPager TD 
{ 
	    padding-top: 3px; 
    font-size: 14px; 
    padding-left: 5px; 
    padding-right: 5px; 
} 
.GridviewScrollPager A 
{ 
    color: #00277a; 
}
.GridviewScrollPager SPAN
{
    font-size: 16px;
    font-weight: bold;
}
    </style>
<%--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/grdiviewScroll.min.js"></script> 
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll();

    });
    function gridviewScroll() {
        $('#<%=MyGrid.ClientID%>').gridviewScroll({
            width: 1000,
            freezesize: 2
        });
    } 
</script>  
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll1();
    });
    function gridviewScroll1() {
        $('#<%=GridView1.ClientID%>').gridviewScroll({
            width: 1000,
            freezesize: 2
        });
    } 
</script>  
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll2();
    });
    function gridviewScroll2() {
        $('#<%=MyGridDeactivate.ClientID%>').gridviewScroll({
            width: 1000,
            freezesize: 2
        });
    } 
</script>  --%>
   
<link rel="stylesheet" href="Styles/stylesheet.css" />
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">

    <form id="form1" runat="server">
    <center>
      <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
     </cc1:ToolkitScriptManager>    
       
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr >
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
     <tr><td height="30px"></td></tr>
    <tr><td height="30px">
    <table border="0" width="100%">
       <tr><td align="center"  height="20px">    
       <asp:LinkButton ID="lnkbtncurrent" runat="server" onclick="lnkbtncurrent_Click" ><b>Indus Group Contacts</b></asp:LinkButton>
       </td>     
     <td align="center">
      <asp:LinkButton ID="lnkbtnpre" runat="server" onclick="lnkbtnpre_Click" ><b>Ace Indus Contacts</b></asp:LinkButton>
     </td>
     <td  align="center"><asp:LinkButton ID="LinkButton1" runat="server" onclick="lnkbtnCon_Click" ><b>Add New  Contact</b></asp:LinkButton></td>
     </tr>
    </table>
    </td></tr>  
      <tr><td height="30px"></td></tr>
    <tr>
     <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
     <table width='100%' border='0' cellspacing='0' cellpadding='0'>     
     <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Registered Contact List</b></font><hr /> </td>
        </tr>
       </table>
      </td>
    </tr>
    <tr>
     <td align="right" bgcolor="white" width="100%" style="padding-right:10px"><font color='#003399' size='2pt'>
 </font></td>  
    </tr>
    <tr id="trcurr1" runat="server">
      <td id="td2" runat="server" align="center" valign="top" width="100%" class="lable"> 
         <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
          <tr> <td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Indus Group Contacts</b></font> </td>
        </tr>
         
       </table>
      </td>
    </tr>
    <tr id="trcurr2" runat="server">        
      <td id="tdcontent1" runat="server" align="left" valign="top" class="lable"> 
      <table>
      <tr>
      <td colspan="3" align="right" style="padding-right:20px;">
      <table style="width: 65px">      
      <tr id="trbuttons" runat="server">     
      
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
      </tr>
      </table>
      </td>
      </tr>
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%">
      <asp:Panel ID="pnlGrid" runat="server" Width="100%" CssClass="pnlbg" >
             <asp:GridView ID="MyGrid" runat="server" Width="100%" 
              AutoGenerateColumns="False"  BorderColor="#E0E0E2" BorderWidth="0px"
                 CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="true" PageSize="10"
                 PagerStyle-Mode="NumericPages"  DataKeyNames="CId"
                   PagerStyle-BackColor="White" 
                 onpageindexchanging="MyGrid_PageIndexChanging" >              
                <Columns>
                  
               <asp:TemplateField  ItemStyle-ForeColor="Gray"  ItemStyle-BorderColor="#E0E0E2">
                <ItemStyle  ForeColor="Gray" BorderColor="#E0E0E2" HorizontalAlign="Center"></ItemStyle>
      <ItemTemplate >
      <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
      </ItemTemplate>
      <ItemStyle Width="20" />
      <HeaderStyle Width="20" />     
      </asp:TemplateField>   
       <asp:TemplateField HeaderText="S.No." HeaderStyle-HorizontalAlign="Center"  HeaderStyle-Font-Bold="true">                 
                        <HeaderStyle    HorizontalAlign="Center" ></HeaderStyle>
                        <ItemStyle  ForeColor="Gray" BorderColor="#E0E0E2" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <HeaderStyle Width="20" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>                 
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2"  HeaderText="Name" >
                <ItemTemplate>
                 <asp:Label ID="lbcompany" runat="server" Text='<%# Bind("CName") %>' ForeColor="Gray"></asp:Label>
           </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-BorderColor="#E0E0E2"  HeaderText="US Phone" >                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CPhone") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                 
            </asp:TemplateField>                 
                    
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Extension" >         
                <ItemTemplate>               
                  <asp:Label ID="lblfiler" runat="server" Text='<%#Bind("CExt") %>'  ForeColor="Gray"></asp:Label>                    
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                
            </asp:TemplateField>    
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Company Mail" >                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CcId") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                
            </asp:TemplateField>         
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Yahoo Id" >           
                <ItemTemplate>               
                    <asp:Label ID="lblema" runat="server" Text='<%#Bind("CEmail") %>'  ForeColor="Gray"></asp:Label>                    
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />
                 
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="G-Talk" >                  
                <ItemTemplate>
               
                    <asp:Label ID="lblurl" runat="server" Text='<%#Bind("CGTalk") %>'  ForeColor="Gray"></asp:Label>
                   
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                
            </asp:TemplateField>    
                    
                  
                     </Columns>
                 <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" /> 
         </asp:GridView>
         </asp:Panel>
         </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr> 
    <tr id="trnew1" runat="server">
     <td>
       <table width='100%' border='0' cellspacing='0' cellpadding='0'>
           <tr><td>&nbsp;</td></tr>    
        <tr><td align="center" bgcolor='white' width='70%'><font color='#003399' size='3pt'><b>Ace Indus Contacts</b></font> </td></tr>
         <%--<tr><td>&nbsp;</td></tr>--%>
         
       </table>
     </td>
    </tr>
    <tr><td align="right" style="padding-right:20px;">    
    <table style="width: 65px">      
      <tr id="tr1" runat="server">     
      
      <td>
      <asp:ImageButton ID="ImageButton3" runat="server" ToolTip="Edit" 
              OnClientClick="return selectOne(this.form)" AlternateText="Edit" Height="20px" ImageUrl="images/edit.jpg"
              Width="17px" onclick="imgedit1_Click" />
      </td>
     
      <td>
      <asp:ImageButton ID="ImageButton5" runat="server" ToolTip="Delete" 
              OnClientClick="return confirmMessageDelete(this.form)" AlternateText="Delete" 
              Height="20px" ImageUrl="images/1371_normalDelete_20_n_g.gif"
              Width="17px" onclick="imgdelete1_Click" />
      </td>      
      </tr>
      </table>
    </td></tr>
    <tr id="trnew2" runat="server">        
      <td id="td3" runat="server" align="left" valign="top" class="lable"> 
      <table width="100%">
      <tr>
      <td >
       <asp:Panel ID="Panel1" runat="server" Width="100%" CssClass="pnlbg" >
      <asp:GridView ID="GridView1" runat="server" Width="100%" 
              AutoGenerateColumns="False"  BorderColor="#E0E0E2" BorderWidth="0px"
                 CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White" AllowPaging="true" PageSize="10"
                 PagerStyle-Mode="NumericPages"  DataKeyNames="CId"
                   PagerStyle-BackColor="White"   
                onpageindexchanging="GridView1_PageIndexChanging">
                  <Columns>
                  <asp:TemplateField  ItemStyle-ForeColor="Gray">
            <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
      <ItemTemplate>
      <asp:CheckBox ID="chkselect" runat="server" onclick="Sample();" />
      </ItemTemplate>
      <HeaderStyle Width="20" />
      </asp:TemplateField>
                    <asp:TemplateField HeaderText="S.No." HeaderStyle-HorizontalAlign="Center"  HeaderStyle-Font-Bold="true">                 
                        <HeaderStyle    HorizontalAlign="Center" ></HeaderStyle>
                        <ItemStyle  ForeColor="Gray" BorderColor="#E0E0E2" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                           <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                        <HeaderStyle Width="20" />
                   <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                   </asp:TemplateField>        
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2"  HeaderText="Name" >
                <ItemTemplate>
                 <asp:Label ID="lbcompany" runat="server" Text='<%# Bind("CName") %>' ForeColor="Gray"></asp:Label>
           </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-BorderColor="#E0E0E2"  HeaderText="Land No." >               
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CPhone") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>               
                <ItemStyle HorizontalAlign="Center" />                 
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Extension" > 
                            <ItemTemplate>               
                  <asp:Label ID="lblfiler" runat="server" Text='<%#Bind("CExt") %>'  ForeColor="Gray"></asp:Label>                    
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                 
            </asp:TemplateField>  
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Company Mail" >                 
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CcId") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                
            </asp:TemplateField>   
                      
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="Yahoo Id" >       
                <ItemTemplate>               
                    <asp:Label ID="lblema" runat="server" Text='<%#Bind("CEmail") %>'  ForeColor="Gray"></asp:Label>                    
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />
                
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#E0E0E2" HeaderText="G-Talk" >                 
                <ItemTemplate>
                
                    <asp:Label ID="lblurl" runat="server" Text='<%#Bind("CGTalk") %>'  ForeColor="Gray"></asp:Label>
                  
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Center" />                
            </asp:TemplateField>
                     
                         
                     </Columns>
                  <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
    <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
    <PagerStyle CssClass="GridviewScrollPager" /> 
         </asp:GridView>
         </asp:Panel>
      </td>
    
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>
    
    <tr>
    <td>
        <asp:Label ID="lblerror" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
    </td>
    </tr>
    <tr>
    <td>   
     <input type="button"  style="display: none;" id="delresume" runat="server" /> 
       <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
                     TargetControlID="delresume" PopupControlID="pnldelsms" DropShadow="false"
      PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground">
      </cc1:ModalPopupExtender>
 <asp:Panel ID="pnldelsms" runat="server" Width="600px"  CssClass="modalPopup" BorderWidth="1"  BorderColor="Gray">

 <table align="center" width="99%"  border="0" cellpadding="0"  cellspacing="0" style="height:350px; background-color:#fff; font-size:10pt; font-family:Geneva,Arial,Helvetica,sans-serif;">
   
   <tr>
       <td align="center" colspan="3" height="30"  class="headertext" style="background:#E0E0E2; font-size:13pt;" valign="middle">
       <asp:Panel ID="pnldelete" runat="server" Height="30" ><p style="margin:5px;"> Employee Contact Form</p>
</asp:Panel>
      </td>     
     </tr>  
      <tr>        
        
         <td align="left" colspan="3">&nbsp;</td>
        </tr>       
        <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Employee ID
         </td>
         <td width="10"><b>:</b></td>
         <td align="left">
         <asp:TextBox ID="txtemployeeid" runat="server" width="250" Enabled="false"></asp:TextBox>
         </td>
        </tr> 
         <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Name
         </td>
         <td width="10"><b>:</b></td>
         <td align="left">
         <asp:TextBox ID="txtName" runat="server" width="250"></asp:TextBox>
         <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtName" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         </td>
        </tr>
        
         <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Comapny
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
         <asp:DropDownList ID="ddlCompanys" runat="server" Width="255">
         <asp:ListItem Text="Select Company" Value="Select Company"></asp:ListItem>
         <asp:ListItem Text="Indus Group" Value="Indus Group"></asp:ListItem>
         <asp:ListItem Text="Ace Indus" Value="Ace Indus"></asp:ListItem>
         </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCompanys"
          InitialValue="Select Company" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         </td>
        </tr>
          <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Phone Number (IND/US)
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
          <asp:TextBox ID="txtPhone" runat="server" width="250"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhone" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender ID="filter1" runat="server" TargetControlID="txtPhone" ValidChars="0123456789"  FilterMode="ValidChars"  ></cc1:FilteredTextBoxExtender>
         </td>
        </tr>
          <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Extension
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
          <asp:TextBox ID="txtExt" runat="server" width="250" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtExt" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtExt" ValidChars="0123456789"  FilterMode="ValidChars"  ></cc1:FilteredTextBoxExtender>
         </td>
        </tr>
        <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Company Mail
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
        <%-- <asp:TextBox ID="txtCompId" runat="server" width="250" AutoPostBack="true" OnTextChanged="txtCompanyId_Changed" ></asp:TextBox>--%>
         <asp:TextBox ID="txtCompId" runat="server" width="250"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCompId" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ErrorMessage="Invalid Format"                                      
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtCompId" Font-Size="Smaller" ValidationGroup="vg1"></asp:RegularExpressionValidator>
         </td>
        </tr>
          <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;Yahoo Id
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
          <asp:TextBox ID="txtmail" runat="server" width="250"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmail" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Invalid Format"                                      
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtmail" Font-Size="Smaller" ValidationGroup="vg1"></asp:RegularExpressionValidator>
         </td>
        </tr>
          <tr>         
        <td align="left" width="200" >&nbsp;&nbsp;G-Talk
         </td>
         <td width="5"><b>:</b></td>
         <td align="left">
          <asp:TextBox ID="txtGT" runat="server" width="250" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtGT" ValidationGroup="vg1" >*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage="Invalid Format"                                      
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="txtGT" Font-Size="Smaller" ValidationGroup="vg1"></asp:RegularExpressionValidator>

         </td>
        </tr>
          
          <tr>         
        <td align="left" width="200" >
         </td>
         <td width="5"></td>
         <td align="left"></td>
        </tr>
          <tr>         
        <td colspan="3" align="center">
        <asp:Button ID="btnSubm" runat="server" Text=" Submit " OnClick="btnSubmit_Click" ValidationGroup="vg1" CssClass="btnround" />
           &emsp;
           <asp:Button ID="btnUpdate" runat="server" Text=" Update " OnClick="btnUpdate_Click" ValidationGroup="vg1" Visible="false" CssClass="btnround" />
           &emsp;
           <asp:Button ID="btnCancel" runat="server" Text=" Cancel " OnClick="btnCancel_Click" CssClass="btnround" />
                    
         </td>
        
        </tr>
         <tr>         
        <td colspan="3" >&nbsp;
         </td>
        
        </tr>
       
      </table>
</asp:Panel>
        </td>
         </tr>
   <%--<tr>
    <td>   
     <input type="button"  style="display: none;" id="delresume1" runat="server" /> 
       <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="ImageButton2"
                     TargetControlID="delresume1" PopupControlID="Panel1" DropShadow="false"
      PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground">
      </cc1:ModalPopupExtender>
 <asp:Panel ID="Panel1" runat="server" Width="400px"  CssClass="modalPopup" Height="150px">
<asp:Panel ID="Panel2" runat="server" >
</asp:Panel>
 <table align="center"  border="0" cellpadding="0" cellspacing="0" style="background-color:#fff; height:150px">
   
   <tr>
       <td align="center" class="headertext" style="background:#E0E0E2"><asp:Label ID="Label1" runat="server" Text="Activate Employee" ForeColor="White"></asp:Label></td>
        <td align="right">
                    
                    </td>   
     </tr> 
         
         <tr>         
        <td align="center" width="100%">
         <table width="100%" border="0">        
        <tr>         
          <td>
              Are You Sure want to Activate this Vendor.<br />
              </td>
        </tr>      
          <tr>
          <td align="right"><asp:Label ID="lbldeactid" runat="server" Visible="false"></asp:Label></td>
        </tr>
        <tr>        
          <td >
          <table border="0" width="100%">
          <tr>
          <td width="50%">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:ImageButton ID="btnactivate" runat="server" ValidationGroup="delsms grp"
                  ImageUrl="~/images/Activate.png" onclick="btnactivate_Click"  />    
          </td>
          <td width="50%" valign="top" >
          
                  <asp:ImageButton ID="ImageButton2"  runat="server" ValidationGroup="delsms grp"
                  ImageUrl="~/images/cancel.png" /> 
          </td>
          </tr>
          </table>
                
           </td>    </tr>
         </table>
         </td>
        </tr>
        <tr>
          <td><asp:Label ID="lblAcess" runat="server" Visible="false"></asp:Label>
             &nbsp;
          </td>
          </tr>
      <tr>
          <td>
             &nbsp;
          </td>
          </tr>
      </table>
</asp:Panel>
        </td>
         </tr>--%>   
   
   </table>
   
 </center>
  </form>
</body>
</html>

