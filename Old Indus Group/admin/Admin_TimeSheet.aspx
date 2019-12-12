<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_TimeSheet.aspx.cs" Inherits="Admin_TimeSheet" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>
<%@ Register Src="Usercontrols/TimeSheet_TopMenu.ascx" TagName="TimeSheetMenu" TagPrefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> : : Indus Group : : - Admin Control Panel - TimeSheet</title>
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
        <script language="javascript" type="text/javascript">
	function alertedit()
{
alert("Employee Details has been edited Successfully");
}
function alertdelete()
{
alert("Employee Details has been deleted Successfully");
}

 function ConfirmationBox(username) {

            var result = confirm('Are you sure you want to delete ' + username + ' record Details');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }


    </script>
    
    
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
    
    <style type="text/css">
        .style24
        {
            height: 15px;
        }
    </style>
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
      #empdata td
        {
        	border:0.1px solid #CCCCCC;
        }
        #empdata th
        {
        	border-right:0.1px solid #CCCCCC;
        }
	</style>
<link rel="stylesheet" href="Styles/stylesheet.css" />
    
</head>
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">
 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
    <tr>
    <td height="30px">&nbsp;</td>
    </tr>
     <tr>
    <td align="center" height="30px"><font color='#003399' size='3pt'><b>Employees Timesheet</b></font></td>
    </tr>
    <tr>
    <td height="10px">&nbsp;</td>
    </tr>
      <tr>
           <td height="10px" align="right" style="padding-right:150px"><asp:LinkButton ID="lnkpage" runat="server" Text="Create TimeSheet" Font-Underline="false" Font-Size="16px" OnClick="click_newpage"> </asp:LinkButton></td>
      </tr>
    <tr> 
    <td align="center">&nbsp;  
      
       <asp:GridView ID="empdata" runat="server" Width="1250px" 
      AutoGenerateColumns="False"  BorderColor="#CCCCCC"
                BorderWidth="3px" CellPadding="3" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                Font-Underline="False"  BackColor="White"
                AllowPaging="True"  PagerStyle-Mode="NumericPages" PageSize="30" 
                   PagerStyle-BackColor="White" 
            onpageindexchanging="empdata_PageIndexChanging" >            
         <%--   <Columns>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label ID="txtscr"  ForeColor="Gray" Text='<%# Bind("firstname") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Last Name">
                <ItemTemplate>
                    <asp:Label ID="txtdesc" ForeColor="Gray" Text='<%# Bind("lastname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Email ID">
                <ItemTemplate>
                    <asp:Label ID="txtlink1" ForeColor="Gray" Text='<%# Bind("username") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Address">
                <ItemTemplate>
                    <asp:Label ID="txtlink2" ForeColor="Gray" Text='<%# Bind("street") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
           
            </asp:TemplateField>
            
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="City">
            <ItemTemplate>
            <asp:Label ID="txtlink3" ForeColor="Gray" Text='<%# Bind("city1") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
         
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Country">
            <ItemTemplate>
            <asp:Label ID="txtlink4" ForeColor="Gray" Text='<%# Bind("country1") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Phone">
            <ItemTemplate>
            <asp:Label ID="txtlink5" ForeColor="Gray" Text='<%# Bind("mobile") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>             
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="View,Edit&Mail">
            <ItemTemplate>
            <asp:HyperLink ID="btnedit" ForeColor="Gray" NavigateUrl='<%# EditTimeUrl ( (int) Eval("userid") ) %>' Text="View" CssClass="data" runat="server"></asp:HyperLink>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />        
            </asp:TemplateField> 
               
          
            </Columns>--%>
           <Columns>
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Emp Id">
                <ItemTemplate>
                    <asp:Label ID="txtscr"  ForeColor="Gray" Text='<%# Bind("userid") %>'   runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                
                <HeaderStyle  Width="90"  HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Consultant Name">
                <ItemTemplate>
                    <asp:Label ID="txtdesc" ForeColor="Gray" Text='<%# Bind("consname") %>' runat="server" ></asp:Label>                                                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Client Name">
                <ItemTemplate>
                    <asp:Label ID="txtlink1" ForeColor="Gray" Text='<%# Bind("clientname") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
             
            </asp:TemplateField>

            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Time Period">
                <ItemTemplate>
                    <asp:Label ID="txtlink2" ForeColor="Gray" Text='<%# Bind("timeperiod") %>' runat="server" CssClass="data"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
           
            </asp:TemplateField>
            
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Work Hours">
            <ItemTemplate>
            <asp:Label ID="txtlink3" ForeColor="Gray" Text='<%# Bind("workhrs") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
         
            </asp:TemplateField>
            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC"  HeaderText="Over Time">
            <ItemTemplate>
            <asp:Label ID="txtlink4" ForeColor="Gray" Text='<%# Bind("overtime") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>            
            <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="Post Date">
            <ItemTemplate>
            <asp:Label ID="txtlink5" ForeColor="Gray" Text='<%# Bind("pdate") %>' runat="server" CssClass="data"></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
          
            </asp:TemplateField>             
             <asp:TemplateField ItemStyle-BorderColor="#CCCCCC" HeaderText="View">
            <ItemTemplate>
            <asp:HyperLink ID="btnedit" ForeColor="Gray" NavigateUrl='<%# EditTimeUrl ( (int) Eval("userid") ) %>' Text="View" CssClass="data" runat="server"></asp:HyperLink>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />        
            </asp:TemplateField> 
               
          
            </Columns>
             <FooterStyle BackColor="#f0f0f0" ForeColor="Red" />
                <RowStyle CssClass="datagrid-2"  Font-Size="9pt" HorizontalAlign="Center" 
                    Font-Strikeout="False" Font-Underline="False" />
                <PagerStyle BackColor="#f0f0f0" ForeColor="#00277a" HorizontalAlign="Right" 
                  Font-Bold="True" Font-Italic="True" Font-Size="8pt" 
                    Font-Underline="False" Height="20px" Wrap="True" />
                <SelectedRowStyle BackColor="#f0f0f0" Font-Bold="True" ForeColor="#00277a" />
              <HeaderStyle CssClass="label5" BackColor="#f0f0f0" Font-Bold="True" Font-Size="Small" BorderColor="Blue" 
                    ForeColor="#00277a" Height="30px" HorizontalAlign="Center" />
            </asp:GridView>
             </td>
    </tr>
    

    
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
      </td>
    </tr>
    <tr>
      <td id="tdcontent1" runat="server" align="center" valign="top" width="100%" class="lable"> 
      
          &nbsp;</td>
    </tr>
    </table>
    </form>
</body>
</html>