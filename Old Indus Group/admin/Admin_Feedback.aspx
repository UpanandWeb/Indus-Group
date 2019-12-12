<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Feedback.aspx.cs" Inherits="Admin_Feedback" %>

<%@ Register Src="Usercontrols/Admin_TopMenu.ascx" TagName="TopMenu" TagPrefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>: :Indus Group : : - Admin Control Panel - Feedback</title>       
          
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
   <table width="80%" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="color:#00277a">
    <tr width="100%">
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
        <td align="center">
         <u >Feedback Details</u>
    </td>
    </tr>
    <tr><td height="30px">
    <table border="0" width="100%">
       <tr><td align="center"  height="20px">      
       </td>     
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td  align="right" style="padding-right:40px;"><font Color="#00277a" ><a href="Admin_systemip.aspx">Track History</a></font></td>
     </tr>
    </table>
    </td></tr>
     <tr >
        <td>
        &nbsp;
    </td>
    </tr>
    
    <tr>
      <td align="center">
      <asp:DataList ID="dlReview" runat="server" Width="100%" style="border:dotted 1px #666" ForeColor="#00277a" 
                                            onitemdatabound="dlReview_ItemDataBound" DataKeyField="id"  
              ondeletecommand="dlReview_DeleteCommand">
        <ItemTemplate>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="color:#00277a; font-size:10pt">
  <tr>
    <td width="130" height="25" align="right"><span id="dlReview_ctl00_Lblnames2">Name    :</span> </td>
    <td width="20">&nbsp;</td>
    <td height="25"><span id="dlReview_ctl00_lblname2">
     <asp:Label ID="lblname" ForeColor="Red" runat="server" Text='<%#Eval("name")%>'></asp:Label>&nbsp;
    </span> <span id="dlReview_ctl00_says2">Says</span></td>
    <td height="25"><a id="dlReview_ctl00_lnkdeact2")"></a></td>
    <td height="25">    
     <asp:LinkButton ID="imgbtndel" runat="server"  OnClientClick="return confirm('Are you sure want delete this record?')" ForeColor="Gray" Text="Delete" CommandName="Delete"></asp:LinkButton></td>
  </tr>
  <tr>
    <td width="130" height="25" align="right"><span id="dlReview_ctl00_Label2">Email    :</span></td>
    <td width="20">&nbsp;</td>
    <td height="25">
     <asp:Label ID="Label1"  runat="server" Text='<%#Eval("email") %>'></asp:Label></td>    
    </td>
    <td width="100" height="25">&nbsp;</td>
    <td width="100" height="25">&nbsp;</td>
  </tr>
  <tr>
    <td width="130" height="25" align="right">Mobile  :</td>
    <td width="20">&nbsp;</td>
    <td height="25">
       <asp:Label ID="Label4" runat="server" Text='<%#Eval("phno") %>'></asp:Label>
    </td>
    <td height="25">&nbsp;</td>
    <td height="25">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="130" align="right" valign="top"> <span id="dlReview_ctl00_Label5" style="color:#00277a; font-size:10pt">Comment  :</span></td>
        <td width="20">&nbsp;</td>
        <td ><table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="baseline">
            <asp:Label ID="lblview" runat="server" ForeColor="#00277a" Font-Size="10pt" Text='<%#Eval("comment") %>'></asp:Label>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr><td width="15px">&nbsp;</td></tr>
  <tr>
    <td width="130" height="25" align="right"><span id="Span1"> </span></td>
    <td width="20">&nbsp;</td>
    <td height="25">
    <asp:Label ID="lbldate" runat="server" ForeColor="Silver" Text='<%#Eval("postDate") %>'></asp:Label></td>
    
    </td>
    <td width="100" height="25">&nbsp;</td>
    <td width="100" height="25">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5">&nbsp;</td>
  </tr>
</table>
<hr />
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
          <td align="right" style="padding-right:15%">
            <asp:Button ID="cmdPrev" runat="server" Text=" << " OnClick="cmdPrev_Click"></asp:Button>
              &nbsp;&nbsp;
            <asp:Button ID="cmdNext" runat="server" Text=" >> " OnClick="cmdNext_Click"></asp:Button>                              
          </td>
        </tr> 
           <tr><td>&nbsp;</td></tr>
        <tr>
    <td align="right" style="padding-right:15%;">
        <asp:Label ID="lblCurrentPage" runat="server" CssClass="select_menu"></asp:Label>
    </td>
</tr>                     
    
  
    </table>   
    </center>
        </form>
</body>
</html>