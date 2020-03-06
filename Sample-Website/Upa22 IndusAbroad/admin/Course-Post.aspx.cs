using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Course_View : System.Web.UI.Page
{
    exception err = new exception();
    static string excep_page = "Course-Post.aspx";
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

    /// <summary>
    /// Save the course details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnupload_Click(object sender, EventArgs e)
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

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-Courses.aspx");
    }
}