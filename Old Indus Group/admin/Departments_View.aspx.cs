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
 

public partial class Departments_View : System.Web.UI.Page
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
        int did = Convert.ToInt32(Request.QueryString["ID"]);
        ds = new DataSet();
        ds = obj.View_DeptInfo(did);

        lblctype.Text = ds.Tables[0].Rows[0]["CompanyType"].ToString();
        lblcname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
        lbldcode.Text = ds.Tables[0].Rows[0]["DeptCode"].ToString();
        lbldname.Text = ds.Tables[0].Rows[0]["DeptName"].ToString();
    }
}
