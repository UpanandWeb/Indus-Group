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
 

public partial class Company_View : System.Web.UI.Page
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
        int sid = Convert.ToInt32(Request.QueryString["id"]);
        ds = new DataSet();
        ds = obj.Read_CompanyInfo(sid);

        lblctype.Text = ds.Tables[0].Rows[0]["CompanyType"].ToString();
        lblcname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
        lblcntname.Text = ds.Tables[0].Rows[0]["CompanyOwner"].ToString();
        lbladdr1.Text = ds.Tables[0].Rows[0]["Address1"].ToString();
        lbldesig.Text = ds.Tables[0].Rows[0]["cont_desig"].ToString();
        lblcountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
        lblstate.Text = ds.Tables[0].Rows[0]["State"].ToString();
        lblcity.Text = ds.Tables[0].Rows[0]["City"].ToString();
        lblpwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
        lblwebsite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
        lblemail.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
        lblphone.Text = ds.Tables[0].Rows[0]["PhoneNo"].ToString();
        lblcpwd.Text = ds.Tables[0].Rows[0]["cpassword"].ToString();
        lblfax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
        lbldesc.Text = ds.Tables[0].Rows[0]["Description"].ToString();
        lbluname.Text = ds.Tables[0].Rows[0]["cont_person"].ToString();

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Company.aspx");
    }
}
