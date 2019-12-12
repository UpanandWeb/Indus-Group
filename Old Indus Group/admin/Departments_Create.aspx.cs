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
 

public partial class Departments_Create : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    string strres = string.Empty;

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
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string CompanyType = ddlctype.SelectedItem.Text.ToString();
            int CompanyID = Convert.ToInt32(ddlcompname.SelectedItem.Value.ToString());
            string DeptCode = txtdeptid.Text.ToString();
            string DeptName = txtdeptname.Text.ToString();
            strres = obj.Insert_DepartmentInfo(DeptCode, CompanyID, DeptName, CompanyType);
            Response.Redirect("Departments.aspx");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }
    protected void ddlctype_SelectedIndexChanged1(object sender, EventArgs e)
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
        Response.Redirect("Departments.aspx");
    }
}
