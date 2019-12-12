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

public partial class admin_Admin_AllRemainders : System.Web.UI.Page
{
    public static string own = "";
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            lblusers.Text = Session["UserName"].ToString();
            bindGrid();
        }
    }
    /// <summary>
    /// displayed reminders by user name
    /// </summary>
    void bindGrid()
    {
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter("select Cal_Id,convert(varchar(10),Rem_date,105) as Rem_date,Rem_time,Rem_note,R_name from Calendar order by Rem_date asc", con);
        da1.Fill(ds1);
        Gridview1.DataSource = ds1.Tables[0];
        Gridview1.DataBind();
    }
    /// <summary>
    /// delete reminder
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkdelrecord(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtndel = sender as ImageButton;       
        GridViewRow gvrow = imgbtndel.NamingContainer as GridViewRow;      
        int userid = Convert.ToInt32(Gridview1.DataKeys[gvrow.RowIndex].Value.ToString());       
        own = ConfigurationManager.AppSettings["owner"].ToString();
        if (lblusers.Text == own)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Calendar where Cal_id=" + userid, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                bindGrid();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Remainder has been deleted Successfully');", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script>alert('You are not a authorized user for this task');</script>");
            //body1.Attributes.Add("onload", "return alertcanceldelete()");
        }
    }

    protected void MyGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {          
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Cal_Id"));
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtndel");           
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
    }
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gridview1.PageIndex = e.NewPageIndex;
        bindGrid();
    }
}
