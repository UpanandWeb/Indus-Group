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
 

public partial class projects : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    int PID = 0;
    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        pnlgrid.Visible = true;
        pnlproject.Visible = false;
        trbuttons.Visible = true;
        trmenu.Visible = true;
        //ddlcompname.Items.Insert(0, "----Select----");

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();
            Bind();
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                PID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }

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
            string strres = obj.Edit_ProjectInfo(ProjectName, ProjectOwner, CompanyType, CompanyName, InternalDivision, ProjectType, Priority, Status, ShortName, StartDate, TargetFinishDate, ActualBudget, TargetBudget, ActualURL, StagingURL, ProjectDesc, PID);
            Response.Redirect("Projects.aspx");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }

    public void Bind()
    {
        ds = new DataSet();
        ds = obj.Bind_NotDefined();
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblcat.Text = "Results for 'Not Defined'";
            gvedit.DataSource = ds;
            gvedit.DataBind();
        }
        else
        {
            lblerr.Text = "No Result Found for 'Not Defined'";
            lblcat.Text = "";
        }
    }

    protected void gvedit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvedit.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void imgnew_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Projects_Create.aspx");
    }

    protected void imgedit_Click(object sender, ImageClickEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            pnlproject.Visible = true;
            pnlgrid.Visible = false;
            trbuttons.Visible = false;
            trmenu.Visible = false;

            try
            {
                for (int i = 0; i < gvedit.Rows.Count; i++)
                {
                    CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
                    if (cbox.Checked)
                    {
                        PID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                    }
                }

                ds = new DataSet();
                ds = obj.Read_ProjectInfo(PID);

                txtprojname.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
                txtprojowner.Text = ds.Tables[0].Rows[0]["ProjectOwner"].ToString();
                string CompanyType = ds.Tables[0].Rows[0]["CompanyType"].ToString();
                ddlctype.SelectedIndex = ddlctype.Items.IndexOf(ddlctype.Items.FindByText(CompanyType));
                DataSet ds1 = new DataSet();
                ds1 = obj.Read_CompanyID(CompanyType);
                ddlcompname.DataSource = ds1;
                ddlcompname.DataTextField = "CompanyName";
                ddlcompname.DataValueField = "CID";
                ddlcompname.DataBind();
                ddlcompname.Items.Insert(0, "----Select----");
                string CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                ddlcompname.SelectedIndex = ddlcompname.Items.IndexOf(ddlcompname.Items.FindByText(CompanyName));
                string InternalDivision = ds.Tables[0].Rows[0]["InternalDivision"].ToString();
                ddlintdiv.SelectedIndex = ddlintdiv.Items.IndexOf(ddlintdiv.Items.FindByText(InternalDivision));
                string ProjectType = ds.Tables[0].Rows[0]["ProjectType"].ToString();
                ddlprojtype.SelectedIndex = ddlprojtype.Items.IndexOf(ddlprojtype.Items.FindByText(ProjectType));
                string Priority = ds.Tables[0].Rows[0]["Priority"].ToString();
                ddlpriority.SelectedIndex = ddlpriority.Items.IndexOf(ddlpriority.Items.FindByText(Priority));
                string Status = ds.Tables[0].Rows[0]["Status"].ToString();
                ddlstatus.SelectedIndex = ddlstatus.Items.IndexOf(ddlstatus.Items.FindByText(Status));
                txtshname.Text = ds.Tables[0].Rows[0]["ShortName"].ToString();
                txtstartdt.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["StartDate"]).ToString("dd MMM yyyy");
                txtenddt.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["TargetFinishDate"]).ToString("dd MMM yyyy");
                txtacbudget.Text = ds.Tables[0].Rows[0]["ActualBudget"].ToString();
                txtbudget.Text = ds.Tables[0].Rows[0]["TargetBudget"].ToString();
                txturl.Text = ds.Tables[0].Rows[0]["ActualURL"].ToString();
                txtsturl.Text = ds.Tables[0].Rows[0]["StagingURL"].ToString();
                txtdesc.Text = ds.Tables[0].Rows[0]["ProjectDesc"].ToString();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");

    }

    protected void ddlctype_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlgrid.Visible = false;
        pnlproject.Visible = true;
        trbuttons.Visible = false;
        trmenu.Visible = false;

        string CompanyType = ddlctype.SelectedItem.Text.ToString();
        ds = new DataSet();
        ds = obj.Read_CompanyID(CompanyType);
        ddlcompname.DataSource = ds;
        ddlcompname.DataTextField = "CompanyName";
        ddlcompname.DataValueField = "CID";
        ddlcompname.DataBind();
        ddlcompname.Items.Insert(0, "----Select----");

    }

    protected void imgdelete_Click(object sender, ImageClickEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            for (int i = 0; i < gvedit.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    PID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                }
            }

            try
            {
                obj.Delete_ProjectInfo(PID);
                Response.Redirect("Projects.aspx");
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }

    protected void btnnotdef_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_NotDefined();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'Not Defined'";
                Bind();
            }
            else
            {
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Not Defined'";
                lblcat.Text = "";
            }
        }
    }

    protected void btnproposed_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Proposed();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'Proposed'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Proposed'";
                lblcat.Text = "";
            }
        }
    }

    protected void btninplan_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_InPlanning();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'In Planning'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'In Planning'";
                lblcat.Text = "";
            }
        }
    }

    protected void btninprogress_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_InProgress();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'In Progress'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
               
            }
            else
            {
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'In Progress'";
                lblcat.Text = "";
            }
        }
    }

    protected void btnonhold_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_OnHold();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'On Hold'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcat.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'On Hold'";
            }
        }
    }

    protected void btncomplete_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Complete();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
                lblcat.Text = "Results for 'Complete'";
            }
            else
            {
                lblcat.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Complete'";
            }
        }
    }

    protected void btntemplate_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Template();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'Template'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcat.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Template'";
            }
        }
    }

    protected void btnarchive_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Archived();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'Archieved'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcat.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Archieved'";
            }
        }
    }

    protected void btngantt_Click(object sender, EventArgs e)
    {
        ds = new DataSet();
        ds = obj.Bind_Gantt();
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblcat.Text = "Results for 'Gantt'";
                gvedit.DataSource = ds;
                gvedit.DataBind();
                lblerr.Text = "";
            }
            else
            {
                lblcat.Text = "";
                trlbl.Visible = true;
                pnlgrid.Visible = false;
                pnlproject.Visible = false;
                lblerr.Text = "No Result Found for 'Gantt'";
            }
        }
    }

    protected void imgview_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                PID = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }
        Response.Redirect("Projects_View.aspx?id=" + PID);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("projects.aspx");
    }
}
