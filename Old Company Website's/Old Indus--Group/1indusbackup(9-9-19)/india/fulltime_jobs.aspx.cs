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
            if (!IsPostBack)
            {
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
        da = new SqlDataAdapter("select ID,jobid, substring(JobName,1,30) as JobName,substring(JobDesc,1,50)+'...' as JobDesc,joblocation from Careers where country='India' and status=1 order by id desc", cn);
        ds = new DataSet();
        da.Fill(ds, "Careers");
        //PagedDataSource pdshared = new PagedDataSource();
        //DataView dview = ds.Tables[0].DefaultView;
        ////dview.Sort = "mfid DESC";
        //pdshared.DataSource = dview;
      
        //pdshared.AllowPaging = true;
        //pdshared.PageSize = 6;
        //pdshared.CurrentPageIndex = CurrentPage;
        
        //    lblCurrentPage.Text = "Page:" + (CurrentPage + 1).ToString() + "of" + pdshared.PageCount.ToString();
        //    cmdPrev.Enabled = !pdshared.IsFirstPage;
        //    cmdNext.Enabled = !pdshared.IsLastPage;
        GridView1.DataSource = ds.Tables["Careers"];
        GridView1.DataBind();
      


        //Close database connection to disconnect to sql server
       // cn.Close();

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
    //protected void cmdPrev_Click(object sender, EventArgs e)
    //{
       
    //    CurrentPage -= 1;
    //    LoadData();
    //}
    //protected void cmdNext_Click(object sender, EventArgs e)
    //{
    //    CurrentPage += 1;
    //    LoadData();
    //}
  
}

