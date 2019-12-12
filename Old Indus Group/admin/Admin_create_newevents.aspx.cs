using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// summary description to create newsevents
/// </summary>
public partial class Admin_create_newevents : System.Web.UI.Page
{
    bool Regis = false;
    /// <summary>
    /// to perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");
        }
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
        int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
    //summary code for submit to insert details into table about the news and events

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into newsevents (jobtitle,jobdesc,sdate,pdate,address) VALUES (@jobtitle,@jobdesc,@sdate,@pdate,@address);", connection);
        cmd.Parameters.Add(new SqlParameter("@jobtitle", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@jobdesc", SqlDbType.NVarChar, 300));
        cmd.Parameters.Add(new SqlParameter("@sdate", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 50));
        cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 500));
        cmd.Parameters["@jobtitle"].Value = Convert.ToString(txtjobtitle.Text);
        cmd.Parameters["@jobdesc"].Value = Convert.ToString(txtjobdesc.Text);
        cmd.Parameters["@sdate"].Value = Convert.ToString(txtjobdate.Text);
        cmd.Parameters["@pdate"].Value = DateTime.Now.ToString();
        cmd.Parameters["@address"].Value = Convert.ToString(txtaddress.Text);
        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        string strScript = "";
        strScript = "alert('New Event has been Added Successfully.');location.replace('news.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
    }
}
