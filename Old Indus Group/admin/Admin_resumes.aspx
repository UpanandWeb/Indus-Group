<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_resumes.aspx.cs" Inherits="admin_Admin_resumes" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>: : Indus Group : : - Admin Control Panel - Careers</title>
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
    <script type="text/javascript" language="javascript">         
     function ConfirmationBox(username) {

             var result = confirm('Are you sure you want to delete Resume record ');
             if (result) {

                 return true;
             }
             else {
                 return false;
             }
         }
    </script>
<script language="javascript" type="text/javascript">
function alertedit()
{
    alert("Client Details has been edited Successfully");
}

//function alertdelete()
//{
//    alert("Client Details has been deleted Successfully");
//}

function alertcreate()
{
    alert("Client Details has been Created Successfully");
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
	 #MyGrid td
        {
        	border:0.1px solid #CCCCCC;
        }
        #MyGrid th
        {
        	border-right:0.1px solid #CCCCCC;
        }
	</style>
	<script language="javascript" type="text/javascript">
	  
    function alertdelete()
    {
        alert("You don't have rights to done this task !!!");
    }    
    </script> 
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
       
       <tr><td height="30px">
    <table border="0" width="100%">
       <tr><td align="center"  height="20px">
       <a href="Admin_Careers.aspx"><b>Posted Jobs</b></a>
       </td>     
     <td align="center"><font><a href="Admin_Careers_Create.aspx"  ><b>Add New Job</b></a></font></td>
     <td  align="center"><font><a href="Admin_resumes.aspx"><b>Posted Resumes</b></a></font></td>
        <td  align="center"><font><a href="Admin_appresumes.aspx"><b>Applied Resumes</b></a></font></td>
     </tr>
    </table>
    </td></tr>
    
       <tr><td>&nbsp;</td></tr>
       <tr>
           <td >
           </td>
       </tr> 
     <tr>
    <td  id="Errmsg" align="right" class="lblog" runat="server">
           </td>
    </tr>
    
    
   <tr>        
      <td id="tdcontent1" runat="server" align="left" valign="top" class="lable"> 
      <table>
      <tr>
      <td width="5px">&nbsp;
      </td>
      <td width="100%" align="center">
             <asp:GridView ID="MyGrid" runat="server" Width="80%" 
                 AutoGenerateColumns="False" DataKeyNames="id"
              PagerSettings-Mode="Numeric" AllowPaging="true"
            Height="100px"  
             BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1" CellPadding="2" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"   BackColor="White"  PageSize="10" OnDataBound="GridView1_DataBound"
             GridLines="Both"  OnRowDataBound="MyGrid_RowDataBound" onpageindexchanging="MyGrid_PageIndexChanging" 
               >
          

                <Columns>
                        <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderStyle-Width="4%" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk1" runat="server" onclick="changeColor(this)" />
                                                <asp:HiddenField ID="hdID" runat="server" Value='<%# Eval("ID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="90" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                   <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ControlStyle-Width="10%" HeaderStyle-Width="10%" FooterStyle-Width="10%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle"  ForeColor="#515151" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >&nbsp;&nbsp;&nbsp;&nbsp;
                     <%#  DataBinder.Eval(Container.DataItem, "name")%>
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>        
                  <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"  ControlStyle-Width="10%" HeaderStyle-Width="10%" FooterStyle-Width="10%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" ForeColor="#515151" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "email")%>&nbsp;                    
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"  ControlStyle-Width="10%" HeaderStyle-Width="10%" FooterStyle-Width="10%">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" ForeColor="#515151" Width="15%" HorizontalAlign="Center"></ItemStyle>
                   <ItemTemplate >
                      <%#  DataBinder.Eval(Container.DataItem, "phno")%>&nbsp;                    
                          
                  </ItemTemplate>
              <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Resume" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"  >

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                      <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnfilename" CommandArgument='<%# Eval("id")%>' OnCommand="lnkbtnfilename" ForeColor="maroon" style="text-decoration:none" runat="server" 
                                  Text ='<%# DataBinder.Eval(Container.DataItem,"resume")%>'   ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="25%"></ItemStyle>
                        <FooterStyle Font-Size="Smaller" Font-Names="Arial"></FooterStyle>
                 </asp:TemplateField>
                  
                                     

                  <asp:TemplateField ItemStyle-Width="10%" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">

                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                       <ItemStyle Font-Size="11px" Font-Names="arial" VerticalAlign="Middle" Width="17%" HorizontalAlign="Center"></ItemStyle>
                           
                       <ItemTemplate>
                       <%--<a href="Admin_EmpDelete.aspx?cid=<%# DataBinder.Eval(Container.DataItem,"userid")%>">
                           <img src='images/delete.png' alt='Delete' width='16' height='16' border='0' /></a>--%>
                      <asp:ImageButton ID="imgbtndel" width='20'  CommandArgument='<%# Eval("id")%>' OnCommand="imgclick" height='20' runat="server"  ImageUrl="images/delete.png" />

                       <br />                                        
                       </ItemTemplate>
                       <ItemStyle Width="7%"></ItemStyle>
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
         </td><td width="4px">&nbsp;</td>
         </tr></table>
      </td>
      <td width="2px">&nbsp;</td>
    </tr>
   </table> 
      <input id="btnDummy2" runat="server" type="button" style="display: none;" />
   <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btncancel" TargetControlID="btnDummy2" PopupControlID="pnldelsms" DropShadow="false"
      PopupDragHandleControlID="pnldelete" BackgroundCssClass="modalBackground" OkControlID="Button1">
      </cc1:ModalPopupExtender>
 <%--<asp:Panel ID="pnldelsms" runat="server" Width="400px" Height="150px">
<fieldset style="width:402px">
<asp:Panel ID="pnldelete" runat="server" >
</asp:Panel>
 <table align="center"  border="0" cellpadding="0" cellspacing="0" style="background-color:#fff; height:150px">
   
   <tr>
       <td align="center" class="headertext" style="background:#036">Delete the Record</td>
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
              Are You Sure want to delete the job details .<br />
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
</asp:Panel>--%>
<asp:Label ID="lblAcess" runat="server" Visible="false" />
<asp:Label ID="testings" runat="server" ></asp:Label>

      <script type="text/javascript">
          function changeColor(CheckBoxObj) {
              if (CheckBoxObj.checked == true) {

                  CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#88AAFF';
              }
              else {
                  CheckBoxObj.parentNode.parentNode.style.backgroundColor = '#FFFFFF';
              }
          }
        </script>
</center>
    </div>
    </form>
</body>
</html>
