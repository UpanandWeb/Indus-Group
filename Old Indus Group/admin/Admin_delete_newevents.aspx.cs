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
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// summarise description to delete the details of new and events
/// </summary>
public partial class Admin_delete_newevents : System.Web.UI.Page
{
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
        string streg = string.Empty;
        string usid = string.Empty;

        usid = Request.QueryString["id"].ToString();
        //Execute code without refreshing the page
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            //Establish sql connection 
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //open database connection to connect to sqlserver
            connection.Open();

            SqlCommand cmd = new SqlCommand("delete from newsevents where id=" + usid, connection);

            streg = cmd.ExecuteNonQuery().ToString();
            //close database connection to disconnect to sql sqrver
            connection.Close();

            string strScript = "";
            strScript = "alert('News Has Been Deleted Successfully.');location.replace('news.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);

            //Response.Redirect("Admin_Careers.aspx?ret=ok");

        }
    }
}
