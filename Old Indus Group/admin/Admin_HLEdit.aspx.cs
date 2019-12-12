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


public partial class Admin_HLEdit : System.Web.UI.Page
{ string Str;
    bool t;
    SqlConnection Connections = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);


        string categ = string.Empty;
        string scat = string.Empty;

        uid = Request.QueryString["cid"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from headlines where id=" + uid, sqlConnection);
            DataSet ds = new DataSet();
            imgtext.Fill(ds, "headlines");

            if (ds.Tables[0].Rows.Count != 0)
            {
                TxtHead.Text = ds.Tables[0].Rows[0]["headlines"].ToString();
                txtdesc.Text = ds.Tables[0].Rows[0]["description"].ToString();
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;

        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update headlines set headlines=@ename,date=@pdate,description=@pdesc where id=" + uid, connection);

        cmd.Parameters.Add(new SqlParameter("@ename", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 20));
        cmd.Parameters.Add(new SqlParameter("@pdesc", SqlDbType.NVarChar, 10000));

        cmd.Parameters["@ename"].Value = Convert.ToString(TxtHead.Text);
        cmd.Parameters["@pdate"].Value = DateTime.Now.ToString();
        cmd.Parameters["@pdesc"].Value = Convert.ToString(txtdesc.Text);

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Admin_HL.aspx?ret=ok");

    }
}
