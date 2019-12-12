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
using System.Web.Mail;
using System.Web.SessionState;
//using IndusAbroad.PostAdLogic;
//using IndusAbroad.Postaddproperties;
//using IndusAbroad.ClassifiedsLogic;
using System.Drawing;
using System.IO;
using System.Web.Configuration;

public partial class Admin_HLCreate : System.Web.UI.Page
{
    string Str;
    bool t;
    SqlConnection Connections = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);


    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        string categ = string.Empty;
        string scat = string.Empty;

        //string uid = Request.QueryString["cid"].ToString();

        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into headlines(headlines,date,description) values (@ename,@pdate,@pdesc);", connection);

        cmd.Parameters.Add(new SqlParameter("@ename", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 20));
        cmd.Parameters.Add(new SqlParameter("@pdesc", SqlDbType.NVarChar, 10000));
        
        cmd.Parameters["@ename"].Value = Convert.ToString(TxtHead.Text);
        cmd.Parameters["@pdate"].Value = DateTime.Now.ToString();
        cmd.Parameters["@pdesc"].Value = Convert.ToString(txtdesc.Text);
        
        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Admin_HLCreate.aspx?ret=ok");

    }
}
