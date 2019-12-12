using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class seminar : System.Web.UI.Page
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
    protected void cmdPrev_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        LoadData();
    }
    protected void cmdNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        LoadData();
    }
    private void LoadData()
    {
        cn.Open();
        DataSet ds = new DataSet();

        //Navigate and get the details of careers
        da = new SqlDataAdapter("select * from seminars order by spdate asc", cn);
        ds = new DataSet();
        da.Fill(ds, "Careers");
        PagedDataSource pdshared = new PagedDataSource();
        DataView dview = ds.Tables[0].DefaultView;
        //dview.Sort = "mfid DESC";
        pdshared.DataSource = dview;

        pdshared.AllowPaging = true;
        pdshared.PageSize = 3;
        pdshared.CurrentPageIndex = CurrentPage;

        cmdNext.Visible = true;
        cmdPrev.Visible = true;
        lblCurrentPage.Text = "Page:" + (CurrentPage + 1).ToString() + "of" + pdshared.PageCount.ToString();
        cmdPrev.Enabled = !pdshared.IsFirstPage;
        cmdNext.Enabled = !pdshared.IsLastPage;
        dlopenings.DataSource = pdshared;
        dlopenings.DataBind();



        //Close database connection to disconnect to sql server
        cn.Close();

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