<%@ Control Language="C#" AutoEventWireup="true" CodeFile="User_TopMenu.ascx.cs" Inherits="Usercontrols_User_TopMenu" %>

 <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="100%">
        <td valign="top" width='100%'>
      <img src="images/admin.jpg" height="223" alt="" style="width: 1000px" />
    </td>
    </tr>
   <tr>
    <td align="center" valign="top" width='100%'>
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td align="center" valign="middle" class="lblog"  >
            <a href="User_Home.aspx">Home</a></td>
        <td class="seperator" align="center" style="height: 7px" >
            |</td>
      
         <td align="center" valign="middle" class="lblog"  >
            <a href="User_Client.aspx">Client Form</a></td>
        <td class="seperator" align="center" style="height: 7px" >
            |</td>
            <td align="center" valign="middle" class="lblog"  >
            <a href="User_Vendor.aspx">Vendor Form</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
     <td align="center" valign="middle" class="lblog"  >
            <a href="User_Employee.aspx">Employee Form</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
       <td align="center" valign="middle" class="lblog"  >
            <a href="User_Upload.aspx">Upload Forms</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
       
       <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Feedback.aspx">Feed Back</a></td>
             <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
       <td align="center" valign="middle" class="lblog"  >
            <a href="newsletter.aspx">Send News Letter</a></td>
             <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
       <td align="center" valign="middle" class="lblog"  >
       <asp:LinkButton ID="lnlAdLogout" runat="server" Text="Logout" OnClick="lnlAdLogout_Click"></asp:LinkButton>
            <%--<a href="Admin_Login.aspx">Logout</a>--%></td>
    </tr>
    

 
    
    
    
      
</table>  
    </td>
    </tr>
    </table>