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

public partial class Emp_News : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    public static string own = "";
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
        da = new SqlDataAdapter("select id,jobtitle,jobdesc,sdate,convert(varchar(20),pdate,101) as pdate from newsevents order by sdate desc", cn);
        ds = new DataSet();
        da.Fill(ds, "newsevents");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }

 
    protected void GridView1_rowdatabound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
            //identifying the control in gridview
            LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkDelete");
            //raising javascript confirmationbox whenver user clicks on link button
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}