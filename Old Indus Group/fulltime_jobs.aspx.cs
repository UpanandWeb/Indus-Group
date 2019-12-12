using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class fulltime_jobs : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        if (!IsPostBack)
        {
            int timeout = HttpContext.Current.Session.Timeout * 1000 * 18000; // (60 sec * 1 min)300 mins means 5 hours
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            LoadData();
        }
    }


    /// <summary>
    /// Code to bind the data of career details.
    /// </summary>
    //PagedDataSource pds = new PagedDataSource();
    private void LoadData()
    {
        //cn.Open();
        DataSet ds = new DataSet();

        //Navigate and get the details of careers
        da = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,40)+'...' as JobDesc,joblocation from Careers where country='USA' and status=1 and added=1 order by id desc", cn);
        ds = new DataSet();
        da.Fill(ds, "Careers");
        GridView1.DataSource = ds.Tables["Careers"];
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadData();
    }

    public int CurrentPage
    {
        get
        {
            object obj = this.ViewState["_CurrentPage"];
            if (obj == null)
                return 0;
            else
                return (int)obj;
        }
        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }
}

