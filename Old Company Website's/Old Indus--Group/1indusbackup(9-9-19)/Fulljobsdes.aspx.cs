using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Fulljobsdes : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    Int32 cId = 0;
    int AdId = 0;

    /// <summary>
    /// displayed specific job description
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

        if (Request.QueryString["jid"] != null)
        {
            AdId = Convert.ToInt16(Request.QueryString["jid"]);
            // Code to execute without refreshing the page

            //To open Connection
            connection.Open();
            string s = "select * from Careers where ID=" + AdId;
            SqlCommand cmd = new SqlCommand(s, connection);
            //SqlDataReader dr = cmd.ExecuteReader();
            SqlDataAdapter sqlad = new SqlDataAdapter(s, connection);
            DataSet ds = new DataSet();
            sqlad.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlopenings.DataSource = ds;
                dlopenings.DataBind();

            }
        }
    }

    protected void SearchJobs_Click(object sender, EventArgs e)
    {
        Response.Redirect("careers.aspx");
    }
}