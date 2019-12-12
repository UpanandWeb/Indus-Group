using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 

public partial class Projects_View : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        try
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            int PID = Convert.ToInt32(Request.QueryString["id"]);
            ds = new DataSet();
            ds = obj.Read_ProjectInfo(PID);

            lblprojname.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
            lblprojowner.Text = ds.Tables[0].Rows[0]["ProjectOwner"].ToString();
            lblctype.Text = ds.Tables[0].Rows[0]["CompanyType"].ToString();
            lblcompname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            lblintdiv.Text = ds.Tables[0].Rows[0]["InternalDivision"].ToString();
            lblprojtype.Text = ds.Tables[0].Rows[0]["ProjectType"].ToString();
            lblpriority.Text = ds.Tables[0].Rows[0]["Priority"].ToString();
            lblstatus.Text = ds.Tables[0].Rows[0]["Status"].ToString();
            lblshname.Text = ds.Tables[0].Rows[0]["ShortName"].ToString();
            lblstdate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["StartDate"]).ToString("dd MMM yyyy");
            lblenddt.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["TargetFinishDate"]).ToString("dd MMM yyyy");
            lblacbudget.Text = ds.Tables[0].Rows[0]["ActualBudget"].ToString();
            lbltarbudget.Text = ds.Tables[0].Rows[0]["TargetBudget"].ToString();
            lblacurl.Text = ds.Tables[0].Rows[0]["ActualURL"].ToString();
            lblsturl.Text = ds.Tables[0].Rows[0]["StagingURL"].ToString();
            lbldesc.Text = ds.Tables[0].Rows[0]["ProjectDesc"].ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("projects.aspx");
    }
}
