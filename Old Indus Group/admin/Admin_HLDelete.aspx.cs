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
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Admin_HLDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string streg = string.Empty;
        string usid = string.Empty;

        usid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("delete from headlines where id=" + usid, connection);

            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            Response.Redirect("Admin_HL.aspx?ret=ok");

        }
    }
}
