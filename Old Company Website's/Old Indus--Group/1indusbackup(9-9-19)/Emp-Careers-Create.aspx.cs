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

public partial class Emp_Careers_Create : System.Web.UI.Page
{
    bool Regis = false;
    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";

    /// <summary>
    /// country names loaded
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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

                SqlDataAdapter sda = new SqlDataAdapter("select * from Countryt_Master", connection);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ddcountry.DataTextField = "CountryName";
                ddcountry.DataValueField = "CountryID";
                ddcountry.DataSource = ds;
                ddcountry.DataBind();
                ddcountry.Items.Insert(0, "Select Country");

                own = Session["userid"].ToString();
                if (own == "Recruiter")
                {
                    pj.Visible = true;
                    anj.Visible = true;
                    pr.Visible = false;
                    ar.Visible = false;
                    anj.Style.Add(HtmlTextWriterStyle.FontSize, "22px");

                }
                else
                {
                    pj.Visible = true;
                    anj.Visible = true;
                    pr.Visible = true;
                    ar.Visible = true;
                }
            }
        }
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string streg = string.Empty;
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into Careers (JobName,JobDesc,pdate,jobid,JobLocation,country,state,status,added) VALUES (@jname,@jdesc,@postdate,@jobid,@JobLocation,@country,@state,@status,@added);", connection);

        cmd.Parameters.Add(new SqlParameter("@jname", SqlDbType.NVarChar, 250));
        cmd.Parameters.Add(new SqlParameter("@jdesc", SqlDbType.NVarChar, 2000));
        cmd.Parameters.Add(new SqlParameter("@postdate", SqlDbType.DateTime, 20));
        cmd.Parameters.Add(new SqlParameter("@jobid", SqlDbType.NVarChar, 50));
        cmd.Parameters.Add(new SqlParameter("@JobLocation", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@state", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@status", SqlDbType.NVarChar, 100));
        cmd.Parameters.Add(new SqlParameter("@added", SqlDbType.NVarChar, 100));

        cmd.Parameters["@jname"].Value = Convert.ToString(txtjname.Text);
        cmd.Parameters["@jdesc"].Value = Convert.ToString(txtjdesc.Text);
        cmd.Parameters["@postdate"].Value = DateTime.Now.ToString();
        cmd.Parameters["@jobid"].Value = Convert.ToString(txtjobid.Text);
        cmd.Parameters["@JobLocation"].Value = Convert.ToString(ddcity.SelectedItem.Text);
        cmd.Parameters["@country"].Value = Convert.ToString(ddcountry.SelectedItem.Text);
        cmd.Parameters["@state"].Value = Convert.ToString(DropDownList1.SelectedItem.Text);
        cmd.Parameters["@status"].Value = 1;

        own = Session["userid"].ToString();
        if (own == "Recruiter")
        {
            cmd.Parameters["@added"].Value = 2;
        }
        else
        {
            cmd.Parameters["@added"].Value = 1;
        }

        streg = cmd.ExecuteNonQuery().ToString();
        connection.Close();
        Response.Redirect("Emp-Careers.aspx");
    }

    /// <summary>
    /// state names displayed when country name change
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddcountry.SelectedItem.Text != "Select Country")
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from State_Master where intCountryId=" + ddcountry.SelectedValue + " order by txtstate asc", connection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DropDownList1.DataTextField = "txtstate";
            DropDownList1.DataValueField = "intState_Id";

            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select State");
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");
        }
        else
        {
            DropDownList1.ClearSelection();
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");
            DropDownList1.Items.Insert(0, "Select State");
        }
    }

    /// <summary>
    /// city names displayed when state name change
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text != "Select State")
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from City_Master where sid=" + DropDownList1.SelectedValue + " order by cityname asc", connection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ddcity.DataTextField = "cityname";
            ddcity.DataSource = ds;
            ddcity.DataBind();
        }
        else
        {
            ddcity.ClearSelection();
            ddcity.Items.Insert(0, "Select City");

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emp-Careers.aspx");
    }
}