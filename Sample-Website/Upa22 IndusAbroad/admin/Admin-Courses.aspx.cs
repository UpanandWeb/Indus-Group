using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_Admin_Courses : System.Web.UI.Page
{
    exception err = new exception();
    static string excep_page = "Admin-Courses.aspx";
    DataSet dsadmin = new DataSet();

    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    /// <summary>
    /// Display the Courses and  hide posted courses
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
                    permission();
                    bind();
                    divsub.Visible = false;
                    bindcountry();
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
    /// Displayed country names
    /// </summary>
    protected void bindcountry()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from ia_Countries order by icountryid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        ddlcon.DataSource = ds;
        ddlcon.DataBind();
        ddlcon.DataTextField = "vcountryname";
        ddlcon.DataValueField = "icountryid";
        ddlcon.DataBind();
        ddlcon.Items.Insert(0, "Select");
    }

    protected void bind()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course order by id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        GalleryDatalist.DataSource = ds;
        GalleryDatalist.DataBind();
    }

    ///// <summary>
    ///// Poste
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void btnpost_Click(object sender, EventArgs e)
    //{
    //    GalleryDatalist.Visible = false;
    //    divsub.Visible = true;
    //    Button1.Visible = false;

    //    t.Attributes.Add("padding-left", "10px");
    //}



    /// <summary>
    /// updateed course details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string id = Convert.ToString(Session["id"]);
            SqlCommand cmd = new SqlCommand("update IB_course set CourseName='" + cor.Text + "',Country='" + ddlcon.SelectedItem.Text + "',University='" + txtt.Text + "',comments='" + txtdescription.Text + "' where id= " + id, con);
            con.Open();
            int j = cmd.ExecuteNonQuery();
            con.Close();
            if (j == 1)
            {
                Label3.Visible = true;
                Label3.Text = "Course Updated Successfully";

                cor.Text = "";
                txtt.Text = "";
                ddlcon.SelectedIndex = -1;
                txtdescription.Text = "";
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }

    /// <summary>
    /// Save the course details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            string date = System.DateTime.Now.ToString("dd-MM-yyyy");
            int sts = 0;
            SqlCommand cmd = new SqlCommand("insert into [dbo].[IB_course] (CourseName,University,Country,Status,comments,posteddate) values ('" + cor.Text + "','" + txtt.Text + "','" + ddlcon.SelectedItem.Text + "'," + sts + ",'" + txtdescription.Text + "','" + date + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                Label3.Visible = true;
                cor.Text = "";
                txtt.Text = "";
                ddlcon.SelectedIndex = -1;
                txtdescription.Text = "";
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }

    /// <summary>
    /// Reset the update details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");
    }

    /// <summary>
    /// hide grid view and display the post course
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        //txtt.Attributes.Add("Enabled", "true");
        //ddlcon.Attributes.Add("Enabled", "true");
        //cor.Attributes.Add("Enabled", "true");
        //txtdescription.Attributes.Add("Enabled", "true");
        //divsub.Visible = true;
        //GalleryDatalist.Visible = false;
        permission();
        dsadmin = (DataSet)Session["dsadmin"];
        if (dsadmin.Tables[0].Rows[0]["Courseedit"].ToString() == "1")
        {
            Response.Redirect("Course-Post.aspx");
        }
        else
        {
            string strScript = "alert('NO permission to do this Task');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void lnkEdit_Command(object sender, CommandEventArgs e)
    {
        try
        {
            permission();
            dsadmin = (DataSet)Session["dsadmin"];
            if (dsadmin.Tables[0].Rows[0]["Courseedit"].ToString() == "1")
            {
                if (e.CommandName == "edit")
                {

                    string id = e.CommandArgument.ToString();
                    SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course where id=" + id, con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    cor.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
                    SqlDataAdapter ad123 = new SqlDataAdapter("select * from [cg_Country_Master] ", con);
                    DataSet ds123 = new DataSet();
                    ad123.Fill(ds123);
                    ddlcon.DataSource = ds123;
                    Session["id"] = id;
                    ddlcon.DataTextField = "txtCountry_name";
                    ddlcon.DataValueField = "intCountry_id";
                    ddlcon.DataBind();
                    for (int i = 0; i < ddlcon.Items.Count; i++)
                    {
                        if (ddlcon.Items[i].Text == Convert.ToString(ds123.Tables[0].Rows[0]["txtCountry_name"]))
                        {
                            ddlcon.Items[i].Selected = true;
                            break;
                        }
                    }
                    txtt.Text = ds.Tables[0].Rows[0]["University"].ToString();
                    txtdescription.Text = ds.Tables[0].Rows[0]["comments"].ToString();

                    divsub.Visible = true;
                    GalleryDatalist.Visible = false;
                    Button1.Visible = false;
                    Button2.Visible = true;
                    btnupload.Visible = false;

                }
            }
            else
            {
                string strScript = "alert('NO permission to do this Task');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }

    protected void lnkView_Command(object sender, CommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "view")
            {
                permission();
                dsadmin = (DataSet)Session["dsadmin"];
                if (dsadmin.Tables[0].Rows[0]["Courseview"].ToString() == "1")
                {
                    string id = e.CommandArgument.ToString();
                    SqlDataAdapter ad = new SqlDataAdapter("select * from IB_course where id=" + id, con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    cor.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
                    SqlDataAdapter ad123 = new SqlDataAdapter("select * from [cg_Country_Master] ", con);
                    DataSet ds123 = new DataSet();
                    ad123.Fill(ds123);
                    ddlcon.DataSource = ds123;
                    Session["id"] = id;
                    ddlcon.DataTextField = "txtCountry_name";
                    ddlcon.DataValueField = "intCountry_id";
                    ddlcon.DataBind();
                    for (int i = 0; i < ddlcon.Items.Count; i++)
                    {
                        if (ddlcon.Items[i].Text == Convert.ToString(ds123.Tables[0].Rows[0]["txtCountry_name"]))
                        {
                            ddlcon.Items[i].Selected = true;
                            break;
                        }
                    }
                    txtt.Text = ds.Tables[0].Rows[0]["University"].ToString();
                    txtdescription.Text = ds.Tables[0].Rows[0]["comments"].ToString();

                    Button2.Visible = false;
                    btnupload.Visible = false;
                    txtt.Attributes.Add("Disabled", "true");
                    ddlcon.Attributes.Add("Disabled", "true");
                    cor.Attributes.Add("Disabled", "true");
                    txtdescription.Attributes.Add("Disabled", "true");

                    divsub.Visible = true;
                    GalleryDatalist.Visible = false;
                }
                else
                {
                    string strScript = "alert('NO permission to do this Task');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }
    protected void imgbtn1_Command(object sender, CommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Delete")
            {
                permission();
                dsadmin = (DataSet)Session["dsadmin"];
                if (dsadmin.Tables[0].Rows[0]["coursedelete"].ToString() == "1")
                {
                    string id = Convert.ToString(e.CommandArgument);

                    SqlCommand cmd = new SqlCommand("delete from  IB_course where id=" + id, con);
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
                else
                {
                    string strScript = "alert('NO permission to do this Task');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
                }
            }
        }
        catch (Exception ex)
        {
            err.insert_exception(ex, excep_page);
            Response.Redirect("ExceptionPage.aspx");
        }
    }

    protected void GalleryDatalist_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GalleryDatalist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}