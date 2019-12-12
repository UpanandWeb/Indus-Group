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

public partial class admin_Admin_Myappointments : System.Web.UI.Page
{
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


           
            //lblFullDate.Text = DateTime.Now.ToLongDateString();
            lblUser.Text = Session["UserName"].ToString();
            //lblUser.Text = "admin";
            bindgrid();
        }
    }
    void bindgrid()
    {
        SqlDataAdapter da = new SqlDataAdapter("select app_id,convert(varchar(10),app_date,105) as app_date,ti_est,app_titile,app_descr from appointments order by app_id desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Gridview1.DataSource = ds;
        Gridview1.DataBind();
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Now.Date)
        {
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = System.Drawing.Color.Gray;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gridview1.PageIndex = e.NewPageIndex;
        bindgrid();
    }
    protected void cal1_click(object sender, EventArgs e)
    {
        string s = cal1.SelectedDate.ToShortDateString();
        Response.Redirect("Admin_Appointments.aspx?date=" + s);
    }
}
