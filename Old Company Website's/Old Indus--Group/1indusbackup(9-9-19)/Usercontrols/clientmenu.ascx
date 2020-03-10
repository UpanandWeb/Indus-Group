<%@ Control Language="C#" AutoEventWireup="true" CodeFile="clientmenu.ascx.cs" Inherits="Usercontrols_clientmenu" %>
    <%--<div id="smoothmenu1" class="ddsmoothmenu" style="background: #336699;">--%>
    <div id="menu">
    <ul class="menu">
        <li><asp:LinkButton ID="lnkbtnhome" runat="server" onclick="lnkbtnhome_Click" CssClass="parent"><span>Home</span></asp:LinkButton></li>
        <li><a href="#" class="parent"><span>Company</span></a>
            <div>
                <ul id="ulcompany" runat="server">
                    <li><a href="rclocation.aspx"><span>Locations</span></a></li>
                    <li><a href="rcDivision.aspx"><span>Divisions</span></a></li>
                    <li><a href="rcdocument.aspx"><span>Company Documents</span></a></li>
                    <li><a href="rcassestinfo.aspx"><span>Assets/Inventory</span></a></li>
                    <li><a href="rcforms.aspx"><span>Forms/Documents</span></a></li>
                    <li><a href="rccurrency.aspx"><span>Currencies</span></a></li>
                    <li><a href="rccontactinfo.aspx"><span>Contacts</span></a></li>
                    <li><a href="rcshipments.aspx"><span>Shipments</span></a></li>
                    <li><a href="rconlineacc.aspx"><span>OnLine Accounts</span></a></li>
                    <li><a href="rcwebsubmissions.aspx"><span>Web Submissions</span></a></li>
                   
                </ul>
            </div>
        </li>
        <li><a href="#" class="parent"><span>Human Resource</span></a>
            <div>
                <ul id="ulHr" runat="server">
                    <li><a href="rcEMPMAIN.aspx"><span>Employee</span></a></li>
                    <li><a href="rcDependentMain.aspx"><span>Dependents</span></a></li>
                    <li><a href="rcSalaryPg.aspx"><span>Salary</span></a></li>
                    <%--<li><a href="rcExppenses.aspx">Expenses</a></li>--%>
                    <li><a href="rcTimesheetcreate.aspx"><span>Time Sheet</span></a></li>
                    <li><a href="rcInsurance.aspx"><span>Insurance</span></a></li>
                    <li><a href="rcprosemployee1.aspx"><span>Prospective Employees</span></a></li>
                    <li><a href="rcVacation1.aspx"><span>Vacation</span></a></li>
                    <li><a href="rcemptickets1.aspx"><span>Employee Tickets</span></a></li>
                    <li><a href="rcemplyaccts1.aspx"><span>Employee Accounts</span></a></li>
                </ul>
            </div>
        </li>
        <li><a href="#" class="parent"><span>Sales</span></a>
            <div>
                <ul id="ulsales" runat="server">
                    <li><a href="RequirementRecords.aspx"><span>Requirements</span></a></li>
                    <li><a href="SubmissionRecords.aspx" class="parent"><span>Submissions</span></a>
                        <div>
                            <ul id="Ul1" class="" runat="server">
                                <li>
                                    <a href="benchSubmission.aspx"><span>Bench Submissions</span></a>
                                </li>
                            </ul>
                        </div>    
                    </li>
                    <!--<li><a href="benchSubmission.aspx">Bench Submissions</a></li>-->
                    <li><a href="ClientRecords.aspx"><span>Client</span></a></li>
                    <li><a href="InterviewRecords.aspx"><span>Interviews</span></a></li>
                    <li><a href="PlacementRecords.aspx"><span>Placements</span></a></li>
                </ul>
            </div>
        </li>
        <li><a href="#" class="parent"><span>Vendors</span></a>
            <div>
                <ul id="ulrecruiting" runat="server">
                    <li><a href="ProfileRecords.aspx"><span>Profiles</span></a></li>
                    <li><a href="Rec_SubVendor.aspx"><span>Sub Vendors</span></a></li>
                    <li><a href="Rec_SubVendor_Contacts.aspx"><span>Sub Vendor Contacts</span></a></li>
                    <li><a href="Rec_SubVendor_Projects.aspx"><span>Sub Vendor Projects</span></a></li>
                </ul>
            </div>
        </li>
        <li id="liusers" runat="server"><a href="#" class="parent"><span>Users</span></a>
            <div>
                <ul>
                    <li><a href="clientsusers.aspx"><span>Create Users</span></a></li>
					<li><a href="clientuser_list.aspx"><span>Users List</span></a></li>
                </ul>
            </div>
        </li>
        <li><asp:LinkButton ID="lnkbtnlogout" runat="server" onclick="lnkbtnlogout_Click"><span>Logout</span></asp:LinkButton></li>
    </ul>
</div>    
<div id="copyright"><a href="http://apycom.com/"></a></div>