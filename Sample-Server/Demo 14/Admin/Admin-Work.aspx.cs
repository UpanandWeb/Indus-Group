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
using System.Web.Configuration;

public partial class Admin_Admin_Work : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            Bindata1();
        }
    }
    private void Bindata1()
    {
        SqlDataAdapter da = new SqlDataAdapter("select  * from   ST_Posts where Post_Type='News' or Post_Type='Work' order by pid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            newsgrid.DataSource = ds;
            newsgrid.DataBind();
        }
        lbltit.Text = "Posted Works/News";
        lbltit.Visible = true;
    }

    protected void ddtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddtype.SelectedItem.Text == "Work")
        {
            lbltit.Text = "Posted Works";
            lbltit.Visible = true;
            txtid.Text = "";
            Bindata(ddtype.SelectedItem.Text);
        }
        //if (ddtype.SelectedItem.Text == "Events")
        //{
        //    txtid.Text = "";
        //    Bindata(ddtype.SelectedItem.Text);
        //}
        if (ddtype.SelectedItem.Text == "News")
        {
            lbltit.Text = "Posted News";
            lbltit.Visible = true;
            txtid.Text = "";
            Bindata(ddtype.SelectedItem.Text);
        }
        //if (ddtype.SelectedItem.Text == "Gallery")
        //{
        //    txtid.Text = "";
        //    Bindata(ddtype.SelectedItem.Text);
        //}
        if (ddtype.SelectedItem.Text == "Select")
        {
            txtid.Text = "";
            Bindata1();
        }
    }

  

    private void Bindata(string p)
    {
        SqlDataAdapter da = new SqlDataAdapter("select  * from   ST_Posts where Post_Type='" + p + "' order by pid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            newsgrid.DataSource = ds;
            newsgrid.DataBind();
            newsgrid.Visible = true;
            lnkcreate.Visible = true;
        }
        else
        {
            newsgrid.Visible = false;
            lnkcreate.Visible = false;
            string strScript = "alert('No Records found');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Home.aspx");
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

    protected void imgbtndel_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["newsdelete"].ToString() == "1")
            {
                ImageButton imgbtndel = sender as ImageButton;
                GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(newsgrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete  ST_Posts where pid=" + userid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('News Details has been Deleted Successfully');location.replace('Admin-Work.aspx');", true);
                }
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
    protected void imgbtnedit1_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["newsedit"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(newsgrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from ST_Posts where pid=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                string cid = das.Tables[0].Rows[0]["pid"].ToString();

                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Admin-Edit-News.aspx?cid=" + cid);
                }
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
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select  * from   ST_Posts where pid='" + txtid.Text + "' order by pid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            newsgrid.DataSource = ds;
            newsgrid.DataBind();
            newsgrid.Visible = true;
            lnkcreate.Visible = true;
            ddtype.SelectedIndex = -1;
        }
        else
        {
            ddtype.SelectedIndex = -1;
            newsgrid.Visible = false;
            lnkcreate.Visible = false;
            string strScript = "alert('No Records found');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}