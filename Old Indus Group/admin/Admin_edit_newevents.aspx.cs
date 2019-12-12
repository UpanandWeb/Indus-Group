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
/// summarise description to edit the news and events details.
/// </summary>
public partial class Admin_edit_newevents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string uid = string.Empty;
        DataSet ds = new DataSet();

        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");
        }

        uid = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter imgtext = new SqlDataAdapter("Select * from newsevents where id=" + uid, sqlConnection);
            imgtext.Fill(ds, "Careers");

            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                txtsdate.Text = ds.Tables[0].Rows[0]["sdate"].ToString();
                txtjobtitle.Text = ds.Tables[0].Rows[0]["jobtitle"].ToString();
                txtjobdesc.Text = ds.Tables[0].Rows[0]["jobdesc"].ToString();
                txtaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            }
        }
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
    //summarise code for submit button to update the details of news and events
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;
        string uid = string.Empty;
        uid = Request.QueryString["id"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update newsevents set jobtitle=@jobtitle,jobdesc=@jobdesc,sdate=@sdate,pdate=@pdate,address=@address where id=" + uid, connection);
        cmd.Parameters.Add(new SqlParameter("@jobtitle", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@jobdesc", SqlDbType.NVarChar, 300));
        cmd.Parameters.Add(new SqlParameter("@sdate", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.DateTime, 50));
        cmd.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 100));

        cmd.Parameters["@jobtitle"].Value = Convert.ToString(txtjobtitle.Text);
        cmd.Parameters["@jobdesc"].Value = Convert.ToString(txtjobdesc.Text);
        cmd.Parameters["@sdate"].Value = Convert.ToString(txtsdate.Text);
        cmd.Parameters["@pdate"].Value = DateTime.Now.ToString();
        cmd.Parameters["@address"].Value = Convert.ToString(txtaddress.Text);
        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();

        string strScript = "";
        strScript = "alert('Event has Been Updated Successfully.');location.replace('news.aspx');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
    }
}
