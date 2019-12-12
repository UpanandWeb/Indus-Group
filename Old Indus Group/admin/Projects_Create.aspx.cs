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
 

public partial class Projects_Create : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        ddlcompname.Items.Insert(0, "----Select----");
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string ProjectName = txtprojname.Text.ToString();
            string ProjectOwner = txtprojowner.Text.ToString();
            string CompanyType = ddlctype.SelectedItem.Text.ToString();
            string CompanyName = ddlcompname.SelectedItem.Text.ToString();
            string InternalDivision = ddlintdiv.SelectedItem.Text.ToString();
            string ProjectType = ddlprojtype.SelectedItem.Text.ToString();
            string Priority = ddlpriority.SelectedItem.Text.ToString();
            string Status = ddlstatus.SelectedItem.Text.ToString();
            string ShortName = txtshname.Text.ToString();
            DateTime StartDate = new DateTime();
            if (txtstartdt.Text != "")
            {
                StartDate = Convert.ToDateTime(txtstartdt.Text.ToString());
            }
            DateTime TargetFinishDate = new DateTime();
            if (txtenddt.Text != "")
            {
                TargetFinishDate = Convert.ToDateTime(txtenddt.Text.ToString());
            }
            string ActualBudget = txtacbudget.Text.ToString();
            string TargetBudget = txtbudget.Text.ToString();
            string ActualURL = txturl.Text.ToString();
            string StagingURL = txtsturl.Text.ToString();
            string ProjectDesc = txtdesc.Text.ToString();
            string strres = obj.Insert_ProjectInfo(ProjectName, ProjectOwner, CompanyType, CompanyName, InternalDivision, ProjectType, Priority, Status, ShortName, StartDate, TargetFinishDate, ActualBudget, TargetBudget, ActualURL, StagingURL, ProjectDesc);
            Response.Redirect("Projects.aspx");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void ddlctype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string CompanyType = ddlctype.SelectedItem.Text.ToString();
        ds = new DataSet();
        ds = obj.Read_CompanyID(CompanyType);
        ddlcompname.DataSource = ds;
        ddlcompname.DataTextField = "CompanyName";
        ddlcompname.DataValueField = "CID";
        ddlcompname.DataBind();
        ddlcompname.Items.Insert(0, "----Select----");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("projects.aspx");
    }
}
