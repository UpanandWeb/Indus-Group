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
using System.Web.Configuration;

public partial class TimeSheet_Delete : System.Web.UI.Page
{
    string usid = string.Empty;
    string xt = string.Empty;
    string fdt = string.Empty;
    string tdt = string.Empty;
    DateTime sdt;
    DataSet ds = new DataSet();
    IGIIT sdata = new IGIIT();
    protected void Page_Load(object sender, EventArgs e)
    {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Request.QueryString["cid"] != null)
        {
            usid = Request.QueryString["cid"].ToString();
        }

        try
        {
            bool xreg = sdata.delts(usid);
            if (xreg)
                Response.Redirect("TimeSheet_Details.aspx");
        }
        catch
        {
        }
    }
}