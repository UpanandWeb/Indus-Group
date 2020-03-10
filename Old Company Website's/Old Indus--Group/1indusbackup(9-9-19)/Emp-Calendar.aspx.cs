using System;
using System.Data;
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Emp_Calendar : System.Web.UI.Page
{
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    public static string own = "";
    string emailid = string.Empty;

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
                //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
                //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
                //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
                //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                //lblUse.Text = Session["UserName"].ToString();
                //own = ConfigurationManager.AppSettings["owner"].ToString();
                //if (lblUse.Text == own)
                //{
                //    allDiv.Visible = true;
                //}
                //else
                //{
                //    allDiv.Visible = false;
                //}
                getTable();
            }
            DataCalendar1.VisibleDate = DateTime.Now.Date;
            DataCalendar1.DataSource = GetEventData();
            DataCalendar1.DayField = "Rem_date";
        }
    }

    DataTable GetEventData()
    {
        emailid = Session["userid"].ToString();
        DataSet ds = new DataSet();
    //    SqlCommand cmd1 = new SqlCommand("Select convert(varchar(10),Rem_date,101) as Rem_date ,count(Rem_time) as cou From Calendar where R_name=@nam  and rem_for ='"+emailid+"'group by Rem_date ", con);
        SqlCommand cmd1 = new SqlCommand("Select convert(varchar(10),Rem_date,101) as Rem_date ,count(Rem_time) as cou From Calendar where  rem_for ='" + emailid + "' group by Rem_date ", con);
        cmd1.Parameters.AddWithValue("@nam", lblUse.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        da.Fill(ds);
        return (DataTable)ds.Tables[0];
    }

    void getTable()
    {
        if (Session["dont"] != "")
        {
            DataSet ds1 = new DataSet();
            SqlCommand cmd1 = new SqlCommand("select Rem_time,convert(varchar(10),Rem_date,105) as Rem_date,Rem_note from Calendar where rem_untill>=@dat and R_name=@nam order by Rem_date asc", con);
            //cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@dat", DateTime.Now.Date);
            cmd1.Parameters.AddWithValue("@nam", lblUse.Text);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                grdRemaind.DataSource = ds1.Tables[0];
                grdRemaind.DataBind();
                mdpop.Show();
            }
        }
    }

    /// <summary>
    /// navigate to reminder 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date >= DateTime.Now.Date)
        {
            HyperLink hy = new HyperLink();
            hy.Text = "[Add New]";
            //hy.Style.Add("text-align", "center");
            hy.NavigateUrl = "Emp-Remainders.aspx?date=" + e.Day.Date.ToShortDateString();
            Panel pnl = new Panel();
            pnl.Style.Add("text-align", "center");
            pnl.Controls.Add(hy);
            e.Cell.Controls.Add(pnl);
        }
        else
        {
            e.Cell.Height = 50;
        }
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-AllRemainders.aspx");
    }

    protected void btndontok_Click(object sender, EventArgs e)
    {
        Session["dont"] = "";
    }

}