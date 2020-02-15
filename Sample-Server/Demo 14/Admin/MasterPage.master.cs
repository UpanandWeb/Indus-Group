using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {

            }
            //int timeout = HttpContext.Current.Session.Timeout * 1000 * 60;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
        }

    }
    protected DataSet Permission()
    {
        if (Session["username"] != null)
        {
            string user = Session["username"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select * from   ST_USers where status=1 and username='" + user + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        else
        {
            return null;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
    protected void imgaddpost_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["newspost"].ToString() == "1")
            {
                Response.Redirect("Admin-AddPost.aspx");
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void lnkwork_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["newsview"].ToString() == "1")
            {
                Response.Redirect("Admin-Work.aspx");
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void lnkevents_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["galaryview"].ToString() == "1")
            {
                Response.Redirect("Admin-Events.aspx");
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void lnkusers_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["usersview"].ToString() == "1")
            {
                Response.Redirect("Admin-Users.aspx");
            }
            else
            {
                string strScript = "alert('No Permissions to do this task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        else
        {
            string strScript = "alert('You Don't Have Permission');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void lnkaccounts_Click(object sender, EventArgs e)
    {

    }
    protected void lnkhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
    }
}
