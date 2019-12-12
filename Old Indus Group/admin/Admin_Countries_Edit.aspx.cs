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

public partial class Admin_Countries_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = string.Empty;
        DataSet ds = new DataSet();

        uid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from Country_Master where intCountry_id=" + uid, connection);
            imgtext.Fill(ds, "Country_Master");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                emailid.Text = ds.Tables[0].Rows[0]["txtCountry_name"].ToString();

            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            string streg = string.Empty;
            string usid = Request.QueryString["cid"].ToString();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            SqlCommand cmd = new SqlCommand("Update Country_Master set txtCountry_name=@aemail,dtEntrydate=@postdate where intCountry_id=" + usid + ";", connection);

            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

            cmd.Parameters["@aemail"].Value = emailid.Text.ToString();
            cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();


            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();

            Response.Redirect("Admin_Countries.aspx?ret=edit");

        }
        catch
        {
        }

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Countries.aspx");
    }



}
