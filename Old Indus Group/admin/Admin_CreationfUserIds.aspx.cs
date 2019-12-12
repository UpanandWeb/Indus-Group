using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Configuration;

public partial class admin_Admin_CreationfUserIds : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    AdminCS obj = new AdminCS();
    DataSet ds=new DataSet();
    DataSet dsgetUserIdData = new DataSet();
    string FName;
    string LName;
    string UserId;
    string Pwd;
    string Desg;
    string Address;
    string PhNo;
    string EmailId;
    string strScript;
    string LoginId;
    string Country;
    string Mobile;
    bool t;
    int Count = 0;
    int prd = 0;
    Int32 Status;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoginId = Convert.ToString(Session["LogInId"]);
        if (LoginId != "")
        {
            // it will stays in the same page
        }

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
      
        VisibilityConditions();

        txtPwd.Attributes.Add("value",txtPwd.Text);
        txtconPwd.Attributes.Add("value", txtconPwd.Text);

        if (!Page.IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            lnkview.Visible = false;
            create.Visible = false;

        //    obj.FillDesignation(ddlUserType);
      //      obj.FillDesignation(ddleddesgn);
            ItemsGet();

            obj.FillUserType(ddlUserType);

            SqlDataAdapter sqlad1 = new SqlDataAdapter("select top 1  empid, * from employeereg1  where empid is not null order by userid desc", con);
            DataSet ds1 = new DataSet();
            sqlad1.Fill(ds1);
            string s = ds1.Tables[0].Rows[0]["empid"].ToString();
            string clean = Regex.Replace(s, "[^0-9 ]", "");
            int s1 = Convert.ToInt16(clean);
            s1 = s1 + 1;
            s = "IGI" + Convert.ToString(s1);
            ssemp.Text = s;
        }
    }    

    protected void chkImmigAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkImmigAll.Checked == true)
        {
            chkbxImmigDel.Checked = true;
            chkbxImmigDown.Checked = true;
            chkbxImmigEdit.Checked = true;
            chkbxImmigPost.Checked = true;
            chkbxImmigview.Checked = true;
        }
        else
        {
            chkbxImmigDel.Checked = false;
            chkbxImmigDown.Checked = false;
            chkbxImmigEdit.Checked = false;
            chkbxImmigPost.Checked = false;
            chkbxImmigview.Checked = false;
        }
    }

    protected void chkAccAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAccAll.Checked == true)
        {
            chkbxAccDel.Checked = true;
            chkbxAccDown.Checked = true;
            chkbxAccEdit.Checked = true;
            chkbxAccPost.Checked = true;
            chkbxAccview.Checked = true;
        }
        else
        {
            chkbxAccDel.Checked = false;
            chkbxAccDown.Checked = false;
            chkbxAccEdit.Checked = false;
            chkbxAccPost.Checked = false;
            chkbxAccview.Checked = false;
        }
    }
    protected void chkHRAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkHRAll.Checked == true)
        {
            chkbxHRDel.Checked = true;
            chkbxHRDown.Checked = true;
            chkbxHREdit.Checked = true;
            chkbxHRPost.Checked = true;
            chkbxHRview.Checked = true;
        }
        else
        {
            chkbxHRDel.Checked = false;
            chkbxHRDown.Checked = false;
            chkbxHREdit.Checked = false;
            chkbxHRPost.Checked = false;
            chkbxHRview.Checked = false;
        }
    }
    protected void chkARPAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkARPAll.Checked == true)
        {
            chkbxARPDel.Checked = true;
            chkbxARPDowm.Checked = true;
            chkbxARPEdit.Checked = true;
            chkbxARPPost.Checked = true;
            chkbxARPview.Checked = true;
        }
        else
        {
            chkbxARPDel.Checked = false;
            chkbxARPDowm.Checked = false;
            chkbxARPEdit.Checked = false;
            chkbxARPPost.Checked = false;
            chkbxARPview.Checked = false;
        }

    }
    protected void chkDRAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkDRAll.Checked == true)
        {
            chkbxDRDel.Checked = true;
            chkbxDRDown.Checked = true;
            chkbxDRPost.Checked = true;
            chkbxDRview.Checked = true;
        }
        else
        {
            chkbxDRDel.Checked = false;
            chkbxDRDown.Checked = false;
            chkbxDRPost.Checked = false;
            chkbxDRview.Checked = false;
        }
    }
    protected void chkLSAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkLSAll.Checked == true)
        {
            chkbxLSDel.Checked = true;
            chkbxLSEdit.Checked = true;
            chkbxLSPost.Checked = true;
            chkbxLSview.Checked = true;
        }
        else
        {
            chkbxLSDel.Checked = false;
            chkbxLSEdit.Checked = false;
            chkbxLSPost.Checked = false;
            chkbxLSview.Checked = false;
        }
    }
    protected void chkExcelAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkExcelAll.Checked == true)
        {
            chkbxExcelDel.Checked = true;
            chkbxExcelDown.Checked = true;
            chkbxExcelEdit.Checked = true;
            chkbxExcelPost.Checked = true;
            chkbxExcelview.Checked = true;
        }
        else
        {
            chkbxExcelDel.Checked = false;
            chkbxExcelDown.Checked = false;
            chkbxExcelEdit.Checked = false;
            chkbxExcelPost.Checked = false;
            chkbxExcelview.Checked = false;
        }
    }

    protected void chkEmpDocAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkEmpDocAll.Checked == true)
        {
            chkbxEDocDown.Checked = true;
            chkbxEDocPost.Checked = true;
            chkbxEDocview.Checked = true;
        }
        else
        {
            chkbxEDocDown.Checked = false;
            chkbxEDocPost.Checked = false;
            chkbxEDocview.Checked = false;
        }
    }

    protected void chkWrdDocAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkWrdDocAll.Checked == true)
        {
            chkbxWDocDel.Checked = true;
            chkbxWDocDown.Checked = true;
            chkbxWDocEdit.Checked = true;
            chkbxWDocPost.Checked = true;
            chkbxWDocview.Checked = true;
        }
        else
        {
            chkbxWDocDel.Checked = false;
            chkbxWDocDown.Checked = false;
            chkbxWDocEdit.Checked = false;
            chkbxWDocPost.Checked = false;
            chkbxWDocview.Checked = false;
        }
    }

    protected void chkRDocAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkRDocAll.Checked == true)
        {
            chkbxRDocDelete.Checked = true;
            chkbxRDocDownload.Checked = true;
            chkbxRDocEdit.Checked = true;
            chkbxRDocPost.Checked = true;
            chkbxRDocPreview.Checked = true;
        }
        else
        {
            chkbxRDocDelete.Checked = false;
            chkbxRDocDownload.Checked = false;
            chkbxRDocEdit.Checked = false;
            chkbxRDocPost.Checked = false;
            chkbxRDocPreview.Checked = false;
        }
    }

    protected void txtUserId_TextChanged(object sender, EventArgs e)
    {
        ds = obj.GetAvailabilityofUserId(txtUserId.Text);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            lblStatus.Text = "User  Already Exist";     
        }
        else
        {           
            lblStatus.Text = "User  Available";   
        }
    }

    public void VisibilityConditions()
    {
        if (rbAccYes.Checked == true)
        {
            trAcc.Visible = true;
            chkbxAccview.Checked = true;
            chkbxAccview.Enabled = false;
        }
        else if (rbAccNo.Checked == true)
        {
            trAcc.Visible = false;            
            chkbxAccview.Enabled = false;
            chkbxAccview.Checked = false;
            chkbxAccDel.Checked = false;
            chkbxAccDown.Checked = false;
            chkbxAccEdit.Checked = false;
            chkbxAccPost.Checked = false;
            chkAccAll.Checked = false;
        }
        if (rbARPYes.Checked == true)
        {
            trARP.Visible = true;
            chkbxARPview.Checked = true;
            chkbxARPview.Enabled = false;
        }
        else if (rbARPNo.Checked == true)
        {
            trARP.Visible = false;            
            chkbxARPview.Enabled = false;
            chkbxARPview.Checked = false;
            chkbxARPDel.Checked = false;
            chkbxARPDowm.Checked = false;
            chkbxARPEdit.Checked = false;
            chkbxARPPost.Checked = false;
            chkARPAll.Checked = false;
        }
        if (rbDRYes.Checked == true)
        {
            trDR.Visible = true;
            chkbxDRview.Checked = true;
            chkbxDRview.Enabled = false;
        }
        else if (rbDRNo.Checked == true)
        {
            trDR.Visible = false;            
            chkbxDRview.Enabled = false;
            chkbxDRview.Checked = false;
            chkbxDRDel.Checked = false;
            chkbxDRDown.Checked = false;
            chkbxDRPost.Checked = false;
            chkDRAll.Checked = false;
        }
        if (rbExcelYes.Checked == true)
        {
            trExcel.Visible = true;
            chkbxExcelview.Checked = true;
            chkbxExcelview.Enabled = false;
        }
        else if (rbExcelNo.Checked==true)
        {
            trExcel.Visible = false;            
            chkbxExcelview.Enabled = false;
            chkbxExcelview.Checked = false;
            chkbxExcelDel.Checked = false;
            chkbxExcelDown.Checked = false;
            chkbxExcelEdit.Checked = false;
            chkbxExcelPost.Checked = false;
            chkExcelAll.Checked = false;
        }
        if (rbHRYes.Checked==true)
        {
            trHR.Visible = true;
            chkbxHRview.Checked = true;
            chkbxHRview.Enabled = false;
        }
        else if (rbHRNo.Checked == true)
        {
            trHR.Visible = false;
            chkbxHRview.Enabled=false;
            chkbxHRview.Checked=false;
            chkbxHRDel.Checked=false;
            chkbxHRDown.Checked=false;
            chkbxHREdit.Checked=false;
            chkbxHRPost.Checked = false;
            chkHRAll.Checked = false;
        }
        if (rbImmigYes.Checked == true)
        {
            trImmig.Visible = true;
            chkbxImmigview.Checked = true;
            chkbxImmigview.Enabled = false;
        }
        else if (rbImmigNo.Checked == true)
        {
            trImmig.Visible = false;
            chkbxImmigview.Enabled = false;
            chkbxImmigview.Checked = false;
            chkbxImmigDel.Checked = false;
            chkbxImmigDown.Checked = false;
            chkbxImmigEdit.Checked = false;
            chkbxImmigPost.Checked = false;
            chkImmigAll.Checked = false;
        }
        if (rbLSYes.Checked == true)
        {
            trLS.Visible = true;
            chkbxLSview.Checked = true;
            chkbxLSview.Enabled = false;
        }
        else if (rbLSNo.Checked == true)
        {
            trLS.Visible = false;
            chkbxLSview.Enabled = false;
            chkbxLSview.Checked = false;
            chkbxLSDel.Checked = false;
            chkbxLSEdit.Checked = false;
            chkbxLSPost.Checked = false;
            chkLSAll.Checked = false;
        }
        if (rbEmpDocYes.Checked == true)
        {
            trEmpDoc.Visible = true;
            chkbxEDocview.Checked = true;
            chkbxEDocview.Enabled = false;
        }
        else if (rbEmpDocNo.Checked == true)
        {
            trEmpDoc.Visible = false;
            chkbxEDocview.Enabled = false;
            chkbxEDocview.Checked = false;
            chkbxEDocPost.Checked = false;
            chkbxEDocDown.Checked = false;
            //chkbxEDocDel.Checked = false;
            //chkbxEDocEdit.Checked = false;
        }
        if (rbWrdDocYes.Checked == true)
        {
            trWrdDoc.Visible = true;
            chkbxWDocview.Checked = true;
            chkbxWDocview.Enabled = false;
        }
        else if (rbWrdDocNo.Checked == true)
        {
            trWrdDoc.Visible = false;
            chkbxWDocview.Enabled = false;
            chkbxWDocview.Checked = false;
            chkbxWDocDel.Checked = false;
            chkbxWDocDown.Checked = false;
            chkbxWDocEdit.Checked = false;
            chkbxWDocPost.Checked = false;
            chkWrdDocAll.Checked = false;
        }
        if (rbResumeYes.Checked == true)
        {
            trRDoc.Visible = true;
            chkbxRDocPreview.Checked = true;
            chkbxRDocPreview.Enabled = false;
        }
        else if (rbResumeNo.Checked == true)
        {
            trRDoc.Visible = false;
            chkbxRDocPreview.Enabled = false;
            chkbxRDocPreview.Checked = false;
            chkbxRDocDelete.Checked = false;
            chkbxRDocDownload.Checked = false;
            chkbxRDocEdit.Checked = false;
            chkbxRDocPost.Checked = false;
            chkRDocAll.Checked = false;
        }

        if (rdempyes.Checked == true)
        {
            tr1.Visible = true;
        }
        else if (rdempyes.Checked == false)
        {
            tr1.Visible = false;
        
        }
        if (rdh1byes.Checked == true)
        {
            tr14.Visible = true;
        }
        else if (rdh1byes.Checked == false)
        {
            tr14.Visible = false;

        }
        if (Careersyes.Checked == true)
        {
            tr21.Visible = true;
        }
        else if (Careersyes.Checked == false)
        {
            tr21.Visible = false;
        }

        if (TimeSheetyes.Checked == true)
        {
            tr28.Visible = true;
        }
        else if (TimeSheetyes.Checked == false)
        {
            tr28.Visible = false;

        }
        if (Documentsyes.Checked == true)
        {
            tr35.Visible = true;
        }
        else if (Documentsyes.Checked == false)
        {
            tr35.Visible = false;

        }

        if (Seminarsyes.Checked == true)
        {
            tr42.Visible = true;
        }
        else if (Seminarsyes.Checked == false)
        {
            tr42.Visible = false;
        }
        if (Feedbackyes.Checked == true)
        {
            tr49.Visible = true;
        }
        else if (Feedbackyes.Checked == false)
        {
            tr49.Visible = false;
        }
        if (Performanceyes.Checked == true)
        {
            tr56.Visible = true;
        }
        else if (Performanceyes.Checked == false)
        {
            tr56.Visible = false;
        }
        if (Rolesyes.Checked == true)
        {
            tr63.Visible = true;
        }
        else if (Rolesyes.Checked == false)
        {
            tr63.Visible = false;
        }
        if (Companyyes.Checked == true)
        {
            tr70.Visible = true;
        }
        else if (Companyyes.Checked == false)
        {
            tr70.Visible = false;

        }
        if (Projectsyes.Checked == true)
        {
            tr77.Visible = true;
        }
        else if (Projectsyes.Checked == false)
        {
            tr77.Visible = false;
        }
        if (Departmentsyes.Checked == true)
        {
            tr84.Visible = true;
        }
        else if (Departmentsyes.Checked == false)
        {
            tr84.Visible = false;
        }
        if (Clientyes.Checked == true)
        {
            tr91.Visible = true;
        }
        else if (Clientyes.Checked == false)
        {
            tr91.Visible = false;
        }
        if (Vendoryes.Checked == true)
        {
            tr98.Visible = true;
        }
        else if (Vendoryes.Checked == false)
        {
            tr98.Visible = false;
        }
        if (Appointmentsyes.Checked == true)
        {
            tr105.Visible = true;
        }
        else if (Appointmentsyes.Checked == false)
        {
            tr105.Visible = false;
        }
        if (Pay_Rollyes.Checked == true)
        {
            tr112.Visible = true;
        }
        else if (Pay_Rollyes.Checked == false)
        {
            tr112.Visible = false;
        }
        if (News_Eventsyes.Checked == true)
        {
            tr119.Visible = true;
        }
        else if (News_Eventsyes.Checked == false)
        {
            tr119.Visible = false;
        }
        if (Usersyes.Checked == true)
        {
            tr13.Visible = true;
        }
        else if (Usersyes.Checked == false)
        {
            tr13.Visible = false;
        }

        if (Emp_Contactsyes.Checked == true)
        {
            tr39.Visible = true;
        }
        else if (Emp_Contactsyes.Checked == false)
        {
            tr39.Visible = false;
        }
        if (Supportyes.Checked == true)
        {
            tr60.Visible = true;
        }
        else if (Supportyes.Checked == false)
        {
            tr60.Visible = false;
        }
        if (Profileyes.Checked == true)
        {
            tr126.Visible = true;
        }
        else if (Profileyes.Checked == false)
        {
            tr126.Visible = false;
        }
        if (rddailyy.Checked == true)  // added on 13-08-2018  by  Y Veeranjaneyulu
        {
            tr58.Visible = true;
        }
        else if (rddailyy.Checked == false)
        {
            tr58.Visible = false;
        }
        if (rdInvoicingy.Checked == true)
        {
            tr110.Visible = true;
        }
        else if (rdInvoicingy.Checked == false)
        {
            tr110.Visible = false;
        }
        if (rdpriny.Checked == true)
        {
            tr132.Visible = true;
        }
        else if (rdpriny.Checked == false)
        {
            tr132.Visible = false;
        }
        if (rdcalendery.Checked == true)
        {
            tr136.Visible = true;
        }
        else if (rdcalendery.Checked == false)
        {
            tr136.Visible = false;
        }
        if (rdreportsy.Checked == true)
        {
            tr143.Visible = true;
        }
        else if (rdreportsy.Checked == false)
        {
            tr143.Visible = false;
        }
        if (rdSalaryy.Checked == true)
        {
            tr149.Visible = true;
        }
        else if (rdSalaryy.Checked == false)
        {
            tr149.Visible = false;
        }
        if (rdcurrenty.Checked == true)
        {
            tr153.Visible = true;
        }
        else if (rdcurrenty.Checked == false)
        {
            tr153.Visible = false;
        }
        if (rdChecklistyes.Checked == true)
        {
            tr142.Visible = true;
        }
        else if (rdChecklistyes.Checked == false)
        {
            tr142.Visible = false;
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (Session["LoginId"] != null)
        {
            if (menu.Visible == true)
            {
                if (lblStatus.Text == "User Available")
                {
                    List<string> menulist = new List<string>();

                    if (rdempyes.Checked == true)
                    {
                        if ((CheckBox2.Checked == true) || (CheckBox3.Checked == true) || (CheckBox4.Checked == true) || (CheckBox5.Checked == true))
                        {
                            string employee = "Employee List";
                            menulist.Add(employee);
                        }
                    }
                    if (rdh1byes.Checked == true)
                    {
                        if ((CheckBox8.Checked == true) || (CheckBox10.Checked == true) || (CheckBox11.Checked == true))
                        {
                            string h1b = "H1B List";
                            menulist.Add(h1b);
                        }
                    }
                    if (Profileyes.Checked == true)
                    {
                        if ((CheckBox60.Checked == true) || (CheckBox66.Checked == true) || (CheckBox103.Checked == true) || (CheckBox104.Checked == true))
                        {
                            string profile = "Profile";
                            menulist.Add(profile);
                        }
                    }
                    if (Careersyes.Checked == true)
                    {
                        if ((CheckBox14.Checked == true) || (CheckBox15.Checked == true) || (CheckBox16.Checked == true) || (CheckBox17.Checked == true))
                        {
                            string career = "Careers";
                            menulist.Add(career);
                        }
                    }
                    if (TimeSheetyes.Checked == true)
                    {
                        if ((CheckBox20.Checked == true) || (CheckBox21.Checked == true))
                        {
                            string time = "Monthly Timesheet";
                            menulist.Add(time);
                        }
                    }

                    if (Documentsyes.Checked == true)
                    {
                        if ((CheckBox26.Checked == true) || (CheckBox27.Checked == true) || (CheckBox29.Checked == true) || (CheckBox30.Checked == true))
                        {
                            string document = "Documents";
                            menulist.Add(document);
                        }
                    }
                    if (Seminarsyes.Checked == true)
                    {
                        if ((CheckBox32.Checked == true) || (CheckBox33.Checked == true) || (CheckBox34.Checked == true) || (CheckBox35.Checked == true))
                        {
                            string seminar = "Seminars";
                            menulist.Add(seminar);
                        }
                    }
                    if (Feedbackyes.Checked == true)
                    {
                        if ((CheckBox38.Checked == true) || (CheckBox41.Checked == true))
                        {
                            string feed = "Feedback";
                            menulist.Add(feed);
                        }
                    }
                    if (Performanceyes.Checked == true)
                    {
                        if ((CheckBox45.Checked == true))
                        {
                            string performance = "Performance";
                            menulist.Add(performance);
                        }
                    }
                    if (Rolesyes.Checked == true)
                    {
                        if ((CheckBox50.Checked == true) || (CheckBox51.Checked == true) || (CheckBox53.Checked == true))
                        {
                            string role = "Roles";
                            menulist.Add(role);
                        }
                    }
                    if (Companyyes.Checked == true)
                    {
                        if ((CheckBox56.Checked == true) || (CheckBox57.Checked == true) || (CheckBox58.Checked == true) || (CheckBox59.Checked == true))
                        {
                            string company = "Company";
                            menulist.Add(company);
                        }
                    }
                    if (Projectsyes.Checked == true)
                    {
                        if ((CheckBox62.Checked == true) || (CheckBox63.Checked == true) || (CheckBox64.Checked == true) || (CheckBox65.Checked == true))
                        {
                            string Project = "Projects";
                            menulist.Add(Project);
                        }
                    }
                    if (Departmentsyes.Checked == true)
                    {
                        if ((CheckBox68.Checked == true) || (CheckBox69.Checked == true) || (CheckBox70.Checked == true) || (CheckBox71.Checked == true))
                        {
                            string Departments = "Departments";
                            menulist.Add(Departments);
                        }
                    }
                    if (Clientyes.Checked == true)
                    {
                        if ((CheckBox74.Checked == true) || (CheckBox75.Checked == true) || (CheckBox76.Checked == true) || (CheckBox77.Checked == true))
                        {
                            string client = "Client";
                            menulist.Add(client);
                        }
                    }
                    if (Vendoryes.Checked == true)
                    {
                        if ((CheckBox80.Checked == true) || (CheckBox81.Checked == true) || (CheckBox82.Checked == true) || (CheckBox72.Checked == true) || (CheckBox83.Checked == true))
                        {
                            string vendor = "Vendor";
                            menulist.Add(vendor);
                        }
                    }
                    if (Appointmentsyes.Checked == true)
                    {
                        if ((CheckBox86.Checked == true) || (CheckBox87.Checked == true))
                        {
                            string Appointments = "Appointments";
                            menulist.Add(Appointments);
                        }
                    }
                    if (Pay_Rollyes.Checked == true)
                    {
                        if ((CheckBox92.Checked == true) || (CheckBox93.Checked == true))
                        {
                            string pay = "Pay Roll";
                            menulist.Add(pay);
                        }
                    }
                    if (News_Eventsyes.Checked == true)
                    {
                        if ((CheckBox98.Checked == true) || (CheckBox99.Checked == true) || (CheckBox100.Checked == true) || (CheckBox101.Checked == true))
                        {
                            string news = "News & Events";
                            menulist.Add(news);
                        }
                    }
                    if (Usersyes.Checked == true)
                    {
                        if ((CheckBox9.Checked == true) || (CheckBox12.Checked == true) || (CheckBox18.Checked == true) || (CheckBox22.Checked == true) || (CheckBox23.Checked == true))
                        {
                            string users = "Users";
                            menulist.Add(users);
                        }
                    }
                    if (Emp_Contactsyes.Checked == true)
                    {
                        if ((CheckBox28.Checked == true) || (CheckBox36.Checked == true) || (CheckBox39.Checked == true) || (CheckBox40.Checked == true))
                        {
                            string emp = "Emp Contacts";
                            menulist.Add(emp);
                        }
                    }
                    if (Supportyes.Checked == true)
                    {
                        if ((CheckBox48.Checked == true) || (CheckBox52.Checked == true))
                        {
                            string support = "Support";
                            menulist.Add(support);
                        }
                    }

                    // added  on 13-08-2018 by y.veeranjaneyulu

                    if (rddailyy.Checked == true)
                    {
                        if ( (CheckBox44.Checked == true) || (CheckBox47.Checked == true) || (CheckBox78.Checked == true))
                        {
                            string support = "Daily Timesheet";
                            menulist.Add(support);
                        }
                    }

                    if (rdInvoicingy.Checked == true)
                    {
                        if ( (CheckBox89.Checked == true) || (CheckBox90.Checked == true) || (CheckBox94.Checked == true) ||(CheckBox95.Checked==true))
                        {
                            string support = "Invoicing";
                            menulist.Add(support);
                        }
                    }

                    if (rdpriny.Checked == true)
                    {
                        if ( (CheckBox102.Checked == true) || (CheckBox46.Checked == true) || (CheckBox105.Checked == true) )
                        {
                            string support = "Principles";
                            menulist.Add(support);
                        }
                    }

                    if (rdcalendery.Checked == true)
                    {
                        if ( (CheckBox107.Checked == true) || (CheckBox108.Checked == true) || (CheckBox109.Checked == true) || (CheckBox110.Checked == true))
                        {
                            string support = "Calendar";
                            menulist.Add(support);
                        }
                    }

                    if (rdreportsy.Checked == true)
                    {
                        if ( (CheckBox113.Checked == true) || (CheckBox114.Checked == true) || (CheckBox115.Checked == true) || (CheckBox116.Checked == true))
                        {
                            string support = "Reports";
                            menulist.Add(support);
                        }
                    }
                    if (rdSalaryy.Checked == true)
                    {
                        if ( (CheckBox118.Checked == true) || (CheckBox119.Checked == true) || (CheckBox84.Checked == true) )
                        {
                            string support = "Salary Stmt";
                            menulist.Add(support);
                        }
                    }
                    if (rdcurrenty.Checked == true)
                    {
                        if ( (CheckBox121.Checked == true) || (CheckBox122.Checked == true) || (CheckBox123.Checked == true) || (CheckBox124.Checked == true))
                        {
                            string support = "Current Resumes";
                            menulist.Add(support);
                        }
                    }

                    if (rdChecklistyes.Checked == true)
                    {
                        if ( (CheckBox125.Checked == true) || (CheckBox126.Checked == true) || (CheckBox127.Checked == true) || (CheckBox128.Checked == true))
                        {
                            string support = "H1B Checklist";
                            menulist.Add(support);
                        }
                    }

                   

                    string s = "select top 1 * from Users_Information order by uid desc";
                    SqlDataAdapter da = new SqlDataAdapter(s, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string uid = ds.Tables[0].Rows[0]["uid"].ToString();
                        string country = ds.Tables[0].Rows[0]["country"].ToString();
                        string role = ds.Tables[0].Rows[0]["Designation"].ToString();
                        string name = ds.Tables[0].Rows[0]["fname"].ToString();
                        string userid = ds.Tables[0].Rows[0]["userid"].ToString();
                        string email = ds.Tables[0].Rows[0]["emailid"].ToString();
                        string mobile = ds.Tables[0].Rows[0]["phno"].ToString();
                        string pwd = ds.Tables[0].Rows[0]["password"].ToString();

                          string chechitemaa = "";
                        for (int i = 0; i < menulist.Count; i++)
                        {
                            string chechitem = Convert.ToString(menulist[i]);

                            con.Open();
                            string s1 = "insert into indus_Roles (country, role,name,item,mid) values('" + country + "','" + role + "','" + name + "','" + chechitem + "','" + uid + "') ";
                            SqlCommand cmd = new SqlCommand(s1, con);
                            int i1 = cmd.ExecuteNonQuery();
                            con.Close();
                            chechitemaa += chechitem + ",";
                        }
                        if (chechitemaa != "")
                        {
                            chechitemaa = chechitemaa.Remove(chechitemaa.Length - 1);

                            if (menulist.Count > 0)
                            {
                                string emppreview;
                                string emppost;
                                string empedit;
                                string empdelete;

                                string h1bpreview;
                                string h1bedit;
                                string h1delete;

                                if (CheckBox2.Checked == true) { emppreview = "1"; } else { emppreview = "0"; }
                                if (CheckBox3.Checked == true) { emppost = "1"; } else { emppost = "0"; }
                                if (CheckBox4.Checked == true) { empedit = "1"; } else { empedit = "0"; }
                                if (CheckBox5.Checked == true) { empdelete = "1"; } else { empdelete = "0"; }

                                if (CheckBox8.Checked == true) { h1bpreview = "1"; } else { h1bpreview = "0"; }
                                if (CheckBox10.Checked == true) { h1bedit = "1"; } else { h1bedit = "0"; }
                                if (CheckBox11.Checked == true) { h1delete = "1"; } else { h1delete = "0"; }

                                string profileview;
                                string profilepost;
                                string profileedit;
                                string profiledelete;

                                string careersview;
                                string careerspost;
                                string careersedit;
                                string careersdelete;

                                if (CheckBox60.Checked == true) { profileview = "1"; } else { profileview = "0"; }
                                if (CheckBox66.Checked == true) { profilepost = "1"; } else { profilepost = "0"; }
                                if (CheckBox103.Checked == true) { profileedit = "1"; } else { profileedit = "0"; }
                                if (CheckBox104.Checked == true) { profiledelete = "1"; } else { profiledelete = "0"; }

                                if (CheckBox14.Checked == true) { careersview = "1"; } else { careersview = "0"; }
                                if (CheckBox15.Checked == true) { careerspost = "1"; } else { careerspost = "0"; }
                                if (CheckBox16.Checked == true) { careersedit = "1"; } else { careersedit = "0"; }
                                if (CheckBox17.Checked == true) { careersdelete = "1"; } else { careersdelete = "0"; }

                                string timeview;
                                string timepost;

                                string documentsview;
                                string documentspost;
                                string documentselete;
                                string documentsdownload;

                                if (CheckBox20.Checked == true) { timeview = "1"; } else { timeview = "0"; }
                                if (CheckBox21.Checked == true) { timepost = "1"; } else { timepost = "0"; }

                                if (CheckBox26.Checked == true) { documentsview = "1"; } else { documentsview = "0"; }
                                if (CheckBox27.Checked == true) { documentspost = "1"; } else { documentspost = "0"; }
                                if (CheckBox29.Checked == true) { documentselete = "1"; } else { documentselete = "0"; }
                                if (CheckBox30.Checked == true) { documentsdownload = "1"; } else { documentsdownload = "0"; }

                                string seminarsview;
                                string seminarspost;
                                string seminarsedit;
                                string seminarsdelete;

                                string feedbackview;
                                string feedbackdelete;

                                string performancepost;

                                if (CheckBox32.Checked == true) { seminarsview = "1"; } else { seminarsview = "0"; }
                                if (CheckBox33.Checked == true) { seminarspost = "1"; } else { seminarspost = "0"; }
                                if (CheckBox34.Checked == true) { seminarsedit = "1"; } else { seminarsedit = "0"; }
                                if (CheckBox35.Checked == true) { seminarsdelete = "1"; } else { seminarsdelete = "0"; }

                                if (CheckBox38.Checked == true) { feedbackview = "1"; } else { feedbackview = "0"; }
                                if (CheckBox41.Checked == true) { feedbackdelete = "1"; } else { feedbackdelete = "0"; }

                                if (CheckBox45.Checked == true) { performancepost = "1"; } else { performancepost = "0"; }

                                string rolesview;
                                string rolespost;
                                string rolesdelete;

                                string companyview;
                                string companypost;
                                string companyedit;
                                string companydelete;

                                if (CheckBox50.Checked == true) { rolesview = "1"; } else { rolesview = "0"; }
                                if (CheckBox51.Checked == true) { rolespost = "1"; } else { rolespost = "0"; }
                                if (CheckBox53.Checked == true) { rolesdelete = "1"; } else { rolesdelete = "0"; }

                                if (CheckBox56.Checked == true) { companyview = "1"; } else { companyview = "0"; }
                                if (CheckBox57.Checked == true) { companypost = "1"; } else { companypost = "0"; }
                                if (CheckBox58.Checked == true) { companyedit = "1"; } else { companyedit = "0"; }
                                if (CheckBox59.Checked == true) { companydelete = "1"; } else { companydelete = "0"; }

                                string projectsview;
                                string projectspost;
                                string projectsedit;
                                string projectsdelete;

                                string departmentview;
                                string departmentpost;
                                string departmentedit;
                                string departmentdelete;

                                if (CheckBox62.Checked == true) { projectsview = "1"; } else { projectsview = "0"; }
                                if (CheckBox63.Checked == true) { projectspost = "1"; } else { projectspost = "0"; }
                                if (CheckBox64.Checked == true) { projectsedit = "1"; } else { projectsedit = "0"; }
                                if (CheckBox65.Checked == true) { projectsdelete = "1"; } else { projectsdelete = "0"; }

                                if (CheckBox68.Checked == true) { departmentview = "1"; } else { departmentview = "0"; }
                                if (CheckBox69.Checked == true) { departmentpost = "1"; } else { departmentpost = "0"; }
                                if (CheckBox70.Checked == true) { departmentedit = "1"; } else { departmentedit = "0"; }
                                if (CheckBox71.Checked == true) { departmentdelete = "1"; } else { departmentdelete = "0"; }

                                string clientview;
                                string clientpost;
                                string clientedit;
                                string clientdelete;

                                string vendorview;
                                string vendorpost;
                                string vendoredit;
                                string vendorstatus;
                                string vendordelete;

                                if (CheckBox74.Checked == true) { clientview = "1"; } else { clientview = "0"; }
                                if (CheckBox75.Checked == true) { clientpost = "1"; } else { clientpost = "0"; }
                                if (CheckBox76.Checked == true) { clientedit = "1"; } else { clientedit = "0"; }
                                if (CheckBox77.Checked == true) { clientdelete = "1"; } else { clientdelete = "0"; }

                                if (CheckBox80.Checked == true) { vendorview = "1"; } else { vendorview = "0"; }
                                if (CheckBox81.Checked == true) { vendorpost = "1"; } else { vendorpost = "0"; }
                                if (CheckBox82.Checked == true) { vendoredit = "1"; } else { vendoredit = "0"; }
                                if (CheckBox72.Checked == true) { vendorstatus = "1"; } else { vendorstatus = "0"; }
                                if (CheckBox83.Checked == true) { vendordelete = "1"; } else { vendordelete = "0"; }

                                string appointmentview;
                                string appointmentpost;

                                string payview;
                                string paypost;

                                string newsview;
                                string newspost;
                                string newsedit;
                                string newsdelete;

                                if (CheckBox86.Checked == true) { appointmentview = "1"; } else { appointmentview = "0"; }
                                if (CheckBox87.Checked == true) { appointmentpost = "1"; } else { appointmentpost = "0"; }

                                if (CheckBox92.Checked == true) { payview = "1"; } else { payview = "0"; }
                                if (CheckBox93.Checked == true) { paypost = "1"; } else { paypost = "0"; }

                                if (CheckBox98.Checked == true) { newsview = "1"; } else { newsview = "0"; }
                                if (CheckBox99.Checked == true) { newspost = "1"; } else { newspost = "0"; }
                                if (CheckBox100.Checked == true) { newsedit = "1"; } else { newsedit = "0"; }
                                if (CheckBox101.Checked == true) { newsdelete = "1"; } else { newsdelete = "0"; }

                                string usersview;
                                string userspost;
                                string usersedit;
                                string usersdelete;
                                string usersstatus;

                                string empconview;
                                string empconpost;
                                string empconedit;
                                string empcondelete;

                                string supportdelete;
                                string supportdownload;

                                if (CheckBox9.Checked == true) { usersview = "1"; } else { usersview = "0"; }
                                if (CheckBox12.Checked == true) { userspost = "1"; } else { userspost = "0"; }
                                if (CheckBox18.Checked == true) { usersedit = "1"; } else { usersedit = "0"; }
                                if (CheckBox22.Checked == true) { usersdelete = "1"; } else { usersdelete = "0"; }
                                if (CheckBox23.Checked == true) { usersstatus = "1"; } else { usersstatus = "0"; }

                                if (CheckBox28.Checked == true) { empconview = "1"; } else { empconview = "0"; }
                                if (CheckBox36.Checked == true) { empconpost = "1"; } else { empconpost = "0"; }
                                if (CheckBox39.Checked == true) { empconedit = "1"; } else { empconedit = "0"; }
                                if (CheckBox40.Checked == true) { empcondelete = "1"; } else { empcondelete = "0"; }

                                if (CheckBox48.Checked == true) { supportdelete = "1"; } else { supportdelete = "0"; }
                                if (CheckBox52.Checked == true) { supportdownload = "1"; } else { supportdownload = "0"; }

                                // Added on 13-8-2018 by Y veeranjaneyulu


                                string dailyview;
                                string Dailyedit;
                                string Dailydelete;
                                if (CheckBox44.Checked == true) { dailyview = "1"; } else { dailyview = "0"; }
                                if (CheckBox47.Checked == true) { Dailyedit = "1"; } else { Dailyedit = "0"; }
                                if (CheckBox78.Checked == true) { Dailydelete = "1"; } else { Dailydelete = "0"; }
                                string Invoicingview;
                                string Invoicingpost;
                                string Invoicingedit;
                                string Invoicingdelete;
                                if (CheckBox89.Checked == true) { Invoicingview = "1"; } else { Invoicingview = "0"; }
                                if (CheckBox90.Checked == true) { Invoicingpost = "1"; } else { Invoicingpost = "0"; }
                                if (CheckBox94.Checked == true) { Invoicingedit = "1"; } else { Invoicingedit = "0"; }
                                if (CheckBox95.Checked == true) { Invoicingdelete = "1"; } else { Invoicingdelete = "0"; }
                                string Principlesview;
                                string Principlesedit;
                                string Principlesdelete;
                                if (CheckBox89.Checked == true) { Principlesview = "1"; } else { Principlesview = "0"; }
                                if (CheckBox90.Checked == true) { Principlesedit = "1"; } else { Principlesedit = "0"; }
                                if (CheckBox94.Checked == true) { Principlesdelete = "1"; } else { Principlesdelete = "0"; }
                                string Calenderview;
                                string Calenderpost;
                                string Calenderedit;
                                string Calenderdelete;
                                if (CheckBox107.Checked == true) { Calenderview = "1"; } else { Calenderview = "0"; }
                                if (CheckBox108.Checked == true) { Calenderpost = "1"; } else { Calenderpost = "0"; }
                                if (CheckBox109.Checked == true) { Calenderedit = "1"; } else { Calenderedit = "0"; }
                                if (CheckBox110.Checked == true) { Calenderdelete = "1"; } else { Calenderdelete = "0"; }
                                string Reportsview;
                                string Reportsedit;
                                string Reportsdelete;
                                string Reportsdownload;
                                if (CheckBox113.Checked == true) { Reportsview = "1"; } else { Reportsview = "0"; }
                                if (CheckBox114.Checked == true) { Reportsedit = "1"; } else { Reportsedit = "0"; }
                                if (CheckBox115.Checked == true) { Reportsdelete = "1"; } else { Reportsdelete = "0"; }
                                if (CheckBox116.Checked == true) { Reportsdownload = "1"; } else { Reportsdownload = "0"; }
                                string Salaryview;
                                string Salaryedit;
                                string Salarydelete;
                                if (CheckBox118.Checked == true) { Salaryview = "1"; } else { Salaryview = "0"; }
                                if (CheckBox119.Checked == true) { Salaryedit = "1"; } else { Salaryedit = "0"; }
                                if (CheckBox84.Checked == true) { Salarydelete = "1"; } else { Salarydelete = "0"; }
                                string Currentview;
                                string Currentpost;
                                string Currentedit;
                                string Currentdelete;

                                if (CheckBox121.Checked == true) { Currentview = "1"; } else { Currentview = "0"; }
                                if (CheckBox122.Checked == true) { Currentpost = "1"; } else { Currentpost = "0"; }
                                if (CheckBox123.Checked == true) { Currentedit = "1"; } else { Currentedit = "0"; }
                                if (CheckBox124.Checked == true) { Currentdelete = "1"; } else { Currentdelete = "0"; }

                                string checklistview;
                                string checklistpost;
                                string checklistedit;
                                string checklistdelete;

                                if (CheckBox125.Checked == true) { checklistview = "1"; } else { checklistview = "0"; }
                                if (CheckBox126.Checked == true) { checklistpost = "1"; } else { checklistpost = "0"; }
                                if (CheckBox127.Checked == true) { checklistedit = "1"; } else { checklistedit = "0"; }
                                if (CheckBox128.Checked == true) { checklistdelete = "1"; } else { checklistdelete = "0"; }


                                string qry = "insert into user_menu(country,role,name,mid,empview,emppost,empedit,empdelete,h1bview,h1bedit,h1bdelete,profileview,";
                                qry += "profilepost,profileedit,profiledelete,careersview,careerspost,careersedit,careersdelete,timeview,timepost,documentsview,documentspost,";
                                qry += "documentselete,documentsdownload,seminarsview,seminarspost,seminarsedit,seminarsdelete,feedbackview,feedbackdelete,performancepost,";
                                qry += "rolesview,rolespost,rolesdelete,companyview,companypost,companyedit,companydelete,projectsview,projectspost,projectsedit,";
                                qry += "projectsdelete,departmentview,departmentpost,departmentedit,departmentdelete,clientview,clientpost,clientedit,clientdelete,vendorview,";
                                qry += "vendorpost,vendoredit,vendorstatus,vendordelete,appointmentview,appointmentpost,payview,paypost,newsview,newspost,newsedit,newsdelete,";
                                qry += "usersview,userspost,usersedit,usersdelete,usersstatus,empconview,empconpost,empconedit,empcondelete,supportdelete,supportdownload,";
                                qry += "dailyview,Dailyedit,Dailydelete,Invoicingview,Invoicingpost,Invoicingedit,Invoicingdelete,Principlesview,Principlesedit,Principlesdelete,";
                                qry += "Calenderview,Calenderpost,Calenderedit,Calenderdelete,Reportsview,Reportsedit,Reportsdelete,Reportsdownload,Salaryview,Salaryedit,Salarydelete,";
                                qry += "Currentview,Currentpost,Currentedit,Currentdelete,checklistview,checklistpost,checklistedit,checklistdelete)values";

                                qry += "('" + country + "','" + role + "','" + name + "','" + uid + "','" + emppreview + "','" + emppost + "','" + empedit + "','" + empdelete
                                    + "','" + h1bpreview + "','" + h1bedit + "','" + h1delete + "','" + profileview + "','" + profilepost + "','" + profileedit + "','" + profiledelete
                                    + "','" + careersview + "','" + careerspost + "','" + careersedit + "','" + careersdelete + "','" + timeview + "','" + timepost + "','" + documentsview + "','" + documentspost
                                    + "','" + documentselete + "','" + documentsdownload + "','" + seminarsview + "','" + seminarspost + "','" + seminarsedit + "','" + seminarsdelete + "','" + feedbackview
                                    + "','" + feedbackdelete + "','" + performancepost + "','" + rolesview + "','" + rolespost + "','" + rolesdelete + "','" + companyview + "','" + companypost
                                    + "','" + companyedit + "','" + companydelete + "','" + projectsview + "','" + projectspost + "','" + projectsedit + "','" + projectsdelete + "','" + departmentview
                                    + "','" + departmentpost + "','" + departmentedit + "','" + departmentdelete + "','" + clientview + "','" + clientpost + "','" + clientedit + "','" + clientdelete
                                    + "','" + vendorview + "','" + vendorpost + "','" + vendoredit + "','" + vendorstatus + "','" + vendordelete + "','" + appointmentview + "','" + appointmentpost
                                    + "','" + payview + "','" + paypost + "','" + newsview + "','" + newspost + "','" + newsedit + "','" + newsdelete + "','" + usersview + "','" + userspost
                                    + "','" + usersedit + "','" + usersdelete + "','" + usersstatus + "','" + empconview + "','" + empconpost + "','" + empconedit + "','" + empcondelete + "','" + supportdelete
                                    + "','" + supportdownload + "','" + dailyview + "','" + Dailyedit + "','" + Dailydelete + "','" + Invoicingview + "','" + Invoicingpost + "','" + Invoicingedit
                                    + "','" + Invoicingdelete + "','" + Principlesview + "','" + Principlesedit + "','" + Principlesdelete + "','" + Calenderview + "','" + Calenderpost + "','" + Calenderedit
                                    + "','" + Calenderdelete + "','" + Reportsview + "','" + Reportsedit + "','" + Reportsdelete + "','" + Reportsdownload + "','" + Salaryview + "','" + Salaryedit
                                    + "','" + Salarydelete + "','" + Currentview + "','" + Currentpost + "','" + Currentedit + "','" + Currentdelete + "','" + checklistview + "','" + checklistpost + "','" + checklistedit + "','" + checklistdelete + "')";
                                con.Open();
                                SqlCommand cmd1 = new SqlCommand(qry, con);
                                int k = cmd1.ExecuteNonQuery();
                                con.Close();

                                if (k == 1)
                                {
                                    string result1 = SendMail(country, email, mobile, name, role, userid, pwd, chechitemaa);

                                    strScript = "alert('User Id is successfully Created');location.replace('Admin_CreationfUserIds.aspx')";
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                                }
                            }
                        }
                        else
                        {
                            strScript = "alert('Please Add at least one menu item for user');";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                        }
                    }
                    else
                    {
                        strScript = "alert('Some Problem Occured Try Again');location.replace('Admin_CreationfUserIds.aspx')";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                    }
                }
                else
                {
                    strScript = "alert('Sorry you Cant create new user id .Please make sure that user id is available or not');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
                }
            }
            else
            {
                strScript = "alert('Please Add Menu to User');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            }
        }
    }

    private string SendMail(string country, string email, string mobile, string name, string role, string userid, string Pwd, string menulist)
    {
        string Msg = "";


        Msg += "<table border='0'><tr><td><img src='http://1indus.com/admin/images/logo02.gif' alt='Company Logo' /></td></tr><tr><td class='data1'>Dear " + name + " ,</td></tr>"
            + "<tr><td height='10px'></td></tr>"
            + "<tr><td><h4>Your account details are as follows:</h4></td></tr>"
             + "<tr><td><h5>User Type : " + role + "</h5></td></tr>"
              + "<tr><td><h5>Country : " + country + "</h5></td></tr>"
            + "<tr><td><h5>User ID : " + email + "</h5></td></tr>"
            + "<tr><td><h5>Password : " + Pwd + "</h5></td></tr>"
            + "<tr><td><h5>Accessing Menu Tabs : " + menulist + "</h5></td></tr>"
            + "<tr><td>Please login with Your following Details.<a href='http://1indus.com/admin/Admin_Login.aspx'>Login</a></td></tr>"
            + "<tr><td height='20px'></td></tr>"
            + "<tr><td height='50px'></td></tr>"
            + "<tr><td>Regards,</td></tr>"
            + "<tr><td><a href='http://igiit.com/'>Indus Group ,</a></td></tr>"
            + "<tr><td>703-593-1234. </td></tr>"
            + "</table>";

    

        string from = "test@1indus.com";
        string fromName = "1indus User Creation";
        string to = email;
        string subject = "" + role + " Login Details for Indus Group.";
        string bodyText = Msg;

        WebClient client = new WebClient();
        NameValueCollection values = new NameValueCollection();
        values.Add("username", USERNAME);
        values.Add("api_key", API_KEY);
        values.Add("from", from);
        values.Add("from_name", fromName);
        values.Add("to", to);
        values.Add("subject", subject);
        values.Add("body_html", Msg);

        byte[] response = client.UploadValues("https://api.elasticemail.com/mailer/send", values);
        return Encoding.UTF8.GetString(response);

    }

    private void ItemsGet()
    {
        dsgetUserIdData = obj.GetAllUsersInfo();
        if (!dsgetUserIdData.Tables[0].Rows.Count.Equals(0))
        {
            gvusers.DataSource = dsgetUserIdData;
            gvusers.DataBind();
        }
    }

    protected void ViewGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox chkbxImmigview1 = (CheckBox)e.Row.FindControl("chkbxImmigview1");
        Label lblImmigview1Status = (Label)e.Row.FindControl("lblImmigview1Status");
        if (lblImmigview1Status != null)
        {
            if (lblImmigview1Status.Text == "1")
            {
                chkbxImmigview1.Checked = true;
            }
            else
            {
                chkbxImmigview1.Checked = false;
            }
        }
        CheckBox chkbxImmigPost1 = (CheckBox)e.Row.FindControl("chkbxImmigPost1");
        Label lblImmigPost1Status = (Label)e.Row.FindControl("lblImmigPost1Status");
        if (lblImmigPost1Status != null)
        {
            if (lblImmigPost1Status.Text == "1")
            {
                chkbxImmigPost1.Checked = true;
            }
            else
            {
                chkbxImmigPost1.Checked = false;
            }
        }
        CheckBox chkbxImmigEdit1 = (CheckBox)e.Row.FindControl("chkbxImmigEdit1");
        Label lblImmigEdit1Status = (Label)e.Row.FindControl("lblImmigEdit1Status");
        if (lblImmigEdit1Status != null)
        {
            if (lblImmigEdit1Status.Text == "1")
            {
                chkbxImmigEdit1.Checked = true;
            }
            else
            {
                chkbxImmigEdit1.Checked = false;
            }
        }
        CheckBox chkbxImmigDel1 = (CheckBox)e.Row.FindControl("chkbxImmigDel1");
        Label lblImmigDel1Status = (Label)e.Row.FindControl("lblImmigDel1Status");
        if (lblImmigDel1Status != null)
        {
            if (lblImmigDel1Status.Text == "1")
            {
                chkbxImmigDel1.Checked = true;
            }
            else
            {
                chkbxImmigDel1.Checked = false;
            }
        }
        CheckBox chkbxImmigDown1 = (CheckBox)e.Row.FindControl("chkbxImmigDown1");
        Label lblImmigDown1Status = (Label)e.Row.FindControl("lblImmigDown1Status");
        if (lblImmigDown1Status != null)
        {
            if (lblImmigDown1Status.Text == "1")
            {
                chkbxImmigDown1.Checked = true;
            }
            else
            {
                chkbxImmigDown1.Checked = false;
            }
        }

        CheckBox chkbxAccview1 = (CheckBox)e.Row.FindControl("chkbxAccview1");
        Label lblAccview1Status = (Label)e.Row.FindControl("lblAccview1Status");
        if (lblAccview1Status != null)
        {
            if (lblAccview1Status.Text == "1")
            {
                chkbxAccview1.Checked = true;
            }
            else
            {
                chkbxAccview1.Checked = false;
            }
        }
        CheckBox chkbxAccPost1 = (CheckBox)e.Row.FindControl("chkbxAccPost1");
        Label lblAccPost1Status = (Label)e.Row.FindControl("lblAccPost1Status");
        if (lblAccPost1Status != null)
        {
            if (lblAccPost1Status.Text == "1")
            {
                chkbxAccPost1.Checked = true;
            }
            else
            {
                chkbxAccPost1.Checked = false;
            }
        }
        CheckBox chkbxAccEdit1 = (CheckBox)e.Row.FindControl("chkbxAccEdit1");
        Label lblAccEdit1Status = (Label)e.Row.FindControl("lblAccEdit1Status");
        if (lblAccEdit1Status != null)
        {
            if (lblAccEdit1Status.Text == "1")
            {
                chkbxAccEdit1.Checked = true;
            }
            else
            {
                chkbxAccEdit1.Checked = false;
            }
        }
        CheckBox chkbxAccDel1 = (CheckBox)e.Row.FindControl("chkbxAccDel1");
        Label lblAccDel1Status = (Label)e.Row.FindControl("lblAccDel1Status");
        if (lblAccDel1Status != null)
        {
            if (lblAccDel1Status.Text == "1")
            {
                chkbxAccDel1.Checked = true;
            }
            else
            {
                chkbxAccDel1.Checked = false;
            }
        }
        CheckBox chkbxAccDown1 = (CheckBox)e.Row.FindControl("chkbxAccDown1");
        Label lblAccDown1Status = (Label)e.Row.FindControl("lblAccDown1Status");
        if (lblAccDown1Status != null)
        {
            if (lblAccDown1Status.Text == "1")
            {
                chkbxAccDown1.Checked = true;
            }
            else
            {
                chkbxAccDown1.Checked = false;
            }
        }

        CheckBox chkbxHRview1 = (CheckBox)e.Row.FindControl("chkbxHRview1");
        Label lblHRview1Status = (Label)e.Row.FindControl("lblHRview1Status");
        if (lblHRview1Status != null)
        {
            if (lblHRview1Status.Text == "1")
            {
                chkbxHRview1.Checked = true;
            }
            else
            {
                chkbxHRview1.Checked = false;
            }
        }
        CheckBox chkbxHRPost1 = (CheckBox)e.Row.FindControl("chkbxHRPost1");
        Label lblHRPost1Status = (Label)e.Row.FindControl("lblHRPost1Status");
        if (lblHRPost1Status != null)
        {
            if (lblHRPost1Status.Text == "1")
            {
                chkbxHRPost1.Checked = true;
            }
            else
            {
                chkbxHRPost1.Checked = false;
            }
        }
        CheckBox chkbxHREdit1 = (CheckBox)e.Row.FindControl("chkbxHREdit1");
        Label lblHREdit1Status = (Label)e.Row.FindControl("lblHREdit1Status");
        if (lblHREdit1Status != null)
        {
            if (lblHREdit1Status.Text == "1")
            {
                chkbxHREdit1.Checked = true;
            }
            else
            {
                chkbxHREdit1.Checked = false;
            }
        }
        CheckBox chkbxHRDel1 = (CheckBox)e.Row.FindControl("chkbxHRDel1");
        Label lblHRDel1Status = (Label)e.Row.FindControl("lblHRDel1Status");
        if (lblHRDel1Status != null)
        {
            if (lblHRDel1Status.Text == "1")
            {
                chkbxHRDel1.Checked = true;
            }
            else
            {
                chkbxHRDel1.Checked = false;
            }
        }
        CheckBox chkbxHRDown1 = (CheckBox)e.Row.FindControl("chkbxHRDown1");
        Label lblHRDown1Status = (Label)e.Row.FindControl("lblHRDown1Status");
        if (lblHRDown1Status != null)
        {
            if (lblHRDown1Status.Text == "1")
            {
                chkbxHRDown1.Checked = true;
            }
            else
            {
                chkbxHRDown1.Checked = false;
            }
        }
        CheckBox chkbxARPview1 = (CheckBox)e.Row.FindControl("chkbxARPview1");
        Label lblARPview1Status = (Label)e.Row.FindControl("lblARPview1Status");
        if (lblARPview1Status != null)
        {
            if (lblARPview1Status.Text == "1")
            {
                chkbxARPview1.Checked = true;
            }
            else
            {
                chkbxARPview1.Checked = false;
            }
        }
        CheckBox chkbxARPPost1 = (CheckBox)e.Row.FindControl("chkbxARPPost1");
        Label lblARPPost1Status = (Label)e.Row.FindControl("lblARPPost1Status");
        if (lblARPPost1Status != null)
        {
            if (lblARPPost1Status.Text == "1")
            {
                chkbxARPPost1.Checked = true;
            }
            else
            {
                chkbxARPPost1.Checked = false;
            }
        }
        CheckBox chkbxARPEdit1 = (CheckBox)e.Row.FindControl("chkbxARPEdit1");
        Label lblARPEdit1Status = (Label)e.Row.FindControl("lblARPEdit1Status");
        if (lblARPEdit1Status != null)
        {
            if (lblARPEdit1Status.Text == "1")
            {
                chkbxARPEdit1.Checked = true;
            }
            else
            {
                chkbxARPEdit1.Checked = false;
            }
        }
        CheckBox chkbxARPDel1 = (CheckBox)e.Row.FindControl("chkbxARPDel1");
        Label lblARPDel1Status = (Label)e.Row.FindControl("lblARPDel1Status");
        if (lblARPDel1Status != null)
        {
            if (lblARPDel1Status.Text == "1")
            {
                chkbxARPDel1.Checked = true;
            }
            else
            {
                chkbxARPDel1.Checked = false;
            }
        }
        CheckBox chkbxARPDown1 = (CheckBox)e.Row.FindControl("chkbxARPDown1");
        Label lblARPDown1Status = (Label)e.Row.FindControl("lblARPDown1Status");
        if (lblARPDown1Status != null)
        {
            if (lblARPDown1Status.Text == "1")
            {
                chkbxARPDown1.Checked = true;
            }
            else
            {
                chkbxARPDown1.Checked = false;
            }
        }

        CheckBox chkbxDRview1 = (CheckBox)e.Row.FindControl("chkbxDRview1");
        Label lblDRview1Status = (Label)e.Row.FindControl("lblDRview1Status");
        if (lblDRview1Status != null)
        {
            if (lblDRview1Status.Text == "1")
            {
                chkbxDRview1.Checked = true;
            }
            else
            {
                chkbxDRview1.Checked = false;
            }
        }
        CheckBox chkbxDRPost1 = (CheckBox)e.Row.FindControl("chkbxDRPost1");
        Label lblDRPost1Status = (Label)e.Row.FindControl("lblDRPost1Status");
        if (lblDRPost1Status != null)
        {
            if (lblDRPost1Status.Text == "1")
            {
                chkbxDRPost1.Checked = true;
            }
            else
            {
                chkbxDRPost1.Checked = false;
            }
        }
        CheckBox chkbxDRDel1 = (CheckBox)e.Row.FindControl("chkbxDRDel1");
        Label lblDRDel1Status = (Label)e.Row.FindControl("lblDRDel1Status");
        if (lblDRDel1Status != null)
        {
            if (lblDRDel1Status.Text == "1")
            {
                chkbxDRDel1.Checked = true;
            }
            else
            {
                chkbxDRDel1.Checked = false;
            }
        }
        CheckBox chkbxDRDown1 = (CheckBox)e.Row.FindControl("chkbxDRDown1");
        Label lblDRDown1Status = (Label)e.Row.FindControl("lblDRDown1Status");
        if (lblDRDown1Status != null)
        {
            if (lblDRDown1Status.Text == "1")
            {
                chkbxDRDown1.Checked = true;
            }
            else
            {
                chkbxDRDown1.Checked = false;
            }
        }
        CheckBox chkbxDRDown11 = (CheckBox)e.Row.FindControl("chkbxDREdit");
        Label lblDRDown1Status1 = (Label)e.Row.FindControl("lblDrEditStatus");
        if (lblDRDown1Status1 != null)
        {
            if (lblDRDown1Status1.Text == "1")
            {
                chkbxDRDown11.Checked = true;
            }
            else
            {
                chkbxDRDown11.Checked = false;
            }
        }
        CheckBox chkbxLSview1 = (CheckBox)e.Row.FindControl("chkbxLSview1");
        Label lblLSview1Status = (Label)e.Row.FindControl("lblLSview1Status");
        if (lblLSview1Status != null)
        {
            if (lblLSview1Status.Text == "1")
            {
                chkbxLSview1.Checked = true;
            }
            else
            {
                chkbxLSview1.Checked = false;
            }
        }
        CheckBox chkbxLSPost1 = (CheckBox)e.Row.FindControl("chkbxLSPost1");
        Label lblLSPost1Status = (Label)e.Row.FindControl("lblLSPost1Status");
        if (lblLSPost1Status != null)
        {
            if (lblLSPost1Status.Text == "1")
            {
                chkbxLSPost1.Checked = true;
            }
            else
            {
                chkbxLSPost1.Checked = false;
            }
        }
        CheckBox chkbxLSEdit1 = (CheckBox)e.Row.FindControl("chkbxLSEdit1");
        Label lblLSEdit1Status = (Label)e.Row.FindControl("lblLSEdit1Status");
        if (lblLSEdit1Status != null)
        {
            if (lblLSEdit1Status.Text == "1")
            {
                chkbxLSEdit1.Checked = true;
            }
            else
            {
                chkbxLSEdit1.Checked = false;
            }
        }
        CheckBox chkbxLSDel1 = (CheckBox)e.Row.FindControl("chkbxLSDel1");
        Label lblLSDel1Status = (Label)e.Row.FindControl("lblLSDel1Status");
        if (lblLSDel1Status != null)
        {
            if (lblLSDel1Status.Text == "1")
            {
                chkbxLSDel1.Checked = true;
            }
            else
            {
                chkbxLSDel1.Checked = false;
            }
        }
        CheckBox chkbxLSDel11 = (CheckBox)e.Row.FindControl("chkbxLSDown");
        Label lblLSDel1Status1 = (Label)e.Row.FindControl("lblLsDownStatus");
        if (lblLSDel1Status1 != null)
        {
            if (lblLSDel1Status1.Text == "1")
            {
                chkbxLSDel11.Checked = true;
            }
            else
            {
                chkbxLSDel11.Checked = false;
            }
        }
        CheckBox chkbxExcelview1 = (CheckBox)e.Row.FindControl("chkbxExcelview1");
        Label lblExcelView1Status = (Label)e.Row.FindControl("lblExcelView1Status");
        if (lblExcelView1Status != null)
        {
            if (lblExcelView1Status.Text == "1")
            {
                chkbxExcelview1.Checked = true;
            }
            else
            {
                chkbxExcelview1.Checked = false;
            }
        }
        CheckBox chkbxExcelPost1 = (CheckBox)e.Row.FindControl("chkbxExcelPost1");
        Label lblExcelPost1Status = (Label)e.Row.FindControl("lblExcelPost1Status");
        if (lblExcelPost1Status != null)
        {
            if (lblExcelPost1Status.Text == "1")
            {
                chkbxExcelPost1.Checked = true;
            }
            else
            {
                chkbxExcelPost1.Checked = false;
            }
        }
        CheckBox chkbxExcelEdit1 = (CheckBox)e.Row.FindControl("chkbxExcelEdit1");
        Label lblExcelEdit1Status = (Label)e.Row.FindControl("lblExcelEdit1Status");
        if (lblExcelEdit1Status != null)
        {
            if (lblExcelEdit1Status.Text == "1")
            {
                chkbxExcelEdit1.Checked = true;
            }
            else
            {
                chkbxExcelEdit1.Checked = false;
            }
        }
        CheckBox chkbxExcelDel1 = (CheckBox)e.Row.FindControl("chkbxExcelDel1");
        Label lblExcelDel1Status = (Label)e.Row.FindControl("lblExcelDel1Status");
        if (lblExcelDel1Status != null)
        {
            if (lblExcelDel1Status.Text == "1")
            {
                chkbxExcelDel1.Checked = true;
            }
            else
            {
                chkbxExcelDel1.Checked = false;
            }
        }
        CheckBox chkbxExcelDown1 = (CheckBox)e.Row.FindControl("chkbxExcelDown1");
        Label lblExcelDown1Status = (Label)e.Row.FindControl("lblExcelDown1Status");
        if (lblExcelDown1Status != null)
        {
            if (lblExcelDown1Status.Text == "1")
            {
                chkbxExcelDown1.Checked = true;
            }
            else
            {
                chkbxExcelDown1.Checked = false;
            }
        }
        CheckBox chkbxEmpDocPost1 = (CheckBox)e.Row.FindControl("chkbxEmpDocPost1");
        Label lblEmpDocPost1Status = (Label)e.Row.FindControl("lblEmpDocPost1Status");
        if (lblEmpDocPost1Status != null)
        {
            if (lblEmpDocPost1Status.Text == "1")
            {
                chkbxEmpDocPost1.Checked = true;
            }
            else
            {
                chkbxEmpDocPost1.Checked = false;
            }
        }
        CheckBox chkbxEmpDocDown1 = (CheckBox)e.Row.FindControl("chkbxEmpDocDown1");
        Label lblEmpDocDown1Status = (Label)e.Row.FindControl("lblEmpDocDown1Status");
        if (lblEmpDocDown1Status != null)
        {
            if (lblEmpDocDown1Status.Text == "1")
            {
                chkbxEmpDocDown1.Checked = true;
            }
            else
            {
                chkbxEmpDocDown1.Checked = false;
            }
        }
        CheckBox chkbxEmpDocDown11 = (CheckBox)e.Row.FindControl("chkbxEmpDocEdit1");
        Label lblEmpDocDown1Status1 = (Label)e.Row.FindControl("lblEmpDocEdit1Status");
        if (lblEmpDocDown1Status1 != null)
        {
            if (lblEmpDocDown1Status1.Text == "1")
            {
                chkbxEmpDocDown11.Checked = true;
            }
            else
            {
                chkbxEmpDocDown11.Checked = false;
            }
        }
        CheckBox chkbxEmpDocDown13 = (CheckBox)e.Row.FindControl("chkbxEmpDocDel1");
        Label lblEmpDocDown1Status3 = (Label)e.Row.FindControl("lblEmpDocDel1Status");
        if (lblEmpDocDown1Status3 != null)
        {
            if (lblEmpDocDown1Status3.Text == "1")
            {
                chkbxEmpDocDown13.Checked = true;
            }
            else
            {
                chkbxEmpDocDown13.Checked = false;
            }
        }
        CheckBox chkbxEmpDocDown12 = (CheckBox)e.Row.FindControl("chkbxEmpDocEdit1");
        Label lblEmpDocDown1Status2 = (Label)e.Row.FindControl("lblEmpDocEdit1Status");
        if (lblEmpDocDown1Status2 != null)
        {
            if (lblEmpDocDown1Status2.Text == "1")
            {
                chkbxEmpDocDown12.Checked = true;
            }
            else
            {
                chkbxEmpDocDown12.Checked = false;
            }
        }
        CheckBox chkbxEmpDocDown14 = (CheckBox)e.Row.FindControl("chkbxEmpview1");
        Label lblEmpDocDown1Status4 = (Label)e.Row.FindControl("lblEmpDocView1Status");
        if (lblEmpDocDown1Status4 != null)
        {
            if (lblEmpDocDown1Status4.Text == "1")
            {
                chkbxEmpDocDown14.Checked = true;
            }
            else
            {
                chkbxEmpDocDown14.Checked = false;
            }
        }
        CheckBox chkbxWrdPost1 = (CheckBox)e.Row.FindControl("chkbxWrdPost1");
        Label lblWrdPost1Status = (Label)e.Row.FindControl("lblWrdPost1Status");
        if (lblWrdPost1Status != null)
        {
            if (lblWrdPost1Status.Text == "1")
            {
                chkbxWrdPost1.Checked = true;
            }
            else
            {
                chkbxWrdPost1.Checked = false;
            }
        }
        CheckBox chkbxWrdEdit1 = (CheckBox)e.Row.FindControl("chkbxWrdEdit1");
        Label lblWrdEdit1Status = (Label)e.Row.FindControl("lblWrdEdit1Status");
        if (lblWrdEdit1Status != null)
        {
            if (lblWrdEdit1Status.Text == "1")
            {
                chkbxWrdEdit1.Checked = true;
            }
            else
            {
                chkbxWrdEdit1.Checked = false;
            }
        }
        CheckBox chkbxWrdDel1 = (CheckBox)e.Row.FindControl("chkbxWrdDel1");
        Label lblWrdDel1Status = (Label)e.Row.FindControl("lblWrdDel1Status");
        if (lblWrdDel1Status != null)
        {
            if (lblWrdDel1Status.Text == "1")
            {
                chkbxWrdDel1.Checked = true;
            }
            else
            {
                chkbxWrdDel1.Checked = false;
            }
        }
        CheckBox chkbxWrdview1 = (CheckBox)e.Row.FindControl("chkbxWrdview1");
        Label lblWrdview1Status = (Label)e.Row.FindControl("lblWrdview1Status");
        if (lblWrdview1Status != null)
        {
            if (lblWrdview1Status.Text == "1")
            {
                chkbxWrdview1.Checked = true;
            }
            else
            {
                chkbxWrdview1.Checked = false;
            }
        }
        CheckBox chkbxWrdDown1 = (CheckBox)e.Row.FindControl("chkbxWrdDown1");
        Label lblWrdDown1Status = (Label)e.Row.FindControl("lblWrdDown1Status");
        if (lblWrdDown1Status != null)
        {
            if (lblWrdDown1Status.Text == "1")
            {
                chkbxWrdDown1.Checked = true;
            }
            else
            {
                chkbxWrdDown1.Checked = false;
            }
        }
        //resume
        CheckBox chkbxResumePost1 = (CheckBox)e.Row.FindControl("chkbxResumePost1");
        Label lblResumePost1Status = (Label)e.Row.FindControl("lblResumePost1Status");
        if (lblResumePost1Status != null)
        {
            if (lblResumePost1Status.Text == "1")
            {
                chkbxResumePost1.Checked = true;
            }
            else
            {
                chkbxResumePost1.Checked = false;
            }
        }
        CheckBox chkbxResumeEdit1 = (CheckBox)e.Row.FindControl("chkbxResumeEdit1");
        Label lblResumeEdit1Status = (Label)e.Row.FindControl("lblResumeEdit1Status");
        if (lblResumeEdit1Status != null)
        {
            if (lblResumeEdit1Status.Text == "1")
            {
                chkbxResumeEdit1.Checked = true;
            }
            else
            {
                chkbxResumeEdit1.Checked = false;
            }
        }
        CheckBox chkbxResumeDel1 = (CheckBox)e.Row.FindControl("chkbxResumeDel1");
        Label lblResumeDel1Status = (Label)e.Row.FindControl("lblResumeDel1Status");
        if (lblResumeDel1Status != null)
        {
            if (lblResumeDel1Status.Text == "1")
            {
                chkbxResumeDel1.Checked = true;
            }
            else
            {
                chkbxResumeDel1.Checked = false;
            }
        }
        CheckBox chkbxResumeview1 = (CheckBox)e.Row.FindControl("chkbxResumeview1");
        Label lblResumeview1Status = (Label)e.Row.FindControl("lblResumeview1Status");
        if (lblResumeview1Status != null)
        {
            if (lblResumeview1Status.Text == "1")
            {
                chkbxResumeview1.Checked = true;
            }
            else
            {
                chkbxResumeview1.Checked = false;
            }
        }
        CheckBox chkbxResumeDown1 = (CheckBox)e.Row.FindControl("chkbxResumeDown1");
        Label lblResumeDown1Status = (Label)e.Row.FindControl("lblResumeDown1Status");
        if (lblResumeDown1Status != null)
        {
            if (lblResumeDown1Status.Text == "1")
            {
                chkbxResumeDown1.Checked = true;
            }
            else
            {
                chkbxResumeDown1.Checked = false;
            }
        }



   }
   protected void ChangeStatus(object sender, CommandEventArgs e)
    {
        Int32 uid = Convert.ToInt32(e.CommandArgument.ToString());
        DataSet ds = new DataSet();
        ds = obj.GetParticularUserData(uid);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            Status = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"].ToString());
        }
        if (Status == 1)
        {
            obj.cStatus = 0;
            obj.cUId = uid;
            t = obj.ChangeUserStatus(obj.cStatus, obj.cUId);
            if (t == true)
            {
                strScript = "alert('Dectivated Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            obj.cStatus = 1;
            obj.cUId = uid;
            t = obj.ChangeUserStatus(obj.cStatus, obj.cUId);
            if(t==true)
            {
                strScript = "alert('Activated Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }

    }
    protected void lnkDeleteUser(object sender, CommandEventArgs e)
    {
        Int32 uid = Convert.ToInt32(e.CommandArgument.ToString());
        obj.cUId = uid;
        t = obj.DeleteUser(obj.cUId);
        if (t == true)
        {
           
                strScript = "alert('UserId deleted Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        create.Visible = true;
        View.Visible = false;
        View1.Visible = false;
        lnkcreate.Visible = false;
        lnkview.Visible = true;
        editbtn.Visible = false;
        disablebtn.Visible = false;
        enablebtn.Visible = false;
        deletebtn.Visible = false;
    }
    protected void lnkview_Click(object sender, EventArgs e)
    {
        lnkview.Visible = false;
        lnkcreate.Visible = true;
        View1.Visible = true;
        View.Visible = true;
        create.Visible = false;
        editbtn.Visible = true;
        disablebtn.Visible = true;
        enablebtn.Visible = true;
        deletebtn.Visible = true;
       
    }

    protected void editbtn_Click(object sender, EventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{

        //foreach (GridViewRow row in gvusers.Rows)
        //{
        //    if (row.RowType == DataControlRowType.DataRow)
        //    {
        //        CheckBox CheckRow = (row.Cells[0].FindControl("CheckBoxreq") as CheckBox);
        //        if (CheckRow.Checked)
        //        {
        //            prd = Convert.ToInt32(gvusers.DataKeys[0].Values[0].ToString());
        //        }
        //    }
        //}
        


        for (int i = 0; i < gvusers.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvusers.Rows[i].FindControl("CheckBoxreq");
            if (cbox.Checked)
            {
                prd = Convert.ToInt32(gvusers.DataKeys[i].Values[0].ToString());
            }
        }
      //  try
     //   {
            Response.Redirect("Admin-EditUser.aspx?rid=" + prd);
     //   }
     //   catch (Exception ex)
     //   {
      //      ex.ToString();
     //   }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }

    protected void deletebtn_Click(object sender, EventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            for (int i = 0; i < gvusers.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gvusers.Rows[i].FindControl("CheckBoxreq");
                if (cbox.Checked)
                {
                    prd = Convert.ToInt32(gvusers.DataKeys[i].Values[0].ToString());
                }
            }
            try
            {
                obj.cUId = prd;
                ds = obj.GetParticularUserData(obj.cUId);
                t = obj.DeleteUser(obj.cUId);
                if (t == true)
                {
                    string email = ds.Tables[0].Rows[0]["emailid"].ToString();
                    string s1i = "delete employeereg1  where emailid='" + email + "' ";
                    con.Open();
                    SqlCommand cmd1i = new SqlCommand(s1i, con);
                    cmd1i.ExecuteNonQuery();
                    con.Close();

                    string s = "delete user_menu where mid='" + obj.cUId + "'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(s, con);
                    int j = cmd.ExecuteNonQuery();
                    con.Close();
                    if (j == 1)
                    {
                        string s1 = "delete indus_Roles where mid='" + obj.cUId + "'";
                        con.Open();
                        SqlCommand cmd1 = new SqlCommand(s1, con);
                        cmd1.ExecuteNonQuery();
                        con.Close();

                        

                        //strScript = "alert('UserId deleted Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('UserId deleted Successfully.');location.replace('Admin_CreationfUserIds.aspx');", true);

                      //  ItemsGet();
                    }

                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    
    }
    protected void gvusers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label lblstatus = (Label)e.Row.FindControl("lblstatus");
        if (lblstatus != null)
        {
            if (lblstatus.Text == "1")
            {
                lblstatus.Text = "Enabled";
            }
            else
            {
                lblstatus.Text = "Disabled";
            }
        }
    }
    protected void disablebtn_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gvusers.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvusers.Rows[i].FindControl("CheckBoxreq");
            if (cbox.Checked)
            {
                prd = Convert.ToInt32(gvusers.DataKeys[i].Values[0].ToString());
            }
        }
        try
        {
            DataSet ds = new DataSet();
            ds = obj.GetParticularUserData(prd);
            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                Status = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"].ToString());
            }
            if (Status == 1)
            {
                obj.cStatus = 0;
                obj.cUId = prd;
                t = obj.ChangeUserStatus(obj.cStatus, obj.cUId);
                if (t == true)
                {
                    string email =ds.Tables[0].Rows[0]["emailid"].ToString();

                    string s1 = "update employeereg1 set status=0  where emailid='" + email + "' ";
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(s1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    strScript = "alert('Disabled Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                  //  ItemsGet();
                }
            }
            else
            {
                strScript = "alert('Selected user is already Disabled');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }


    protected void enablebtn_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gvusers.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvusers.Rows[i].FindControl("CheckBoxreq");
            if (cbox.Checked)
            {
                prd = Convert.ToInt32(gvusers.DataKeys[i].Values[0].ToString());
            }
        }
        try
        {
            DataSet ds = new DataSet();
            ds = obj.GetParticularUserData(prd);
            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                Status = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"].ToString());
            }
            if (Status == 0)
            {
                obj.cStatus = 1;
                obj.cUId = prd;
                t = obj.ChangeUserStatus(obj.cStatus, obj.cUId);
                if (t == true)
                {
                    string email = ds.Tables[0].Rows[0]["emailid"].ToString();

                    string s1 = "update employeereg1 set status=1  where emailid='" + email + "' ";
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(s1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    strScript = "alert('Enabled Successfully.');location.replace('Admin_CreationfUserIds.aspx');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                  //  ItemsGet();
                }
            }
            else
            {
                strScript = "alert('Selected user is already Enabled');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void gvusers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvusers.PageIndex = e.NewPageIndex;
        ItemsGet();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            CheckBox2.Checked = true;
            CheckBox3.Checked = true;
            CheckBox4.Checked = true;
            CheckBox5.Checked = true;
        }
        else
        {
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;
            CheckBox4.Checked = false;
            CheckBox5.Checked = false;
        }
    }

    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox7.Checked == true)
        {
            CheckBox8.Checked = true;
            CheckBox10.Checked = true;
            CheckBox11.Checked = true;
        }
        else
        {
            CheckBox8.Checked = false;
            CheckBox10.Checked = false;
            CheckBox11.Checked = false;
        }
    }
    protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox13.Checked == true)
        {
            CheckBox14.Checked = true;
            CheckBox15.Checked = true;
            CheckBox16.Checked = true;
            CheckBox17.Checked = true;
        }
        else
        {
            CheckBox14.Checked = false;
            CheckBox15.Checked = false;
            CheckBox16.Checked = false;
            CheckBox17.Checked = false;
        }
    }
    protected void CheckBox19_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox19.Checked == true)
        {
            CheckBox20.Checked = true;
            CheckBox21.Checked = true;
        }
        else
        {
            CheckBox20.Checked = false;
            CheckBox21.Checked = false;
        }
    }

    protected void CheckBox25_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox25.Checked == true)
        {
            CheckBox26.Checked = true;
            CheckBox27.Checked = true;
            CheckBox28.Checked = true;
            CheckBox29.Checked = true;
            CheckBox30.Checked = true;
        }
        else
        {
            CheckBox26.Checked = false;
            CheckBox27.Checked = false;
            CheckBox28.Checked = false;
            CheckBox29.Checked = false;
            CheckBox30.Checked = false;
        }

    }
    protected void CheckBox31_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox31.Checked == true)
        {
            CheckBox32.Checked = true;
            CheckBox33.Checked = true;
            CheckBox34.Checked = true;
            CheckBox35.Checked = true;
        }
        else
        {
            CheckBox32.Checked = false;
            CheckBox33.Checked = false;
            CheckBox34.Checked = false;
            CheckBox35.Checked = false;
        }
    }

    protected void CheckBox37_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox37.Checked == true)
        {
            CheckBox38.Checked = true;
            CheckBox41.Checked = true;
        }
        else
        {
            CheckBox38.Checked = false;
            CheckBox41.Checked = false;
        }
    }

    protected void CheckBox49_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox49.Checked == true)
        {
            CheckBox50.Checked = true;
            CheckBox51.Checked = true;
            CheckBox53.Checked = true;
        }
        else
        {
            CheckBox50.Checked = false;
            CheckBox51.Checked = false;
            CheckBox53.Checked = false;
        }
    }

    protected void CheckBox55_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox55.Checked == true)
        {
            CheckBox56.Checked = true;
            CheckBox57.Checked = true;
            CheckBox58.Checked = true;
            CheckBox59.Checked = true;
        }
        else
        {
            CheckBox56.Checked = false;
            CheckBox57.Checked = false;
            CheckBox58.Checked = false;
            CheckBox59.Checked = false;
        }
    }

    protected void CheckBox61_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox61.Checked == true)
        {
            CheckBox62.Checked = true;
            CheckBox63.Checked = true;
            CheckBox64.Checked = true;
            CheckBox65.Checked = true;
        }
        else
        {
            CheckBox62.Checked = false;
            CheckBox63.Checked = false;
            CheckBox64.Checked = false;
            CheckBox65.Checked = false;
        }
    }

    protected void CheckBox67_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox67.Checked == true)
        {
            CheckBox68.Checked = true;
            CheckBox69.Checked = true;
            CheckBox70.Checked = true;
            CheckBox71.Checked = true;
        }
        else
        {
            CheckBox68.Checked = false;
            CheckBox69.Checked = false;
            CheckBox70.Checked = false;
            CheckBox71.Checked = false;
        }
    }
    protected void CheckBox73_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox73.Checked == true)
        {
            CheckBox74.Checked = true;
            CheckBox75.Checked = true;
            CheckBox76.Checked = true;
            CheckBox77.Checked = true;
        }
        else
        {
            CheckBox74.Checked = false;
            CheckBox75.Checked = false;
            CheckBox76.Checked = false;
            CheckBox77.Checked = false;
        }
    }

    protected void CheckBox79_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox79.Checked == true)
        {
            CheckBox80.Checked = true;
            CheckBox81.Checked = true;
            CheckBox82.Checked = true;
            CheckBox83.Checked = true;
            CheckBox72.Checked = true;
        }
        else
        {
            CheckBox80.Checked = false;
            CheckBox81.Checked = false;
            CheckBox82.Checked = false;
            CheckBox83.Checked = false;
            CheckBox72.Checked = false;
        }
    }

    protected void CheckBox85_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox85.Checked == true)
        {
            CheckBox86.Checked = true;
            CheckBox87.Checked = true;
        }
        else
        {
            CheckBox86.Checked = false;
            CheckBox87.Checked = false;
        }
    }

    protected void CheckBox91_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox91.Checked == true)
        {
            CheckBox92.Checked = true;
            CheckBox93.Checked = true;
        }
        else
        {
            CheckBox92.Checked = false;
            CheckBox93.Checked = false;
        }
    }

    protected void CheckBox97_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox97.Checked == true)
        {
            CheckBox98.Checked = true;
            CheckBox99.Checked = true;
            CheckBox100.Checked = true;
            CheckBox101.Checked = true;
        }
        else
        {
            CheckBox98.Checked = false;
            CheckBox99.Checked = false;
            CheckBox100.Checked = false;
            CheckBox101.Checked = false;
        }
    }

    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox6.Checked == true)
        {
            CheckBox9.Checked = true;
            CheckBox12.Checked = true;
            CheckBox18.Checked = true;
            CheckBox22.Checked = true;
            CheckBox23.Checked = true;
        }
        else
        {
            CheckBox9.Checked = false;
            CheckBox12.Checked = false;
            CheckBox18.Checked = false;
            CheckBox22.Checked = false;
            CheckBox23.Checked = false;
        }
    }

    protected void CheckBox24_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox24.Checked == true)
        {
            CheckBox28.Checked = true;
            CheckBox36.Checked = true;
            CheckBox39.Checked = true;
            CheckBox40.Checked = true;
        }
        else
        {
            CheckBox28.Checked = false;
            CheckBox36.Checked = false;
            CheckBox39.Checked = false;
            CheckBox40.Checked = false;
        }
    }

    protected void CheckBox43_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox43.Checked == true)
        {
            CheckBox48.Checked = true;
            CheckBox52.Checked = true;
        }
        else
        {
            CheckBox48.Checked = false;
            CheckBox52.Checked = false;
        }
    }

    protected void CheckBox54_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox54.Checked == true)
        {
           CheckBox60 .Checked = true;
            CheckBox66.Checked = true;
            CheckBox103.Checked = true;
            CheckBox104.Checked = true;
        }
        else
        {
           CheckBox60 .Checked = false;
            CheckBox66.Checked = false;
            CheckBox103.Checked = false;
            CheckBox104.Checked = false;
        }
    }

    protected void lnkmenu_Click(object sender, EventArgs e)
    {
        if ((lblStatus.Text == "User  Available") && (txtEmailId.Text != "") && (ddlCountry.SelectedItem.Text != "Select Country") && (ddlUserType.SelectedItem.Text != "Select User Type"))
        {
            menu.Visible = true;
            btnCreate.Visible = true;
            Button1.Visible = true;

            FName = Convert.ToString(txtFName.Text);
            LName = Convert.ToString(txtLName.Text);
            UserId = Convert.ToString(txtUserId.Text);
            Pwd = Convert.ToString(txtPwd.Text);
            Address = Convert.ToString(txtAddress.Text); 
            PhNo = Convert.ToString(txtConNumber.Text);
            EmailId = Convert.ToString(txtEmailId.Text);
            Desg = Convert.ToString(ddlUserType.SelectedValue);
            Mobile = Convert.ToString(txtMobile.Text);

            Country = Convert.ToString(ddlCountry.SelectedValue);

            string empid = Convert.ToString(ssemp.Text);

            obj.cFName = FName;
            obj.cLName = LName;
            obj.cUserId = UserId;
            obj.cPassword = Pwd;
            obj.cDesig = Desg;
            obj.cAddress = Address;
            obj.cContactNo = PhNo;
            obj.cEmailId = EmailId;
            obj.cMobile = Mobile;
            obj.cCountry = Country;
            obj.cStatus = 1;
            obj.cCreatedon = System.DateTime.Now;

            if (chkbxAccDel.Checked == true)
            {
                obj.cAccDel = 1;
            }
            else if (chkbxAccDel.Checked == false)
            {
                obj.cAccDel = 0;
            }

            if (chkbxAccDown.Checked == true)
            {
                obj.cAccDown = 1;
            }
            else if (chkbxAccDown.Checked == false)
            {
                obj.cAccDown = 0;
            }

            if (chkbxAccEdit.Checked == true)
            {
                obj.cAccEdit = 1;
            }
            else if (chkbxAccEdit.Checked == false)
            {
                obj.cAccEdit = 0;
            }

            if (chkbxAccPost.Checked == true)
            {
                obj.cAccPost = 1;
            }
            else if (chkbxAccPost.Checked == false)
            {
                obj.cAccPost = 0;
            }

            if (chkbxAccview.Checked == true)
            {
                obj.cAccView = 1;
            }
            else if (chkbxAccview.Checked == false)
            {
                obj.cAccView = 0;
            }
            //arp
            if (chkbxARPDel.Checked == true)
            {
                obj.cARPDel = 1;
            }
            else if (chkbxARPDel.Checked == false)
            {
                obj.cARPDel = 0;
            }

            if (chkbxARPDowm.Checked == true)
            {
                obj.cARPDown = 1;
            }
            else if (chkbxARPDowm.Checked == false)
            {
                obj.cARPDown = 0;
            }

            if (chkbxARPEdit.Checked == true)
            {
                obj.cARPEdit = 1;
            }
            else if (chkbxARPEdit.Checked == false)
            {
                obj.cARPEdit = 0;
            }

            if (chkbxARPPost.Checked == true)
            {
                obj.cARPPost = 1;
            }
            else if (chkbxARPPost.Checked == false)
            {
                obj.cARPPost = 0;
            }

            if (chkbxARPview.Checked == true)
            {
                obj.cARPView = 1;
            }
            else if (chkbxARPview.Checked == false)
            {
                obj.cARPView = 0;
            }
            //dr
            if (chkbxDRDel.Checked == true)
            {
                obj.cDRDel = 1;
            }
            else if (chkbxDRDel.Checked == false)
            {
                obj.cDRDel = 0;
            }

            if (chkbxDRDown.Checked == true)
            {
                obj.cDRDown = 1;
            }
            else if (chkbxDRDown.Checked == false)
            {
                obj.cDRDown = 0;
            }

            if (chkbxDRPost.Checked == true)
            {
                obj.cDRPost = 1;
            }
            else if (chkbxDRPost.Checked == false)
            {
                obj.cDRPost = 0;
            }
            if (chkbxDRview.Checked == true)
            {
                obj.cDRView = 1;
            }
            else if (chkbxDRview.Checked == false)
            {
                obj.cDRView = 0;
            }
            //if (chkbxDREdit.Checked == true)
            //{
            //    obj.cDREdit = 1;
            //}
            //else if (chkbxDREdit.Checked == false)
            //{
            //    obj.cDREdit = 0;
            //}                     
            //excel
            if (chkbxExcelDel.Checked == true)
            {
                obj.cExelDel = 1;
            }
            else if (chkbxExcelDel.Checked == false)
            {
                obj.cExelDel = 0;
            }
            if (chkbxExcelDown.Checked == true)
            {
                obj.cExelDown = 1;
            }
            else if (chkbxExcelDown.Checked == false)
            {
                obj.cExelDown = 0;
            }
            if (chkbxExcelEdit.Checked == true)
            {
                obj.cExelEdit = 1;
            }
            else if (chkbxExcelEdit.Checked == false)
            {
                obj.cExelEdit = 0;
            }
            if (chkbxExcelPost.Checked == true)
            {
                obj.cExelPost = 1;
            }
            else if (chkbxExcelPost.Checked == false)
            {
                obj.cExelPost = 0;
            }
            if (chkbxExcelview.Checked == true)
            {
                obj.cExelView = 1;
            }
            else if (chkbxExcelview.Checked == false)
            {
                obj.cExelView = 0;
            }
            //hr
            if (chkbxHRDel.Checked == true)
            {
                obj.cHRDel = 1;
            }
            else if (chkbxHRDel.Checked == false)
            {
                obj.cHRDel = 0;
            }
            if (chkbxHRDown.Checked == true)
            {
                obj.cHRDown = 1;
            }
            else if (chkbxHRDown.Checked == false)
            {
                obj.cHRDown = 0;
            }
            if (chkbxHREdit.Checked == true)
            {
                obj.cHREdit = 1;
            }
            else if (chkbxHREdit.Checked == false)
            {
                obj.cHREdit = 0;
            }
            if (chkbxHRPost.Checked == true)
            {
                obj.cHRPost = 1;
            }
            else if (chkbxHRPost.Checked == false)
            {
                obj.cHRPost = 0;
            }
            if (chkbxHRview.Checked == true)
            {
                obj.cHRView = 1;
            }
            else if (chkbxHRview.Checked == false)
            {
                obj.cHRView = 0;
            }
            //immigration
            if (chkbxImmigDel.Checked == true)
            {
                obj.cImmigDel = 1;
            }
            else if (chkbxImmigDel.Checked == false)
            {
                obj.cImmigDel = 0;
            }
            if (chkbxImmigDown.Checked == true)
            {
                obj.cImmigDown = 1;
            }
            else if (chkbxImmigDown.Checked == false)
            {
                obj.cImmigDown = 0;
            }
            if (chkbxImmigEdit.Checked == true)
            {
                obj.cImmigEdit = 1;
            }
            else if (chkbxImmigEdit.Checked == false)
            {
                obj.cImmigEdit = 0;
            }
            if (chkbxImmigPost.Checked == true)
            {
                obj.cImmigPost = 1;
            }
            else if (chkbxImmigPost.Checked == false)
            {
                obj.cImmigPost = 0;
            }
            if (chkbxImmigview.Checked == true)
            {
                obj.cImmigView = 1;
            }
            else if (chkbxImmigview.Checked == false)
            {
                obj.cImmigView = 0;
            }
            //time & attendence
            if (chkbxLSDel.Checked == true)
            {
                obj.cLeavesDel = 1;
            }
            else if (chkbxLSDel.Checked == false)
            {
                obj.cLeavesDel = 0;
            }
            if (chkbxLSEdit.Checked == true)
            {
                obj.cLeavesEdit = 1;
            }
            else if (chkbxLSEdit.Checked == false)
            {
                obj.cLeavesEdit = 0;
            }
            if (chkbxLSPost.Checked == true)
            {
                obj.cLeavesPost = 1;
            }
            else if (chkbxLSPost.Checked == false)
            {
                obj.cLeavesPost = 0;
            }
            if (chkbxLSview.Checked == true)
            {
                obj.cLeavesView = 1;
            }
            else if (chkbxLSview.Checked == false)
            {
                obj.cLeavesView = 0;
            }


            // Employee Docs
            if (chkbxEDocDown.Checked == true)
            {
                obj.cEmpDocsDown = 1;
            }
            else if (chkbxEDocDown.Checked == false)
            {
                obj.cEmpDocsDown = 0;
            }


            if (chkbxEDocPost.Checked == true)
            {
                obj.cEmpDocsPost = 1;
            }

            else if (chkbxEDocPost.Checked == false)
            {
                obj.cEmpDocsPost = 0;
            }

            if (chkbxEDocview.Checked == true)
            {
                obj.cEmpDocsView = 1;
            }
            else if (chkbxEDocview.Checked == false)
            {
                obj.cEmpDocsView = 0;
            }

            if (chkbxEDocDel.Checked == true)
            {
                obj.cEmpDocsDelete = 1;
            }
            else if (chkbxEDocview.Checked == false)
            {
                obj.cEmpDocsDelete = 0;
            }

            // Word Docs
            if (chkbxWDocPost.Checked == true)
            {
                obj.cWrdDocsPost = 1;
            }
            else if (chkbxWDocPost.Checked == false)
            {
                obj.cWrdDocsPost = 0;
            }
            if (chkbxWDocEdit.Checked == true)
            {
                obj.cWrdDocsEdit = 1;
            }
            else if (chkbxWDocEdit.Checked == false)
            {
                obj.cWrdDocsEdit = 0;
            }
            if (chkbxWDocDel.Checked == true)
            {
                obj.cWrdDocsDelete = 1;
            }
            else if (chkbxWDocDel.Checked == false)
            {
                obj.cWrdDocsDelete = 0;
            }
            if (chkbxWDocview.Checked == true)
            {
                obj.cWrdDocsView = 1;
            }
            else if (chkbxWDocview.Checked == false)
            {
                obj.cWrdDocsView = 0;
            }
            if (chkbxWDocDown.Checked == true)
            {
                obj.cWrdDocsDown = 1;
            }
            else if (chkbxWDocDown.Checked == false)
            {
                obj.cWrdDocsDown = 0;
            }

            //Resume

            if (chkbxRDocPost.Checked == true)
            {
                obj.cRDocsPost = 1;
            }
            else if (chkbxRDocPost.Checked == false)
            {
                obj.cRDocsPost = 0;
            }
            if (chkbxRDocEdit.Checked == true)
            {
                obj.cRDocsEdit = 1;
            }
            else if (chkbxRDocEdit.Checked == false)
            {
                obj.cRDocsEdit = 0;
            }
            if (chkbxRDocDelete.Checked == true)
            {
                obj.cRDocsDelete = 1;
            }
            else if (chkbxRDocDelete.Checked == false)
            {
                obj.cRDocsDelete = 0;
            }
            if (chkbxRDocPreview.Checked == true)
            {
                obj.cRDocsView = 1;
            }
            else if (chkbxRDocPreview.Checked == false)
            {
                obj.cRDocsView = 0;
            }
            if (chkbxRDocDownload.Checked == true)
            {
                obj.cRDocsDown = 1;
            }
            else if (chkbxRDocDownload.Checked == false)
            {
                obj.cRDocsDown = 0;
            }

            t = obj.CreateUserId(obj.cUserId, obj.cPassword, obj.cFName, obj.cLName, obj.cDesig, obj.cAddress, obj.cContactNo, obj.cEmailId,
               obj.cStatus, obj.cCreatedon, obj.cImmigView, obj.cImmigPost, obj.cImmigEdit, obj.cImmigDel, obj.cImmigDown,
               obj.cAccView, obj.cAccPost, obj.cAccEdit, obj.cAccDel, obj.cAccDown, obj.cHRView, obj.cHRPost, obj.cHREdit,
               obj.cHRDel, obj.cHRDown, obj.cDRView, obj.cDRPost, obj.cDRDel, obj.cDRDown, obj.cLeavesView, obj.cLeavesPost,
               obj.cLeavesEdit, obj.cLeavesDel, obj.cARPView, obj.cARPPost, obj.cARPEdit, obj.cARPDel, obj.cARPDown,
               obj.cExelView, obj.cExelPost, obj.cExelEdit, obj.cExelDel, obj.cExelDown, obj.cEmpDocsView, obj.cEmpDocsPost, obj.cEmpDocsDown, obj.cEmpDocsDelete,
               obj.cWrdDocsPost, obj.cWrdDocsEdit, obj.cWrdDocsDelete, obj.cWrdDocsView, obj.cWrdDocsDown,
               obj.cRDocsPost, obj.cRDocsEdit, obj.cRDocsDelete, obj.cRDocsView, obj.cRDocsDown, obj.cCountry, obj.cMobile, empid);

            if (t == true)
            {
              //  string result1 = SendMail(obj.cUserId, obj.cPassword, obj.cFName, obj.cLName, obj.cDesig, obj.cEmailId, obj.cCountry);

                //strScript = "alert('User Id is successfully Created');location.replace('Admin_CreationfUserIds.aspx')";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            }
        }
        else
        {
            strScript = "alert('Fill all details of User');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
        }
    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox5.Checked == false)
        {
            CheckBox1.Checked = false;
        }
        else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
        {
            CheckBox1.Checked = true;
        }
    }

    protected void CheckBox60_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox60.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true && CheckBox66.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }
    protected void CheckBox66_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox66.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true && CheckBox66.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }

    protected void CheckBox103_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox103.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true && CheckBox66.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }

    protected void CheckBox104_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox104.Checked == false)
        {
            CheckBox54.Checked = false;
        }
        else if (CheckBox60.Checked == true && CheckBox66.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
        {
            CheckBox54.Checked = true;
        }
    }

    protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox14.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }

    protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox15.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }

    protected void CheckBox16_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox16.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }

    protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox17.Checked == false)
        {
            CheckBox13.Checked = false;
        }
        else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox16.Checked == true && CheckBox17.Checked == true)
        {
            CheckBox13.Checked = true;
        }
    }

    protected void CheckBox20_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox20.Checked == false)
        {
            CheckBox19.Checked = false;
        }
        else if (CheckBox20.Checked == true && CheckBox21.Checked == true )
        {
            CheckBox19.Checked = true;
        }
    }

    protected void CheckBox21_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox20.Checked == false)
        {
            CheckBox19.Checked = false;
        }
        else if (CheckBox20.Checked == true && CheckBox21.Checked == true)
        {
            CheckBox19.Checked = true;
        }
    }

    protected void CheckBox26_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox26.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox29.Checked == true && CheckBox30.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }

    protected void CheckBox27_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox27.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox29.Checked == true && CheckBox30.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }

    protected void CheckBox29_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox29.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox29.Checked == true && CheckBox30.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }

    protected void CheckBox30_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox30.Checked == false)
        {
            CheckBox25.Checked = false;
        }
        else if (CheckBox26.Checked == true && CheckBox27.Checked == true && CheckBox29.Checked == true && CheckBox30.Checked == true)
        {
            CheckBox25.Checked = true;
        }
    }

    protected void CheckBox32_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox32.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }

    protected void CheckBox33_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox33.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }

    protected void CheckBox34_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox34.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }

    protected void CheckBox35_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox35.Checked == false)
        {
            CheckBox31.Checked = false;
        }
        else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
        {
            CheckBox31.Checked = true;
        }
    }

    protected void CheckBox38_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox38.Checked == false)
        {
            CheckBox37.Checked = false;
        }
        else if (CheckBox38.Checked == true && CheckBox41.Checked == true)
        {
            CheckBox37.Checked = true;
        }
    }

    protected void CheckBox41_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox41.Checked == false)
        {
            CheckBox37.Checked = false;
        }
        else if (CheckBox38.Checked == true && CheckBox41.Checked == true)
        {
            CheckBox37.Checked = true;
        }
    }

    /// <summary>
    /// Roles individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox50_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox50.Checked == false)
        {
            CheckBox49.Checked = false;
        }
        else if (CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox53.Checked == true)
        {
            CheckBox49.Checked = true;
        }
    }

    protected void CheckBox51_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox51.Checked == false)
        {
            CheckBox49.Checked = false;
        }
        else if (CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox53.Checked == true)
        {
            CheckBox49.Checked = true;
        }
    }

    protected void CheckBox53_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox53.Checked == false)
        {
            CheckBox49.Checked = false;
        }
        else if (CheckBox50.Checked == true && CheckBox51.Checked == true && CheckBox53.Checked == true)
        {
            CheckBox49.Checked = true;
        }
    }

    /// <summary>
    /// Company individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox56_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox56.Checked == false)
        {
            CheckBox55.Checked = false;
        }
        else if (CheckBox56.Checked == true && CheckBox57.Checked == true && CheckBox58.Checked == true && CheckBox59.Checked == true)
        {
            CheckBox55.Checked = true;
        }
    }

    protected void CheckBox57_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox57.Checked == false)
        {
            CheckBox55.Checked = false;
        }
        else if (CheckBox56.Checked == true && CheckBox57.Checked == true && CheckBox58.Checked == true && CheckBox59.Checked == true)
        {
            CheckBox55.Checked = true;
        }
    }

    protected void CheckBox58_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox58.Checked == false)
        {
            CheckBox55.Checked = false;
        }
        else if (CheckBox56.Checked == true && CheckBox57.Checked == true && CheckBox58.Checked == true && CheckBox59.Checked == true)
        {
            CheckBox55.Checked = true;
        }
    }

    protected void CheckBox59_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox59.Checked == false)
        {
            CheckBox55.Checked = false;
        }
        else if (CheckBox56.Checked == true && CheckBox57.Checked == true && CheckBox58.Checked == true && CheckBox59.Checked == true)
        {
            CheckBox55.Checked = true;
        }
    }

    /// <summary>
    /// Projects  individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox62_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox62.Checked == false)
        {
            CheckBox61.Checked = false;
        }
        else if (CheckBox62.Checked == true && CheckBox63.Checked == true && CheckBox64.Checked == true && CheckBox65.Checked == true)
        {
            CheckBox61.Checked = true;
        }
    }

    protected void CheckBox63_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox63.Checked == false)
        {
            CheckBox61.Checked = false;
        }
        else if (CheckBox62.Checked == true && CheckBox63.Checked == true && CheckBox64.Checked == true && CheckBox65.Checked == true)
        {
            CheckBox61.Checked = true;
        }
    }

    protected void CheckBox64_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox64.Checked == false)
        {
            CheckBox61.Checked = false;
        }
        else if (CheckBox62.Checked == true && CheckBox63.Checked == true && CheckBox64.Checked == true && CheckBox65.Checked == true)
        {
            CheckBox61.Checked = true;
        }
    }

    protected void CheckBox65_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox65.Checked == false)
        {
            CheckBox61.Checked = false;
        }
        else if (CheckBox62.Checked == true && CheckBox63.Checked == true && CheckBox64.Checked == true && CheckBox65.Checked == true)
        {
            CheckBox61.Checked = true;
        }
    }

    /// <summary>
    /// Departments individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox68_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox68.Checked == false)
        {
            CheckBox67.Checked = false;
        }
        else if (CheckBox68.Checked == true && CheckBox69.Checked == true && CheckBox70.Checked == true && CheckBox71.Checked == true)
        {
            CheckBox67.Checked = true;
        }
    }

    protected void CheckBox69_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox69.Checked == false)
        {
            CheckBox67.Checked = false;
        }
        else if (CheckBox68.Checked == true && CheckBox69.Checked == true && CheckBox70.Checked == true && CheckBox71.Checked == true)
        {
            CheckBox67.Checked = true;
        }
    }

    protected void CheckBox70_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox70.Checked == false)
        {
            CheckBox67.Checked = false;
        }
        else if (CheckBox68.Checked == true && CheckBox69.Checked == true && CheckBox70.Checked == true && CheckBox71.Checked == true)
        {
            CheckBox67.Checked = true;
        }
    }

    protected void CheckBox71_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox71.Checked == false)
        {
            CheckBox67.Checked = false;
        }
        else if (CheckBox68.Checked == true && CheckBox69.Checked == true && CheckBox70.Checked == true && CheckBox71.Checked == true)
        {
            CheckBox67.Checked = true;
        }
    }
    /// <summary>
    /// Clients individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox74_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox74.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }

    protected void CheckBox75_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox75.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }

    protected void CheckBox76_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox76.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }
    protected void CheckBox77_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox77.Checked == false)
        {
            CheckBox73.Checked = false;
        }
        else if (CheckBox74.Checked == true && CheckBox75.Checked == true && CheckBox76.Checked == true && CheckBox77.Checked == true)
        {
            CheckBox73.Checked = true;
        }
    }

    /// <summary>
    /// Vendors individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox80_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox80.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox72.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox81_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox81.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox72.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox82_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox82.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox72.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox72_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox72.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox72.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    protected void CheckBox83_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox83.Checked == false)
        {
            CheckBox79.Checked = false;
        }
        else if (CheckBox80.Checked == true && CheckBox81.Checked == true && CheckBox82.Checked == true && CheckBox72.Checked == true && CheckBox83.Checked == true)
        {
            CheckBox79.Checked = true;
        }
    }

    /// <summary>
    /// Appointments individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox86_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox86.Checked == false)
        {
            CheckBox85.Checked = false;
        }
        else if (CheckBox86.Checked == true && CheckBox87.Checked == true)
        {
            CheckBox85.Checked = true;
        }
    }

    protected void CheckBox87_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox87.Checked == false)
        {
            CheckBox85.Checked = false;
        }
        else if (CheckBox86.Checked == true && CheckBox87.Checked == true)
        {
            CheckBox85.Checked = true;
        }
    }
    /// <summary>
    /// Pay Roll individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox92_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox92.Checked == false)
        {
            CheckBox91.Checked = false;
        }
        else if (CheckBox92.Checked == true && CheckBox93.Checked == true)
        {
            CheckBox91.Checked = true;
        }
    }

    protected void CheckBox93_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox93.Checked == false)
        {
            CheckBox91.Checked = false;
        }
        else if (CheckBox92.Checked == true && CheckBox93.Checked == true)
        {
            CheckBox91.Checked = true;
        }
    }
    /// <summary>
    /// News & Events individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox98_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox98.Checked == false)
        {
            CheckBox97.Checked = false;
        }
        else if (CheckBox98.Checked == true && CheckBox99.Checked == true && CheckBox100.Checked == true && CheckBox101.Checked == true)
        {
            CheckBox97.Checked = true;
        }
    }

    protected void CheckBox99_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox98.Checked == false)
        {
            CheckBox97.Checked = false;
        }
        else if (CheckBox98.Checked == true && CheckBox99.Checked == true && CheckBox100.Checked == true && CheckBox101.Checked == true)
        {
            CheckBox97.Checked = true;
        }
    }

    protected void CheckBox100_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox100.Checked == false)
        {
            CheckBox97.Checked = false;
        }
        else if (CheckBox98.Checked == true && CheckBox99.Checked == true && CheckBox100.Checked == true && CheckBox101.Checked == true)
        {
            CheckBox97.Checked = true;
        }
    }

    protected void CheckBox101_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox101.Checked == false)
        {
            CheckBox97.Checked = false;
        }
        else if (CheckBox98.Checked == true && CheckBox99.Checked == true && CheckBox100.Checked == true && CheckBox101.Checked == true)
        {
            CheckBox97.Checked = true;
        }
    }

    /// <summary>
    /// USers individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox9.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }

    protected void CheckBox12_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox12.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox18_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox18.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox22_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox22.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }
    protected void CheckBox23_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox23.Checked == false)
        {
            CheckBox6.Checked = false;
        }
        else if (CheckBox9.Checked == true && CheckBox12.Checked == true && CheckBox18.Checked == true && CheckBox22.Checked == true && CheckBox23.Checked == true)
        {
            CheckBox6.Checked = true;
        }
    }

    /// <summary>
    ///  Emp Contacts individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox28_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox28.Checked == false)
        {
            CheckBox24.Checked = false;
        }
        else if (CheckBox28.Checked == true && CheckBox36.Checked == true && CheckBox39.Checked == true && CheckBox40.Checked == true)
        {
            CheckBox24.Checked = true;
        }
    }

    protected void CheckBox36_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox36.Checked == false)
        {
            CheckBox24.Checked = false;
        }
        else if (CheckBox28.Checked == true && CheckBox36.Checked == true && CheckBox39.Checked == true && CheckBox40.Checked == true)
        {
            CheckBox24.Checked = true;
        }
    }

    protected void CheckBox39_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox39.Checked == false)
        {
            CheckBox24.Checked = false;
        }
        else if (CheckBox28.Checked == true && CheckBox36.Checked == true && CheckBox39.Checked == true && CheckBox40.Checked == true)
        {
            CheckBox24.Checked = true;
        }
    }

    protected void CheckBox40_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox40.Checked == false)
        {
            CheckBox24.Checked = false;
        }
        else if (CheckBox28.Checked == true && CheckBox36.Checked == true && CheckBox39.Checked == true && CheckBox40.Checked == true)
        {
            CheckBox24.Checked = true;
        }
    }

    /// <summary>
    ///  Support individual checked changed  Y.Veeranjaneyulu    3-8-2016
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox48_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox48.Checked == false)
        {
            CheckBox43.Checked = false;
        }
        else if (CheckBox48.Checked == true && CheckBox52.Checked == true)
        {
            CheckBox43.Checked = true;
        }
    }
    protected void CheckBox52_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox52.Checked == false)
        {
            CheckBox43.Checked = false;
        }
        else if (CheckBox48.Checked == true && CheckBox52.Checked == true)
        {
            CheckBox52.Checked = true;
        }
    }

    /// daily Timesheet  select all                           added on13-08-2018  by Y.Veeranjaneyulu
    protected void CheckBox42_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox42.Checked == true)
        {
            CheckBox44.Checked = true;
            CheckBox47.Checked = true;
            CheckBox78.Checked = true;
        }
        else
        {
            CheckBox44.Checked = false;
            CheckBox47.Checked = false;
            CheckBox78.Checked = false;
        }
    }

    protected void CheckBox44_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox44.Checked == false)
        {
            CheckBox42.Checked = false;
        }
        else if (CheckBox44.Checked == true && CheckBox47.Checked == true && CheckBox78.Checked == true)
        {
            CheckBox42.Checked = true;
        }
    }

    protected void CheckBox47_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox47.Checked == false)
        {
            CheckBox42.Checked = false;
        }
        else if (CheckBox44.Checked == true && CheckBox47.Checked == true && CheckBox78.Checked == true)
        {
            CheckBox42.Checked = true;
        }
    }

    protected void CheckBox78_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox78.Checked == false)
        {
            CheckBox42.Checked = false;
        }
        else if (CheckBox44.Checked == true && CheckBox47.Checked == true && CheckBox78.Checked == true)
        {
            CheckBox42.Checked = true;
        }
    }
    protected void CheckBox88_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox88.Checked == true)
        {
            CheckBox89.Checked = true;
            CheckBox90.Checked = true;
            CheckBox94.Checked = true;
            CheckBox95.Checked = true;
        }
        else
        {
            CheckBox89.Checked = false;
            CheckBox90.Checked = false;
            CheckBox94.Checked = false;
            CheckBox95.Checked = false;
        }
    }
    protected void CheckBox89_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox89.Checked == false)
        {
            CheckBox88.Checked = false;
        }
        else if (CheckBox89.Checked == true && CheckBox90.Checked == true && CheckBox94.Checked == true && CheckBox95.Checked == true)
        {
            CheckBox88.Checked = true;
        }
    }
    protected void CheckBox90_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox90.Checked == false)
        {
            CheckBox88.Checked = false;
        }
        else if (CheckBox89.Checked == true && CheckBox90.Checked == true && CheckBox94.Checked == true && CheckBox95.Checked == true)
        {
            CheckBox88.Checked = true;
        }
    }
    protected void CheckBox94_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox94.Checked == false)
        {
            CheckBox88.Checked = false;
        }
        else if (CheckBox89.Checked == true && CheckBox90.Checked == true && CheckBox94.Checked == true && CheckBox95.Checked == true)
        {
            CheckBox88.Checked = true;
        }
    }
    protected void CheckBox95_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox95.Checked == false)
        {
            CheckBox88.Checked = false;
        }
        else if (CheckBox89.Checked == true && CheckBox90.Checked == true && CheckBox94.Checked == true && CheckBox95.Checked == true)
        {
            CheckBox88.Checked = true;
        }
    }
    protected void CheckBox96_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox96.Checked == true)
        {
            CheckBox102.Checked = true;
            CheckBox46.Checked = true;
            CheckBox105.Checked = true;
        }
        else
        {
            CheckBox102.Checked = false;
            CheckBox46.Checked = false;
            CheckBox105.Checked = false;
        }
    }
    protected void CheckBox102_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox102.Checked == false)
        {
            CheckBox96.Checked = false;
        }
        else if (CheckBox102.Checked == true && CheckBox46.Checked == true && CheckBox105.Checked == true )
        {
            CheckBox96.Checked = true;
        }
    }
    protected void CheckBox46_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox46.Checked == false)
        {
            CheckBox96.Checked = false;
        }
        else if (CheckBox102.Checked == true && CheckBox46.Checked == true && CheckBox105.Checked == true)
        {
            CheckBox96.Checked = true;
        }
    }
    protected void CheckBox105_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox105.Checked == false)
        {
            CheckBox96.Checked = false;
        }
        else if (CheckBox102.Checked == true && CheckBox46.Checked == true && CheckBox105.Checked == true)
        {
            CheckBox96.Checked = true;
        }
    }
    protected void CheckBox106_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox106.Checked == true)
        {
            CheckBox107.Checked = true;
            CheckBox108.Checked = true;
            CheckBox109.Checked = true;
            CheckBox110.Checked = true;
        }
        else
        {
            CheckBox107.Checked = false;
            CheckBox108.Checked = false;
            CheckBox109.Checked = false;
            CheckBox110.Checked = false;
        }
    }
    protected void CheckBox107_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox107.Checked == false)
        {
            CheckBox106.Checked = false;
        }
        else if (CheckBox107.Checked == true && CheckBox108.Checked == true && CheckBox109.Checked == true && CheckBox110.Checked == true)
        {
            CheckBox106.Checked = true;
        }
    }
    protected void CheckBox108_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox108.Checked == false)
        {
            CheckBox106.Checked = false;
        }
        else if (CheckBox107.Checked == true && CheckBox108.Checked == true && CheckBox109.Checked == true && CheckBox110.Checked == true)
        {
            CheckBox106.Checked = true;
        }
    }
    protected void CheckBox109_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox109.Checked == false)
        {
            CheckBox106.Checked = false;
        }
        else if (CheckBox107.Checked == true && CheckBox108.Checked == true && CheckBox109.Checked == true && CheckBox110.Checked == true)
        {
            CheckBox106.Checked = true;
        }
    }
    protected void CheckBox110_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox110.Checked == false)
        {
            CheckBox106.Checked = false;
        }
        else if (CheckBox107.Checked == true && CheckBox108.Checked == true && CheckBox109.Checked == true && CheckBox110.Checked == true)
        {
            CheckBox106.Checked = true;
        }
    }

    protected void CheckBox112_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox112.Checked == true)
        {
            CheckBox113.Checked = true;
            CheckBox114.Checked = true;
            CheckBox115.Checked = true;
            CheckBox116.Checked = true;
        }
        else
        {
            CheckBox113.Checked = false;
            CheckBox114.Checked = false;
            CheckBox115.Checked = false;
            CheckBox116.Checked = false;
        }
    }
    protected void CheckBox113_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox113.Checked == false)
        {
            CheckBox112.Checked = false;
        }
        else if (CheckBox113.Checked == true && CheckBox114.Checked == true && CheckBox115.Checked == true && CheckBox116.Checked == true)
        {
            CheckBox112.Checked = true;
        }
    }

    protected void CheckBox114_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox114.Checked == false)
        {
            CheckBox112.Checked = false;
        }
        else if (CheckBox113.Checked == true && CheckBox114.Checked == true && CheckBox115.Checked == true && CheckBox116.Checked == true)
        {
            CheckBox112.Checked = true;
        }
    }
    protected void CheckBox115_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox115.Checked == false)
        {
            CheckBox112.Checked = false;
        }
        else if (CheckBox113.Checked == true && CheckBox114.Checked == true && CheckBox115.Checked == true && CheckBox116.Checked == true)
        {
            CheckBox112.Checked = true;
        }
    }
    protected void CheckBox116_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox116.Checked == false)
        {
            CheckBox112.Checked = false;
        }
        else if (CheckBox113.Checked == true && CheckBox114.Checked == true && CheckBox115.Checked == true && CheckBox116.Checked == true)
        {
            CheckBox112.Checked = true;
        }
    }
    protected void CheckBox117_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox17.Checked == true)
        {
            CheckBox118.Checked = true;
            CheckBox119.Checked = true;
            CheckBox84.Checked = true;
        }
        else
        {
            CheckBox118.Checked = false;
            CheckBox119.Checked = false;
            CheckBox84.Checked = false;
        }
    }
    protected void CheckBox118_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox118.Checked == false)
        {
            CheckBox117.Checked = false;
        }
        else if (CheckBox118.Checked == true && CheckBox119.Checked == true && CheckBox84.Checked == true )
        {
            CheckBox117.Checked = true;
        }
    }
    protected void CheckBox119_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox119.Checked == false)
        {
            CheckBox117.Checked = false;
        }
        else if (CheckBox118.Checked == true && CheckBox119.Checked == true && CheckBox84.Checked == true)
        {
            CheckBox117.Checked = true;
        }
    }
    protected void CheckBox84_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox84.Checked == false)
        {
            CheckBox117.Checked = false;
        }
        else if (CheckBox118.Checked == true && CheckBox119.Checked == true && CheckBox84.Checked == true)
        {
            CheckBox117.Checked = true;
        }
    }
    protected void CheckBox120_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox120.Checked == true)
        {
            CheckBox121.Checked = true;
            CheckBox122.Checked = true;
            CheckBox123.Checked = true;
            CheckBox124.Checked = true;
        }
        else
        {
            CheckBox121.Checked = false;
            CheckBox122.Checked = false;
            CheckBox123.Checked = false;
            CheckBox124.Checked = false;
        }
    }
    protected void CheckBox121_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox121.Checked == false)
        {
            CheckBox120.Checked = false;
        }
        else if (CheckBox121.Checked == true && CheckBox122.Checked == true && CheckBox123.Checked == true && CheckBox124.Checked == true)
        {
            CheckBox120.Checked = true;
        }
    }
    protected void CheckBox122_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox122.Checked == false)
        {
            CheckBox120.Checked = false;
        }
        else if (CheckBox121.Checked == true && CheckBox122.Checked == true && CheckBox123.Checked == true && CheckBox124.Checked == true)
        {
            CheckBox120.Checked = true;
        }
    }
    protected void CheckBox123_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox123.Checked == false)
        {
            CheckBox120.Checked = false;
        }
        else if (CheckBox121.Checked == true && CheckBox122.Checked == true && CheckBox123.Checked == true && CheckBox124.Checked == true)
        {
            CheckBox120.Checked = true;
        }
    }
    protected void CheckBox124_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox124.Checked == false)
        {
            CheckBox120.Checked = false;
        }
        else if (CheckBox121.Checked == true && CheckBox122.Checked == true && CheckBox123.Checked == true && CheckBox124.Checked == true)
        {
            CheckBox120.Checked = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    //h1b list for individual
    protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox8.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox10.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox11.Checked == false)
        {
            CheckBox7.Checked = false;
        }
        else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
        {
            CheckBox7.Checked = true;
        }
    }
    protected void CheckBox125_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox125.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }
    protected void CheckBox126_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox126.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }
    protected void CheckBox127_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox127.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }
    protected void CheckBox128_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox128.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }
    protected void CheckBox111_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox111.Checked == true)
        {
            CheckBox125.Checked = true;
            CheckBox126.Checked = true;
            CheckBox127.Checked = true;
            CheckBox128.Checked = true;
        }
        else
        {
            CheckBox125.Checked = false;
            CheckBox126.Checked = false;
            CheckBox127.Checked = false;
            CheckBox128.Checked = false;
        }
    }
    protected void ddlUserType_TextChanged(object sender, EventArgs e)
    {

    }
}
