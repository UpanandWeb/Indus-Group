<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_systemip.aspx.cs" Inherits="admin_Admin_systemip" %>


<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : - Admin Control Panel - Clients</title>
    
<script language="javascript" type="text/javascript">

</script>
<style type="text/css">
        .modalBackground
        {  
        	background-color: Black;  
        	filter: alpha(opacity=50);  
        	opacity: 0.50;
        }
       .updateProgress
       {  
       	border-width: 1px; 
        border-style: solid; 
        background-color: White;  
        position: absolute;  
        width: 180px;  
        height: 65px;
       }         
        </style>
  <style type="text/css">
		.black_overlay{
			display:none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 1000px;
			height: 600px;
			background-color: #333;
			z-index:1001;
			-moz-opacity: 0.8;
			
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.white_content {
			display:none;
			position: absolute;
			top: 25%;
			left: 35%;
			width: 350px;
			
			padding: 0px;
			border: 0px solid #a6c25c;
			background-color: white;
			z-index:1002;
			overflow: auto;
		}
		.headertext{
font-family:Arial, Helvetica, sans-serif;
font-size:14px;
color:#f19a19;
font-weight:bold;
}
.textfield
{
	border:1px solid #a6c25c;
	width:200px; 
}
.button2
{
 background-color:#a6c25c;
 color:White;
 font-size:11px;
 font-weight:bold;
 border:1px solid #7f9db9;
 width:68px;
	}
	  .style24
      {
          color: #7a7a7b;
          font-size: 12px;
          font-weight: bold;
          font-family: Geneva, Arial, Helvetica, sans-serif;
          text-decoration: none;
          height: 29px;
      }
       #GridView1 td
        {
        	border:0.1px solid #CCCCCC;
        }
        #GridView1 th
        {
        	border-right:0.1px solid #CCCCCC;
        }
	</style>
<link rel="stylesheet" href="Styles/stylesheet.css" />

</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager><center>
 <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
             <table width="998px">
                <tr>
                    <td>                                    
                        <uc1:TopMenu ID="Topmenu1" runat="server" />
                    </td>
                </tr>
            </table>       
        </td>
    </tr>   
       <tr>
           <td style="height:30px">
           </td>
       </tr>
     
       <tr>
           <td id="crtopt" runat="server" align="center"  class="lblog" width=" 90%">
           </td>
       </tr>
       <tr><td>&nbsp;</td></tr>
         <tr>
         <td id="Td1" runat="server" align="center" style="height:30px"  class="style24" width=" 90%"> 
         
         <asp:Label ID="lblseminnartitle" runat="server" Text="IP History" Font-Bold="true" ForeColor="#00277a" Font-Size="11pt"></asp:Label>
             <br />
           </td>
       </tr>
       <%--<tr>
           <td style="height:30px">
           </td>
       </tr>--%> 
     <tr>
    <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
    </tr>
    
    
   <tr>
   <td align="center">
   <asp:GridView ID="GridView1" runat="server" Width="96%" 
    AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="20" 
                   PagerStyle-BackColor="White" 
           onpageindexchanging="GridView1_PageIndexChanging" 
           onrowdatabound="GridView1_RowDataBound">
        <Columns>           
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Ip Address" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("sysipaddress") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="20%" />
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Time" >
                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("datetime") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="20%" />
            </asp:TemplateField>          
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" >  
                 <ItemTemplate>
            <%--<asp:HyperLink ID="HyperLink3" NavigateUrl='<%# FormatUrlDl( (int) Eval("id") )%>' runat="server" Text='Delete' CssClass ="headings" ></asp:HyperLink>--%> 
                        <asp:LinkButton ID="lnkdeletetemp" runat="server" CommandArgument='<%#Eval("tid") %>' OnCommand="FormatUrlDl" ForeColor="Gray" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="18%" />
                </asp:TemplateField>
                
                
            
        </Columns>
   
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="8pt" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#CCCCCC" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="false" Font-Size="10pt" 
                    ForeColor="#00277a" Height="20px" />
    </asp:GridView>
   </td>
   </tr>
   </table> 
      <input id="btnDummy2" runat="server" type="button" style="display: none;" />
   <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btncancel" TargetControlID="btnDummy2" PopupControlID="pnldelsms" DropShadow="false"
      PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground" OkControlID="Button1">
      </cc1:ModalPopupExtender>
 <asp:Panel ID="pnldelsms" runat="server" Width="400px" Height="150px">
<fieldset style="width:402px">
<asp:Panel ID="pnldelete" runat="server" >
</asp:Panel>
 <table align="center"  border="0" cellpadding="0" cellspacing="0" style="background-color:#fff; height:150px">
   
   <tr>
       <td align="center" class="headertext" style="background:#f0f0f0">Delete the Record</td>
        <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="X" ForeColor="white" 
                            BorderStyle="None" BackColor="Gray"/>
                    
                    </td>   
     </tr> 
         
         <tr>         
        <td align="center" width="100%">
         <table width="100%" border="0">        
        <tr>         
          <td>
              Are You Sure want to Delete the Record.<br />
        </td>
        </tr>      
          <tr>
          <td align="right">&nbsp;</td>
        </tr>
        <tr>        
          <td align="center">
                  <asp:Button ID="imgbtnsmsdelete" runat="server" Text="Confirm" OnClick="imgbtnsmsdelete_Click"
                 /> &nbsp; <asp:Button ID="btncancel" runat="server" Text="Cancel" />  </td>
        </tr>
        <tr>
          <td>   
          <asp:Label ID="lbldid" runat="server" Visible="false"></asp:Label></td>
          </tr>
      
      </table>
        </td>
         </tr>
</table>
</fieldset>
</asp:Panel></center>
    </div>
    </form>
</body>
</html>

