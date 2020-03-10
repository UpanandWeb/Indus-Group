using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class admin_Emp_Clients : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    public static string own = "";
    int CID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Bind();
            }
        }
    }

    private void Bind()
    {
        da = new SqlDataAdapter("select * from clients  order by cid desc", cn);
        ds = new DataSet();
        da.Fill(ds, "clients");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }


    protected void imgnew_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Emp-Createclients.aspx");
    }
}
