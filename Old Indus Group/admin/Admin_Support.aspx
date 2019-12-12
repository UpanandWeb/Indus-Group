<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Support.aspx.cs" Inherits="Admin_Support" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: :Indus Group : : Admin Control Panel - Support</title>       
          
  <link rel="stylesheet" href="Styles/stylesheet.css" />   
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
<body id="body1" runat="server" topmargin="0" leftmargin="0" bgcolor="#F6FDFD">
    <form id="form1" runat="server">  
    <center> 
   <table width="998px" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
        <td valign="top" width='100%' class="lblog" >
     <uc1:TopMenu ID="Topmenu1" runat="server" />
    </td>
    </tr>
     <tr >
        <td>
        &nbsp;
    </td>
    </tr>
     <tr >
        <td align="center" style="color:#00277a">
         <u>Support Details</u>
    </td>
    </tr>
     <tr >
        <td>
        &nbsp;
    </td>
    </tr>
    <tr>
      <td id="tdcontent" runat="server" align="center" valign="top" width="100%" class="lable"> 
        <asp:DataList ID="dlReview" runat="server" Width="90%" style="border:dotted 1px #666; color:#00277a" 
                                          DataKeyField="sp_id"  
              ondeletecommand="dlReview_DeleteCommand">
        <ItemTemplate>
        <table width="100%" border="0">
        <tr>
        <td width="73%" class="select_menu" height="20" id="tddetails" runat="server" style="padding-left:10px;"> 
              <asp:Label ID="lblFrom" runat="server" Font-Size="9pt" ForeColor="#00277a" Text='<%#Eval("sp_from")%>'></asp:Label>
        </td>
        <td align="right" style="padding-right:10px;">                     
                      <asp:LinkButton ID="imgbtndel" runat="server" Font-Size="9pt"  OnClientClick="return confirm('Are you sure want delete this record?')" Text="Delete" CommandName="Delete"></asp:LinkButton>
         </td>
          </tr>
         <tr>
         <tr>
        <td class="select_menu" height="35" id="tdview" runat="server" colspan="2" style="padding-left:10px;">
         <asp:Label ID="lblmsg" runat="server" ForeColor="#00277a" Font-Size="9pt" Text='<%#Eval("sp_message") %>'></asp:Label></td>
  
      </tr>
      <tr>
      <td colspan="2" align="right" id="tddate" runat="server" class="select_menu" style="padding-right:10px;">
      <asp:LinkButton ID="lblPfile" runat="server" Font-Size="9pt" Text='<%#Eval("sp_file") %>' OnCommand="filedownload" CommandArgument='<%#Eval("sp_file") %>'></asp:LinkButton>
  
      </td></tr>
      <tr>
        <td colspan="4" width="100%"><hr /></td>
      </tr>
    </table>
      </ItemTemplate>
    </asp:DataList>
          </td>
         
        </tr>
     
       <tr>
          <td align="center">
             <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
         </td>
      </tr>
        <tr><td>&nbsp;</td></tr>
      <tr>
          <td align="right" style="padding-right:5%">
            <asp:Button ID="cmdPrev" runat="server" Text=" << " OnClick="cmdPrev_Click"></asp:Button>
              &nbsp;&nbsp;
            <asp:Button ID="cmdNext" runat="server" Text=" >> " OnClick="cmdNext_Click"></asp:Button>                              
          </td>
        </tr> 
           <tr><td>&nbsp;</td></tr>
        <tr>
    <td align="right" style="padding-right:5%;"> 
        <asp:Label ID="lblCurrentPage" runat="server" CssClass="select_menu" Font-Size="11pt" ForeColor="#00277a"></asp:Label>
    </td>
</tr>                     
    
  
    </table>   
    </center>
        </form>
</body>
</html>