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

public partial class Emp_Careers : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    SqlDataAdapter da;
    DataSet ds;
    Int32 uid;
    string str;
    public static string own = "";
    public static string own1 = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            //SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            //ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Bind();

                own = Session["userid"].ToString();
              //  own1 = Session["Designation"].ToString();

                if (own == "Recruiter")
                {
                    pj.Visible = true;
                    anj.Visible = true;
                    pr.Visible = false;
                    ar.Visible = false;
                    pj.Style.Add(HtmlTextWriterStyle.FontSize, "22px");

                }
                else
                {
                    if ((own == "nt@1indus.net") || (own == "smandava@1indus.net"))
                    {
                        pj.Visible = true;
                        anj.Visible = true;
                        pr.Visible = true;
                        ar.Visible = true;
                    }
                    else
                    {
                        pj.Visible = true;
                        anj.Visible = false;
                        pr.Visible = false;
                        ar.Visible = false;
                    }
                   
                }
            }
        }
    }
    /// <summary>
    /// displayed jobseekers
    /// </summary>
    private void Bind()
    {
        own = Session["userid"].ToString();
        if (own == "Recruiter")
        {
            da = new SqlDataAdapter("select case when status=1 then 'Active' when status=0 then 'Deactive' end as status1, *, convert(varchar(12),pdate,113)post from Careers where added=2 order by id desc", cn);

        }
        else
        {
            da = new SqlDataAdapter("select case when status=1 then 'Active' when status=0 then 'Deactive' end as status1, *, convert(varchar(12),pdate,113)post from Careers where added=1  order by id desc", cn);
        }
        ds = new DataSet();
        da.Fill(ds, "Careers");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
  
}

