using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Users : System.Web.UI.Page
{
    exception err = new exception();
    static string excep_page = "Users.aspx";
    DataSet dsadmin = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                try
                {
                    bind();
                }
                catch (Exception ex)
                {
                    err.insert_exception(ex, excep_page);
                    Response.Redirect("ExceptionPage.aspx");
                }
            }
        }
    }

    /// <summary>
    /// get login user details
    /// </summary>
    protected void permission()
    {
        if (Session["user"] != null)
        {
            string admin = "Select * from IA_Users where userid='" + Session["user"].ToString() + "'";
            SqlDataAdapter sdaadmin = new SqlDataAdapter(admin, con);
            DataSet dsadmin = new DataSet();
            sdaadmin.Fill(dsadmin);
            Session["dsadmin"] = dsadmin;
        }
    }
    /// <summary>
    /// shows users data 
    /// </summary>
    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select case when ustatus ='1' then 'Active' when ustatus ='0' then 'DeActive' end as stat,   * from IA_Users order by uid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GalleryDatalist.DataSource = ds;
        GalleryDatalist.DataBind();
    }

    /// <summary>
    /// navigate create user page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Label2_Click(object sender, EventArgs e)
    {
        //try
        //{
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["userscreate"].ToString() == "1")
            {
                Response.Redirect("Create-User.aspx");
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }

    /// <summary>
    /// chang user status
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkactivate_Command(object sender, CommandEventArgs e)
    {
        //try
        //{
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["usersedit"].ToString() == "1")
            {
                if (e.CommandName == "active")
                {
                    string a = e.CommandArgument.ToString();
                    SqlDataAdapter sda = new SqlDataAdapter("select * from  IA_Users where uid='" + a + "'", con);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string aa = ds.Tables[0].Rows[0]["uStatus"].ToString();
                        if (aa == "0")
                        {
                            SqlCommand cmd = new SqlCommand("update  IA_Users set uStatus=1 where uid='" + a + "'", con);
                            con.Open();
                            int i = cmd.ExecuteNonQuery();
                            con.Close();
                            if (i == 1)
                            {
                                string str = "alert('Status updated successfully.');relocation('Users.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                                bind();
                            }
                        }
                        else
                        {
                            SqlCommand cmd1 = new SqlCommand("update  IA_Users set uStatus=0 where uid='" + a + "'", con);
                            con.Open();
                            int i1 = cmd1.ExecuteNonQuery();
                            con.Close();
                            if (i1 == 1)
                            {
                                string str = "alert('Status updated successfully.');relocation('Users.aspx');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                                bind();
                            }
                        }
                    }
                }
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }

    /// <summary>
    ///  show specific user details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgbtnview_Command(object sender, CommandEventArgs e)
    {
        //try
        //{
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["usersview"].ToString() == "1")
            {
                if (e.CommandName == "view")
                {
                    string a = e.CommandArgument.ToString();
                    Response.Redirect("User-View.aspx?id=" + a);
                }
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }

    /// <summary>
    /// modify specific user details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgbtnview_Command1(object sender, CommandEventArgs e)
    {
        //try
        //{
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["usersedit"].ToString() == "1")
            {
                if (e.CommandName == "edit")
                {
                    string a = e.CommandArgument.ToString();
                    Response.Redirect("User-Edit.aspx?id=" + a);
                }
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }
    /// <summary>
    /// delete sepcific user
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgbtn1_Command(object sender, CommandEventArgs e)
    {
        //try
        //{
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["usersdelete"].ToString() == "1")
            {
                if (e.CommandName == "Delete")
                {
                    string a = e.CommandArgument.ToString();
                    SqlCommand cmd = new SqlCommand("delete from  IA_Users where uid='" + a + "'", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i == 1)
                    {
                        string str = "alert('Record Deleted successfully.');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
                    }
                    bind();
                }
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        //}
        //catch (Exception ex)
        //{
        //    err.insert_exception(ex, excep_page);
        //    Response.Redirect("ExceptionPage.aspx");
        //}
    }

    protected void GalleryDatalist_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GalleryDatalist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}