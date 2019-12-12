using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;

public partial class Emp_Timesheet : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string uid = string.Empty;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                

                Method();
            }
        }
    }

    private void Method()
    {
        string userid="";
        SqlDataAdapter da = new SqlDataAdapter("select  * from employeereg1 where status=1 and empid like 'IGI%'  and emailid='" + Session["userid"].ToString() + "'", sqlConnection);
        DataSet ds1 = new DataSet();
        da.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            userid = ds1.Tables[0].Rows[0]["empid"].ToString();
        }

        ds = GetEmpData(userid);
        empdata.DataSource = ds;
        empdata.DataBind();
    }

    public DataSet GetEmpData(string userid)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from timesheet where  empid ='" + userid + "' order by id desc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
   
    protected void lnknew_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-New-TimeSheet.aspx");
    }

    protected void empdata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        empdata.PageIndex = e.NewPageIndex;
        Method();
    }
}