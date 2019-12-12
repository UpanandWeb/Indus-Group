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
 

public partial class Departments : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    int did = 0;
    public static string own = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        pnlgrid.Visible = true;
        pnlproject.Visible = false;

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblAcess.Text = Session["UserName"].ToString();

            bind();
        }
    }

    public void bind()
    {
        ds = new DataSet();
        ds = obj.Bind_DepartmentInfo();
        gvedit.DataSource = ds;
        gvedit.DataBind();
    }

    protected void gvedit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvedit.PageIndex = e.NewPageIndex;
        bind();
    }

    protected void imgnew_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Departments_Create.aspx");
    }

    protected void imgedit_Click(object sender, ImageClickEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            pnlgrid.Visible = false;
            pnlproject.Visible = true;
            trbuttons.Visible = false;

            for (int i = 0; i < gvedit.Rows.Count; i++)
            {
                CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
                if (cbox.Checked)
                {
                    did = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                }
            }

            if (did != 0)
            {
                ds = new DataSet();
                ds = obj.Read_DepartmentInfo(did);

                txtdeptid.Text = ds.Tables[0].Rows[0]["DeptCode"].ToString();
                txtdeptname.Text = ds.Tables[0].Rows[0]["DeptName"].ToString();
                string CompanyType = ds.Tables[0].Rows[0]["CompanyType"].ToString();
                ddlctype.SelectedIndex = ddlctype.Items.IndexOf(ddlctype.Items.FindByText(CompanyType));
                bindCname();
                string CompanyID = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                ddlcompname.SelectedIndex = ddlcompname.Items.IndexOf(ddlcompname.Items.FindByValue(CompanyID));
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }

    public void bindCname()
    {
        string CompanyType = ddlctype.SelectedItem.Text.ToString();
        DataSet ds1 = new DataSet();
        ds1 = obj.Read_CompanyID(CompanyType);
        ddlcompname.DataSource = ds1;
        ddlcompname.DataTextField = "CompanyName";
        ddlcompname.DataValueField = "CID";
        ddlcompname.DataBind();
        ddlcompname.Items.Insert(0, "----Select----");
    }


    protected void ddlctype_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlgrid.Visible = false;
        pnlproject.Visible = true;
        trbuttons.Visible = false;
        bindCname();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                did = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }

        string CompanyType = ddlctype.SelectedItem.Text.ToString();
        int CompanyID = Convert.ToInt32(ddlcompname.SelectedItem.Value.ToString());
        string DeptCode = txtdeptid.Text.ToString();
        string DeptName = txtdeptname.Text.ToString();

        string strres = obj.Edit_DepartmentInfo(DeptCode, CompanyID, DeptName, did, CompanyType);
        Response.Redirect("Departments.aspx");
    }

    protected void imgview_Click(object sender, ImageClickEventArgs e)
    {
        for (int i = 0; i < gvedit.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)gvedit.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                did = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
            }
        }

        Response.Redirect("Departments_View.aspx?ID=" + did);
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
                    did = Convert.ToInt32(gvedit.DataKeys[i].Values[0].ToString());
                }
            }

            try
            {
                obj.Delete_DepartmentInfo(did);
                Response.Redirect("Departments.aspx");
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");

    }
}
