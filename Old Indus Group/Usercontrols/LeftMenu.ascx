 <%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftMenu.ascx.cs" Inherits="Usercontrols_LeftMenu" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:::Recruiters Choice:::</title>
<link href="includes/styles.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="JScripts/jquery.min.js"></script>
<script type="text/javascript" src="JScripts/ddaccordion.js"></script>
<script type="text/javascript" src="JScripts/Menu1.js"> </script>

</head>
<table border="0" align="left" style="margin-left:0px" cellpadding="0" cellspacing="0">
      <tr>
        <td>
            <table border="0" align="left" cellpadding="0" cellspacing="0">
              <tr id="trcompany" runat="server">
                <td width="173" valign="top" id="tdcomp" runat="server">
                    <div class="glossymenu">
                        <a class="menuitem submenuheader" href="#" >Company</a>
                        <div class="submenu">
	                        <ul>
	                            <%--<li><a href="company.aspx">Company Details</a></li>--%>
	                            <li><a href="Location.aspx">Locations</a></li>
	                            <li><a href="division.aspx">Divisions</a></li>
	                            <li><a href="holiday.aspx">Holidays</a></li>
	                            <li><a href="document.aspx">Company Documents</a></li>
	                            <li><a href="assestinfo.aspx">Assets/Inventory</a></li>
	                            <li><a href="forms.aspx">Forms/Documents</a></li>
	                            <li><a href="currency.aspx">Currencies</a></li>
	                            <li><a href="contactinfo.aspx">Contacts</a></li>
	                            <%--<li><a href="#">Personal Contacts</a></li>--%>
	                            <li><a href="shipments.aspx">Shipments</a></li>
	                            <%--<li><a href="#">Guest House</a></li>--%>
	                            <li><a href="onlineacc.aspx">OnLine Accounts</a></li>
	                            <li><a href="websubmissions.aspx"">Web Submissions</a></li>
	                        </ul>
                        </div>
                    </div>
                </td>
            </tr>
              <tr id="trhr" runat="server">
                  <td width="173" valign="top" id="tdhr" runat="server">
                      <div class="glossymenu">
                          <a class="menuitem submenuheader" href="#" >Human Resources</a>
                          <div class="submenu">
                             <ul>
                                <li><a href="EMPMAIN.aspx">Employee</a></li>
                                <li><a href="DependentMain.aspx">Dependents</a></li>
                                <li><a href="SalaryPg.aspx">Salary</a></li>
                                <li><a href="Exppenses.aspx">Expenses</a></li>
                                <li><a href="Timesheet.aspx">Time Sheet</a></li>
                                <li><a href="Insurance.aspx">Insurance</a></li>
                                <li><a href="prosemployee1.aspx">Prospective Employees</a></li>
                                <li><a href="Vacation1.aspx">Vacation</a></li>
                                <li><a href="emptickets1.aspx">Employee Tickets</a></li>
                                <li><a href="emplyaccts1.aspx">Employee Accounts</a></li>
                               </ul>
                          </div>
                       </div>
                   </td>
                </tr>
              <%--<tr>
            <td width="173" valign="top" id="tdim" runat="server">
            <div class="glossymenu">
            <a class="menuitem submenuheader" href="#" >Immigration</a>
            <div class="submenu" >
	            <ul>
            	    
	                <li><a href="LcaInformation1.aspx">LCA</a></li>
	                <li><a href="LcaLocation1.aspx">Location LCA</a></li>
	                <li><a href="Labour1.aspx">Labor</a></li>
	                <li><a href="I1401.aspx">I-140</a></li>
	                <li><a href="I4851.aspx">I-485</a></li>
	                <li><a href="rfe1.aspx">RFE</a></li>
	                <li><a href="rec_effort1.aspx">Recruitment Efforts</a></li>
	            </ul>
            </div>
            </div>
            </td>
            </tr>
            --%>
            <tr>
                <td width="173" valign="top" id="tdsales"  runat="server">
                    <div class="glossymenu">
                        <a class="menuitem submenuheader" href="#">Sales</a>
                            <div class="submenu">
	                            <ul>
	                                <li><a href="RequirementRecords.aspx">Requirements</a></li>
	                                <li><a href="SubmissionRecords.aspx">Submissions</a></li>
	                                <li><a href="ClientRecords.aspx">Client</a></li>
	                                <li><a href="InterviewRecords.aspx">Interviews</a></li>
	                                <li><a href="PlacementRecords.aspx">Placements</a></li>
                                  <%--   <li><a href="RequirementLog.aspx">Requirement Log</a></li>--%>
	                                <%--<li><a href="ClientPO.aspx">Client PO</a></li>
	                                <li><a href="Client_SupportStaff.aspx">Client-Support Staff</a></li>
	                                <li><a href="OtherClient.aspx">Other Clients</a></li>
	                                <li><a href="PlacementMiddleClients.aspx">Placement-Middle Clients </a></li>--%>
	                            </ul>
                            </div>
                    </div>
               </td>
            </tr>
            <tr id="trrecruit" runat="server">
                <td width="173" valign="top" id="tdrec" runat="server">
                    <div class="glossymenu">
                        <a class="menuitem submenuheader" href="#" >Recruiting</a>
                            <div class="submenu">
	                            <ul>
	                                <%--<li><a href="#">Skills</a></li>--%>
	                                <li><a href="profilerecords.aspx">Profiles</a></li>
	                                <%--<li><a href="recruiterprofles.aspx">Recruiting Profiles</a></li>--%>
	                                <li><a href="Rec_SubVendor.aspx">Sub Vendors</a></li>
	                                <li><a href="Rec_SubVendor_Contacts.aspx">Sub Vendor Contacts</a></li>
	                                <li><a href="Rec_SubVendor_Projects.aspx">Sub Vendor Projects</a></li>
	                            </ul>
                            </div>	
                    </div>
                </td>
            </tr>


