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

public partial class Admin_Countries_Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        string arrlx = string.Empty;


        string useremail = emailid.Text.ToString();

        string[] myArr = useremail.Split(new Char[] { ',' });
        string streg = string.Empty;

        for (int i = 0; i <= myArr.Length - 1; i++)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            connection.Open();

            SqlCommand cmd = new SqlCommand("insert into Country_Master (txtCountry_name,dtEntrydate) VALUES(@aemail,@postdate)", connection);

            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));

            //cmd.Parameters["@aemail"].Value = useremail;
            cmd.Parameters["@aemail"].Value = myArr[i].ToString();
            cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();


            streg = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        Response.Redirect("Admin_Countries_Create.aspx?ret=ok");

    }
}
