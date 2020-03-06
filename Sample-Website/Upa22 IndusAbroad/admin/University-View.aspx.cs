using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_University_View : System.Web.UI.Page
{
    exception err = new exception();
    static string excep_page = "University-View.aspx";
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
                    string use = Request.QueryString["id"];
                    SqlDataAdapter ad = new SqlDataAdapter("select  * from IA_University where uid='" + use + "' ", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtname.Text = ds.Tables[0].Rows[0]["uname"].ToString();
                        txtstate.Text = ds.Tables[0].Rows[0]["state"].ToString();
                        txtcity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                        txturl.Text = ds.Tables[0].Rows[0]["Website"].ToString();
                        txtw.Text = ds.Tables[0].Rows[0]["worldrank"].ToString();
                        txtc.Text = ds.Tables[0].Rows[0]["countryrank"].ToString();
                        ddc.ClearSelection();
                        ddc.Items.FindByText(ds.Tables[0].Rows[0]["country"].ToString()).Selected = true;
                    }
                }
                catch (Exception ex)
                {
                    err.insert_exception(ex, excep_page);
                    Response.Redirect("ExceptionPage.aspx");
                }
            }
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