<%--<tr>
<td width="173" valign="top" id="tdpayroll" runat="server">
            <div class="glossymenu">
            <a class="menuitem submenuheader" href="#" >Payroll</a>
<div class="submenu">
	<ul>
	<li><a href="PM_AddNew1.aspx">Payroll Master</a></li>
	<li><a href="payrollentries1.aspx">Payroll Entries</a></li>
	<li><a href="PM_W41.aspx">Employee W4</a></li>
	
	</ul>
</div>	
            </div>
            </td>
</tr>--%>

<%--<tr>
<td width="173" valign="top" id="tdaccounts" runat="server">
            <div class="glossymenu">
            
            <a class="menuitem submenuheader" href="#" >Accounts</a>
<div class="submenu">
	<ul>
	<li><a href="#" class="menuitem submenuheader">Receivables</a>
 	     <div class="submenu">
	     <ul>
	     <li><a href="Invoices_New.aspx">Invoices Items</a></li>
	     <li><a href="CreditorRecords.aspx">Creditors</a></li>
	     <li><a href="IncomingPaymentrecords.aspx">Incoming Payments</a></li>
	     <li><a href="DepositTicketrecords.aspx">Deposit Tickets</a></li>
	     <li><a href="invoicesrecords.aspx">Invoices</a></li>
	     </ul>
	     </div>
	</li>
	
	<li><a href="#" class="menuitem submenuheader">Banks</a>
	<div class="submenu" >
	     <ul>
	     <li><a href="Bank_Acct1.aspx">Bank Accounts</a></li>
	     <li><a href="Bank_tra1.aspx">Bank Transactions</a></li>
	     </ul>
	     </div>
	</li>
	<li><a href="#" class="menuitem submenuheader">Payables</a>
	<div class="submenu" >
	     <ul>
	     <li><a href="payable1.aspx">Payees</a></li>
	     <li><a href="p_bills1.aspx">Bills</a></li>
	     <li><a href="p_subvendor1.aspx">Sub Vendor Invoices</a></li>
	     <li><a href="p_payments1.aspx">Payments</a></li>
	     </ul>
	     </div>
	</li>
	<li><a href="#" class="menuitem submenuheader">GL</a>
	<div class="submenu">
	     <ul>
	     <li><a href="GeneralAccountrecords.aspx">GL Accounts</a></li>
	     <li><a href="GeneralLedgerRecords.aspx">General Ledger</a></li>
	     <li><a href="AppAccountsrecords.aspx">App Accounts</a></li>
	     <li><a href="AccountTypesrecords.aspx">Account Types</a></li>
	     <li><a href="paymenttermsrecords.aspx">Payment Terms</a></li>
	     
	     </ul>
	     </div>
	</li>
	</ul>
</div>	
            
            </div>
            </td>
</tr>--%>

<%--<tr>
<td width="173" valign="top" id="td2" runat="server">
            <div class="glossymenu">
            <a class="menuitem submenuheader" href="#" >Task Management</a>
<div class="submenu">
	<ul>
	<li><a href="#">Projects</a></li>
	<li><a href="#">Members</a></li>
	<li><a href="#">Tasks</a></li>
	<li><a href="#">Tickets</a></li>

	</ul>
</div>	

            </div>
            </td>
</tr>--%>

            <tr id="trlogins" runat="server">
                <td width="173" valign="top" id="td1" runat="server">
                    <div class="glossymenu">
                        <a class="menuitem submenuheader" href="#" >User Logins</a>
                            <div class="submenu">
	                            <ul>
	                                <li><a href="CreateUser.aspx">Users</a></li>
	                                <%--<li><a href="#">User Login</a></li>--%>
	                            </ul>
                            </div>	
                    </div>
                </td>
            </tr>


<%--<tr>
<td width="173" valign="top" id="td3" runat="server">
            <div class="glossymenu">
            <a class="menuitem submenuheader" href="#" >Tools</a>
<div class="submenu">
	<ul>
	<li><a href="#">Company Settings</a></li>
	<li><a href="#">Application Settings</a></li>
	<li><a href="#">Application Filters</a></li>
	<li><a href="#">Report Builder</a></li>
	<li><a href="#">Flexi Fields</a></li>
	<li><a href="#">Application Rules</a></li>
	<li><a href="#">Document Triggers</a></li>
	<li><a href="#">DSS</a></li>
	<li><a href="#">Email Style Sheets (ESS)</a></li>
	<li><a href="#">Lookups</a></li>
	<li><a href="#">Themes</a></li>
	<li><a href="#">Menus</a></li>
	<li><a href="#">Images</a></li>
	<li><a href="#">Portals</a></li>
	<li><a href="#">Portal Reports</a></li>
	<li><a href="#">Copy Rules</a></li>
	<li><a href="#">Record Actions</a></li>
	<li><a href="#">Job Master</a></li>
	<li><a href="#">Charts</a></li>
	<li><a href="#">Composit Charts</a></li>
	<li><a href="#">Chart Templates</a></li>
	<li><a href="#">Summary Reports</a></li>
	<li><a href="#">Import</a></li>
	<li><a href="#">Application Sequences</a></li>
	<li><a href="#">Company Sequences</a></li>
	<li><a href="#">Online Forms</a></li>
	<li><a href="#">Month Master</a></li>
	
</ul>
</div>	

            </div>
            </td>
</tr>--%>

        </table>
        </td>
      </tr>
    </table>