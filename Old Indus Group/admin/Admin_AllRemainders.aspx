<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_AllRemainders.aspx.cs" Inherits="admin_Admin_AllRemainders" %>
<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Remainders </title>
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>
    .modalBackground 
{
   
    background-color:#EBEBEB;
    filter:alpha(opacity=70);
    opacity:0.7;
}
    #Gridview1
      {
      	border:1px solid Gray;
	padding:2px;
      }
   .GridviewScrollHeader TH, .GridviewScrollHeader TD 
{ 
	color: #00277a;
    padding: 5px; 
    font-weight: bold;     
    border-right: 1px solid #E0E0E2; 
    border-bottom: 1px solid #E0E0E2; 
    background-color: #EFEFEF; 
    text-align: center; 
   
} 
.GridviewScrollItem TD 
{ 
	color:Gray;
    padding: 5px;     
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
     <script type="text/javascript">
         function ConfirmationBox(userid) {
             var result = confirm('Are you sure you want to delete employee record ');
             if (result) {
                 return true;
             }
             else {
                 return false;
             }
         }
</script>    

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
<body>
    <form id="form1" runat="server">
    <div>
    <center>
<table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
            <uc1:TopMenu ID="Topmenu1" runat="server" />
        </td>
    </tr>
    <tr>
    <td>&nbsp;
    </td>
    </tr>
    <tr height="19">
    <td width="100%" align="center"  height="15" class="headings4" style="color:#174eb4;">Remainders List</td>                     
                </tr>
                <tr>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td>
                <asp:GridView ID="Gridview1" runat="server" Width="998px" DataKeyNames="Cal_Id"
                 ForeColor="#00277a"  AutoGenerateColumns="false" PageSize="10" AllowPaging="true" 
                   PagerStyle-BackColor="White" OnRowDataBound="MyGrid_RowDataBound" 
                 onpageindexchanging="MyGrid_PageIndexChanging" >
                <HeaderStyle CssClass="GridviewScrollHeader" HorizontalAlign="Center" /> 
                <RowStyle CssClass="GridviewScrollItem" HorizontalAlign="Center" /> 
                <PagerStyle CssClass="GridviewScrollPager" HorizontalAlign="Right" /> 
                <Columns> 
                <asp:TemplateField HeaderText="Name">
                <ItemTemplate>              
                 <asp:Label ID="lblName" runat="server" Text='<%#Eval("R_name") %>'/>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
                </asp:TemplateField>     
                <asp:TemplateField HeaderText="Date">
                <ItemTemplate>               
                 <asp:Label ID="lblDate" runat="server"  Text='<%#Eval("Rem_date") %>'/>                
                </ItemTemplate>
                <ItemStyle Width="100px" />                
                </asp:TemplateField>          
                <asp:TemplateField HeaderText="Time (EST)">
                <ItemTemplate >
                <asp:Label ID="lblEst" runat="server" Text='<%#Eval("Rem_time") %>'  />
                </ItemTemplate>
                <ItemStyle Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Note">
                <ItemStyle HorizontalAlign="Left" />
                <ItemStyle Width="500px" />
                <ItemTemplate>               
                <asp:Label ID="lblNote" runat="server"  Text='<%#Eval("Rem_note") %>'  />                       
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  >
               <ItemTemplate>                      
               <asp:ImageButton ID="imgbtndel" width='20' height='20' runat="server" ImageUrl="images/delete.png" OnClick="lnkdelrecord" />
               <br />                                        
               </ItemTemplate>
                <ItemStyle Width="50px"  HorizontalAlign="Center"/>
                </asp:TemplateField>            
                </Columns>
                </asp:GridView>
                </td>
                </tr>           
    </table> 
    <asp:ScriptManager ID="scrst" runat="server"></asp:ScriptManager>     
     </center>
     <asp:Label ID="lblusers" runat="server" Visible="false" />    
    </div>
    </form>
</body>
</html>
