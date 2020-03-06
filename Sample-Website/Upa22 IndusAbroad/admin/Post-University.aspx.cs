using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Post_University : System.Web.UI.Page
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
    /// Save the course details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnupload_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.ToString("dd-MM-yyyy");
        int st = 2;
        SqlCommand cmd = new SqlCommand("insert into IA_University (uname,city,state,country,worldrank,countryrank,Website,pdate,status) values   ('" + txtname.Text + "','" + txtcity.Text + "','" + txtstate.Text + "','" + ddc.SelectedItem.Text + "','" + txtw.Text + "','" + txtc.Text + "','" + txturl.Text + "','" + date + "'," + st + ")", con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            txtname.Text = "";
            txtcity.Text = "";
            txtstate.Text = "";
            txtw.Text = "";
            txtc.Text = "";

            ddc.SelectedIndex = -1;
            string strScript = "alert('University Added Successfully');location.replace('Admin-University.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-University.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-University.aspx");
    }
}