<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Admin_TopMenu.ascx.cs" Inherits="Usercontrols_Admin_TopMenu" %>
<style>
.border
{
	border:none;
	color:#00277a;
	background-color:White;
}
</style>
<center>
 <table width="998px"  cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr width="998px">
     <td valign="top" align="center"  width="998px">
      <img src="images/admin.jpg" height="223" alt="" style="width: 100%" />
    </td>
    </tr>
    <tr><td style="height:10px"></td></tr>
   <tr>
    <td align="left" valign="top" width='100%'>
 <table border="0" cellspacing="0" cellpadding="0" width="998px">
    <tr>
        <td align="center" valign="middle" class="lblog">
            <a href="Admin_Home.aspx">Home</a>
        </td>
        <td class="seperator" align="center" style="height: 7px" >|</td>
      
         <%--<td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Client.aspx">Client Form</a></td>
        <td class="seperator" align="center" style="height: 7px" >
            |</td>
            <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Vendor.aspx">Vendor Form</a></td>
            
             <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>--%>
       <%--<td align="center" valign="middle" class="lblog">
            <a href="Admin_JobPost.aspx">JobPost</a></td>
           
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>--%>
       
        <td align="center" valign="middle" class="lblog" id="empform" runat="server">
            <a href="Admin_Employee.aspx">Employee List</a>
        </td>
        <td class="seperator" align="center" width="3" style="height: 7px" id="empform1" runat="server">|</td>
        <td align="center" valign="middle" class="lblog">
            <a href="Admin_EmpNewForm.aspx">H1B List</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">|</td>
            
       <%--<td align="center" valign="middle" class="lblog">
            <a href="Admin_Upload.aspx">Upload Forms</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>--%>
       
      <%-- <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_CareersNew.aspx">Careers</a></td>
       <td class="seperator" align="center" width="3" style="height: 7px">|</td>--%>
       <td align="center" valign="middle" class="lblog" >
            <a href="Admin_Careers.aspx">Careers</a></td>
       <td class="seperator" align="center" width="3" style="height: 7px">|</td>
      
       
       <td align="center" valign="middle" class="lblog">
            <a href="Admin_timesheet.aspx">TimeSheet</a>
       </td>
       <td class="seperator" align="center" width="3" style="height: 7px" id="tdEmpDocsSep" runat="server">|</td>
       
       
       <td align="center" valign="middle" class="lblog" id="tdEmpDocs" runat="server" >
            <a href="Admin_UploadDocs.aspx">All Docs</a></td>
             <td class="seperator" align="center" width="3" style="height: 7px" id="td1" runat="server">|</td>
        <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Seminar.aspx">Seminars</a>&nbsp;</td>
               <td class="seperator" align="center" style="height: 7px">|</td>
             <td align="center" valign="middle" class="lblog" id="td2" runat="server" >
            <a href="Admin_Feedback.aspx">Feedback</a></td>
       <td class="seperator" align="center" width="3" style="height: 7px" id="td3" runat="server">|</td>
       
      <%-- <td align="center" valign="middle" class="lblog" id="td2" runat="server" >
            <a href="Admin_Feedback.aspx">Feed back Administration</a></td>--%>
            
<td align="center" valign="middle" class="lblog"  >
<asp:DropDownList ID="ddltypes" runat="server" CssClass="border lblog" AutoPostBack="true" OnSelectedIndexChanged="ddltype_Select" >
<asp:ListItem Text="Company" Value="Company"  />
<asp:ListItem Text="Projects" Value="Projects" />
<asp:ListItem Text="Departments" Value="Departments" />
<asp:ListItem Text="Roles" Value="Roles" />
<asp:ListItem Text="Performance" Value="Performance" />

</asp:DropDownList>
           <%-- <a href="Company.aspx">Company</a>
           <a href="Projects.aspx">Projects</a>
           --%> 
           <%-- <img src="../images/immdwn.png" id="img" runat="server" style="vertical-align:bottom" />
             <span id="spn" runat="server" style="position:relative; width:100px; background-color:Gray">
             <a href="Departments.aspx">Departments</a>
              <a href="Roles.aspx">Roles</a></span>--%>
             </td>
       <%-- <td class="seperator" align="center" style="height: 7px" >|</td>--%>
    </tr>
    <tr>
    <td colspan="21">
    <hr />
    </td>
    </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" width="998px" >
     <tr>
        <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_clients.aspx">Client</a></td>
        <td class="seperator" align="center" style="height: 7px" >|</td>
      
        
         <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_vendors.aspx">Vendor</a></td>
        <td class="seperator" align="center" style="height: 7px" >|</td>
        
        <td align="center" valign="middle" class="lblog">
            <a href="Admin_Appointments.aspx">Appointments</a></td>
        <td class="seperator" align="center" style="height: 7px" >|</td>
        
        
        <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Calendar.aspx">Calendar</a></td>
        <td class="seperator" align="center" style="height: 7px">|</td>
        
        <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Paysheet.aspx">Pay Roll</a></td>
        <td class="seperator" align="center" style="height: 7px">|</td>
        
       <%--<td align="center" valign="middle" class="lblog">
            <a href="Projects.aspx">Projects</a></td>
        <td class="seperator" align="center" style="height: 7px" >|</td>--%>
        
        
         <%--<td align="center" valign="middle" class="lblog"  >
            <a href="Departments.aspx">Departments</a></td>
        <td class="seperator" align="center" style="height: 7px">|</td>
        
        
        <td align="center" valign="middle" class="lblog"  >
            <a href="Roles.aspx">Roles</a></td>
        <td class="seperator" align="center" style="height: 7px">|</td>
        --%>
        
       <%--<td align="center" valign="middle" class="lblog"  >
            <a href="TaskSheet.aspx">TaskSheet</a></td>
        <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>--%>
       
       <%--<td align="center" valign="middle" class="lblog"  >
             <a href="Admin_Countries.aspx">Countries</a></td>
             <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>
       <td align="center" valign="middle" class="lblog"  >
             <a href="Admin_States.aspx">States</a></td>
             <td class="seperator" align="center" width="3" style="height: 7px">
            |</td>--%>
       
       
       <td align="center" valign="middle" class="lblog"  >
            <a href="news.aspx">News & Events</a></td>
       <td class="seperator" align="center" style="height: 7px">|</td>

       <td align="center" valign="middle" class="lblog" id="tdcreate" runat="server" >
            <a href="Admin_CreationfUserIds.aspx">Users</a>
       </td>
        <td class="seperator" align="center" style="height: 7px" id="td4" runat="server">|</td>
        <td align="center" valign="middle" class="lblog" id="td5" runat="server" >
            <a href="Admin_Contacts.aspx">Emp Contacts</a></td>
       <td class="seperator" align="center" style="height: 7px" id="tdSepcreate" runat="server">|</td>
        <td align="center" valign="middle" class="lblog"  >
            <a href="Admin_Support.aspx">Support</a>&nbsp;</td>
        <td class="seperator" align="center" style="height: 7px">|</td>      
            
        
       <td align="center" valign="middle" class="lblog"  >
       <asp:LinkButton ID="lnkALog" runat="server" Text="Logout" OnClick="lnkALog_click"></asp:LinkButton>
            <%--<a href="Admin_Login.aspx">Logout</a>--%>&nbsp;</td>
    </tr>    
    
</table>
    </td>
    </tr>
    </table>
   
    </center>