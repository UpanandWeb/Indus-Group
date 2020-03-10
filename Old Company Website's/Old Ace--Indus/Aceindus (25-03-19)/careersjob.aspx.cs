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
using System.Data.SqlClient;

/// <summary>
/// summary description to bind and dispaly the career job details.
/// </summary>
public partial class careersjob : System.Web.UI.Page
{
    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Establish sql conncetion
        SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter da;
        DataSet ds;
        da = new SqlDataAdapter("select rowid,jobid,jobtitle,jobdesc,Location,Min_Exp,Max_Exp,convert(varchar(12),pdate,113) pdate from cg_jobpost ", cn);
        ds = new DataSet();
        da.Fill(ds, "cg_jobpost");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    /// <summary>
    /// Code for paging.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
