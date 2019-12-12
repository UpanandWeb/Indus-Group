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
using System.Web.Configuration;

public partial class admin_Admin_EditUser : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    AdminCS obj = new AdminCS();
    DataSet ds = new DataSet();
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
    int usid = 0;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
                SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
                ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                DataSet ds1 = obj.GetAvailabilityofUserId(txtUserId.Text);
                if (!ds1.Tables[0].Rows.Count.Equals(0))
                { 
                    lblStatus.Text = "User Already Exist";
                }
                else
                {
                    lblStatus.Text = "User Available";
                }

                obj.FillUserType(ddleddesgn);
                usid = Convert.ToInt32(Request.QueryString["rid"].ToString());
                dsgetUserIdData = obj.GetParticularUserData(usid);
                if (!dsgetUserIdData.Tables[0].Rows.Count.Equals(0))
                {
                    txtedfname.Text = dsgetUserIdData.Tables[0].Rows[0]["FName"].ToString();
                    txtedlname.Text = dsgetUserIdData.Tables[0].Rows[0]["LName"].ToString();
                    txtedpwd.Text = dsgetUserIdData.Tables[0].Rows[0]["Password"].ToString();
                    txtedaddress.Text = dsgetUserIdData.Tables[0].Rows[0]["Address"].ToString();
                    txtUserId.Text = dsgetUserIdData.Tables[0].Rows[0]["UserId"].ToString();
                    txtedcontact.Text = dsgetUserIdData.Tables[0].Rows[0]["PhNo"].ToString();
                    txtedmob.Text = dsgetUserIdData.Tables[0].Rows[0]["mobile"].ToString();
                    txtedmail.Text = dsgetUserIdData.Tables[0].Rows[0]["EmailId"].ToString();
                    ddleddesgn.ClearSelection();
                    ddleddesgn.Items.FindByText(dsgetUserIdData.Tables[0].Rows[0]["Designation"].ToString()).Selected = true;
                    txtedmob.Text = dsgetUserIdData.Tables[0].Rows[0]["mobile"].ToString();
                    ddledcountry.ClearSelection();
                    ddledcountry.Items.FindByText(dsgetUserIdData.Tables[0].Rows[0]["Country"].ToString()).Selected = true;

                    if (dsgetUserIdData.Tables[0].Rows[0]["ImmigDocs_View"].ToString() == "1")
                    {
                        CheckBox125.Checked = true;
                    }
                    else
                    {
                        CheckBox125.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ImmigDocs_Download"].ToString() == "1")
                    {
                        CheckBox129.Checked = true;
                    }
                    else
                    {
                        CheckBox129.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ImmigDocs_Post"].ToString() == "1")
                    {
                        CheckBox126.Checked = true;
                    }
                    else
                    {
                        CheckBox126.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ImmigDocs_Edit"].ToString() == "1")
                    {
                        CheckBox127.Checked = true;
                    }
                    else
                    {
                        CheckBox127.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ImmigDocs_Delete"].ToString() == "1")
                    {
                        CheckBox128.Checked = true;
                    }
                    else
                    {
                        CheckBox128.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["AccDocs_View"].ToString() == "1")
                    {
                        CheckBox131.Checked = true;
                    }
                    else
                    {
                        CheckBox131.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["AccDocs_Download"].ToString() == "1")
                    {
                        CheckBox135.Checked = true;
                    }
                    else
                    {
                        CheckBox135.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["AccDocs_Post"].ToString() == "1")
                    {
                        CheckBox132.Checked = true;
                    }
                    else
                    {
                        CheckBox132.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["AccDocs_Edit"].ToString() == "1")
                    {
                        CheckBox133.Checked = true;
                    }
                    else
                    {
                        CheckBox133.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["AccDocs_Delete"].ToString() == "1")
                    {
                        CheckBox134.Checked = true;
                    }
                    else
                    {
                        CheckBox134.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["HRDocs_View"].ToString() == "1")
                    {
                        CheckBox137.Checked = true;
                    }
                    else
                    {
                        CheckBox137.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["HRDocs_Download"].ToString() == "1")
                    {
                        CheckBox141.Checked = true;
                    }
                    else
                    {
                        CheckBox141.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["HRDocs_Post"].ToString() == "1")
                    {
                        CheckBox138.Checked = true;
                    }
                    else
                    {
                        CheckBox138.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["HRDocs_Edit"].ToString() == "1")
                    {
                        CheckBox139.Checked = true;
                    }
                    else
                    {
                        CheckBox139.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["HRDocs_Delete"].ToString() == "1")
                    {
                        CheckBox140.Checked = true;
                    }
                    else
                    {
                        CheckBox140.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["DailyReports_View"].ToString() == "1")
                    {
                        CheckBox149.Checked = true;
                    }
                    else
                    {
                        CheckBox149.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["DailyReports_Download"].ToString() == "1")
                    {
                        CheckBox153.Checked = true;
                    }
                    else
                    {
                        CheckBox153.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["DailyReports_Post"].ToString() == "1")
                    {
                        CheckBox150.Checked = true;
                    }
                    else
                    {
                        CheckBox150.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["DailyReports_Delete"].ToString() == "1")
                    {
                        CheckBox152.Checked = true;
                    }
                    else
                    {
                        CheckBox152.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["DailyReports_Edit"].ToString() == "1")
                    {
                        CheckBox151.Checked = true;
                    }
                    else
                    {
                        CheckBox151.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["ARPDocs_View"].ToString() == "1")
                    {
                        CheckBox143.Checked = true;
                    }
                    else
                    {
                        CheckBox143.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ARPDocs_Download"].ToString() == "1")
                    {
                        CheckBox147.Checked = true;
                    }
                    else
                    {
                        CheckBox147.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ARPDocs_Post"].ToString() == "1")
                    {
                        CheckBox144.Checked = true;
                    }
                    else
                    {
                        CheckBox144.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ARPDocs_Edit"].ToString() == "1")
                    {
                        CheckBox145.Checked = true;
                    }
                    else
                    {
                        CheckBox145.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["ARPDocs_Delete"].ToString() == "1")
                    {
                        CheckBox146.Checked = true;
                    }
                    else
                    {
                        CheckBox146.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["Leaves_View"].ToString() == "1")
                    {
                        CheckBox155.Checked = true;
                    }
                    else
                    {
                        CheckBox155.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Leaves_Post"].ToString() == "1")
                    {
                        CheckBox156.Checked = true;
                    }
                    else
                    {
                        CheckBox156.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Leaves_Delete"].ToString() == "1")
                    {
                        CheckBox158.Checked = true;
                    }
                    else
                    {
                        CheckBox158.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Leaves_Edit"].ToString() == "1")
                    {
                        CheckBox157.Checked = true;
                    }
                    else
                    {
                        CheckBox157.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Leaves_Download"].ToString() == "1")
                    {
                        CheckBox159.Checked = true;
                    }
                    else
                    {
                        CheckBox159.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["Resume_View"].ToString() == "1")
                    {
                        CheckBox179.Checked = true;
                    }
                    else
                    {
                        CheckBox179.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Resume_Post"].ToString() == "1")
                    {
                        CheckBox180.Checked = true;
                    }
                    else
                    {
                        CheckBox180.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Resume_Edit"].ToString() == "1")
                    {
                        CheckBox181.Checked = true;
                    }
                    else
                    {
                        CheckBox181.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Resume_Delete"].ToString() == "1")
                    {
                        CheckBox182.Checked = true;
                    }
                    else
                    {
                        CheckBox182.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Resume_Download"].ToString() == "1")
                    {
                        CheckBox183.Checked = true;
                    }
                    else
                    {
                        CheckBox183.Checked = false;
                    }

                    if (dsgetUserIdData.Tables[0].Rows[0]["WrdDocs_View"].ToString() == "1")
                    {
                        CheckBox173.Checked = true;
                    }
                    else
                    {
                        CheckBox173.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["WrdDocs_Post"].ToString() == "1")
                    {
                        CheckBox174.Checked = true;
                    }
                    else
                    {
                        CheckBox174.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["WrdDocs_Edit"].ToString() == "1")
                    {
                        CheckBox175.Checked = true;
                    }
                    else
                    {
                        CheckBox175.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["WrdDocs_Delete"].ToString() == "1")
                    {
                        CheckBox176.Checked = true;
                    }
                    else
                    {
                        CheckBox176.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["WrdDocs_Download"].ToString() == "1")
                    {
                        CheckBox177.Checked = true;
                    }
                    else
                    {
                        CheckBox177.Checked = false;
                    }


                    if (dsgetUserIdData.Tables[0].Rows[0]["EmpDoc_View"].ToString() == "1")
                    {
                        CheckBox167.Checked = true;
                    }
                    else
                    {
                        CheckBox167.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["EmpDoc_Post"].ToString() == "1")
                    {
                        CheckBox168.Checked = true;
                    }
                    else
                    {
                        CheckBox168.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["EmpDoc_Edit"].ToString() == "1")
                    {
                        CheckBox169.Checked = true;
                    }
                    else
                    {
                        CheckBox169.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["EmpDoc_Delete"].ToString() == "1")
                    {
                        CheckBox170.Checked = true;
                    }
                    else
                    {
                        CheckBox170.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["EmpDoc_Download"].ToString() == "1")
                    {
                        CheckBox171.Checked = true;
                    }
                    else
                    {
                        CheckBox171.Checked = false;
                    }

                    if (dsgetUserIdData.Tables[0].Rows[0]["Excel_View"].ToString() == "1")
                    {
                        CheckBox161.Checked = true;
                    }
                    else
                    {
                        CheckBox161.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Excel_Post"].ToString() == "1")
                    {
                        CheckBox162.Checked = true;
                    }
                    else
                    {
                        CheckBox162.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Excel_Edit"].ToString() == "1")
                    {
                        CheckBox163.Checked = true;
                    }
                    else
                    {
                        CheckBox163.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Excel_Delete"].ToString() == "1")
                    {
                        CheckBox164.Checked = true;
                    }
                    else
                    {
                        CheckBox164.Checked = false;
                    }
                    if (dsgetUserIdData.Tables[0].Rows[0]["Excel_Download"].ToString() == "1")
                    {
                        CheckBox165.Checked = true;
                    }
                    else
                    {
                        CheckBox165.Checked = false;
                    }


                    DataSet ds = new DataSet();
                    SqlDataAdapter sdaa = new SqlDataAdapter("select * from user_menu where mid='" + usid + "'", con);
                    sdaa.Fill(ds);
                    if (!ds.Tables[0].Rows.Count.Equals(0))
                    {
                        if (ds.Tables[0].Rows[0]["empview"].ToString() == "1")
                        {
                            CheckBox2.Checked = true;
                        }
                        else
                        {
                            CheckBox2.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["emppost"].ToString() == "1")
                        {
                            CheckBox3.Checked = true;
                        }
                        else
                        {
                            CheckBox3.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["empedit"].ToString() == "1")
                        {
                            CheckBox4.Checked = true;
                        }
                        else
                        {
                            CheckBox4.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["empdelete"].ToString() == "1")
                        {
                            CheckBox5.Checked = true;
                        }
                        else
                        {
                            CheckBox5.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["h1bview"].ToString() == "1")
                        {
                            CheckBox8.Checked = true;
                        }
                        else
                        {
                            CheckBox8.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["h1bedit"].ToString() == "1")
                        {
                            CheckBox10.Checked = true;
                        }
                        else
                        {
                            CheckBox10.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["h1bdelete"].ToString() == "1")
                        {
                            CheckBox11.Checked = true;
                        }
                        else
                        {
                            CheckBox11.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["profileview"].ToString() == "1")
                        {
                            CheckBox60.Checked = true;
                        }
                        else
                        {
                            CheckBox60.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["profilepost"].ToString() == "1")
                        {
                            CheckBox66.Checked = true;
                        }
                        else
                        {
                            CheckBox66.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["profileedit"].ToString() == "1")
                        {
                            CheckBox103.Checked = true;
                        }
                        else
                        {
                            CheckBox103.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["profiledelete"].ToString() == "1")
                        {
                            CheckBox104.Checked = true;
                        }
                        else
                        {
                            CheckBox104.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["careersview"].ToString() == "1")
                        {
                            CheckBox14.Checked = true;
                        }
                        else
                        {
                            CheckBox14.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["careerspost"].ToString() == "1")
                        {
                            CheckBox15.Checked = true;
                        }
                        else
                        {
                            CheckBox15.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["careersedit"].ToString() == "1")
                        {
                            CheckBox16.Checked = true;
                        }
                        else
                        {
                            CheckBox16.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["careersdelete"].ToString() == "1")
                        {
                            CheckBox17.Checked = true;
                        }
                        else
                        {
                            CheckBox17.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["timeview"].ToString() == "1")
                        {
                            CheckBox20.Checked = true;
                        }
                        else
                        {
                            CheckBox20.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["timepost"].ToString() == "1")
                        {
                            CheckBox21.Checked = true;
                        }
                        else
                        {
                            CheckBox21.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["documentsview"].ToString() == "1")
                        {
                            CheckBox26.Checked = true;
                        }
                        else
                        {
                            CheckBox26.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["documentspost"].ToString() == "1")
                        {
                            CheckBox27.Checked = true;
                        }
                        else
                        {
                            CheckBox27.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["documentselete"].ToString() == "1")
                        {
                            CheckBox29.Checked = true;
                        }
                        else
                        {
                            CheckBox29.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["documentsdownload"].ToString() == "1")
                        {
                            CheckBox30.Checked = true;
                        }
                        else
                        {
                            CheckBox30.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["seminarsview"].ToString() == "1")
                        {
                            CheckBox32.Checked = true;
                        }
                        else
                        {
                            CheckBox32.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["seminarspost"].ToString() == "1")
                        {
                            CheckBox33.Checked = true;
                        }
                        else
                        {
                            CheckBox33.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["seminarsedit"].ToString() == "1")
                        {
                            CheckBox34.Checked = true;
                        }
                        else
                        {
                            CheckBox34.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["seminarsdelete"].ToString() == "1")
                        {
                            CheckBox35.Checked = true;
                        }
                        else
                        {
                            CheckBox35.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["feedbackview"].ToString() == "1")
                        {
                            CheckBox38.Checked = true;
                        }
                        else
                        {
                            CheckBox38.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["feedbackdelete"].ToString() == "1")
                        {
                            CheckBox41.Checked = true;
                        }
                        else
                        {
                            CheckBox41.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["performancepost"].ToString() == "1")
                        {
                            CheckBox45.Checked = true;
                        }
                        else
                        {
                            CheckBox45.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["rolesview"].ToString() == "1")
                        {
                            CheckBox50.Checked = true;
                        }
                        else
                        {
                            CheckBox50.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["rolespost"].ToString() == "1")
                        {
                            CheckBox51.Checked = true;
                        }
                        else
                        {
                            CheckBox51.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["rolesdelete"].ToString() == "1")
                        {
                            CheckBox53.Checked = true;
                        }
                        else
                        {
                            CheckBox53.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["companyview"].ToString() == "1")
                        {
                            CheckBox56.Checked = true;
                        }
                        else
                        {
                            CheckBox56.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["companypost"].ToString() == "1")
                        {
                            CheckBox57.Checked = true;
                        }
                        else
                        {
                            CheckBox57.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["companyedit"].ToString() == "1")
                        {
                            CheckBox58.Checked = true;
                        }
                        else
                        {
                            CheckBox58.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["companydelete"].ToString() == "1")
                        {
                            CheckBox59.Checked = true;
                        }
                        else
                        {
                            CheckBox59.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["projectsview"].ToString() == "1")
                        {
                            CheckBox62.Checked = true;
                        }
                        else
                        {
                            CheckBox62.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["projectspost"].ToString() == "1")
                        {
                            CheckBox63.Checked = true;
                        }
                        else
                        {
                            CheckBox63.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["projectsedit"].ToString() == "1")
                        {
                            CheckBox64.Checked = true;
                        }
                        else
                        {
                            CheckBox64.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["projectsdelete"].ToString() == "1")
                        {
                            CheckBox65.Checked = true;
                        }
                        else
                        {
                            CheckBox65.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["departmentview"].ToString() == "1")
                        {
                            CheckBox68.Checked = true;
                        }
                        else
                        {
                            CheckBox68.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["departmentpost"].ToString() == "1")
                        {
                            CheckBox69.Checked = true;
                        }
                        else
                        {
                            CheckBox69.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["departmentedit"].ToString() == "1")
                        {
                            CheckBox70.Checked = true;
                        }
                        else
                        {
                            CheckBox70.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["departmentdelete"].ToString() == "1")
                        {
                            CheckBox71.Checked = true;
                        }
                        else
                        {
                            CheckBox71.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["clientview"].ToString() == "1")
                        {
                            CheckBox74.Checked = true;
                        }
                        else
                        {
                            CheckBox74.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["clientpost"].ToString() == "1")
                        {
                            CheckBox75.Checked = true;
                        }
                        else
                        {
                            CheckBox75.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["clientedit"].ToString() == "1")
                        {
                            CheckBox76.Checked = true;
                        }
                        else
                        {
                            CheckBox76.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["clientdelete"].ToString() == "1")
                        {
                            CheckBox77.Checked = true;
                        }
                        else
                        {
                            CheckBox77.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["vendorview"].ToString() == "1")
                        {
                            CheckBox80.Checked = true;
                        }
                        else
                        {
                            CheckBox80.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["vendorpost"].ToString() == "1")
                        {
                            CheckBox81.Checked = true;
                        }
                        else
                        {
                            CheckBox81.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["vendoredit"].ToString() == "1")
                        {
                            CheckBox82.Checked = true;
                        }
                        else
                        {
                            CheckBox82.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["vendorstatus"].ToString() == "1")
                        {
                            CheckBox72.Checked = true;
                        }
                        else
                        {
                            CheckBox72.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["vendordelete"].ToString() == "1")
                        {
                            CheckBox83.Checked = true;
                        }
                        else
                        {
                            CheckBox83.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["appointmentview"].ToString() == "1")
                        {
                            CheckBox86.Checked = true;
                        }
                        else
                        {
                            CheckBox86.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["appointmentpost"].ToString() == "1")
                        {
                            CheckBox87.Checked = true;
                        }
                        else
                        {
                            CheckBox87.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["payview"].ToString() == "1")
                        {
                            CheckBox92.Checked = true;
                        }
                        else
                        {
                            CheckBox92.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["paypost"].ToString() == "1")
                        {
                            CheckBox93.Checked = true;
                        }
                        else
                        {
                            CheckBox93.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["newsview"].ToString() == "1")
                        {
                            CheckBox98.Checked = true;
                        }
                        else
                        {
                            CheckBox98.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["newspost"].ToString() == "1")
                        {
                            CheckBox99.Checked = true;
                        }
                        else
                        {
                            CheckBox99.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["newsedit"].ToString() == "1")
                        {
                            CheckBox100.Checked = true;
                        }
                        else
                        {
                            CheckBox100.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["newsdelete"].ToString() == "1")
                        {
                            CheckBox101.Checked = true;
                        }
                        else
                        {
                            CheckBox101.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["usersview"].ToString() == "1")
                        {
                            CheckBox9.Checked = true;
                        }
                        else
                        {
                            CheckBox9.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["userspost"].ToString() == "1")
                        {
                            CheckBox12.Checked = true;
                        }
                        else
                        {
                            CheckBox12.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["usersedit"].ToString() == "1")
                        {
                            CheckBox18.Checked = true;
                        }
                        else
                        {
                            CheckBox18.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["usersdelete"].ToString() == "1")
                        {
                            CheckBox22.Checked = true;
                        }
                        else
                        {
                            CheckBox22.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["usersstatus"].ToString() == "1")
                        {
                            CheckBox23.Checked = true;
                        }
                        else
                        {
                            CheckBox23.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["empconview"].ToString() == "1")
                        {
                            CheckBox28.Checked = true;
                        }
                        else
                        {
                            CheckBox28.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["empconpost"].ToString() == "1")
                        {
                            CheckBox36.Checked = true;
                        }
                        else
                        {
                            CheckBox36.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["empconedit"].ToString() == "1")
                        {
                            CheckBox39.Checked = true;
                        }
                        else
                        {
                            CheckBox39.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["empcondelete"].ToString() == "1")
                        {
                            CheckBox40.Checked = true;
                        }
                        else
                        {
                            CheckBox40.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["supportdelete"].ToString() == "1")
                        {
                            CheckBox48.Checked = true;
                        }
                        else
                        {
                            CheckBox48.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["supportdownload"].ToString() == "1")
                        {
                            CheckBox52.Checked = true;
                        }
                        else
                        {
                            CheckBox52.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["dailyview"].ToString() == "1")
                        {
                            CheckBox44.Checked = true;
                        }
                        else
                        {
                            CheckBox44.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Dailyedit"].ToString() == "1")
                        {
                            CheckBox47.Checked = true;
                        }
                        else
                        {
                            CheckBox47.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Dailydelete"].ToString() == "1")
                        {
                            CheckBox78.Checked = true;
                        }
                        else
                        {
                            CheckBox78.Checked = false;
                        }



                        if (ds.Tables[0].Rows[0]["Invoicingview"].ToString() == "1")
                        {
                            CheckBox89.Checked = true;
                        }
                        else
                        {
                            CheckBox89.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Invoicingpost"].ToString() == "1")
                        {
                            CheckBox90.Checked = true;
                        }
                        else
                        {
                            CheckBox90.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Invoicingedit"].ToString() == "1")
                        {
                            CheckBox94.Checked = true;
                        }
                        else
                        {
                            CheckBox94.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Invoicingdelete"].ToString() == "1")
                        {
                            CheckBox95.Checked = true;
                        }
                        else
                        {
                            CheckBox95.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["Principlesview"].ToString() == "1")
                        {
                            CheckBox102.Checked = true;
                        }
                        else
                        {
                            CheckBox102.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Principlesedit"].ToString() == "1")
                        {
                            CheckBox46.Checked = true;
                        }
                        else
                        {
                            CheckBox46.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Principlesdelete"].ToString() == "1")
                        {
                            CheckBox105.Checked = true;
                        }
                        else
                        {
                            CheckBox105.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["Calenderview"].ToString() == "1")
                        {
                            CheckBox107.Checked = true;
                        }
                        else
                        {
                            CheckBox107.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Calenderpost"].ToString() == "1")
                        {
                            CheckBox108.Checked = true;
                        }
                        else
                        {
                            CheckBox108.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Calenderedit"].ToString() == "1")
                        {
                            CheckBox109.Checked = true;
                        }
                        else
                        {
                            CheckBox109.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Calenderdelete"].ToString() == "1")
                        {
                            CheckBox110.Checked = true;
                        }
                        else
                        {
                            CheckBox110.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["Reportsview"].ToString() == "1")
                        {
                            CheckBox113.Checked = true;
                        }
                        else
                        {
                            CheckBox113.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Reportsedit"].ToString() == "1")
                        {
                            CheckBox114.Checked = true;
                        }
                        else
                        {
                            CheckBox114.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Reportsdelete"].ToString() == "1")
                        {
                            CheckBox115.Checked = true;
                        }
                        else
                        {
                            CheckBox115.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Reportsdownload"].ToString() == "1")
                        {
                            CheckBox116.Checked = true;
                        }
                        else
                        {
                            CheckBox116.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["Salaryview"].ToString() == "1")
                        {
                            CheckBox118.Checked = true;
                        }
                        else
                        {
                            CheckBox118.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Salaryedit"].ToString() == "1")
                        {
                            CheckBox119.Checked = true;
                        }
                        else
                        {
                            CheckBox119.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Salarydelete"].ToString() == "1")
                        {
                            CheckBox84.Checked = true;
                        }
                        else
                        {
                            CheckBox84.Checked = false;
                        }


                        if (ds.Tables[0].Rows[0]["Currentview"].ToString() == "1")
                        {
                            CheckBox121.Checked = true;
                        }
                        else
                        {
                            CheckBox121.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Currentpost"].ToString() == "1")
                        {
                            CheckBox122.Checked = true;
                        }
                        else
                        {
                            CheckBox122.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Currentedit"].ToString() == "1")
                        {
                            CheckBox123.Checked = true;
                        }
                        else
                        {
                            CheckBox123.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["Currentdelete"].ToString() == "1")
                        {
                            CheckBox124.Checked = true;
                        }
                        else
                        {
                            CheckBox124.Checked = false;
                        }

                        if (ds.Tables[0].Rows[0]["checklistview"].ToString() == "1")
                        {
                            CheckBox185.Checked = true;
                        }
                        else
                        {
                            CheckBox185.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["checklistpost"].ToString() == "1")
                        {
                            CheckBox186.Checked = true;
                        }
                        else
                        {
                            CheckBox186.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["checklistedit"].ToString() == "1")
                        {
                            CheckBox187.Checked = true;
                        }
                        else
                        {
                            CheckBox187.Checked = false;
                        }
                        if (ds.Tables[0].Rows[0]["checklistdelete"].ToString() == "1")
                        {
                            CheckBox188.Checked = true;
                        }
                        else
                        {
                            CheckBox188.Checked = false;
                        }
                    }
                }
            }
        }
    }

    protected void txtUserId_TextChanged(object sender, EventArgs e)
    {
        ds = obj.GetAvailabilityofUserId(txtUserId.Text);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            lblStatus.Text = "User Already Exist";
        }
        else
        {
            lblStatus.Text = "User Available";
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (lblStatus.Text == "User Available")
        {
            usid = Convert.ToInt32(Request.QueryString["rid"].ToString());

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

            if (rddailyy2.Checked == true)
            {
                if ( (CheckBox44.Checked == true) || (CheckBox47.Checked == true) || (CheckBox78.Checked == true))
                {
                    string support = "Daily Timesheet";
                    menulist.Add(support);
                }
            }

            if (rdInvoicingy.Checked == true)
            {
                if ( (CheckBox89.Checked == true) || (CheckBox90.Checked == true) || (CheckBox94.Checked == true) || (CheckBox95.Checked == true))
                {
                    string support = "Invoicing";
                    menulist.Add(support);
                }
            }

            if (rdpriny.Checked == true)
            {
                if ( (CheckBox102.Checked == true) || (CheckBox46.Checked == true) || (CheckBox105.Checked == true))
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
                if ( (CheckBox118.Checked == true) || (CheckBox119.Checked == true) || (CheckBox84.Checked == true))
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
                if ((CheckBox185.Checked == true) || (CheckBox186.Checked == true) || (CheckBox187.Checked == true) || (CheckBox188.Checked == true))
                {
                    string support = "H1B Checklist";
                    menulist.Add(support);
                }
            }


            string s = "select  * from Users_Information where  uid ='" + usid + "' ";
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

                con.Open();
                string s1 = "delete indus_Roles where mid='" + usid + "'; ";
                SqlCommand cmd = new SqlCommand(s1, con);
                int i1 = cmd.ExecuteNonQuery();

                string s11 = "delete user_menu where mid='" + usid + "'; ";
                SqlCommand cmd11 = new SqlCommand(s11, con);
                int i11 = cmd11.ExecuteNonQuery();
                con.Close();

                string chechitemaa = "";
                for (int i = 0; i < menulist.Count; i++)
                {
                    string chechitem = Convert.ToString(menulist[i]);

                    con.Open();
                    string s3 = "insert into indus_Roles (country, role,name,item,mid) values('" + country + "','" + role + "','" + name + "','" + chechitem + "','" + uid + "') ";
                    SqlCommand cmd3 = new SqlCommand(s3, con);
                    int i3 = cmd3.ExecuteNonQuery();
                    con.Close();

                    chechitemaa += chechitem + ",";
                }
                if (chechitemaa != "")
                {
                    chechitemaa = chechitemaa.Remove(chechitemaa.Length - 1);

                    if (menulist.Count > 0)
                    {
                        string Immigpreview;
                        string Immigpost;
                        string Immigedit;
                        string Immigdelete;
                        string ImmigDownload;

                        if (CheckBox125.Checked == true) { Immigpreview = "1"; } else { Immigpreview = "0"; }
                        if (CheckBox126.Checked == true) { Immigpost = "1"; } else { Immigpost = "0"; }
                        if (CheckBox127.Checked == true) { Immigedit = "1"; } else { Immigedit = "0"; }
                        if (CheckBox128.Checked == true) { Immigdelete = "1"; } else { Immigdelete = "0"; }
                        if (CheckBox129.Checked == true) { ImmigDownload = "1"; } else { ImmigDownload = "0"; }


                        string Accountpreview;
                        string Accountpost;
                        string Accountedit;
                        string Accountdelete;
                        string AccountDownload;

                        if (CheckBox131.Checked == true) { Accountpreview = "1"; } else { Accountpreview = "0"; }
                        if (CheckBox132.Checked == true) { Accountpost = "1"; } else { Accountpost = "0"; }
                        if (CheckBox133.Checked == true) { Accountedit = "1"; } else { Accountedit = "0"; }
                        if (CheckBox134.Checked == true) { Accountdelete = "1"; } else { Accountdelete = "0"; }
                        if (CheckBox135.Checked == true) { AccountDownload = "1"; } else { AccountDownload = "0"; }

                        string HRpreview;
                        string HRpost;
                        string HRedit;
                        string HRdelete;
                        string HRDownload;

                        if (CheckBox137.Checked == true) { HRpreview = "1"; } else { HRpreview = "0"; }
                        if (CheckBox138.Checked == true) { HRpost = "1"; } else { HRpost = "0"; }
                        if (CheckBox139.Checked == true) { HRedit = "1"; } else { HRedit = "0"; }
                        if (CheckBox140.Checked == true) { HRdelete = "1"; } else { HRdelete = "0"; }
                        if (CheckBox141.Checked == true) { HRDownload = "1"; } else { HRDownload = "0"; }

                        string ARPpreview;
                        string ARPpost;
                        string ARPedit;
                        string ARPdelete;
                        string ARPDownload;

                        if (CheckBox143.Checked == true) { ARPpreview = "1"; } else { ARPpreview = "0"; }
                        if (CheckBox144.Checked == true) { ARPpost = "1"; } else { ARPpost = "0"; }
                        if (CheckBox145.Checked == true) { ARPedit = "1"; } else { ARPedit = "0"; }
                        if (CheckBox146.Checked == true) { ARPdelete = "1"; } else { ARPdelete = "0"; }
                        if (CheckBox147.Checked == true) { ARPDownload = "1"; } else { ARPDownload = "0"; }

                        string DailyReportspreview;
                        string DailyReportspost;
                        string DailyReportsedit;
                        string DailyReportsdelete;
                        string DailyReportsDownload;

                        if (CheckBox149.Checked == true) { DailyReportspreview = "1"; } else { DailyReportspreview = "0"; }
                        if (CheckBox150.Checked == true) { DailyReportspost = "1"; } else { DailyReportspost = "0"; }
                        if (CheckBox151.Checked == true) { DailyReportsedit = "1"; } else { DailyReportsedit = "0"; }
                        if (CheckBox152.Checked == true) { DailyReportsdelete = "1"; } else { DailyReportsdelete = "0"; }
                        if (CheckBox153.Checked == true) { DailyReportsDownload = "1"; } else { DailyReportsDownload = "0"; }

                        string attendancepreview;
                        string attendancepost;
                        string attendanceedit;
                        string attendancedelete;
                        string attendanceDownload;

                        if (CheckBox155.Checked == true) { attendancepreview = "1"; } else { attendancepreview = "0"; }
                        if (CheckBox156.Checked == true) { attendancepost = "1"; } else { attendancepost = "0"; }
                        if (CheckBox157.Checked == true) { attendanceedit = "1"; } else { attendanceedit = "0"; }
                        if (CheckBox158.Checked == true) { attendancedelete = "1"; } else { attendancedelete = "0"; }
                        if (CheckBox159.Checked == true) { attendanceDownload = "1"; } else { attendanceDownload = "0"; }

                        string Excelpreview;
                        string Excelpost;
                        string Exceledit;
                        string Exceldelete;
                        string ExcelDownload;

                        if (CheckBox161.Checked == true) { Excelpreview = "1"; } else { Excelpreview = "0"; }
                        if (CheckBox162.Checked == true) { Excelpost = "1"; } else { Excelpost = "0"; }
                        if (CheckBox163.Checked == true) { Exceledit = "1"; } else { Exceledit = "0"; }
                        if (CheckBox164.Checked == true) { Exceldelete = "1"; } else { Exceldelete = "0"; }
                        if (CheckBox165.Checked == true) { ExcelDownload = "1"; } else { ExcelDownload = "0"; }

                        string EmpDocspreview;
                        string EmpDocspost;
                        string EmpDocsedit;
                        string EmpDocsdelete;
                        string EmpDocsDownload;

                        if (CheckBox167.Checked == true) { EmpDocspreview = "1"; } else { EmpDocspreview = "0"; }
                        if (CheckBox168.Checked == true) { EmpDocspost = "1"; } else { EmpDocspost = "0"; }
                        if (CheckBox169.Checked == true) { EmpDocsedit = "1"; } else { EmpDocsedit = "0"; }
                        if (CheckBox170.Checked == true) { EmpDocsdelete = "1"; } else { EmpDocsdelete = "0"; }
                        if (CheckBox171.Checked == true) { EmpDocsDownload = "1"; } else { EmpDocsDownload = "0"; }

                        string Wordpreview;
                        string Wordpost;
                        string Wordedit;
                        string Worddelete;
                        string WordDownload;

                        if (CheckBox173.Checked == true) { Wordpreview = "1"; } else { Wordpreview = "0"; }
                        if (CheckBox174.Checked == true) { Wordpost = "1"; } else { Wordpost = "0"; }
                        if (CheckBox175.Checked == true) { Wordedit = "1"; } else { Wordedit = "0"; }
                        if (CheckBox176.Checked == true) { Worddelete = "1"; } else { Worddelete = "0"; }
                        if (CheckBox177.Checked == true) { WordDownload = "1"; } else { WordDownload = "0"; }

                        string Resumespreview;
                        string Resumespost;
                        string Resumesedit;
                        string Resumesdelete;
                        string ResumesDownload;

                        if (CheckBox179.Checked == true) { Resumespreview = "1"; } else { Resumespreview = "0"; }
                        if (CheckBox180.Checked == true) { Resumespost = "1"; } else { Resumespost = "0"; }
                        if (CheckBox181.Checked == true) { Resumesedit = "1"; } else { Resumesedit = "0"; }
                        if (CheckBox182.Checked == true) { Resumesdelete = "1"; } else { Resumesdelete = "0"; }
                        if (CheckBox183.Checked == true) { ResumesDownload = "1"; } else { ResumesDownload = "0"; }

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

                        if (CheckBox185.Checked == true) { checklistview = "1"; } else { checklistview = "0"; }
                        if (CheckBox186.Checked == true) { checklistpost = "1"; } else { checklistpost = "0"; }
                        if (CheckBox187.Checked == true) { checklistedit = "1"; } else { checklistedit = "0"; }
                        if (CheckBox188.Checked == true) { checklistdelete = "1"; } else { checklistdelete = "0"; }

                        obj.cFName = Convert.ToString(txtedfname.Text);
                        obj.cLName = Convert.ToString(txtedlname.Text);
                        obj.cUserId = Convert.ToString(txtUserId.Text);
                        obj.cPassword = Convert.ToString(txtedpwd.Text);
                        obj.cDesig = Convert.ToString(ddleddesgn.SelectedItem.Text);
                        obj.cAddress = Convert.ToString(txtedaddress.Text);
                        obj.cContactNo = Convert.ToString(txtedcontact.Text);
                        obj.cEmailId = Convert.ToString(txtedmail.Text);
                        obj.cMobile = Convert.ToString(txtedmob.Text);
                        obj.cCountry = Convert.ToString(ddledcountry.SelectedItem.Text);

                        string name6 = obj.cFName + " " + obj.cLName;
                        string qry = "update Users_Information set UserId='" + obj.cUserId + "',	Password='" + obj.cPassword + "',	FName='" + obj.cFName + "',	LName='" + obj.cLName + "',	Designation='" + obj.cDesig + "',";
                        qry += "  Address='" + obj.cAddress + "',	PhNo='" + obj.cContactNo + "',EmailId='" + obj.cEmailId + "',	ImmigDocs_View='" + Immigpreview + "',";
                        qry += " ImmigDocs_Download='" + ImmigDownload + "',	ImmigDocs_Post='" + Immigpost + "',	ImmigDocs_Edit='" + Immigedit + "',	ImmigDocs_Delete='" + Immigdelete + "',	AccDocs_View='" + Accountpreview + "',";
                        qry += " AccDocs_Download='" + AccountDownload + "',	AccDocs_Post='" + Accountpost + "',	AccDocs_Edit='" + Accountedit + "',	AccDocs_Delete='" + Accountdelete + "',	HRDocs_View='" + HRpreview + "',	";
                        qry += " HRDocs_Download='" + HRDownload + "',	HRDocs_Post='" + HRpost + "',	HRDocs_Edit='" + HRedit + "',	HRDocs_Delete='" + HRdelete + "',	DailyReports_View='" + DailyReportspreview + "',	";
                        qry += "  DailyReports_Download='" + DailyReportsDownload + "',	DailyReports_Post='" + DailyReportspost + "',	DailyReports_Delete='" + DailyReportsdelete + "',	Leaves_View='" + attendancepreview + "',";
                        qry += "  Leaves_Post='" + attendancepost + "',	ARPDocs_View='" + ARPpreview + "',	ARPDocs_Download='" + ARPDownload + "',	ARPDocs_Post='" + ARPpost + "',	ARPDocs_Edit='" + ARPedit + "',";
                        qry += "  ARPDocs_Delete='" + ARPdelete + "',	Excel_View='" + Excelpreview + "',	Excel_Download='" + ExcelDownload + "',	Excel_Post='" + Excelpost + "',	Excel_Edit='" + Exceledit + "',";
                        qry += "  Excel_Delete='" + Exceldelete + "',	Leaves_Delete='" + attendancedelete + "',	Leaves_Edit='" + attendanceedit + "',	EmpDoc_Post='" + EmpDocspost + "',	";
                        qry += "  EmpDoc_Download='" + EmpDocsDownload + "',	EmpDoc_View='" + EmpDocspreview + "',	EmpDoc_Delete='" + EmpDocsdelete + "',	WrdDocs_View='" + Wordpreview + "',	WrdDocs_Post='" + Wordpost + "',";
                        qry += "  WrdDocs_Edit='" + Wordedit + "',	WrdDocs_Delete='" + Worddelete + "',WrdDocs_Download='" + WordDownload + "',Country='" + obj.cCountry + "',	mobile='" + obj.cMobile + "',Resume_View='" + Resumespreview + "',";
                        qry += "   Resume_Post='" + Resumespost + "',Resume_Edit='" + Resumesedit + "',Resume_Delete='" + Resumesdelete + "',	Resume_Download='" + ResumesDownload + "',	EmpDoc_Edit='" + EmpDocsedit + "',";
                        qry += "   Leaves_Download='" + attendanceDownload + "',	DailyReports_Edit='" + DailyReportsedit + "' where uid='" + usid + "'";

                        con.Open();
                        SqlCommand cmd1 = new SqlCommand(qry, con);
                        int k = cmd1.ExecuteNonQuery();
                        con.Close();

                        if (k == 1)
                        {
                            string qry1 = "insert into user_menu(country,role,name,mid,empview,emppost,empedit,empdelete,h1bview,h1bedit,h1bdelete,profileview,";
                            qry1 += "profilepost,profileedit,profiledelete,careersview,careerspost,careersedit,careersdelete,timeview,timepost,documentsview,documentspost,";
                            qry1 += "documentselete,documentsdownload,seminarsview,seminarspost,seminarsedit,seminarsdelete,feedbackview,feedbackdelete,performancepost,";
                            qry1 += "rolesview,rolespost,rolesdelete,companyview,companypost,companyedit,companydelete,projectsview,projectspost,projectsedit,";
                            qry1 += "projectsdelete,departmentview,departmentpost,departmentedit,departmentdelete,clientview,clientpost,clientedit,clientdelete,vendorview,";
                            qry1 += "vendorpost,vendoredit,vendorstatus,vendordelete,appointmentview,appointmentpost,payview,paypost,newsview,newspost,newsedit,newsdelete,";
                            qry1 += "usersview,userspost,usersedit,usersdelete,usersstatus,empconview,empconpost,empconedit,empcondelete,supportdelete,supportdownload,";
                            qry1 += "dailyview,Dailyedit,Dailydelete,Invoicingview,Invoicingpost,Invoicingedit,Invoicingdelete,Principlesview,Principlesedit,Principlesdelete,";
                            qry1 += "Calenderview,Calenderpost,Calenderedit,Calenderdelete,Reportsview,Reportsedit,Reportsdelete,Reportsdownload,Salaryview,Salaryedit,Salarydelete,";
                            qry1 += "Currentview,Currentpost,Currentedit,Currentdelete,checklistview,checklistpost,checklistedit,checklistdelete)values";

                            qry1 += "('" + country + "','" + role + "','" + name + "','" + uid + "','" + emppreview + "','" + emppost + "','" + empedit + "','" + empdelete
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
                            SqlCommand cmd15 = new SqlCommand(qry1, con);
                            int k5 = cmd15.ExecuteNonQuery();
                            con.Close();

                            //string qry1 = "update User_menu set	country='" + obj.cCountry + "',	role='" + obj.cDesig + "',	name='" + name6 + "',	empview='" + emppreview + "',	emppost='" + emppost + "',	empedit='" + empedit + "',	";
                            //qry1 += "   empdelete='" + empdelete + "',	h1bview='" + h1bpreview + "',        h1bedit='" + h1bedit + "',	h1bdelete='" + h1delete + "',	profileview='" + profileview + "',	profilepost='" + profilepost + "',";
                            //qry1 += "    profileedit='" + profileedit + "',	profiledelete='" + profiledelete + "',        careersview='" + careersview + "',	careerspost='" + careerspost + "',	careersedit='" + careersedit + "',	";
                            //qry1 += "    careersdelete='" + careersdelete + "',	timeview='" + timeview + "',	timepost='" + timepost + "',        documentsview='" + documentsview + "',	documentspost='" + documentspost + "',	";
                            //qry1 += "     documentselete='" + documentselete + "',	documentsdownload='" + documentsdownload + "',	seminarsview='" + seminarsview + "',        seminarspost='" + seminarspost + "',	";
                            //qry1 += "     seminarsedit='" + seminarsedit + "',	seminarsdelete='" + seminarsdelete + "',	feedbackview='" + feedbackview + "',	feedbackdelete='" + feedbackdelete + "',";
                            //qry1 += "  performancepost='" + performancepost + "',	rolesview='" + rolesview + "',	rolespost='" + rolespost + "',	rolesdelete='" + rolesdelete + "',	companyview='" + companyview + "',	companypost='" + companypost + "',	";
                            //qry1 += "   companyedit='" + companyedit + "',	companydelete='" + companydelete + "',	projectsview='" + projectsview + "',	projectspost='" + projectspost + "',	projectsedit='" + projectsedit + "',	";
                            //qry1 += "   projectsdelete='" + projectsdelete + "',	departmentview='" + departmentview + "',	departmentpost='" + departmentpost + "',	departmentedit='" + departmentedit + "',	";
                            //qry1 += "   departmentdelete='" + departmentdelete + "',	clientview='" + clientview + "',	clientpost='" + clientpost + "',	clientedit='" + clientedit + "',	clientdelete='" + clientdelete + "',";
                            //qry1 += "   vendorview='" + vendorview + "',	vendorpost='" + vendorpost + "',	vendoredit='" + vendoredit + "',	vendorstatus='" + vendorstatus + "',	vendordelete='" + vendordelete + "',";
                            //qry1 += "   appointmentview='" + appointmentview + "',	appointmentpost='" + appointmentpost + "',	payview='" + payview + "',	paypost='" + paypost + "',	newsview='" + newsview + "',	";
                            //qry1 += "   newspost='" + newspost + "',	newsedit='" + newsedit + "',	newsdelete='" + newsdelete + "',	usersview='" + usersview + "',	userspost='" + userspost + "',	usersedit='" + usersedit + "',	";
                            //qry1 += "   usersdelete='" + usersdelete + "',	usersstatus='" + usersstatus + "',	empconview='" + empconview + "',	empconpost='" + empconpost + "',	empconedit='" + empconedit + "',	empcondelete='" + empcondelete + "',";
                            //qry1 += "   supportdelete='" + supportdelete + "',	supportdownload='" + supportdownload + "',	dailyview='" + dailyview + "',	Dailyedit='" + Dailyedit + "',	Dailydelete='" + Dailydelete + "',	Invoicingview='" + Invoicingview + "',	";
                            //qry1 += "    Invoicingpost='" + Invoicingpost + "',	Invoicingedit='" + Invoicingedit + "',	Invoicingdelete='" + Invoicingdelete + "',	Principlesview='" + Principlesview + "',	Principlesedit='" + Principlesedit + "',";
                            //qry1 += "    Principlesdelete='" + Principlesdelete + "',	Calenderview='" + Calenderview + "',	Calenderpost='" + Calenderpost + "',	Calenderedit='" + Calenderedit + "',	Calenderdelete='" + Calenderdelete + "',";
                            //qry1 += "    Reportsview='" + Reportsview + "',	Reportsedit='" + Reportsedit + "',	Reportsdelete='" + Reportsdelete + "',	Reportsdownload='" + Reportsdownload + "',	Salaryview='" + Salaryview + "',	Salaryedit='" + Salaryedit + "',";
                            //qry1 += "    Salarydelete='" + Salarydelete + "',	Currentview='" + Currentview + "',	Currentpost='" + Currentpost + "',	Currentedit='" + Currentedit + "',	Currentdelete='" + Currentdelete + "' where mid='" + usid + "'";

                            //  string result1 = SendMail(obj.cCountry, obj.cEmailId, obj.cMobile, obj.cFName, obj.cDesig, obj.cUserId, obj.cPassword, chechitemaa);

                            strScript = "alert('User Id is successfully Updated');location.replace('Admin_CreationfUserIds.aspx')";
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

    string SendMail(string country, string email, string mobile, string name, string role, string userid, string Pwd, string menulist)
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

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_CreationfUserIds.aspx");
    }

    //Immigration Docs for  select all
    protected void CheckBox111_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox111.Checked == true)
        {
            CheckBox125.Checked = true;
            CheckBox126.Checked = true;
            CheckBox127.Checked = true;
            CheckBox128.Checked = true;
            CheckBox129.Checked = true;
        }
        else
        {
            CheckBox125.Checked = false;
            CheckBox126.Checked = false;
            CheckBox127.Checked = false;
            CheckBox128.Checked = false;
            CheckBox129.Checked = false;
        }
    }
    //Immigration Docs for single check boxes
    protected void CheckBox125_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox125.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true && CheckBox129.Checked == true)
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
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true && CheckBox129.Checked == true)
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
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true && CheckBox129.Checked == true)
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
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true && CheckBox129.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }
    protected void CheckBox129_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox129.Checked == false)
        {
            CheckBox111.Checked = false;
        }
        else if (CheckBox125.Checked == true && CheckBox126.Checked == true && CheckBox127.Checked == true && CheckBox128.Checked == true && CheckBox129.Checked == true)
        {
            CheckBox111.Checked = true;
        }
    }

    //Accounting Docs  for select  all
    protected void CheckBox130_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox130.Checked == true)
        {
            CheckBox131.Checked = true;
            CheckBox132.Checked = true;
            CheckBox133.Checked = true;
            CheckBox134.Checked = true;
            CheckBox135.Checked = true;
        }
        else
        {
            CheckBox131.Checked = false;
            CheckBox132.Checked = false;
            CheckBox133.Checked = false;
            CheckBox134.Checked = false;
            CheckBox135.Checked = false;
        }
    }

    //Accounting Docs  for individual
    protected void CheckBox131_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox131.Checked == false)
        {
            CheckBox130.Checked = false;
        }
        else if (CheckBox131.Checked == true && CheckBox132.Checked == true && CheckBox133.Checked == true && CheckBox134.Checked == true && CheckBox135.Checked == true)
        {
            CheckBox130.Checked = true;
        }
    }
    protected void CheckBox132_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox132.Checked == false)
        {
            CheckBox130.Checked = false;
        }
        else if (CheckBox131.Checked == true && CheckBox132.Checked == true && CheckBox133.Checked == true && CheckBox134.Checked == true && CheckBox135.Checked == true)
        {
            CheckBox130.Checked = true;
        }
    }
    protected void CheckBox133_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox133.Checked == false)
        {
            CheckBox130.Checked = false;
        }
        else if (CheckBox131.Checked == true && CheckBox132.Checked == true && CheckBox133.Checked == true && CheckBox134.Checked == true && CheckBox135.Checked == true)
        {
            CheckBox130.Checked = true;
        }
    }
    protected void CheckBox134_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox134.Checked == false)
        {
            CheckBox130.Checked = false;
        }
        else if (CheckBox131.Checked == true && CheckBox132.Checked == true && CheckBox133.Checked == true && CheckBox134.Checked == true && CheckBox135.Checked == true)
        {
            CheckBox130.Checked = true;
        }
    }
    protected void CheckBox135_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox135.Checked == false)
        {
            CheckBox130.Checked = false;
        }
        else if (CheckBox131.Checked == true && CheckBox132.Checked == true && CheckBox133.Checked == true && CheckBox134.Checked == true && CheckBox135.Checked == true)
        {
            CheckBox130.Checked = true;
        }
    }

    //HR Docs for select all
    protected void CheckBox136_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox136.Checked == true)
        {
            CheckBox137.Checked = true;
            CheckBox138.Checked = true;
            CheckBox139.Checked = true;
            CheckBox140.Checked = true;
            CheckBox141.Checked = true;
        }
        else
        {
            CheckBox137.Checked = false;
            CheckBox138.Checked = false;
            CheckBox139.Checked = false;
            CheckBox140.Checked = false;
            CheckBox141.Checked = false;
        }
    }
    //HR Docs for individual
    protected void CheckBox137_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox137.Checked == false)
        {
            CheckBox136.Checked = false;
        }
        else if (CheckBox137.Checked == true && CheckBox138.Checked == true && CheckBox139.Checked == true && CheckBox140.Checked == true && CheckBox141.Checked == true)
        {
            CheckBox136.Checked = true;
        }
    }
    protected void CheckBox138_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox138.Checked == false)
        {
            CheckBox136.Checked = false;
        }
        else if (CheckBox137.Checked == true && CheckBox138.Checked == true && CheckBox139.Checked == true && CheckBox140.Checked == true && CheckBox141.Checked == true)
        {
            CheckBox136.Checked = true;
        }
    }
    protected void CheckBox139_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox139.Checked == false)
        {
            CheckBox136.Checked = false;
        }
        else if (CheckBox137.Checked == true && CheckBox138.Checked == true && CheckBox139.Checked == true && CheckBox140.Checked == true && CheckBox141.Checked == true)
        {
            CheckBox136.Checked = true;
        }
    }
    protected void CheckBox140_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox140.Checked == false)
        {
            CheckBox136.Checked = false;
        }
        else if (CheckBox137.Checked == true && CheckBox138.Checked == true && CheckBox139.Checked == true && CheckBox140.Checked == true && CheckBox141.Checked == true)
        {
            CheckBox136.Checked = true;
        }
    }
    protected void CheckBox141_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox141.Checked == false)
        {
            CheckBox136.Checked = false;
        }
        else if (CheckBox137.Checked == true && CheckBox138.Checked == true && CheckBox139.Checked == true && CheckBox140.Checked == true && CheckBox141.Checked == true)
        {
            CheckBox136.Checked = true;
        }
    }

    //ARP Docs for select all
    protected void CheckBox142_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox142.Checked == true)
        {
            CheckBox143.Checked = true;
            CheckBox144.Checked = true;
            CheckBox145.Checked = true;
            CheckBox146.Checked = true;
            CheckBox147.Checked = true;
        }
        else
        {
            CheckBox143.Checked = false;
            CheckBox144.Checked = false;
            CheckBox145.Checked = false;
            CheckBox146.Checked = false;
            CheckBox147.Checked = false;
        }
    }
    //ARP Docs for individual
    protected void CheckBox143_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox143.Checked == false)
        {
            CheckBox142.Checked = false;
        }
        else if (CheckBox143.Checked == true && CheckBox144.Checked == true && CheckBox145.Checked == true && CheckBox146.Checked == true && CheckBox147.Checked == true)
        {
            CheckBox142.Checked = true;
        }
    }
    protected void CheckBox144_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox144.Checked == false)
        {
            CheckBox142.Checked = false;
        }
        else if (CheckBox143.Checked == true && CheckBox144.Checked == true && CheckBox145.Checked == true && CheckBox146.Checked == true && CheckBox147.Checked == true)
        {
            CheckBox142.Checked = true;
        }
    }
    protected void CheckBox145_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox145.Checked == false)
        {
            CheckBox142.Checked = false;
        }
        else if (CheckBox143.Checked == true && CheckBox144.Checked == true && CheckBox145.Checked == true && CheckBox146.Checked == true && CheckBox147.Checked == true)
        {
            CheckBox142.Checked = true;
        }
    }
    protected void CheckBox146_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox146.Checked == false)
        {
            CheckBox142.Checked = false;
        }
        else if (CheckBox143.Checked == true && CheckBox144.Checked == true && CheckBox145.Checked == true && CheckBox146.Checked == true && CheckBox147.Checked == true)
        {
            CheckBox142.Checked = true;
        }
    }
    protected void CheckBox147_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox147.Checked == false)
        {
            CheckBox142.Checked = false;
        }
        else if (CheckBox143.Checked == true && CheckBox144.Checked == true && CheckBox145.Checked == true && CheckBox146.Checked == true && CheckBox147.Checked == true)
        {
            CheckBox142.Checked = true;
        }
    }

    //Daily Reports for select all
    protected void CheckBox148_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox148.Checked == true)
        {
            CheckBox149.Checked = true;
            CheckBox150.Checked = true;
            CheckBox151.Checked = true;
            CheckBox152.Checked = true;
            CheckBox153.Checked = true;
        }
        else
        {
            CheckBox149.Checked = false;
            CheckBox150.Checked = false;
            CheckBox151.Checked = false;
            CheckBox152.Checked = false;
            CheckBox153.Checked = false;
        }
    }
    //Daily Reports for  individual
    protected void CheckBox149_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox149.Checked == false)
        {
            CheckBox148.Checked = false;
        }
        else if (CheckBox149.Checked == true && CheckBox150.Checked == true && CheckBox151.Checked == true && CheckBox152.Checked == true && CheckBox153.Checked == true)
        {
            CheckBox148.Checked = true;
        }
    }
    protected void CheckBox150_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox150.Checked == false)
        {
            CheckBox148.Checked = false;
        }
        else if (CheckBox149.Checked == true && CheckBox150.Checked == true && CheckBox151.Checked == true && CheckBox152.Checked == true && CheckBox153.Checked == true)
        {
            CheckBox148.Checked = true;
        }
    }
    protected void CheckBox151_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox151.Checked == false)
        {
            CheckBox148.Checked = false;
        }
        else if (CheckBox149.Checked == true && CheckBox150.Checked == true && CheckBox151.Checked == true && CheckBox152.Checked == true && CheckBox153.Checked == true)
        {
            CheckBox148.Checked = true;
        }
    }
    protected void CheckBox152_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox152.Checked == false)
        {
            CheckBox148.Checked = false;
        }
        else if (CheckBox149.Checked == true && CheckBox150.Checked == true && CheckBox151.Checked == true && CheckBox152.Checked == true && CheckBox153.Checked == true)
        {
            CheckBox148.Checked = true;
        }
    }
    protected void CheckBox153_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox153.Checked == false)
        {
            CheckBox148.Checked = false;
        }
        else if (CheckBox149.Checked == true && CheckBox150.Checked == true && CheckBox151.Checked == true && CheckBox152.Checked == true && CheckBox153.Checked == true)
        {
            CheckBox148.Checked = true;
        }
    }

    //Time & attendance  for select all
    protected void CheckBox154_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox154.Checked == true)
        {
            CheckBox155.Checked = true;
            CheckBox156.Checked = true;
            CheckBox157.Checked = true;
            CheckBox158.Checked = true;
            CheckBox159.Checked = true;
        }
        else
        {
            CheckBox155.Checked = false;
            CheckBox156.Checked = false;
            CheckBox157.Checked = false;
            CheckBox158.Checked = false;
            CheckBox159.Checked = false;
        }
    }
    //Time & attendance  for  individual
    protected void CheckBox155_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox155.Checked == false)
        {
            CheckBox154.Checked = false;
        }
        else if (CheckBox155.Checked == true && CheckBox156.Checked == true && CheckBox157.Checked == true && CheckBox158.Checked == true && CheckBox159.Checked == true)
        {
            CheckBox154.Checked = true;
        }
    }
    protected void CheckBox156_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox156.Checked == false)
        {
            CheckBox154.Checked = false;
        }
        else if (CheckBox155.Checked == true && CheckBox156.Checked == true && CheckBox157.Checked == true && CheckBox158.Checked == true && CheckBox159.Checked == true)
        {
            CheckBox154.Checked = true;
        }
    }
    protected void CheckBox157_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox157.Checked == false)
        {
            CheckBox154.Checked = false;
        }
        else if (CheckBox155.Checked == true && CheckBox156.Checked == true && CheckBox157.Checked == true && CheckBox158.Checked == true && CheckBox159.Checked == true)
        {
            CheckBox154.Checked = true;
        }
    }
    protected void CheckBox158_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox158.Checked == false)
        {
            CheckBox154.Checked = false;
        }
        else if (CheckBox155.Checked == true && CheckBox156.Checked == true && CheckBox157.Checked == true && CheckBox158.Checked == true && CheckBox159.Checked == true)
        {
            CheckBox154.Checked = true;
        }
    }
    protected void CheckBox159_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox159.Checked == false)
        {
            CheckBox154.Checked = false;
        }
        else if (CheckBox155.Checked == true && CheckBox156.Checked == true && CheckBox157.Checked == true && CheckBox158.Checked == true && CheckBox159.Checked == true)
        {
            CheckBox154.Checked = true;
        }
    }
    //Excel Docs for select all
    protected void CheckBox160_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox160.Checked == true)
        {
            CheckBox161.Checked = true;
            CheckBox162.Checked = true;
            CheckBox163.Checked = true;
            CheckBox164.Checked = true;
            CheckBox165.Checked = true;
        }
        else
        {
            CheckBox161.Checked = false;
            CheckBox162.Checked = false;
            CheckBox163.Checked = false;
            CheckBox164.Checked = false;
            CheckBox165.Checked = false;
        }
    }

    protected void CheckBox161_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox161.Checked == false)
        {
            CheckBox160.Checked = false;
        }
        else if (CheckBox161.Checked == true && CheckBox162.Checked == true && CheckBox163.Checked == true && CheckBox164.Checked == true && CheckBox165.Checked == true)
        {
            CheckBox160.Checked = true;
        }
    }
    protected void CheckBox162_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox162.Checked == false)
        {
            CheckBox160.Checked = false;
        }
        else if (CheckBox161.Checked == true && CheckBox162.Checked == true && CheckBox163.Checked == true && CheckBox164.Checked == true && CheckBox165.Checked == true)
        {
            CheckBox160.Checked = true;
        }
    }
    protected void CheckBox163_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox163.Checked == false)
        {
            CheckBox160.Checked = false;
        }
        else if (CheckBox161.Checked == true && CheckBox162.Checked == true && CheckBox163.Checked == true && CheckBox164.Checked == true && CheckBox165.Checked == true)
        {
            CheckBox160.Checked = true;
        }
    }
    protected void CheckBox164_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox164.Checked == false)
        {
            CheckBox160.Checked = false;
        }
        else if (CheckBox161.Checked == true && CheckBox162.Checked == true && CheckBox163.Checked == true && CheckBox164.Checked == true && CheckBox165.Checked == true)
        {
            CheckBox160.Checked = true;
        }
    }
    protected void CheckBox165_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox165.Checked == false)
        {
            CheckBox160.Checked = false;
        }
        else if (CheckBox161.Checked == true && CheckBox162.Checked == true && CheckBox163.Checked == true && CheckBox164.Checked == true && CheckBox165.Checked == true)
        {
            CheckBox160.Checked = true;
        }
    }
    //Employee Docs for selct all
    protected void CheckBox166_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox166.Checked == true)
        {
            CheckBox167.Checked = true;
            CheckBox168.Checked = true;
            CheckBox169.Checked = true;
            CheckBox170.Checked = true;
            CheckBox171.Checked = true;
        }
        else
        {
            CheckBox167.Checked = false;
            CheckBox168.Checked = false;
            CheckBox169.Checked = false;
            CheckBox170.Checked = false;
            CheckBox171.Checked = false;
        }
    }
    //Employee Docs for  individual
    protected void CheckBox167_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox167.Checked == false)
        {
            CheckBox166.Checked = false;
        }
        else if (CheckBox167.Checked == true && CheckBox168.Checked == true && CheckBox169.Checked == true && CheckBox170.Checked == true && CheckBox171.Checked == true)
        {
            CheckBox166.Checked = true;
        }
    }
    protected void CheckBox168_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox168.Checked == false)
        {
            CheckBox166.Checked = false;
        }
        else if (CheckBox167.Checked == true && CheckBox168.Checked == true && CheckBox169.Checked == true && CheckBox170.Checked == true && CheckBox171.Checked == true)
        {
            CheckBox166.Checked = true;
        }
    }
    protected void CheckBox169_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox169.Checked == false)
        {
            CheckBox166.Checked = false;
        }
        else if (CheckBox167.Checked == true && CheckBox168.Checked == true && CheckBox169.Checked == true && CheckBox170.Checked == true && CheckBox171.Checked == true)
        {
            CheckBox166.Checked = true;
        }
    }
    protected void CheckBox170_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox170.Checked == false)
        {
            CheckBox166.Checked = false;
        }
        else if (CheckBox167.Checked == true && CheckBox168.Checked == true && CheckBox169.Checked == true && CheckBox170.Checked == true && CheckBox171.Checked == true)
        {
            CheckBox166.Checked = true;
        }
    }
    protected void CheckBox171_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox171.Checked == false)
        {
            CheckBox166.Checked = false;
        }
        else if (CheckBox167.Checked == true && CheckBox168.Checked == true && CheckBox169.Checked == true && CheckBox170.Checked == true && CheckBox171.Checked == true)
        {
            CheckBox166.Checked = true;
        }
    }
    //Word Documents for select all
    protected void CheckBox172_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox172.Checked == true)
        {
            CheckBox173.Checked = true;
            CheckBox174.Checked = true;
            CheckBox175.Checked = true;
            CheckBox176.Checked = true;
            CheckBox177.Checked = true;
        }
        else
        {
            CheckBox173.Checked = false;
            CheckBox174.Checked = false;
            CheckBox175.Checked = false;
            CheckBox176.Checked = false;
            CheckBox177.Checked = false;
        }
    }
    //Word Documents for individual
    protected void CheckBox173_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox173.Checked == false)
        {
            CheckBox172.Checked = false;
        }
        else if (CheckBox173.Checked == true && CheckBox174.Checked == true && CheckBox175.Checked == true && CheckBox176.Checked == true && CheckBox177.Checked == true)
        {
            CheckBox172.Checked = true;
        }
    }
    protected void CheckBox174_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox174.Checked == false)
        {
            CheckBox172.Checked = false;
        }
        else if (CheckBox173.Checked == true && CheckBox174.Checked == true && CheckBox175.Checked == true && CheckBox176.Checked == true && CheckBox177.Checked == true)
        {
            CheckBox172.Checked = true;
        }
    }
    protected void CheckBox175_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox175.Checked == false)
        {
            CheckBox172.Checked = false;
        }
        else if (CheckBox173.Checked == true && CheckBox174.Checked == true && CheckBox175.Checked == true && CheckBox176.Checked == true && CheckBox177.Checked == true)
        {
            CheckBox172.Checked = true;
        }
    }
    protected void CheckBox176_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox176.Checked == false)
        {
            CheckBox172.Checked = false;
        }
        else if (CheckBox173.Checked == true && CheckBox174.Checked == true && CheckBox175.Checked == true && CheckBox176.Checked == true && CheckBox177.Checked == true)
        {
            CheckBox172.Checked = true;
        }
    }
    protected void CheckBox177_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox177.Checked == false)
        {
            CheckBox172.Checked = false;
        }
        else if (CheckBox173.Checked == true && CheckBox174.Checked == true && CheckBox175.Checked == true && CheckBox176.Checked == true && CheckBox177.Checked == true)
        {
            CheckBox172.Checked = true;
        }
    }

    //Resumes for select all
    protected void CheckBox178_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox178.Checked == true)
        {
            CheckBox179.Checked = true;
            CheckBox180.Checked = true;
            CheckBox181.Checked = true;
            CheckBox182.Checked = true;
            CheckBox183.Checked = true;
        }
        else
        {
            CheckBox179.Checked = false;
            CheckBox180.Checked = false;
            CheckBox181.Checked = false;
            CheckBox182.Checked = false;
            CheckBox183.Checked = false;
        }
    }
    //Resumes for individual

    protected void CheckBox179_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox179.Checked == false)
        {
            CheckBox178.Checked = false;
        }
        else if (CheckBox179.Checked == true && CheckBox180.Checked == true && CheckBox181.Checked == true && CheckBox182.Checked == true && CheckBox183.Checked == true)
        {
            CheckBox178.Checked = true;
        }
    }
    protected void CheckBox180_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox180.Checked == false)
        {
            CheckBox178.Checked = false;
        }
        else if (CheckBox179.Checked == true && CheckBox180.Checked == true && CheckBox181.Checked == true && CheckBox182.Checked == true && CheckBox183.Checked == true)
        {
            CheckBox178.Checked = true;
        }
    }
    protected void CheckBox181_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox181.Checked == false)
        {
            CheckBox178.Checked = false;
        }
        else if (CheckBox179.Checked == true && CheckBox180.Checked == true && CheckBox181.Checked == true && CheckBox182.Checked == true && CheckBox183.Checked == true)
        {
            CheckBox178.Checked = true;
        }
    }
    protected void CheckBox182_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox182.Checked == false)
        {
            CheckBox178.Checked = false;
        }
        else if (CheckBox179.Checked == true && CheckBox180.Checked == true && CheckBox181.Checked == true && CheckBox182.Checked == true && CheckBox183.Checked == true)
        {
            CheckBox178.Checked = true;
        }
    }
    protected void CheckBox183_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox183.Checked == false)
        {
            CheckBox178.Checked = false;
        }
        else if (CheckBox179.Checked == true && CheckBox180.Checked == true && CheckBox181.Checked == true && CheckBox182.Checked == true && CheckBox183.Checked == true)
        {
            CheckBox178.Checked = true;
        }
    }

    //Employee List for select all
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
    //Employee List for  individual
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
    //h1b list for select all
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

    //Profile for select all
    protected void CheckBox54_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox54.Checked == true)
        {
            CheckBox60.Checked = true;
            CheckBox66.Checked = true;
            CheckBox103.Checked = true;
            CheckBox104.Checked = true;
        }
        else
        {
            CheckBox60.Checked = false;
            CheckBox66.Checked = false;
            CheckBox103.Checked = false;
            CheckBox104.Checked = false;
        }
    }
    //Profile for indiavidual
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

    //Careers for for select all
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

    //Careers for indivdual
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
    //Monthly TimeSheet for select all
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
    //Monthly TimeSheet for individual
    protected void CheckBox20_CheckedChanged(object sender, EventArgs e)
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
    //Documents for select all
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

    //Documents for indiviudal
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
    //Seminars for select all
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
    //Seminars for individual
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

    //Feedback for select all
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

    //Feedback for individual
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

    //roles for select all
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

    // roles for individual
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
    // Company for select all 
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
    // Company for individual 
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
    // Projects for  select all 

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

    // Projects for  individual 
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
    // Departments for select all 
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
    // Departments for individual 
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
    // Clients for select all 

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

    // Clients for individual 
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
    // Vendors  for select all 

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

    // Vendors  for individual 
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

    // Appointments  for select all 

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

    // Appointments   for individual 
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
    // Pay Roll  for select all 

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

    // Pay Roll  for individual 
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
    // News & Events for select all 

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

    // News & Events for individual 
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
    // USers for  select all 

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

    // USers for  individual 
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
    //  Emp Contacts for select all 
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
    //  Emp Contacts for individual 
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

    //  Support for individual 
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

    /// daily Timesheet  select all                           added on14-08-2018  by Y.Veeranjaneyulu
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

    // daily timesheet for individual
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

    //  Invoicing for select all
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
    //  Invoicing for individual
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
    // Principles for select all
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

    // Principles for individual
    protected void CheckBox102_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox102.Checked == false)
        {
            CheckBox96.Checked = false;
        }
        else if (CheckBox102.Checked == true && CheckBox46.Checked == true && CheckBox105.Checked == true)
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
    // Calender for select all
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
    //calender for individual
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

    //Reports for select all
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
    //Reports for individual
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
    //Salary Stmt for select all
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
    //Salary Stmt for individual
    protected void CheckBox118_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox118.Checked == false)
        {
            CheckBox117.Checked = false;
        }
        else if (CheckBox118.Checked == true && CheckBox119.Checked == true && CheckBox84.Checked == true)
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
    //Current Resumes for select all
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
    //Current Resumes for individual
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
    protected void CheckBox184_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox184.Checked == true)
        {
            CheckBox185.Checked = true;
            CheckBox186.Checked = true;
            CheckBox187.Checked = true;
            CheckBox188.Checked = true;
        }
        else
        {
            CheckBox185.Checked = false;
            CheckBox186.Checked = false;
            CheckBox187.Checked = false;
            CheckBox188.Checked = false;
        }
    }
    protected void CheckBox185_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox185.Checked == false)
        {
            CheckBox184.Checked = false;
        }
        else if (CheckBox185.Checked == true && CheckBox186.Checked == true && CheckBox187.Checked == true && CheckBox188.Checked == true)
        {
            CheckBox184.Checked = true;
        }
    }
    protected void CheckBox186_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox186.Checked == false)
        {
            CheckBox184.Checked = false;
        }
        else if (CheckBox185.Checked == true && CheckBox186.Checked == true && CheckBox187.Checked == true && CheckBox188.Checked == true)
        {
            CheckBox184.Checked = true;
        }
    }
    protected void CheckBox187_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox187.Checked == false)
        {
            CheckBox184.Checked = false;
        }
        else if (CheckBox185.Checked == true && CheckBox186.Checked == true && CheckBox187.Checked == true && CheckBox188.Checked == true)
        {
            CheckBox184.Checked = true;
        }
    }
    protected void CheckBox188_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox188.Checked == false)
        {
            CheckBox184.Checked = false;
        }
        else if (CheckBox185.Checked == true && CheckBox186.Checked == true && CheckBox187.Checked == true && CheckBox188.Checked == true)
        {
            CheckBox184.Checked = true;
        }
    }
}