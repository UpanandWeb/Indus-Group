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

public partial class Admin_Admin_Users : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataAdapter da = new SqlDataAdapter("select CASE WHEN status=1 THEN 'Active'   when status=2 THEN 'Deactive'  END as status1,* from   ST_USers  order by ufname asc", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                usergrid.DataSource = ds;
                usergrid.DataBind();
            }
        }
    }
    protected void lnkcreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Create-User.aspx");
    }

    protected void lnkstatus_Click(object sender, EventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["usersstatus"].ToString() == "1")
            {
                LinkButton imgbtndel = sender as LinkButton;
                GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(usergrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("update  ST_USers set status=2 where uid=" + userid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('User Details has been Updated Successfully');location.replace('Admin-Users.aspx');", true);
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
    protected void imgbtnedit1_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["usersedit"].ToString() == "1")
            {
                ImageButton imgbtnedit = sender as ImageButton;
                GridViewRow gvrow = imgbtnedit.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(usergrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter("select * from ST_USers where uid=" + userid, con);
                DataSet das = new DataSet();
                cmd.Fill(das);
                string cid = das.Tables[0].Rows[0]["uid"].ToString();

                if (das.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Admin-Edit-User.aspx?uid=" + cid);
                }
                con.Close();
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
    protected void imgbtndel_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = Permission();
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0]["usersdelete"].ToString() == "1")
            {
                ImageButton imgbtndel = sender as ImageButton;
                GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;
                int userid = Convert.ToInt32(usergrid.DataKeys[gvrow.RowIndex].Value.ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("delete ST_USers  where uid=" + userid, con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertBox", "alert('User Details has been Deleted Successfully');location.replace('Admin-Users.aspx');", true);
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
}