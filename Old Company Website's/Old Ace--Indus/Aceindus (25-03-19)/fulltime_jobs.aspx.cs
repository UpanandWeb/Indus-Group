using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using igiit.BussinessLogic;
using igiit.PropertiesLayer;
using System.Data.SqlClient;

/// <summary>
/// summary code for career job to display the description of employee.
/// </summary>
public partial class fulltime_jobs : System.Web.UI.Page
{
    //Initialise object to get the update details of employee.
    EmployeeDetails sdata = new EmployeeDetails();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Code to execute without refreshing the page.
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    /// <summary>
    /// Code to bind the data of career details.
    /// </summary>
    PagedDataSource pds = new PagedDataSource();
    private void LoadData()
    {
        //Establish sql connection.
        string Connection = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(Connection);
        //Open database connection to connect to sql server
        con.Open();
        DataSet ds = new DataSet();

        //Navigate and get the details of careers
        ds = sdata.GetNewCareers();
        pds.DataSource = ds.Tables[0].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 1;
        //pds.PageSize = Convert.ToInt16(ddlPageSize.SelectedValue);
        pds.CurrentPageIndex = CurrentPage;
        lnkbtnNext.Enabled = !pds.IsLastPage;
        lnkbtnPrevious.Enabled = !pds.IsFirstPage;
        DataList1.DataSource = pds;
        DataList1.DataBind();
        doPaging();

        //Close database connection to disconnect to sql server
        con.Close();

    }
    /// <summary>
    /// summary code for paging.
    /// </summary>
    private void doPaging()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
        for (int i = 0; i < pds.PageCount; i++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }
        dlPaging.DataSource = dt;
        dlPaging.DataBind();
    }
    /// <summary>
    /// summary code for dropdownlist paging based on selected index changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    
    //protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    CurrentPage = 0;
    //    LoadData();
    //}
    /// <summary>
    /// summary code for previous button to see the previous contents in the list.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkbtnPrevious_Click1(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        LoadData();
    }
    /// <summary>
    /// summary code for next button to see the next contents in the list.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkbtnNext_Click1(object sender, EventArgs e)
    {
        CurrentPage += 1;
        LoadData();
    }
    /// <summary>
    /// summary code for paging based on selected item changed.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dlPaging_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        LoadData();
    }
    /// <summary>
    /// summary code to view the current page details. 
    /// </summary>
    public int CurrentPage
    {
        get
        {
            if (this.ViewState["CurrentPage"] == null)
                return 0;
            else
                return Convert.ToInt16(this.ViewState["CurrentPage"].ToString());
        }
        set
        {
            this.ViewState["CurrentPage"] = value;
        }
    }
    /// <summary>
    /// summary code for page based on item data bound.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkbtnPage.Enabled = false;
            lnkbtnPage.Font.Bold = true;
        }
    }
}
