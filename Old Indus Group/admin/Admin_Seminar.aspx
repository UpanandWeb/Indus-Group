<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Seminar.aspx.cs" Inherits="admin_Admin_Seminar" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : - Admin Control Panel - Seminars</title>
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
<script language="javascript" type="text/javascript">
//function alertedit()
//{
//    alert("Client Details has been edited Successfully");
//}

//function alertdelete()
//{
//    alert("Client Details has been deleted Successfully");
//}

//function alertcreate()
//{
//    alert("Client Details has been Created Successfully");
//}
  
    function alertdelete12()
    {
        alert("You don't have rights to done this task !!!");
    }  
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
   <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
</cc1:ToolkitScriptManager><center>
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
           <td  align="center">
           <table width="100%" >
           <tr>
           <td align="right"   >
           <a href="Admin_Sem_Registration.aspx" style="color:Maroon" class="lblog" >Registered Candidates</a>
           </td>
           <td id="crtopt" runat="server" align="left"  class="lblog" width="50%" style="padding-left:20px;" ></td>
           </tr>
           </table>
           </td>
       </tr>
       <tr><td>&nbsp;</td></tr>
         <tr>
         <td id="Td1" runat="server" align="center" style="height:30px"  class="style24" width=" 90%">         
         <asp:Label ID="lblseminnartitle" runat="server" Text="Seminars List" ForeColor="#00277a" Font-Bold="true" Font-Size="Large"></asp:Label>
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
   <asp:GridView ID="GridView1" runat="server" Width="100%" 
    AutoGenerateColumns="False"  BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="5" 
                   PagerStyle-BackColor="White" 
           onpageindexchanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Seminar Title">
                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLink1"  NavigateUrl='<%# FormatUrl( (int) Eval("sid") )%>' runat="server" Text='<%# Bind("CourseName") %>' ForeColor="Gray"></asp:HyperLink> 
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <ItemStyle CssClass="" />
                 <HeaderStyle  Width="15%" />
                 
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Description" >
                
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CouserDes") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>                
                <ItemStyle HorizontalAlign="Left" />
                 <HeaderStyle Width="50%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Date of Seminar" >
                
                <ItemTemplate>
                    <asp:Label ID="Labeldate" runat="server" Text='<%# Bind("SeDate") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
                 <HeaderStyle Width="14%" HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Posted On" >
                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("post") %>' ForeColor="Gray"></asp:Label>
                </ItemTemplate>
            
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="12%" />
            </asp:TemplateField>
            
            
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Edit" >  
                <ItemTemplate>
            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# FormatUrlEd( (int) Eval("sid") )%>' runat="server" Text='Edit' ForeColor="Gray" ></asp:HyperLink> 
                        <%--<asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("id") %>' OnCommand="FormatUrlEd" CssClass ="headings" Text="Edit"></asp:LinkButton>--%>

                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="8%" />
              </asp:TemplateField>
              
               <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Delete" >  
                 <ItemTemplate>
            <%--<asp:HyperLink ID="HyperLink3" NavigateUrl='<%# FormatUrlDl( (int) Eval("id") )%>' runat="server" Text='Delete' CssClass ="headings" ></asp:HyperLink>--%> 
                        <asp:LinkButton ID="lnkdeletetemp" runat="server" CommandArgument='<%#Eval("sid") %>' OnCommand="FormatUrlDl" ForeColor="Gray" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="8%" />
                </asp:TemplateField>              
                
            
        </Columns>
   
         <FooterStyle BackColor="#f0f0f0" ForeColor="#00277a" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt"  HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                    BorderColor="#f0f0f0" Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
                <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" 
                    ForeColor="#00277a" Height="30px" />
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
       <td align="center" class="headertext" style="background:#CCCCCC">Delete the Record</td>
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
              Are You Sure want to Delete the Course.<br />
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
          <asp:Label ID="lbldid" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="lblAcess" runat="server" Visible="false" /> 
          </td>
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
</html>
