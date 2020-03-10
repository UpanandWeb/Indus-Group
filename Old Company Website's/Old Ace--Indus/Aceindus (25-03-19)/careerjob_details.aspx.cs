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
/// summary descrption to bind the job details and send mail or forward to friend
/// </summary>
/// 
public partial class careerjob_details : System.Web.UI.Page
{
    //Establish sql connection
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
  
    //Initialise object to bind data.
    Binddata obj = new Binddata();
    string sid = string.Empty;

    /// <summary>
    /// To perform action when page is loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        sid = (Request.QueryString["rowid"].ToString());
        //btnjobtofrd.Attributes.Add("onclick", "window.open('forward_job_tofrd.aspx','','height=530,width=530');return false");
        btnemailwithoutreg.Attributes.Add("onclick", "window.open('sendattachementtoemail.aspx?id=" + sid + "','','height=530,width=650');return false");
        btncratingaccount.Attributes.Add("onclick", "window.open('newaccount_login.aspx?id="+sid+"','');return false");

        
        DataSet ds = new DataSet();
        //Navigate and get career job post details through id.
        ds = obj.cg_jobpost(sid);
        dljobpost.DataSource = ds;
        dljobpost.DataBind();

        //Navigate and get career job post details through id.
        ds = obj.cg_jobpost(sid);
        dldescription.DataSource = ds;
        dldescription.DataBind();
    }
    /// <summary>
    /// code to redirect back to career job list.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnbacklist_Click(object sender, EventArgs e)
    {
        Response.Redirect("careersjob.aspx");
    }

    //protected void btnjobtofrd_Click(object sender, EventArgs e)
    //{
    //    btnjobtofrd.Attributes.Add("onclick", "window.open('forward_job_tofrd.aspx','','height=530,width=530');return false");

    //}
    protected void btnemailwithoutreg_Click(object sender, EventArgs e)
    {
        btnemailwithoutreg.Attributes.Add("onclick", "window.open('sendattachementtoemail.aspx','','height=530,width=650');return false");
    }
    
    
}