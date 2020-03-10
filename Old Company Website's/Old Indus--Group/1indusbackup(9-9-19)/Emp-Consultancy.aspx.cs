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
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class Emp_Consultancy : System.Web.UI.Page
{
    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    int statusid;
    public static string own = "";
    int usid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Binddata();
            }
        }
    }
    private void Binddata()
    {
        SqlDataAdapter da = new SqlDataAdapter("Select * from ig_counsaltancy order by cname asc", sqlConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    protected void btnVendor_Click(object sender, EventArgs e)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from ig_counsaltancy  where firm_name like '" + txtsrchven.Text + "%'", sqlConnection);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            //GridView1.Columns[6].Visible = false;

            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
    }
}